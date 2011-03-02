require File.dirname(__FILE__) + '/test_helper.rb'

class TestSugarSoapClient < Test::Unit::TestCase

  def test_should_init_wsdl_file
    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)

    assert_nil client.session
  end

  def test_should_raise_exception_if_login_failed
    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)
    assert !client.logged_in?
    driver = client.send(:driver)
    driver.expects(:login).returns({"id" => "-1"})
    assert_raise(SugarSoap::InvalidLogin) { client.login("username", "password") }
    assert !client.logged_in?
  end
  
  def test_should_raise_exception_if_connection_in_login_failed
    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)
    assert !client.logged_in?
    driver = client.send(:driver)
    driver.expects(:login).raises(SocketError)
    assert_raise(SugarSoap::ConnectionError) { client.login("username", "password") }
    assert !client.logged_in?
  end
  
  def test_should_know_if_logged_in
    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)
    assert !client.logged_in?
    client.login("username", "password")
    assert client.logged_in?
  end

  def test_should_find
    WsdlFactoryMock.any_instance.
                    expects(:get_entry).
                    with(WsdlFactoryMock.session_id, "Sugar-Module", 23, []).
                    returns("SoapResponse")
    
    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)

    client.expects(:extract_name_value_list_as_hash_from_soap_response).
           with("SoapResponse")

    client.login("username", "password")
    client.find("Sugar-Module", 23)
  end
  
  def test_should_extract_name_value_list_as_hash_from_soap_response
    soap_response = mock("SoapResponse")
    
    soap_response.expects(:entry_list).returns([{"name_value_list" => [{"name" => "username", "value" => "admin"}]}])
    
    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)
    expected_response = {"username" => "admin"}
    assert_equal expected_response, client.extract_name_value_list_as_hash_from_soap_response(soap_response)
  end

  def test_should_create
    WsdlFactoryMock.any_instance.
                    expects(:set_entry).
                    with(WsdlFactoryMock.session_id, "Sugar-Module", {:name => "foo", :value => "bar"}).
                    returns({"id" => "Remote GUID"})

    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)
    client.expects(:logged_in?).returns(true)

    entry_mock = mock("EntryMock")
    entry_mock.expects(:to_name_value_list).returns({:name => "foo", :value => "bar"})
    client.login("username", "password")
    assert_equal "Remote GUID", client.create("Sugar-Module", entry_mock)
  end
  
  def test_should_update
    WsdlFactoryMock.any_instance.
                    expects(:set_entry).
                    with(WsdlFactoryMock.session_id, "Sugar-Module", {:name => "foo", :value => "bar"}).
                    returns({"id" => "Remote GUID"})

    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)
    client.expects(:logged_in?).returns(true)

    entry_mock = mock("EntryMock")
    entry_mock.expects(:to_name_value_list).returns({:name => "foo", :value => "bar"})
    client.login("username", "password")
    assert_equal "Remote GUID", client.update("Sugar-Module", entry_mock)
  end
  
  def test_should_reraise_empty_response_exception
    WsdlFactoryMock.any_instance.
                    expects(:set_entry).
                    with(WsdlFactoryMock.session_id, "Sugar-Module", {:name => "foo", :value => "bar"}).
                    raises(SOAP::EmptyResponseError, "Response was empty.")
    
    client = SugarSoap::Client.new("sugar_crm.wsdl", WsdlFactoryMock)
    client.expects(:logged_in?).returns(true)

    entry_mock = mock("EntryMock")
    entry_mock.expects(:to_name_value_list).returns({:name => "foo", :value => "bar"})
    client.login("username", "password")
    
    assert_raise(SOAP::EmptyResponseError) { client.create("Sugar-Module", entry_mock) }
  end
  
end
