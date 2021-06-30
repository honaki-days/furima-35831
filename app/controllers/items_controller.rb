class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :detail_category_id, :detail_condition_id, :user_area_id, :delivery_charge_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end
end