class StatusesController < ApplicationController
  before_action :correct_user,   only: :destroy
  before_action :logged_in_user, only: [:index, :destroy, :create]
  
  def create
    @pet = Pet.find(params[:pet_id])
    @status = current_user.statuses.build(status_params)
    if @status.save
      flash[:success] = "コメントしました"
      redirect_to [@pet]
    else
      redirect_to request.referrer, status: :see_other
    end
  end
    
  def destroy
    @status.destroy
    flash[:success] = "コメントを削除しました"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end
      
  def status_params
    params.require(:status).permit(:food, :weight, :temperature).merge(pet_id: params[:pet_id])
  end

  def correct_user
    @status = current_user.statuses.find_by(id: params[:id])
    redirect_to root_url, status: :see_other if @status.nil?
  end
  
end
