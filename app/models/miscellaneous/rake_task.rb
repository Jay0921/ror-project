module Miscellaneous
  class RakeTask
    attr_reader :user_name, :task_name

    def self.all(namespace = 'patchwork')
      Rails.application.load_tasks
      Rake::Task.tasks.select { |t| t.name.include?(namespace) }
    end

    def initialize(user_name, task_name)
      @user_name = user_name
      @task_name = task_name
    end

    def info(text)
      task << { user_name: user_name, created_at: Time.current.to_i, message: text }
    end

    def values
      task.values
    end

    private

    def task
      @task ||= Redis::List.new(task_name, marshal: true)
    end
  end
end
