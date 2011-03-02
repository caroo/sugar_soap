require 'rubygems'
gem "test-unit"
require 'test/unit'
require 'mocha'
require 'soap/wsdlDriver'

require File.dirname(__FILE__) + '/../lib/sugar_soap'

class WsdlFactoryMock
  
  def self.session_id
    42
  end

  def initialize(uri_to_wsdl)
    @uri_to_wsdl = "uri_to_wsdl"
  end
  
  def create_rpc_driver
    self
  end
  
  def login(username, password)
    {"id" => self.class.session_id}
  end
  
end

class Mappable
  include SugarSoap::AttributesToNameValueListMapper
  
  def name_value_list_mapping
    {
      :name => "name",
      :company => "firma"
    }
  end
  
  def name
    "Heinz Putzrath"
  end
  
  def company
    "Hans Wurst GmbH"
  end
  
end