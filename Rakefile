#!/usr/bin/env rake
require File.expand_path('../config/application', __FILE__)
TheNextBigThing::Application.load_tasks

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:rspec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :rspec
