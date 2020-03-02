module Admin
  class BaseController < ApplicationController
    before_action :authorize_user
    layout 'admin'

    def authorize_user
      redirect_to new_user_session_path, notice: 'Not authorized.' if current_user.nil?
    end
  end
end
