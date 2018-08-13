class VideoController < ApplicationController
  def video_new
    @standard=params[:standard].to_i
    @selected=params[:selected_subject].to_i
    @selected_subject=Course.find_by(id: @selected)
    @video=Video.new
    render :layout => false
  end

  def video_create
    @video_create=Video.create(video_params)
    redirect_to root_path
  end

  def video_delete
    @video=Video.find(params[:id])
    @video.destroy
    redirect_to root_path
  end

  private

  def video_params
    params.require(:video).permit(:title,:description,:file,:standard,:course_id)
  end
end
