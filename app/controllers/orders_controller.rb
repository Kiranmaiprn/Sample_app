class OrdersController < ApplicationController
    
        def show
            @user=User.find(params[:id])
            @orders=@user.orders
            render json: @orders
        end
        
        def create
            @order=Order.create(user_id: params[:id])
            @items=params[:items_id]
            @items.each do |item_name|
                if Item.find_by_item_name(item_name).present?
                    @item=Item.find_by(item_name: item_name)
                    @order.items << @item
                else
                    @order.items.create(item_name: item_name)
                end
            end

           render json: @order.items
        end
    
    
end
