require "bundler/inline"
require "crust_json_encoder"
require "benchmark/ips"
require "active_record"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Base.logger = Logger.new(nil)

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :name
    t.string :email
  end
end

class User < ActiveRecord::Base
end

20.times { |i| User.create!(name: "dummy-#{i}", email: "dummy-#{i}.example.com") }
users = User.all
string = "this is the <string> & \u2028 \u2029"

Benchmark.ips do |x|
  x.report("JSONGemEncoder String") do
    ActiveSupport::JSON::Encoding.json_encoder = ActiveSupport::JSON::Encoding::JSONGemEncoder
    ActiveSupport::JSON.encode(string)
  end

  x.report("CrustJSONEncoder String") do
    ActiveSupport::JSON::Encoding.json_encoder = CrustJSONEncoder
    ActiveSupport::JSON.encode(string)
  end

  x.compare!
end

Benchmark.ips do |x|
  x.report("JSONGemEncoder AR(one record)") do
    ActiveSupport::JSON::Encoding.json_encoder = ActiveSupport::JSON::Encoding::JSONGemEncoder
    ActiveSupport::JSON.encode(users.first)
  end

  x.report("CrustJSONEncoder AR(one record)") do
    ActiveSupport::JSON::Encoding.json_encoder = CrustJSONEncoder
    ActiveSupport::JSON.encode(users.first)
  end

  x.compare!
end

Benchmark.ips do |x|
  x.report("JSONGemEncoder AR(multiple records)") do
    ActiveSupport::JSON::Encoding.json_encoder = ActiveSupport::JSON::Encoding::JSONGemEncoder
    ActiveSupport::JSON.encode(users)
  end

  x.report("CrustJSONEncoder AR(multiple records)") do
    ActiveSupport::JSON::Encoding.json_encoder = CrustJSONEncoder
    ActiveSupport::JSON.encode(users)
  end

  x.compare!
end
