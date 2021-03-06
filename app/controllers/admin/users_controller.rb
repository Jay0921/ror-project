module Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[destroy]

    def index
      @q = User.ransack(params[:q])
      @users = @q.result.order('id ASC').page(params[:page])
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully deleted.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
