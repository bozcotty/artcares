class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = campaign_by_id
  end

  def new
    @campaign = Campaign.new
    authorize! :create, Campaign, message: 'You need to sign up to create a Campaign.'
  end

  def create
    @campaign = current_user.build_campaign(campaign_params)
    authorize! :create, Campaign, message: 'You need to sign up to create a Campaign.'
    if @campaign.save
      flash[:notice] = 'Campaign was saved successfully.'
      redirect_to @campaign
    else
      flash[:error] = 'Error saving Campaign, please try again.'
      render :new
    end
  end

  def edit
    @campaign = campaign_by_id
    authorize! :edit, @campaign, message: 'You need to own the Campaign to edit it.'
  end

  def update
    campaign_params.delete('patient_image_1') if campaign_params[:patient_image_1].blank?

    @campaign = campaign_by_id
    authorize! :update, @campaign, message: 'You need to own the Campaign to edit it.'

    if @campaign.update_attributes(campaign_params)
      redirect_to @campaign, notice: 'Your updates were saved successfully.'
    else
      flash[:error] = 'Error saving Campaign changes. Please try again.'
      render :edit
    end
  end

  private

  def campaign_params
    params[:campaign]
  end

  def campaign_by_id
    Campaign.find(params[:id])
  end
end
