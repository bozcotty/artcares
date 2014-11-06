class CampaignsController < ApplicationController
  def index
    @campaigns= Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
    authorize! :create, Campaign, message: "You need to sign up to create a Campaign."
  end

  def create
    @campaign = current_user.build_campaign(params[:campaign])
    authorize! :create, Campaign, message: "You need to sign up to create a Campaign."
    if @campaign.save
      flash[:notice] = "Campaign was saved successfully."
      redirect_to @campaign
    else
      flash[:error] = "Error saving Campaign, please try again."
      render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
    authorize! :edit, @campaign, message: "You need to own the Campaign to edit it."
  end

  def update
    if params[:campaign][:patient_image_1].blank?
      params[:campaign].delete("patient_image_1")
    end
    @campaign = Campaign.find(params[:id])
    authorize! :update, @campaign, message: "You need to own the Campaign to edit it."

    if @campaign.update_attributes(params[:campaign])
      redirect_to @campaign, notice: "Your updates were saved successfully."
    else
      flash[:error] = "Error saving Campaign changes. Please try again."
      render :edit
    end
  end
end
