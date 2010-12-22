module Chameleon
  class Engine < Rails::Engine
    engine_name :chameleon
    initializer "chameleon.initialization" do
      Dir.glob(File.join("app", "widgets", "*.rb")).each { |f| require File.expand_path(f) }
    end
  end
end

Kernel.class_eval do
  def widget(name, &block)
    Widget.widget(name, &block)
  end
end
