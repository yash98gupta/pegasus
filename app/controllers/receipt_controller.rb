class ReceiptController < ApplicationController

  def index

    @user_standard=User.where(standard: params[:standard])

    @receipts = Array.new

    @user_standard.each do |r|
      @receipt=Receipt.where(student_id: r.id)
      @receipt.each do |f|
        @receipts.push f
      end
    end

  end

end
