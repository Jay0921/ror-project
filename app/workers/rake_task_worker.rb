class RakeTaskWorker
  include Sidekiq::Worker

  sidekiq_options retry: false, unique: :until_and_while_executing

  def perform(user_email, task_name)
    @task = RakeTask::RunTask.call(user_email: user_email, task_name: task_name)
  rescue StandardError => e
    raise e
  end
end
