require 'soap/wsdlDriver'

module SugarSoap
  
  class StubClient
    
    attr_reader :session
    
    def initialize(uri_to_wsdl, factory_class = nil)
      self.driver = factory_class
      self.session = nil
    end
    
    def login(username, password)
      @session = "any_session_id"
    end
    
    def create(sugar_module, entry)
      raise "NotLoggedIn" unless logged_in?
      "any_guid"
    end
    
    def update(sugar_module, entry)
      raise "NotLoggedIn" unless logged_in?
      true
    end
    
    def find(sugar_module, entry_id)
      {}
    end

    def logged_in?
      !!session
    end

    private
    
      attr_accessor :driver
      attr_writer :session
      
  end
  
end