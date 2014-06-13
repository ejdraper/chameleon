widget :somethings do
  #key some_key
  type "list"
  a = []
  data do
    Somethings.scope_of_interest.each do |s|
      a << {
        :name => s.suitable_field_for_name
        :color => 'red', # or whichever
        :text => s.suitable_field_for_text,
        :highlight => true, # or not
        :description => s.suitable_field_for_description
      }
    end
    a
  end
end

