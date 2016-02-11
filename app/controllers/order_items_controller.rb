class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    # session[:order_id] = @order.id
    if @order.save
      render json: @order, status: 200 #TODO store result in token 
    else
      render json: { error: @order.errors.full_messages }, status: 400
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    head :updated, location: order_items_path(@order)
  end

  def destroy
    # TODO first have the cart token destroyed on client side
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    render status: 200
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
