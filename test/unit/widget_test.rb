require "test_helper"

class WidgetTest < Test::Unit::TestCase
  def test_widget
    widget = Chameleon::Widget.find(:test)
    assert_not_nil widget
    assert_equal :test, widget.name
    assert_equal "c6fdeae2af2c327cac35abc2ccacd8619af56821", widget.key
    assert_equal "number_and_secondary", widget.type
    assert_equal 1, widget.data.call[:value]
    assert_equal 2, widget.data.call[:previous]
  end
end
