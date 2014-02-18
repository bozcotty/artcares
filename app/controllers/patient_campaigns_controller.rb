class PatientCampaignsController < ApplicationController
  def index
    @patient_campaigns = Patient_Campaign.all
  end

  def show
    @patient_campaign = Patient_Campaign.find(params[:id])
  end

  def new
    @patient_campaign = Patient_Campaign.new
    authorize! :create, Patient_Campaign, message: "You need to sign up to create a Patient Campaign."
  end

  def create 
    @patient_campaign = current_user.patient_campaigns.new(params[:patient_campaign])
    authorize! :create, Patient_Campaign, message: "You need to sign up to create a Patient Campaign."
    if @patient_campaign.save
      flash[:notice] = "Patient Campaign was saved successfully."
      redirect_to @patient_campaign
    else
      flash[:error] = "Error saving Patient Campaign, please try again."
      render :new
    end


  def edit
    @patient_campaign = Patient_Campaign.find(params[:id])
    authorize! :edit, @patient_campaign, message: "You need to own the Patient Campaign to edit it."
  end
end
