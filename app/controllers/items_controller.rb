class ItemsController < ApplicationController
  
  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user_id = current_user.id
    @item.user = current_user

    if @item.save
        redirect_to root_path
        flash[:notice] = "Nice! You just added a new ToDo!"
    else
        flash[:alert] = "Bummer, something went wrong! Try again.. eh?"
        redirect_to root_path
    end
   
  end
end
