module RoleChecker
  def ctoconnection_admin_user?
    return false unless current_user

    %w[peter@ctoconnection.com pavlo@ctoconnection.com].include?(current_user[:info][:email])
  end
end
