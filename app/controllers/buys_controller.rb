class BuysController < ApplicationController
  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  private

  def buy_params
    params.require(:buy_address).permit(:municipality, :area_of_origin_id, :address, :post_code, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

 
end
