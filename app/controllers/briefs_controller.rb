class BriefsController < ApplicationController
  def index
    @briefs = Brief.all
  end

  def show
    @brief = Brief.find(params[:id])
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
