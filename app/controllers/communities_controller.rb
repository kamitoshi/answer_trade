class CommunitiesController < ApplicationController
  before_action :set_community, only:[:show, :edit, :update, :destroy]

  def index
    @communities = Community.all
  end

  def show
  end

  def new
    @community = Community.new
  end

  def create
    @community = current_student.communities.build(community_params)
    if @community.save
      StudentCommunity.create(student_id: current_student.id, community_id: @community.id)
      flash[:success] = "『#{@community.name}』を作成しました"
      redirect_to community_path(@community)
    else
      flash.now[:danger] = "コミュニティを作成できませんでした"
      render :new
    end
  end

  def edit
    unless @community.students.include(current_student)
      flash[:danger] = "所属していないコミュニティの編集はできません"
      redirect_to comminity_path(@community)
    end
  end

  def update
    if @community.students.include(current_student)
      if @community.update(community_params)
        flash[:success] = "編集しました"
        redirect_to community_path(@community)
      else
        flash[:danger] = "編集に失敗しました"
        render :edit
      end
    else
      flash[:danger] = "所属していないコミュニティの編集はできません"
      redirect_to comminity_path(@community)
    end
  end

  def destroy
    if @community.admin == current_student
      if @community.destroy
        flash[:success] = "『#{@community.name}』を削除しました"
        redirect_to communities_path
      else
        flash[:danger] = "コミュニティの削除に失敗しました"
        redirect_to comminity_path(@community)
      end
    else
      flash[:danger] = "管理者以外はコミュニティを削除することができません"
      redirect_to comminity_path(@community)
    end
  end

  private
  def community_params
    params.require(:community).permit(:admin_id, :name, :slogan, :detail)
  end

  def set_community
    @community = Community.find(params[:id])
  end
end
