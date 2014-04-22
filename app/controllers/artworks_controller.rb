class ArtworksController < ApplicationController

  def index 
    @artworks = Artwork.all
  end

  def new
    @patient_campaign = PatientCampaign.find(params[:patient_campaign_id])
    @artwork = Artwork.new
    authorize! :create, Artwork, message: "You need to own the Patient Campaign to add an artwork to it." 
  end

  def create
    @patient_campaign = PatientCampaign.find(params[:patient_campaign_id])
    # @artwork = Artwork.new(params[:artwork])
    # @artwork.user = current_user
    @artwork = current_user.artworks.build(params[:artwork])
    @artwork.patient_campaign = @patient_campaign
      authorize! :create, Artwork, message: "You need to be signed up as an artist to list artworks."
   
    if @artwork.save
      flash[:notice] = "Your artwork listing was saved successfully."
      redirect_to [@patient_campaign, @artwork]
    else
      flash[:error] = @artwork.patient_campaign.errors.full_messages
      render :new
    end
  end

  def show
    @patient_campaign = PatientCampaign.find(params[:patient_campaign_id])
    @artwork = Artwork.find(params[:id])
  end

  def edit
    @patient_campaign = PatientCampaign.find(params[:patient_campaign_id])
    @artwork = Artwork.find(params[:id])
    authorize! :edit, @artwork, message: "You need own the artwork to do that."
  end

  def update
    @patient_campaign = PatientCampaign.find(params[:patient_campaign_id])
    @artwork = Artwork.find(params[:id])
    @artwork.user = current_user
    authorize! :update, @artwork, message: "You need to own the artwork to update it."
    if @artwork.update_attributes(params[:artwork])
      redirect_to [@patient_campaign, @artwork], notice: "Artwork was updated successfully."
    else
      flash[:error] = @artwork.errors.full_messages
      render :edit
    end
  end

  def destroy
    @patient_campaign = PatientCampaign.find(params[:patient_campaign_id])
    @artwork = Artwork.find(params[:id])
    title = @artwork.title
    authorize! :destroy, @artwork, message: "You need to own the artwork to delete it."
    if @artwork.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @patient_campaign
    else
      flash[:error] = "There was an error deleting the artwork."
      render :show
    end
  end
  

  # form_tag patient_campaign_artwork_buy_path(artwork.patient_campaign, artwork) do
  #   stripe checkout stuff
  # end
  def buy
    @artwork = Artwork.find(params[:artwork_id])

    charge = Stripe::Charge.create(
      :card        => params[:stripe_Token],
      :amount      => @artwork.price * 100 + shipping_cost,
      :description => "#{params[:stripeEmail]} purchased #{@artwork.title}",
      :currency    => 'usd'
    )

    @buyer = Buyer.create(name: params[:stripeShippingName],
                          city: params[:stripeShippingAddressCity])

    PurchaseMailer.new_purchase(@artwork, @buyer).deliver

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end