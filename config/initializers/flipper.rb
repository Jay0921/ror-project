Flipper.configure do |config|
  config.default do
    redis = Redis.new(url: 'redis://127.0.0.1:6379')
    adapter = Flipper::Adapters::Redis.new(redis)

    Flipper.new(adapter)
  end
end

class CanAccessFlipperUI
  def self.matches?(request)
    true
  end
end
