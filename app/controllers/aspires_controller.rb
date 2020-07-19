class AspiresController < ApplicationController
  before_action :set_aspire, only:[:edit, :update]

  def new
    @aspire = Aspire.new
  end

  def create
    @aspire = current_student.build_aspire(aspire_params)
    if @aspire.save
      flash[:success] = "志望校を登録しました"
      redirect_to student_path(current_student)
    else
      flash.now[:danger] = "志望校を登録できませんでした"
      render :new
    end
  end

  def edit
    unless @aspire.student == current_student
      flash[:danger] = "他の人の志望校を変更することはできません"
      redirect_to student_path(current_student)
    end
  end

  def update
    if @aspire.student == current_student
      if @aspire.update(aspire_params)
        flash[:success] = "志望校を登録しました"
        redirect_to student_path(current_student)
      else
        flash.now[:danger] = "志望校を登録できませんでした"
        render :edit
      end
    else
      flash[:danger] = "他の人の志望校を変更することはできません"
      redirect_to student_path(current_student)
    end
  end

  private
  def aspire_params
    params.require(:aspire).permit(:student_id, :school_name, :faculty)
  end

  def set_aspire
    @aspire = Aspire.find(params[:id])
  end
end
