class Api::Internal::ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Item.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item
    else
      render json: { errors: item.errors }
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(list_params)
      render json: item
    else
      render json: { errors: item.errors }
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: {}
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
