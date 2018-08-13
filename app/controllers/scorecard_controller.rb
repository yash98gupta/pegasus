class ScorecardController < ApplicationController

  def upload_result_new
    @score_new=Scoreboard.new
    @student_id=params[:student_id]
    @course_id=params[:course_id]
    end

  def upload_result_create

    @score_create=Scoreboard.create(
      student_id: params[:student_id].to_i,
      course_id: params[:course_id].to_i,
      title: params[:scoreboard][:title],
      marks: params[:scoreboard][:marks].to_i
    )
    redirect_to root_path
  end

  def edit_result
    @score_edit=Scoreboard.find(params[:id])
  end

  def update_result
    @score_update=Scoreboard.find(params[:id])
    @score_update.update(

    )
    redirect_to root_path
  end

  def destroy
    @score_delete=Scoreboard.find(params[:id])
    @score_delete.destroy
    redirect_to root_path
  end

  def sum
  end
end
