class VideosController < ApplicationController
  before_action :set_video, only:[:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
    @categories = Category.all
    @subject_categories = @categories.group(:subject).map{|subject_category| subject_category.subject}
  end

  def show
    unless current_student.watched?(@video)
      current_student.watches.create(video_id: @video.id)
    end
    @student = @video.student
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_student.videos.build(video_params)
    if @video.save
      flash[:success] = "動画を投稿しました"
      redirect_to videos_path
    else
      flash.now[:danger] = "動画の投稿に失敗しました"
      render :new
    end
  end

  def request_new
    @video = Video.new
  end

  def request_create
    @video = current_student.videos.build(video_params)
    @video.request_id = params[:request_id]
    if @video.save
      flash[:success] = "リクエストの回答動画を投稿しました"
      redirect_to videos_path
    else
      flash.now[:danger] = "動画の投稿に失敗しました"
      render :request_new
    end
  end

  def edit
    unless @video.student == current_student
      flash[:danger] = "他の人がアップした動画は編集できません"
      redirect_to videos_path
    end
  end

  def update
    if @video.student == current_student
      if @video.update(video_params)
        flash[:success] = "動画の内容を編集しました"
        redirect_to video_path(@video)
      else
        flash.now[:danger] = "編集できませんでした"
        render :edit
      end
    else
      flash[:danger] = "他の人がアップした動画は編集できません"
      redirect_to videos_path
    end
  end

  def destroy
    if @video.student == current_student
      if @video.destroy
        flash[:success] = "動画を削除しました"
        redirect_to videos_path
      else
        flash[:danger] = "削除できませんでした"
        redirect_to video_path(@video)
      end
    else
      flash[:danger] = "他の人のアップした動画は削除できません"
      redirect_to videos_path
    end
  end

  private
  def video_params
    params.require(:video).permit(:student_id, :request_id, :category_id, :academic_stage, :title, :content, :detail, :count)
  end

  def set_video
    @video = Video.find(params[:id])
  end
end
