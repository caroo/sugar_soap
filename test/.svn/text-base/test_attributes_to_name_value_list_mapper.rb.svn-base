require "test_helper"


class AttributesToNameValueListMapperTest < Test::Unit::TestCase
  
  def test_should_serialize_mappable_attributes_to_name_value_list
    mappable = Mappable.new
    name_value_list = mappable.to_name_value_list
    name_value_list[0]["name"] = "name"
    name_value_list[0]["value"] = mappable.name
    name_value_list[1]["name"] = "firma"
    name_value_list[1]["value"] = mappable.company
  end
  
end