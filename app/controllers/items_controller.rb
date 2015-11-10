class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = current_user.items
  end

  def search
    @search = params[:q]
    @items = Item.search(@search)

    render :index
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    item_params[:collection_id] =
      current_user.collections.where(name: item_params.delete(:collection)).first_or_create.id

    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, flash: { success: "Item was successfully added." }
    else
      render :new
    end
  end

  def update
    item_params[:collection_id] =
      current_user.collections.where(name: item_params.delete(:collection)).first_or_create.id

    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item, flash: { success: "Item was successfully updated." }
    else
      flash.now[:error] = "Failed to update this item."
      render :edit
    end
  end

  def destroy
    @item.destroy

    redirect_to items_url, notice: "Item was successfully deleted."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Whitelisted params.
  def item_params
    @item_params ||= params.require(:item).permit(:title, :description, :collection, :item_image)
  end
end
