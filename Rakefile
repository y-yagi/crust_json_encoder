require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
  t.warning = true
end

task :build_lib do
  system("cargo build --release", exception: true)
end

task performance: :build_lib do
  system("bundle exec ruby performance/benchmark.rb", exception: true)
end

task :default => :test
task :test => [:build_lib]
