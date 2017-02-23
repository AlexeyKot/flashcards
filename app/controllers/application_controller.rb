class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def index
  end

  private

  def not_authenticated
    flash[:warning] = 'Вам нужно войти на сайт для просмотра этой страницы'
    redirect_to log_in_path
  end
end
