class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      @items = response.first(20)
    end
  end

  def show
    @users_have = User.have_users(params[:item_id])
    @user_want = User.want_users(params[:item_id])
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
