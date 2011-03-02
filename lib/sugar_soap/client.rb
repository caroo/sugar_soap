require 'soap/wsdlDriver'

module SugarSoap
  
  class Client
    
    attr_reader :session
    
    # SugarSoap::Client.new(:wsdl => "#{RAILS_ROOT}/config/sugar_development.wsdl", :username => "username", :password => "passwort")
    
    def initialize(uri_to_wsdl, factory_class = SOAP::WSDLDriverFactory)
      self.driver = factory_class.new(uri_to_wsdl).create_rpc_driver
      self.session = nil
    end
    
    def login(username, password)
      begin
        soap_response = driver.login({"user_name" => username, "password" => password}, "")
      rescue SocketError => exception
        raise SugarSoap::ConnectionError, "Connection to SugarCRM durin login failed."
      end
      
      raise SugarSoap::InvalidLogin if soap_response["id"] == "-1"
      @session = soap_response["id"]
    end
    
    def create(sugar_module, entry)
      # FIXME Die Fehlerbehandlung ist an dieser Stelle nur unzureichend
      # gelöst. Was passiert, wenn ein Fehler beim Anlegen eines entries
      # aufgetreten ist? Mgl. Antworten: Retry oder Queue
      raise "NotLoggedIn" unless logged_in?
      driver.set_entry(session, sugar_module, entry.to_name_value_list)["id"]
    end
    
    def update(sugar_module, entry)
      raise "NotLoggedIn" unless logged_in?
      begin
        driver.set_entry(session, sugar_module, entry.to_name_value_list)["id"]
      rescue SOAP::EmptyResponseError => e # sugar-crm failure - do nothing
        return true
      end
    end
    
    def find(sugar_module, entry_id)
      soap_response = driver.get_entry(session, sugar_module, entry_id, [])
      extract_name_value_list_as_hash_from_soap_response(soap_response)
    end

    def logged_in?
      !!session
    end

    def extract_name_value_list_as_hash_from_soap_response(soap_response)
      soap_response.entry_list.first["name_value_list"].inject({}) { |clean_response, nv| clean_response[nv["name"]] = nv["value"]; clean_response }
    end
        
    private
    
      attr_accessor :driver
      attr_writer :session
      
  end
  
end