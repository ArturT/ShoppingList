class Api::Internal::ListsController < ApplicationController
  before_action :authenticate_user!

  takes :lists_presenter

  def index
    render json: current_user.lists
  end

  def show
    list = current_user.lists.find(params[:id])
    render json: lists_presenter.as_json(list)
  end

  def create
    list = current_user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors }, status: 422
    end
  end

  def update
    list = current_user.lists.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors }, status: 422
    end
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
