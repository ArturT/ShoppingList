class Api::Internal::ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.lists
  end

  def create
    list = current_user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors }
    end
  end

  def update
  end

  def destroy
    list = current_user.lists.find(params[:id])
    list.destroy
    render json: {}
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
