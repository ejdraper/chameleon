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
    assert_equal 1, assigns(:data)[:value]
    assert_equal 2, assigns(:data)[:previous]
  end

  test "widget with custom key parameter" do
    get :show, :id => "test2", :token => "c6fdeae2af2c327cac35abc2ccacd8619af56821"
    assert_response :ok
    assert_template "widgets/number_and_secondary"
    assert_equal 1, assigns(:data)[:value]
    assert_equal 2, assigns(:data)[:previous]
  end

  test "widget with custom auth block" do
    get :show, :id => "test3", :token => "987654321"
    assert_response :ok
    assert_template "widgets/number_and_secondary"
    assert_equal 5, assigns(:data)[:value]
    assert_equal 3, assigns(:data)[:previous]
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

  test "number and secondary widget with custom display text" do
    get :show, :id => "number_and_secondary_with_text", :key => "x"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <item>
    <value>1</value>
    <text>Display Me</text>
  </item>
  <item>
    <value>2</value>
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

  test "rag" do
    get :show, :id => "rag", :key => "x"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <item>
    <value>5</value>
    <text>Five</text>
  </item>
  <item>
    <value>2</value>
    <text>Two</text>
  </item>
  <item>
    <value>1</value>
    <text>One</text>
  </item>
</root>
EOF
    assert_equal xml, response.body
  end

  test "rag with empty values" do
    get :show, :id => "rag_with_empty_values", :key => "x"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <item>
    <value></value>
    <text></text>
  </item>
  <item>
    <value>2</value>
    <text>Two</text>
  </item>
  <item>
    <value></value>
    <text></text>
  </item>
</root>
EOF
    assert_equal xml, response.body
  end

  test "text" do
    get :show, :id => "text", :key => "x"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <item>
    <text><![CDATA[First panel text]]></text>
    <type>0</type>
  </item>
</root>
EOF
    assert_equal xml, response.body
  end

  test "text with multiple panels" do
    get :show, :id => "text_with_multiple_panels", :key => "x"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <item>
    <text><![CDATA[First panel text]]></text>
    <type>0</type>
  </item>
  <item>
    <text><![CDATA[Second panel text]]></text>
    <type>0</type>
  </item>
  <item>
    <text><![CDATA[Third panel text]]></text>
    <type>0</type>
  </item>
</root>
EOF
    assert_equal xml, response.body
  end

  test "text with multiple panels and types" do
    get :show, :id => "text_with_multiple_panels_and_types", :key => "x"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <item>
    <text><![CDATA[First panel text]]></text>
    <type>2</type>
  </item>
  <item>
    <text><![CDATA[Second panel text]]></text>
    <type>1</type>
  </item>
  <item>
    <text><![CDATA[Third panel text]]></text>
    <type>0</type>
  </item>
</root>
EOF
    assert_equal xml, response.body
  end

  test "geckometer" do
    get :show, :id => "geckometer", :key => "x"
xml =<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <item>23</item>
  <min>
    <value>10</value>
    <text>Min visitors</text>
  </min>
  <max>
    <value>30</value>
    <text>Max visitors</text>
  </max>
</root>
EOF
    assert_equal xml, response.body
  end

end
