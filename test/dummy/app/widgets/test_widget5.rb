widget :test5 do
  auth { |controller, request, params| Account.all.detect { |a| a.api_token == controller.params[:token] } }
  type "pie"
  data do |account|
    [
      {:value => 0.5, :label => "PieA", :colour => "ABABAB"},
      {:value => 1.2, :label => "PieB", :colour => "CDCDCD"},
      {:value => 3.5, :label => "PieC", :colour => "EFEFEF"}
    ]
  end
end
