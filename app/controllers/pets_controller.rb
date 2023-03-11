class PetsController < ApplicationController
  def show
    @pet=Pet.find(params[:id])
    @statuses = @pet.statuses
    if logged_in?
      @status = current_user.statuses.build
    end
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      flash[:success] = "投稿しました"
      redirect_to request.referer
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  def destroy
    @pet.destroy
    flash[:success] = "投稿を削除しました"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  def pet_params
    params.require(:pet).permit(:name, :sex, :old)
  end
end
