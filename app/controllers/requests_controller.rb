class RequestsController < ApplicationController
  before_action :set_request, only:[:show, :edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_student.requests.build(request_params)
    if @request.save
      flash[:success] = "リクエストしました"
      redirect_to requests_path
    else
      flash.now[:danger] = "リクエストに失敗しました"
      render :new
    end
  end

  def edit
    unless @request.student == current_student
      flash[:danger] = "他人のリクエストを変更することはできません"
      redirect_to student_path(current_student)
    end
  end

  def update
    if @request.student == current_student
      if @request.update(request_params)
        flash[:success] = "リクエストを編集しました"
        redirect_to requests_path
      else
        flash.now[:danger] = "リクエストの編集に失敗しました"
        render :edit
      end
    else
      flash[:danger] = "他人のリクエストを変更することはできません"
      redirect_to student_path(current_student)
    end
  end

  def destroy
    if @request.student == current_student
      if @request.destroy
        flash[:success] = "リクエストを削除しました"
        redirect_to requests_path
      else
        flash[:danger] = "リクエストを削除できませんでした"
        redirect_to requests_path
      end
    else
      flash[:danger] = "他人のリクエストを削除することはできません"
      redirect_to student_path(current_student)
    end
  end

  private
  def request_params
    params.require(:request).permit(:student_id, :academic_stage, :subject, :subject_content, :title, :detail, :is_active)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
