class ItemsController < ApplicationController
  
  # def new 
  #   @item = Item.new(params[:item])
  # end
  
  def create
    @item = Item.new
     @item.name = params[:item][:name]
     @item.user_id = current_user.id
    @item.user = current_user

    if @item.save
       redirect_to root_path
     flash[:notice] = "You made a new item!"
    else
      flash[:alert] = "There was an error creating this item."
       redirect_to root_path
    end
   
  end
end
