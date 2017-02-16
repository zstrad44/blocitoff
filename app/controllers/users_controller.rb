class UsersController < ApplicationController
  
  def dashboard
    @user = current_user
    @item = Item.new
    # @item = Item.find(params[:id])
  end
  
end

