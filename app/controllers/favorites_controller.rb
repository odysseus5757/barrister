class FavoritesController < ApplicationController

  before_action :ensure_current_user_is_owner, :only => [:update, :destroy, :show, :edit]

  def ensure_current_user_is_owner
    @favorite = Favorite.find(params[:id])
    if @favorite.user_id != current_user.id
      redirect_to root_url, :alert => "Unauthorized"
    end
  end

  def index
    #if current_user != nil
      @favorites = current_user.favorites
      #@favorites = Favorite.where({ :user_id => current_user.id })
    #else
      #@favorites = Favorite.all
    #end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.brief_id = params[:brief_id]
    @favorite.comment = params[:comment]

    if @favorite.save
      redirect_to "/favorites", :notice => "Favorite created successfully."
    else
      render 'new'
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])

    @favorite.user_id = current_user.id
    @favorite.brief_id = params[:brief_id]
    @favorite.comment = params[:comment]

    if @favorite.save
      redirect_to "/favorites", :notice => "Favorite updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy

    redirect_to "/favorites", :notice => "Favorite deleted."
  end

end
