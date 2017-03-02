class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end

    def edit
      @user = User.find(params[:id])
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

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = 'Профиль обновлен'
        redirect_to edit_user_path(@user)
      else
        flash[:danger] = 'Ошибка при обновлении профиля'
        render 'edit'
      end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :id)
    end
end
