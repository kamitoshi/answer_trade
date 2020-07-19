class StudentsController < ApplicationController
  before_action :set_student, only:[:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def edit
    unless current_student == @student
      flash[:danger] = "他人のプロフィールは変更できません"
      redirect_to student_path(current_student)
    end
  end

  def update
    if current_student == @student
      if @student.update(student_params)
        flash[:success] = "プロフィールを変更しました"
        redirect_to student_path(@student)
      else
        flash[:danger] = "プロフィールの変更に失敗しました。入力内容が正しいか確認してください"
        render :edit
      end
    else
      flash[:danger] = "他人のプロフィールは変更できません"
    end
  end

  def destroy
    if current_student == @student
      if @student.destroy
        flash[:success] = "退会しました。"
        redirect_to root_path
      else
        flash[:danger] = "退会に失敗しました。時間を置いて再度お試しください。解決しない場合は運営に問い合わせください。"
        redirect_to student_path(@student)
      end
    else
      flash[:danger] = "他人のアカウントを退会させることはできません"
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :grade, :email, :introduction, :is_subscribe, :image)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
