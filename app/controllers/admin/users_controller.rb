module Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[edit update destroy]

    def index
      @q = User.ransack(params[:q])
      @users = @q.result.order('id ASC').page(params[:page])
    end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        flash[:alert] = @user.errors.full_messages.join(', ')
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully deleted.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :role
      )
    end
  end
end
