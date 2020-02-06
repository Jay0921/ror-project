class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    current_user&.email || 'System'
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_back(fallback_location: root_path, alert: exception.message)
  end
end
