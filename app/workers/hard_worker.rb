class HardWorker
  include Sidekiq::Worker

  def perform(name)
    puts "#{name} is a hard worker"
  end
end