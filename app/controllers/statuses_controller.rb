class StatusesController < ApplicationController
  before_action :correct_user,   only: :destroy
  before_action :logged_in_user, only: [:index, :destroy, :create]
  
  def create
    @pet = Pet.find(params[:pet_id])
    @status = current_user.statuses.build(status_params)
    if @status.save
      flash[:success] = "記録しました"
      redirect_to [@pet]
    else
      flash[:danger] = "項目を埋めてください"
      redirect_to request.referrer, status: :see_other
    end
  end 
    
  def destroy
    @status.destroy
    if request.referrer.nil?
      flash[:success] = "記録を削除しました"
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  def edit 
    @pet = Pet.find(params[:id])
    @status = Status.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @status = Status.find(params[:id])
    if @status.update(status_params)
      flash[:success] = "訂正しました"
      redirect_to request.referrer
    else
      flash[:danger] = "項目を埋めてください"
      render 'edit', status: :unprocessable_entity
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
