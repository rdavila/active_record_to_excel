# encoding: utf-8

require 'rubygems'
require 'bundler'
require File.expand_path('../lib/active_record_to_excel/version', __FILE__)

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "active_record_to_excel"
  gem.homepage = "http://github.com/rdavila/active_record_to_excel"
  gem.license = "MIT"
  gem.summary = %Q{Excel generator based on ActiveRecord queries}
  gem.description = %Q{
    This tool allows you to generate quick and simple
    Excel reports based on the array of records returned by your 
    ActiveRecord queries
  }
  gem.email = "ruben.grunge84@gmail.com"
  gem.authors = ["Rubén Dávila Santos"]
  gem.version = ActiveRecordToExcel::Version::STRING
  gem.add_dependency 'spreadsheet', '= 0.6.5.8'
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "active_record_to_excel #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
