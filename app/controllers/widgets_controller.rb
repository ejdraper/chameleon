class WidgetsController < ApplicationController
  before_filter :find_widget
  before_filter :validate_key
  skip_before_filter :verify_authenticity_token

  def show
    @data = @widget.data.call
    render "#{@widget.type}.xml"
  end

  protected
    def find_widget
      @widget = Widget.find(params[:id].gsub(".xml", ""))
      raise "Invalid widget!" if @widget.nil?
    end

    def validate_key
      raise "Invalid key!" if !@widget.public && (params[@widget.key_parameter].blank? || params[@widget.key_parameter] != @widget.key)
    end
end
