class CardsController < ApplicationController
	before_action :get_params
	skip_before_action :get_params, only: [:new, :create, :index, :random, :check]
	def index
		@cards = Card.all
	end

	def random
		@card = Card.expired.random
	end

	def new
		@card = Card.new
	end

	def edit
	end

	def create
		@card = Card.new(card_params)

		@card.save
		redirect_to @card
	end

	def update
		if @card.update(card_params)
			flash[:success] = 'Карточка изменена'
			redirect_to @card
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@card.destroy

		redirect_to cards_path
	end

	def check
		@card = Card.find(params[:check][:id])
		answer = params[:check][:answer]
		if answer == @card.original_text
			@card.set_review_date(3)
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
		params.require(:card).permit(:original_text, :translated_text)
	end
end
