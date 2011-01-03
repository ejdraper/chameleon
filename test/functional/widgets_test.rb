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
    assert_equal [1,2], assigns(:data)
  end

  test "widget with custom key parameter" do
    get :show, :id => "test2", :token => "c6fdeae2af2c327cac35abc2ccacd8619af56821"
    assert_response :ok
    assert_template "widgets/number_and_secondary"
    assert_equal [1,2], assigns(:data)
  end

  test "widget with custom auth block" do
    get :show, :id => "test3", :token => "987654321"
    assert_response :ok
    assert_template "widgets/number_and_secondary"
    assert_equal [5,3], assigns(:data)
  end

  test "number and secondary widget" do
    get :show, :id => "test3", :token => "987654321"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <item>
    <value>5</value>
    <text></text>
  </item>
  <item>
    <value>3</value>
    <text></text>
  </item>
</root>
EOF
    assert_equal xml, response.body
  end

  test "line widget" do
    get :show, :id => "test4", :token => "987654321"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
    <item>0</item>
    <item>2</item>
    <item>3</item>
    <item>5</item>
    <item>9</item>
  <settings>
      <axisx>1</axisx>
      <axisx>2</axisx>
      <axisx>3</axisx>
      <axisx>4</axisx>
      <axisx>5</axisx>
      <axisy>0</axisy>
      <axisy>10</axisy>
    <colour>ABABAB</colour>
  </settings>
</root>
EOF
    assert_equal xml, response.body
  end

  test "pie widget" do
    get :show, :id => "test5", :token => "987654321"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
    <item>
      <value>0.5</value>
      <label>PieA</label>
      <colour>ABABAB</colour>
    </item>
    <item>
      <value>1.2</value>
      <label>PieB</label>
      <colour>CDCDCD</colour>
    </item>
    <item>
      <value>3.5</value>
      <label>PieC</label>
      <colour>EFEFEF</colour>
    </item>
</root>
EOF
    assert_equal xml, response.body
  end
end
