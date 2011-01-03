widget :test4 do
  auth { |controller, request, params| Account.all.detect { |a| a.api_token == controller.params[:token] } }
  type "line"
  data do |account|
    [[0, 2, 3, 5, 9], [1,2,3,4,5], [0, 10], "ABABAB"]
  end
end
