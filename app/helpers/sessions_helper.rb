module SessionsHelper
  
  #引数に渡されたユーザーオブジェクトでログインする。
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #永続的セッションを記憶する(Userモデルを参照)
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  #永続的セッションを破棄
  def forget(user)
    user.forget #Userモデル参照
    cookies.delete(:user_id)
    cookies.delete(:remmber_token)
  end
  
  #セッションと@current_userを破棄します
  def log_out
    foreget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  #一時セッションにいるユーザーを返す。
  #それ以外の場合はcookiesに対応するユーザーを返す。
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookiees.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && User.authenticated?(cookies[:remember_token])
        log_in user
        @current_iuser = user
      end
    end
  end
  
  #現在ログイン中のユーザーがいればtrue、そうでなければfalseを返します。
  def logged_in?
    !current_user.nil?
  end
end
