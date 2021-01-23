# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require_relative 'config/application'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation'
end

RuboCop::RakeTask.new(:rubocop) do |task|
  task.requires << 'rubocop-rails'
end

task default: :spec

Rails.application.load_tasks
