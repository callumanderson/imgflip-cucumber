require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{ imgfliptests --format pretty --require imgfliptests/features/}
end

Cucumber::Rake::Task.new(:cucumber_screenshot) do |t|
  t.cucumber_opts = %w{ imgfliptests --require imgfliptests/features/ --format html --out report.html}
end

task :default => :spec
