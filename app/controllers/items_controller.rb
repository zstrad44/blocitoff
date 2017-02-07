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
  
  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      redirect_to root_path
      flash[:notice] = "Success! ToDo was marked as COMPLETE and has been DESTROYED!"
      
    else
      flash[:alert] = "Something wen't terribly wrong! Try again if you want.."
      redirect_to root_path
    end
  end
  
end
