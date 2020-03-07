class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    redirect_to tests_path if logged_in?
  end

  def create
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      flash[:notice] = 'Добро пожаловать!'
      redirect_to session[:referer] || root_path
    else
      flash.now[:alert] = "Неправильный логин или пароль"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:referer)
    redirect_to login_path, notice: 'Пока пока, рады были с вами поработать'
  end

end
