class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :item_find, only: [:show, :create, :edit, :update]
  before_action :set_user, only: [:edit, :update]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :detail_category_id, :detail_condition_id, :user_area_id, :delivery_charge_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def set_user
    redirect_to root_path unless current_user == @item.user
  end
  
end