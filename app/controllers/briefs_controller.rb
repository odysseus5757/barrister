class BriefsController < ApplicationController

  before_action :ensure_current_user_is_owner, :only => [:update, :destroy, :edit]

  def ensure_current_user_is_owner
    @favorite = Favorite.find(params[:id])
    if @favorite.user_id != current_user.id
      redirect_to root_url, :alert => "Unauthorized"
    end
  end

  def index
    @briefs = Brief.all
  end

  def show
    @brief = Brief.find(params[:id])
    @favorite = Favorite.new
  end

  def new
    @brief = Brief.new
  end

  def create
    @brief = Brief.new
    @brief.name = params[:name]
    @brief.user_id = current_user.id
    @brief.link = params[:link]
    @brief.lawyer = params[:lawyer]

    if @brief.save
      redirect_to "/briefs", :notice => "Brief created successfully."
    else
      render 'new'
    end
  end

  def edit
    @brief = Brief.find(params[:id])
  end

  def update
    @brief = Brief.find(params[:id])

    @brief.name = params[:name]
    @brief.user_id = current_user.id
    @brief.link = params[:link]
    @brief.lawyer = params[:lawyer]

    if @brief.save
      redirect_to "/briefs", :notice => "Brief updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @brief = Brief.find(params[:id])

    @brief.destroy

    redirect_to "/briefs", :notice => "Brief deleted."
  end
end
