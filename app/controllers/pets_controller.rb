class PetsController < ApplicationController
  before_action :correct_user,   only: :destroy
  before_action :logged_in_user, only: [:index, :destroy, :create]

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
      flash[:success] = "追加しました"
      redirect_to request.referer
    else
      flash[:danger] = "項目を埋めてください"
      redirect_to request.referrer, status: :see_other
    end
  end

  def destroy
    @pet.destroy
    flash[:success] = "削除しました"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:success] = "訂正しました"
      redirect_to request.referrer
    else
      flash[:danger] = "項目を埋めてください"
      render 'edit', status: :unprocessable_entity
    end
  end

  def pet_params
    params.require(:pet).permit(:name, :sex, :old)
  end

  def correct_user
    @pets = current_user.pets.find_by(id: params[:id])
    redirect_to root_url, status: :see_other if @pet.nil?
  end
end
