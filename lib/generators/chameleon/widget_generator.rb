require "rails/generators"

module Chameleon
  class WidgetGenerator < Rails::Generators::Base
    desc "Generates a widget for exposing data to Geckoboard"
    argument :name, :type => :string, :desc => "Name of the widget", :required => true
    argument :type, :type => :string, :desc => "Type of the widget", :required => true

    def create_widget
      key = Digest::SHA1.hexdigest("#{self.name}#{self.type}#{Time.now.to_i}#{ENV["USER"]}")
      data =<<EOF
widget :#{self.name.underscore} do
  key "#{key}"
  type "#{self.type}"
  data do
  end
end
EOF
      create_file("app/widgets/#{self.name.underscore}_widget.rb", data)
    end
  end
end
