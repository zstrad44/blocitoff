class ItemsController < ApplicationController
  include ItemsHelper
  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @user = current_user.items
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
  
  def edit 
    @item = Item.find(params[:id])
    @user = current_user
  end
  
  def update
    @item = Item.find(params[:id])
      if @item.reset_item
        @item.created_at = Time.now
      end

    if @item.update(item_params)
      change_days(@item)
      redirect_to root_path
      flash[:notice] = "Nice! You just updated your ToDo!"
    else
      flash[:alert] = "Something went wrong, please try again."
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

  private
  
    def item_params
      params.require(:item).permit(:name , :created_at, :updated_at, :reset_item, :days_to_expire)
    end
  
end
