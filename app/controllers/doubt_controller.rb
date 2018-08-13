class DoubtController < ApplicationController

  def new
    @standard=params[:standard].to_i
    @selected_subject=params[:selected_subject].to_i
    @new_doubt = Doubt.new
    @new_comment=Comment.new
      render :layout => false
  end

  def create
    @create_doubt=Doubt.create(
      title: params[:doubt][:title],
      description: params[:doubt][:description],
      student_id:params[:doubt][:student_id].to_i,
      course_id: params[:doubt][:course_id].to_i
    )
    @create_doubt.file.attach(params[:doubt][:file])
    @create_doubt.save
    redirect_to root_path
  end

  def create_comment

    @create_comment=Comment.create(
      title: params[:comment][:title],
      description: params[:comment][:description],
      student_id:params[:comment][:student_id].to_i,
      doubt_id: params[:comment][:doubt_id].to_i
    )
    @create_comment.file.attach(params[:comment][:file])
    @create_comment.save
    redirect_to root_path
  end

  def doubt_delete
    @doubt=Doubt.find(params[:id])
    @comments=Comment.where(doubt_id:@doubt.id)
    @comments.delete_all
    @doubt.destroy
    redirect_to root_path
  end

  def comment_delete
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end


end
