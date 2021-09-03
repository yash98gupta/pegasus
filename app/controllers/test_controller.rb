class TestController < ApplicationController
  def test_new
    @standard=params[:standard].to_i
    @selected=params[:selected_subject].to_i
    @selected_subject=Course.find_by(id: @selected)
    @test=Test.new
    render :layout => false
  end

  def test_create
    @test=Test.create(test_params)
    redirect_to root_path
  end

  def test_delete
    @test=Test.find(params[:id])
    @test.destroy
    redirect_to root_path
  end

  private

  def test_params
    params.require(:test).permit(:title,:description,:file,:standard,:course_id)
  end
end
