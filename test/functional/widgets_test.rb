require 'test_helper'

class WidgetsTest < ActionController::TestCase
  tests WidgetsController

  test "invalid widget" do
    ex = assert_raise(RuntimeError) do
      get :show, :id => "blah"
    end
    assert_equal "Invalid widget!", ex.message
  end

  test "invalid key" do
    ex = assert_raise(RuntimeError) do
      get :show, :id => "test", :key => "12345"
    end
    assert_equal "Invalid key!", ex.message
  end

  test "valid widget and key" do
    get :show, :id => "test", :key => "c6fdeae2af2c327cac35abc2ccacd8619af56821"
    assert_response :ok
    assert_template "widgets/number_and_secondary"
  end

  test "widget with custom key parameter" do
    get :show, :id => "test2", :token => "c6fdeae2af2c327cac35abc2ccacd8619af56821"
    assert_response :ok
    assert_template "widgets/number_and_secondary"
  end
end
