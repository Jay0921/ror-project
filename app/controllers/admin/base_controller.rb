module Admin
  class BaseController < ApplicationController
    before_action :authorize_user
    layout 'admin'

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to :back, notice: exception.message
    end

    def authorize_user
      redirect_to root_path, notice: 'Not authorized.' if current_user.nil?
    end
  end
end
