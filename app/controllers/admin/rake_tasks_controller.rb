module Admin
  class RakeTasksController < BaseController
    def index
      Rails.application.load_tasks
      Rake::TaskManager.record_task_metadata = true
      @tasks = Miscellaneous::RakeTask.all
    end

    def show
      @task = Miscellaneous::RakeTask.new(current_user, params[:id])
    end

    def run
      RakeTaskWorker.perform_async(current_user.email, params[:task_name])
      redirect_to admin_rake_task_path(params[:task_name])
    end
  end
end
