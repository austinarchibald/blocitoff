class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error adding the item. Please try again."
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    if @item.destroy
      flash.now[:notice] = "Item removed."
    else
      flash[:error] = "There was an error removing the item."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
