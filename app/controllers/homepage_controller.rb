class HomepageController < ApplicationController
  def show
    @inquiry = Inquiry.new
  end

  def inquiry_create

    @inquiry_create=Inquiry.create(
      name: params[:inquiry][:name],
      mobile_number: params[:inquiry][:mobile_number],
      subject: params[:inquiry][:subject],
      message: params[:inquiry][:message]
    )
    redirect_to root_path
    end

    def inquiry_delete
      @inquiry_delete=Inquiry.find(params[:id])
      @inquiry_delete.destroy
      redirect_to root_path
    end

end
