widget :test3 do
  auth { |controller, request, params| Account.all.detect { |a| a.api_token == controller.params[:token] } }
  type "number_and_secondary"
  data do |account|
    {
      :value => account.value,
      :previous => account.previous
    }
  end
end
