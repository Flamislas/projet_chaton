class JoinTableCartItemsController < ApplicationController

  # def new
  #   @cart = Cart.find(params[:cart_id])
  #   @join_table_cart_item = JoinTableCartItem.new

  # end

  def create
    @cart = Cart.find_by(user_id: current_user.id)
    @join_table_cart_item = JoinTableCartItem.new( cart_id: @cart.id, item_id: params[:item_id])

    if @join_table_cart_item.save # essaie de sauvegarder en db
      flash.notice = "join_table_cart_item successfully created"
      redirect_to panier_path
    else
      flash.alert = "join_table_cart_item not created"
      render 'new'
      flash.alert = nil
    end
  end

  def destroy
    @cart = Cart.find_by(user_id: current_user.id)
    @join_table_cart_item = JoinTableCartItem.find_by(cart_id: @cart.id, item_id: params[:item_id])
    @join_table_cart_item.destroy
    redirect_to panier_path
  end
end
