class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  def index
    @collections = current_user.collections
  end

  def new
    @collection = Collection.new
  end

  def show
    @collection = current_user.collections.find(params[:id])
  end

  def edit
  end

  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to items_url, flash: { success: "Collection has been successfully created." }
    else
      render :new
    end
  end

  def update
    @collection = Collection.find(params[:id])

    if @collection.update(collection_params)
      redirect_to @collection, flash: { success: "Item was successfully updated." }
    else
      flash.now[:error] = "Failed to update this collection."
      render :edit
    end
  end

  def destroy
    @collection.destroy

    redirect_to items_url, flash: { notice: "Item was successfully deleted." }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    @collection_params ||= params.require(:collection).permit(:name)
  end
end
