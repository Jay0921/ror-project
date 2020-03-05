module RakeTask
  class RunTask
    include RakeTaskService

    def call
      @task = Miscellaneous::RakeTask.new(user_email, task_name)
      @task.info 'Started'

      Miscellaneous::RakeTask.all
      Rake::Task[task_name].reenable
      Rake::Task[task_name].invoke(user_email)
      $redis.expire(task_name, 7.days)

      @task.info 'Completed'
      @task
    end
  end
end
