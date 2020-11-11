module Auth
  def authenticate_user!
    if user_signed_in?
      @current_user = session['userinfo']
    else
      redirect_to root_path
    end
  end

  def user_signed_in?
    session['userinfo'].present?
  end

  def authorize_admin!
    redirect_to root_path unless ctoconnection_admin_user?
  end

  def current_user
    @current_user
  end
end
