class AccessConstraint
  def self.matches?(request)
    current_user = request.env['warden'].user
    current_user.present? && current_user.respond_to?(:super_admin?) && current_user.super_admin?
  end
end
