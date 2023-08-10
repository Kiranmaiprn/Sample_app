class OrdersController < ApplicationController
<<<<<<< HEAD
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


    def index
        @user = User.find(params[:user_id])
        @hash= {}
        @user.orders.each_with_index do |k,index| 
            a = "order no #{index+1}"
            @hash[a] = k.items.pluck("item_name")
        end
        render json: @hash
    end
=======
    
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
    
>>>>>>> 0fd0b0389d10acdb5419d3d044ae78534008b933
    
end
