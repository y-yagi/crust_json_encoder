# frozen_string_literal: true

require "rake/testtask"
require "rake/extensiontask"

task default: :test

Rake::ExtensionTask.new("crust_json_encoder") do |c|
  c.lib_dir = "lib/crust_json_encoder"
end

Rake::TestTask.new do |t|
  t.deps << :compile
  t.test_files = FileList[File.expand_path("test/*_test.rb", __dir__)]
  t.verbose = true
  t.warning = true
end

task console: :compile do
  ruby "bin/console"
end

task performance: :compile do
  ruby "performance/benchmark.rb"
end
