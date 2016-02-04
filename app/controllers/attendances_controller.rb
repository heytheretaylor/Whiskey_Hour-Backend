class AttendancesController < ApplicationController

	def current_attend
    a = Attendance.where(:ritual => Ritual.next_ritual)
    b = a.where(:user => current_user)
    c = b.last

    if c.nil?
      return false
    else
      return c
    end

  end


  
  def new

    @attendance = Attendance.new
    @ritual = Ritual.next_ritual


    @current_attend = current_attend



  end

  def create
    #calls next_ritual from Ritual model (if no next event exists, creates it)
    @ritual = Ritual.next_ritual
    
    #makes new Attendance object, sets user to current user

    ## removed :user => current_user from params for new, might let me take bool?
    @attendance = Attendance.new(attendance_params)
    #sets ritual to next_ritual
    @attendance.ritual = @ritual
    @attendance.user = current_user



    if @attendance.save
      if @attendance.is_coming
        flash[:notice] = "See you there hot shot!"
      else
        flash[:notice] = "Your loss"
      end
      redirect_to rituals_path
    else
      flash[:notice] = "Post failed!"
      logger.debug("There was an error!!!")
     end
    
    

  end

  def index
    ##eliminates nil fields in attendance (do I need this? should move to model)
    @attendances = Attendance.where.not(user_id: nil, ritual_id: nil)
    @users = User.all

    @current_attend = current_attend

  end

  def show
    @attendance = Attendance.find(params[:id])
    
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user_id, :ritual_id, :is_coming)
  end


end
