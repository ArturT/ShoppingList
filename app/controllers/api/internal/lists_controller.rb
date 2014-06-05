class Api::Internal::ListsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    respond_with current_user.lists
  end

  def create
  end

  def update
  end

  def destroy
  end
end
