class DashboardController < ApplicationController

  def show
    render :layout => false
  end

  def subject
    @selected_subject = Course.find(params[:id])
    render :layout => false
  end


  def leaderboard

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
  #
  # def schedule
  #   render :layout => false
  # end
  #

  #
  # def ncert_solutions
  #   render :layout => false
  # end
  #
  # def tests
  #   render :layout => false
  # end
  #
  # def assignment
  #   render :layout => false
  # end
  #
  # def video
  #   render :layout => false
  # end
  #
  # def doubts
  #   render :layout => false
  # end




end
