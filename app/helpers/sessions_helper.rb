module SessionsHelper


  def current_user
    @current_user ||= session_user
  end

  def current_user?(user)
    user == current_user
  end

  def session_user
    User.find_by(id: session[:user_id])
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end
end
