module Admin
  class BaseController < ApplicationController
    authorize_resource
    before_action :authorize_user
    layout 'admin'

    def authorize_user
      return unless current_user.nil?

      redirect_to new_user_session_path, notice: 'Not authorized.'
    end
  end
end
