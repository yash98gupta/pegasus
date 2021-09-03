class NcertsolController < ApplicationController
  def ncertsol_new
    @standard=params[:standard].to_i
    @selected=params[:selected_subject].to_i
    @selected_subject=Course.find_by(id: @selected)
    @ncertsol=Ncertsol.new
    render :layout => false
  end

  def ncertsol_create
    @ncertsol=Ncertsol.create(ncertsol_params)
    redirect_to root_path
  end

  def ncertsol_delete
    @ncert=Ncertsol.find(params[:id])
    @ncert.destroy
    redirect_to root_path
  end

  private

  def ncertsol_params
    params.require(:ncertsol).permit(:title,:description,:file,:standard,:course_id)
  end
end
