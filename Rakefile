# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rake'
require "rake/gempackagetask"
require "rake/rdoctask"

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

task :default => ["test"]

spec = Gem::Specification.new do |s|

  s.name              = "chameleon"
  s.version           = "0.2.3"
  s.summary           = "Rails engine to let you easily build Geckoboard widgets"
  s.author            = "Elliott Draper"
  s.email             = "el@ejdraper.com"
  s.homepage          = "http://github.com/ejdraper/chameleon"

  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.rdoc)
  s.rdoc_options      = %w(--main README.rdoc)

  s.files             = %w(MIT-LICENSE README.rdoc) + Dir.glob("{app,config,lib}/**/*")
  s.require_paths     = ["lib"]

  s.add_development_dependency("rails", "3.2.6")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

task :package => :gemspec

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "app/**/*.rb", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
