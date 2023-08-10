class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token

    # POST - royalkitchen/users/:id/orders
    def create 
        @order = Order.create(user_id: params[:user_id])
        a = params[:items]
        a.each do |k| 
            if Item.find_by(item_name: k)
                @item = Item.find_by(item_name: k)
            else
                @item = Item.create(item_name: k)
            end

            @order.items << @item 
        end

        render json: @order.items
    end


    # Get - royalkitchen/users/:id/orders
    def index
        @user = User.find(params[:user_id])
        @hash= {}
        @user.orders.each_with_index do |k,index| 
            a = "order no #{index+1}"
            @hash[a] = k.items.pluck("item_name")
        end
        render json: @hash
    end
    
end
