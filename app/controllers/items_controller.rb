class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @item = current_user.items.build(item_params)
    @new_item = Item.new
    if @item.save
      flash.now[:notice] = "Item added."
    else
      flash[:error] = "There was an error adding the item. Please try again."
    end
    respond_to do |format|
      format.html
      format.js
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
