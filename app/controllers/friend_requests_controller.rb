class FriendRequestsController < ApplicationController

  before_action :ensure_current_user_is_owner, :only => [:update, :destroy, :show, :edit]

  def ensure_current_user_is_owner
    @favorite = Favorite.find(params[:id])
    if @favorite.user_id != current_user.id
      redirect_to root_url, :alert => "Nice try"
    end
  end

  def index
    @friend_requests = FriendRequest.where({ :sender_id => current_user.id })
  end

  def show
    @friend_request = FriendRequest.find(params[:id])
  end

  def new
    @friend_request = FriendRequest.new
  end

  def create
    @friend_request = FriendRequest.new
    @friend_request.sender_id = current_user.id
    @friend_request.receiver_id = params[:receiver_id]

    if @friend_request.save
      redirect_to "/statuses", :notice => "Friend request created successfully."
    else
      render 'new'
    end
  end

  def edit
    @friend_request = FriendRequest.find(params[:id])
  end

  def update
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.sender_id = current_user.id
    @friend_request.receiver_id = params[:receiver_id]

    if @friend_request.save
      redirect_to "/friend_requests", :notice => "Friend request updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.destroy

    redirect_to "/friend_requests", :notice => "Friend request deleted."
  end
end
