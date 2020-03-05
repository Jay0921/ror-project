module RakeTaskService
  extend ActiveSupport::Concern
  attr_accessor :task, :user_email, :task_name

  class_methods do
    def call(*args)
      klass = new
      klass.user_email = args[0][:user_email]
      klass.task_name = args[0][:task_name]

      raise "user_email must be provided" unless klass.user_email.present?
      raise "task_name must be provided" unless klass.task_name.present?

      klass.call
    end
  end

  private

  def puts(text)
    Object.send(:puts, text)
    task.info text
  end

  def task
    @task ||= Miscellaneous::RakeTask.new(user_email, task_name)
  end
end
