require "bundler/gem_tasks"
require "rake/testtask"
require "thermite/tasks"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
  t.warning = true
end

Thermite::Tasks.new

task :build_lib do
  system("cargo build --release", exception: true)
end

task performance: ["thermite:build"] do
  system("bundle exec ruby performance/benchmark.rb", exception: true)
end

task :default => :test
task :test => ['thermite:build']
