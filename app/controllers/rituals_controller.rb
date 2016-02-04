class RitualsController < ApplicationController
		helper DateHelper
	

	def new
		@ritual = Ritual.new
	end

	def create
		@ritual = Ritual.new(ritual_params)

		if @ritual.save
			flash[:notice] = "Ritual Created!"
			redirect_to rituals_path
		else
			logger.debug("there was an error!")
			
			
		end
	end


	def index
		@ritual = Ritual.joins(:attendances).uniq
		@attendance = Attendance.all
		@user = User.all
		respond_to do |format|
  		format.html
  		format.json { render :json => @ritual }
end


	end

	def show
		@ritual = Ritual.find(params[:id])
		@new_whiskey = Whiskey.new
		@whiskey = Whiskey.all
		@attendance = Attendance.all
		@user = User.all
		@post_new = Post.new
		@post_new.ritual = @ritual
		@ritual_posts = Post.where(:ritual => @ritual)


	end

	private

	def ritual_params
		params.require(:ritual).permit(:whiskey_id, :user_id, :date_of)
	end
end
