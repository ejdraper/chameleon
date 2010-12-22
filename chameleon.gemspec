# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{chameleon}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elliott Draper"]
  s.date = %q{2010-12-22}
  s.email = %q{el@ejdraper.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["MIT-LICENSE", "README.rdoc", "app/controllers/widgets_controller.rb", "app/models/widget.rb", "app/views/widgets/number_and_secondary.xml.erb", "config/routes.rb", "test/chameleon_test.rb", "test/dummy/app/controllers/application_controller.rb", "test/dummy/app/helpers/application_helper.rb", "test/dummy/app/views/layouts/application.html.erb", "test/dummy/app/widgets/test_widget.rb", "test/dummy/app/widgets/test_widget2.rb", "test/dummy/config/application.rb", "test/dummy/config/boot.rb", "test/dummy/config/database.yml", "test/dummy/config/environment.rb", "test/dummy/config/environments/development.rb", "test/dummy/config/environments/production.rb", "test/dummy/config/environments/test.rb", "test/dummy/config/initializers/backtrace_silencers.rb", "test/dummy/config/initializers/inflections.rb", "test/dummy/config/initializers/mime_types.rb", "test/dummy/config/initializers/secret_token.rb", "test/dummy/config/initializers/session_store.rb", "test/dummy/config/locales/en.yml", "test/dummy/config/routes.rb", "test/dummy/config.ru", "test/dummy/db/test.sqlite3", "test/dummy/log/development.log", "test/dummy/log/production.log", "test/dummy/log/server.log", "test/dummy/log/test.log", "test/dummy/public/404.html", "test/dummy/public/422.html", "test/dummy/public/500.html", "test/dummy/public/favicon.ico", "test/dummy/public/javascripts/application.js", "test/dummy/public/javascripts/controls.js", "test/dummy/public/javascripts/dragdrop.js", "test/dummy/public/javascripts/effects.js", "test/dummy/public/javascripts/prototype.js", "test/dummy/public/javascripts/rails.js", "test/dummy/Rakefile", "test/dummy/script/rails", "test/functional/widgets_test.rb", "test/integration/navigation_test.rb", "test/support/integration_case.rb", "test/test_helper.rb", "test/unit/widget_test.rb", "lib/chameleon.rb", "lib/generators/chameleon/widget_generator.rb"]
  s.homepage = %q{http://github.com/ejdraper/chameleon}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rails engine to let you easily build Geckoboard widgets}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["= 3.0.3"])
    else
      s.add_dependency(%q<rails>, ["= 3.0.3"])
    end
  else
    s.add_dependency(%q<rails>, ["= 3.0.3"])
  end
end
