class UsersController < ApplicationController
  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path, notice: "Вы успешно зарегистрировались и вошли!"
    else
      flash.now[:alert] = "Вы неправильно заполнили поля формы регистрации!"

      render :new
    end

  end

  def new
    @user = User.new
  end
end