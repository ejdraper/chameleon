widget :test5 do
  auth { |controller, request, params| Account.all.detect { |a| a.api_token == controller.params[:token] } }
  type "pie"
  data do |account|
    [
      [0.5, "PieA", "ABABAB"],
      [1.2, "PieB", "CDCDCD"],
      [3.5, "PieC", "EFEFEF"]
    ]
  end
end
