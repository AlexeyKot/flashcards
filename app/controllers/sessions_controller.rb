class SessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]
	def new
	end

	def create
		if login(params[:email], params[:password])
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
end
