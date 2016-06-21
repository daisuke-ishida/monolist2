class RankingController < ApplicationController
      def have
        ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
        @item = ids.map do |id|
            Item.find(id)
    end

    def want
        @item = Want_items.find(params[:user_id])
        ids =@item.group(params[:q]).order(count_current_user_items: :desc).limit(10).offset(0).keys
        @items = ids.map do |id|
            Item.find(id)
    end
end