class UsersController < ApplicationController
  
  def dashboard
    @user = current_user
    @item = Item.new
    
  end
  
  
end

