class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logined!, :current_user, :hinted_text_field_tag, :hinted_password_field_tag

  def logined!
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    unless logined!
      redirect_to login_path
    end
  end

  def hinted_text_field_tag(name, value = nil, hint = "Click and enter text", options={})
    value = value.nil? ? hint : value
    text_field_tag name, value, {:onclick => "if($(this).value == '#{hint}'){$(this).value = ''}", :onblur => "if($(this).value == ''){$(this).value = '#{hint}'}" }.update(options.stringify_keys)
  end

  def hinted_password_field_tag(name, value = nil, hint = "Click and enter text", options={})
  value = value.nil? ? hint : value
  password_field_tag name, value, {:onclick => "if($(this).value == '#{hint}'){$(this).value = ''}", :onblur => "if($(this).value == ''){$(this).value = '#{hint}'}" }.update(options.stringify_keys)
end

end
