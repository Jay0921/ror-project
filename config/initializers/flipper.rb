Flipper.configure do |config|
  config.default do
    redis = Redis.new(url: ENV["REDIS_ENDPOINT"])
    adapter = Flipper::Adapters::Redis.new(redis)

    Flipper.new(adapter)
  end
end
