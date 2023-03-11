class StatusesController < ApplicationController
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
  
end
