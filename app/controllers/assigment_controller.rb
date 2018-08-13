class AssigmentController < ApplicationController

  def assignment_new
    @standard=params[:standard].to_i
    @selected=params[:selected_subject].to_i
    @selected_subject=Course.find_by(id: @selected)
    @assign=Assignment.new
    render :layout => false
  end

  def assignment_create
    @assign_create=Assignment.create(assignment_params)
    redirect_to root_path
  end

  def assignment_delete
    @assign=Assignment.find(params[:id])
    @assign.destroy
    redirect_to root_path
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title,:description,:file,:standard,:course_id)
  end

end
