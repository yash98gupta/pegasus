class CoursesController < ApplicationController

  def integrated
  end
  
  def class6
  end

  def class7
  end

  def class8
  end

  def class9
  end

  def class10
  end

  def clas11
  end

  def class12
  end

  def subject
    @subject=Course.new
  end

  def subject_create
    @subject=Course.create(
      subject_name: params[:course][:subject_name],
      standard: params[:course][:standard],
      fees: params[:course][:fees]
    )
    redirect_to root_path
  end

  def edit_subject
  end

  def update_subject
  end

  def destroy_subject
    # cart where subject_is is of this subject will be deleted also from the courses list it will be deleted
  end


end
