class PurchaseLogsController < ApplicationController
  def index
    @purchase_log_address = PurchaseLogAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_log_address = PurchaseLogAddress.new(purchase_log_params)
    if @purchase_log_address.valid?
      @purchase_log_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_log_params
    params.require(:purchase_log_address).permit(:receiver_postal_code, :user_area_id, :receiver_cities, :receiver_address, :receiver_building_name, :receiver_phone_number, :purchases_log).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end