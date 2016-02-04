class WhiskeysController < ApplicationController
	def new
		@whiskey = Whiskey.new
	end

	def create
		@whiskey = Whiskey.new(whiskey_params)
		
		if @whiskey.save
			flash[:notice] = "whiskeyed!"
			redirect_to whiskeys_path(@whiskey)
		else
			flash[:notice] = "whiskey failed!"
			logger.debug("There was an error!!!")
		end
	end

	def index
		@whiskeys = Whiskey.all
		@new_whiskey = Whiskey.new
	end

	def show
		@whiskey = Whiskey.find(params[:id])
	end

	private
	def whiskey_params
		params.require(:whiskey).permit(:name, :image)
	end
end
