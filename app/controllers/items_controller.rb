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

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
