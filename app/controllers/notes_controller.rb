class NotesController < ApplicationController

  def study_material_new

    @standard=params[:standard].to_i
    @selected=params[:selected_subject].to_i
    @selected_subject=Course.find_by(id: @selected)
    @notes=Note.new
    @notes_all=Note.all
    render :layout => false
  end

  def study_material_create

    @note_create=Note.create(study_params)
    redirect_to root_path
  end

  def notes_delete
    @notes=Note.find(params[:id])
    @notes.destroy
    redirect_to root_path
  end


  private

  def study_params
    params.require(:note).permit(:title,:description,:file,:standard,:course_id)
  end
end
