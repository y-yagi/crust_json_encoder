require "bundler/gem_tasks"
require 'helix_runtime/build_task'
require "rake/testtask"

HelixRuntime::BuildTask.new

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
  t.warning = true
end

task :default => :test
task :test => [:build]
