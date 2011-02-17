widget :text_with_multiple_panels_and_types do
  key "x"
  type "text"
  data do
    [
      { :text => "First panel text", :type => :info },
      { :text => "Second panel text", :type => :alert },
      { :text => "Third panel text" }
    ]
  end
end
