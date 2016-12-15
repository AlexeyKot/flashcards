class CardsController < ApplicationController
	def index
		@cards = Card.all
	end

	def new
		@card = Card.new
	end

	def create
		@card = Card.new(card_params)
 
		@card.save
		redirect_to @card
  	end

	def show
		@card = Card.find(params[:id])
	end

	def destroy
		@card = Card.find(params[:id])
		@card.destroy

		redirect_to cards_path
	end

	private
		def card_params
			params.require(:card).permit(:original_text, :translated_text)
  		end
end
