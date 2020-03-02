class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    current_user&.email || 'System'
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_back(fallback_location: root_path, alert: exception.message)
  end

  def after_sign_in_path_for(resource)
    admin_root_path
  end
end
