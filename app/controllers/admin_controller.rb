class AdminController < ApplicationController

  def dashboard
    # whenever --update-crontab    => to run the mailer wheneverise to set task
    # whenever -c theCronJob       => to remove the crontabs i.e tasks already set.
    # lib->tasks->email_tasks
      # Cart.all.each do |c|
      #   if Date.today() >= c.end_date - 7
      #     ReminderMailer.reminder_email(User.find_by(id: c.student_id)).deliver_now
      #   end
      # end

    render :layout => false
  end

  def admin_common
    @standard=params[:standard].to_i
    @user = User.where(standard: @standard)
    render :layout => false
  end

  def admin8
    @user=User.where(standard: '8')
    render :layout => false
  end

  def admin9
    @user= User.where(standard: '9');
    render :layout => false

  end

  def admin10
    @user= User.where(standard: '10');

    render :layout => false
  end

  def admin11
    @user= User.where(standard: '11');
    render :layout => false

  end

  def admin12
    @user= User.where(standard: '12');
    render :layout => false
  end

  def student

    @student = User.find(params[:id])
    @student_subjects = Cart.where(student_id: @student.id)
    render :layout => false
  end

  def admin_leaderboard

    @standard= params[:standard]
    render :layout => false
  end

  def admin_leaderboard_subject

    @selected_subject = Course.find_by(id: params[:course_id])
    @u=Course.find_by(id: params[:course_id]).standard
    User.where(standard: @u).each do |u|
        @sum=0
      Scoreboard.where(student_id: u.id, course_id: params[:course_id]).each do |t|
        @sum = @sum + t.marks
      end
      Scoreboard.where(student_id: u.id, course_id: params[:course_id]).each do |k|
        k.total=@sum
        k.save
      end
    end
    @filter=Scoreboard.where(course_id: params[:course_id])
    @filtered=@filter.order(total: :desc)
    @names=@filtered.distinct.pluck(:student_id)
    render :layout => false

  end

  def choose_subjects

    @path=params[:path].to_i
    @standard=params[:standard].to_i
    render :layout => false
  end

  def destroy_user
    byebug
    @user_destroy = User.find(params[:id])
    if params[:pending].to_i == 1
      @cart_destroy=Cart.find_by(course_id:params[:course_id].to_i , student_id: @user_destroy.id)
      @cart_destroy.destroy
    end

    if params[:pending].to_i ==2
      @user_destroy.destroy
    end
    redirect_to root_path
    end
end
