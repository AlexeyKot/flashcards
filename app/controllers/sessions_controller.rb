class SessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]
	def new
	end

	def create
		if login(session_params[:email], session_params[:password], session_params[:remember_me])
			flash[:success] = 'С возвращением!'
			redirect_back_or_to root_path
		else
			flash.now[:warning] = 'Неправильный email или пароль'
			render 'new'
		end
	end

	def destroy
		logout
		flash[:success] = 'До свидания!'
		redirect_to log_in_path
	end

	private

  def session_params
    params.permit(:email, :password, :remember_me)
  end

end
