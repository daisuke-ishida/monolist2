class RankingsController < ApplicationController
    
    def have
      ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
      @item = ids.map do |id|
        Item.find(id)
    end
    end
    
    def want
      ids = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
      @item = ids.map do |id|
        Item.find(id)
    end
    end
    
end
