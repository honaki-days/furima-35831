class PurchaseLogsController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :root_path [:index, :create]



  def index
  @purchase_log_address = PurchaseLogAddress.new
  end

  def create
    @purchase_log_address = PurchaseLogAddress.new(purchase_log_params)
    if @purchase_log_address.valid?
      pay_item
      @purchase_log_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_log_params
    params.require(:purchase_log_address).permit(:receiver_postal_code, :user_area_id, :receiver_cities, :receiver_address, :receiver_building_name, :receiver_phone_number, :purchases_log_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  
        card: purchase_log_params[:token], 
        currency: 'jpy'                 
      )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def  root_path  
    if current_user.id == @item.user_id || @item.purchase_log.present?
    　redirect_to root_path
    end
  end
end