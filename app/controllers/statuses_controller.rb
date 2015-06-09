class StatusesController < ApplicationController

  before_action :ensure_current_user_is_owner, :only => [:update, :destroy, :show, :edit]

  def ensure_current_user_is_owner
    @favorite = Favorite.find(params[:id])
    if @favorite.user_id != current_user.id
      redirect_to root_url, :alert => "Nice try"
    end
  end

  def index
    @statuses = current_user.timeline_statuses.order("created_at DESC")
    @mystatuses = current_user.statuses.order ("created_at DESC")
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new
    @status.content = params[:content]
    @status.user_id = current_user.id

    if @status.save
      redirect_to "/statuses", :notice => "Status created successfully."
    else
      render 'new'
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])

    @status.content = params[:content]
    @status.user_id = current_user.id

    if @status.save
      redirect_to "/statuses", :notice => "Status updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @status = Status.find(params[:id])

    @status.destroy

    redirect_to "/statuses", :notice => "Status deleted."
  end
end
