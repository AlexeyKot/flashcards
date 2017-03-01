class CardsController < ApplicationController
	before_action :get_params
	skip_before_action :get_params, only: [:new, :create, :index, :random, :check]
	def index
		@cards = current_user.cards.all
	end

	def random
		@card = current_user.cards.expired.random.first
	end

	def new
		@card = current_user.cards.new
	end

	def edit
	end

	def create
		@card = current_user.cards.create(card_params)
		if @card.persisted?
			flash[:success] = 'Карточка создана'
			redirect_to @card
		else
			flash[:danger] = 'Ошибка при создании карты'
			render 'new'
		end
	end

	def update
		if @card.update(card_params)
			flash[:success] = 'Карточка обновлена'
			redirect_to @card
		else
			flash[:danger] = 'Ошибка при обновлении карты'
			render 'edit'
		end
	end

	def show
	end

	def destroy
		if @card.destroy
			flash[:success] = 'Карточка удалена'
		else
			flash[:warning] = 'Не удалось удалить карточку'
		end
		redirect_to cards_path

	end

	def check
		@card = Card.find(params[:check][:id])
		answer = params[:check][:answer]
		if @card.check_translation(answer)
			@card.move_review_date
			flash[:success] = "Правильный ответ! Следующая проверка: " + @card.review_date.to_s
		else
			flash[:danger] = "Вы неправильно перевели предыдущую карточку!"
		end
		redirect_to root_path
	end

	private
	def get_params
		@card = Card.find(params[:id])
	end

	def card_params
		params.require(:card).permit(:original_text, :translated_text, :user_id)
	end
end
