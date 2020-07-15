class EvaluationsController < ApplicationController

  def create
    if params[:high_low] == "high"
      @evaluation = current_student.evaluations.build(video_id: params[:video_id], high_low: "high")
      @evaluation.save
      render :toggle
    elsif
      params[:high_low] == "low"
      @evaluation = current_student.evaluations.build(video_id: params[:video_id], high_low: "low")
      @evaluation.save
      render :toggle
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.high?
      @evaluation.update(high_low: "low")
      render :toggle
    elsif @evaluation.low?
      @evaluation.update(high_low: "high")
      render :toggle
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    @video = @evaluation.video
    @evaluation.destroy
    @evaluation = nil
    render :destroy
  end

end
