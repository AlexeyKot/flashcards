class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.persisted?
            login(user_params[:email], user_params[:password])
            flash[:success] = 'Вы успешно зарегистрировались'
			      redirect_to root_path
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
