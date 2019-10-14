# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "chameleon"
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elliott Draper"]
  s.date = "2012-07-25"
  s.email = "el@ejdraper.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["MIT-LICENSE", "README.rdoc", "app/controllers/chameleon/widgets_controller.rb", "app/models/chameleon/widget.rb", "app/views/chameleon/widgets/funnel.xml.erb", "app/views/chameleon/widgets/geckometer.xml.erb", "app/views/chameleon/widgets/line.xml.erb", "app/views/chameleon/widgets/number_and_secondary.xml.erb", "app/views/chameleon/widgets/pie.xml.erb", "app/views/chameleon/widgets/rag.xml.erb", "app/views/chameleon/widgets/text.xml.erb", "config/routes.rb", "lib/chameleon.rb", "lib/generators/chameleon/widget_generator.rb"]
  s.homepage = "http://github.com/ejdraper/chameleon"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Rails engine to let you easily build Geckoboard widgets"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, "= 3.2.17")
    else
      s.add_dependency(%q<rails>, "= 3.2.17")
    end
  else
    s.add_dependency(%q<rails>, "= 3.2.17")
  end
end
