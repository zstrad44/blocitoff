class UsersController < ApplicationController
  
  def dashboard
    @user = current_user
    @item_new = Item.new
  end
  
end

