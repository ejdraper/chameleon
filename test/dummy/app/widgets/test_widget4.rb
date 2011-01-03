widget :test4 do
  auth { |controller, request, params| Account.all.detect { |a| a.api_token == controller.params[:token] } }
  type "line"
  data do |account|
    {
      :items => [0, 2, 3, 5, 9],
      :x_axis => [1,2,3,4,5],
      :y_axis => [0, 10],
      :colour => "ABABAB"
    }
  end
end
