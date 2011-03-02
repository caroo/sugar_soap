module SugarSoap
  module AttributesToNameValueListMapper
  
    def to_name_value_list
      name_value_list_mapping.inject([]) do |name_value_list, mapping|
        name_value_list << {"name" => mapping[1].to_s, "value" => instance_eval(mapping[0].to_s)}
      end
    end
  
  end
end