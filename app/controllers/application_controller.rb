class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_back(fallback_location: root_path, notice: exception.message)
  end
end
