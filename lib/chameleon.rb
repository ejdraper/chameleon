module Chameleon
  class Engine < Rails::Engine
    isolate_namespace Chameleon

    initializer "chameleon.initialization" do
      Dir.glob(File.join("app", "widgets", "*.rb")).each { |f| require File.expand_path(f) }
    end
  end
end

Kernel.class_eval do
  def widget(name, &block)
    Chameleon::Widget.widget(name, &block)
  end
end
