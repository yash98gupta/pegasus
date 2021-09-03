class TimetableController < ApplicationController
  def timetable_new
    @standard=params[:standard].to_i
    if current_user.admin !=true
    @selected=params[:selected_subject].to_i
    @selected_subject=Course.find_by(id: @selected)
    end
    @timetable=Timetable.new
    render :layout => false
  end

  def timetable_create
    @timetable=Timetable.create(timetable_params)
    redirect_to root_path
  end

  def timetable_delete
    @timetable=Timetable.find(params[:id])
    @timetable.destroy
    redirect_to root_path
  end

  private

  def timetable_params
    params.require(:timetable).permit(:title,:description,:file,:standard)
  end
end
