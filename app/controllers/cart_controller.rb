class CartController < ApplicationController

  def new

    if current_user.admin == true
      @user_admin=true
    else
      @user_admin=false
    end
    @student_id = params[:id]
    @cart_add=Cart.new
    @subjects = Course.where(standard: params[:standard])
    @subject_fees=Array.new
    @subject_id = Array.new
      @subjects.each do |s|
          @subject_id.push s.id
          @subject_fees.push s.fees
          @cart_id=params[:cart_id]
            if @cart_id != nil
              @cart_subject=Cart.find_by(id: @cart_id).course_id
              @subject_renew=Course.find_by(id: @cart_subject)
            end

      end
      @enrolled_subject= Array.new

      @subjects.each do |s|
        if Cart.find_by(student_id: @student_id,course_id: s.id) !=nil
          @enrolled_subject.push s.id
        end
      end

  end

  def create

    if current_user.admin == true
      @cart_add=Cart.create(
        student_id: params[:student_id].to_i,
        course_id: params[:cart][:course_id].to_i,
        end_date: params[:cart][:end_date],
        fees: params[:cart][:fees].to_i,
        emp_name: params[:cart][:emp_name],
        subscription: true
      )
      @make_reciept=Receipt.create(
        student_id: params[:student_id].to_i,
        subject_id: params[:cart][:course_id].to_i,
        end_date: params[:cart][:end_date],
        fees: params[:cart][:fees].to_i,
        emp_name: params[:cart][:emp_name]
      )
    else

      @end_date=params[:cart][:end_date]
      @a = Date.parse(@end_date.to_s)
      @b = Date.parse(Time.now.to_s)
      @c = @a.mjd - @b.mjd
      @months=(@c/30).round(0)
      if @months<=0
        @months=1
      end
      @cart_add=Cart.create(
        student_id: params[:student_id].to_i,
        course_id: params[:cart][:course_id].to_i,
        end_date: params[:cart][:end_date],
        fees: Course.find_by(id: params[:cart][:course_id]).fees * @months.round(0),
        emp_name: 'self',
        subscription: true
      )
      @make_reciept=Receipt.create(
        student_id: params[:student_id].to_i,
        subject_id: params[:cart][:course_id].to_i,
        end_date: params[:cart][:end_date],
        fees: Course.find_by(id: params[:cart][:course_id]).fees * @months.round(0),
        emp_name: 'self'
      )
    end
      ReceiptMailer.receipt_email(User.find(params[:student_id])).deliver_now
    redirect_to root_path
  end

  def destroy
    @remove_subject=Cart.find(params[:id])
    @remove_subject.destroy
    redirect_to root_path
  end

  def renew

    @cart_id=params[:id]
    redirect_to add_subject_path(:id => params[:student_id],:standard => params[:standard],:cart_id => params[:id])
  end

  def edit
    #
    @subject_renew=Cart.find(params[:id])
  end

  def update
    #
      @subject_renew=Cart.find(params[:id])
      @subject_renew.update(
      end_date: params[:cart][:end_date],
      subscription: true
      )

      @make_reciept=Receipt.create(
        student_id: @subject_renew.student_id,
        subject_id: @subject_renew.course_id,
        end_date: params[:cart][:end_date],
        fees: params[:cart][:fees].to_i,
        emp_name: params[:cart][:emp_name]
      )

      ReceiptMailer.receipt_email(User.find_by(id: @subject_renew.student_id)).deliver_now

      redirect_to root_path
  end

  def receipt

    @subject_receipt = Receipt.where(subject_id: params[:subject_id],student_id: params[:student_id])


  end


end
