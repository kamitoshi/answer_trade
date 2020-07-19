class EducationalBackgroundsController < ApplicationController
  before_action :set_educational_background, only:[:edit, :update]

  def new
    @educational_background = EducationalBackground.new
  end

  def create
    @educational_background = current_student.build_educational_background(educational_background_params)
    if @educational_background.save
      flash[:success] = "学歴を登録しました"
      redirect_to student_path(current_student)
    else
      flash.now[:danger] = "学歴を登録できませんでした"
      render :new
    end
  end

  def edit
    unless @educational_background.student == current_student
      flash[:danger] = "他の人の学歴を変更することはできません"
      redirect_to student_path(current_student)
    end
  end

  def update
    if @educational_background.student == current_student
      if @educational_background.update(educational_background_params)
        flash[:success] = "学歴を編集しました"
        redirect_to student_path(current_student)
      else
        flash.now[:danger] = "学歴を編集できませんでした"
        render :edit
      end
    else
      flash[:danger] = "他の人の学歴を変更することはできません"
      redirect_to student_path(current_student)
    end
  end

  private
  def educational_background_params
    params.require(:educational_background).permit(:student_id, :primary_school, :middle_school, :high_school, :is_public)
  end

  def set_educational_background
    @educational_background = EducationalBackground.find(params[:id])
  end
  
end
