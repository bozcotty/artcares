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
      :card        => params[:stripeToken],
      # amount is in cents! (includes price + shipping price)
      :amount      => @artwork.stripe_amount,
      :description => "#{params[:stripeEmail]} purchased #{@artwork.title}",
      :currency    => 'usd',
      :image       => @artwork.art_image_1.thumb.url,
      :name        => 'ArtCaring.com',
      :label       => 'Buy Now',
      )
    

    @buyer = Buyer.where(name: params[:stripeBillingName],
      email: params[:stripeEmail], 
      address_line_1: params[:stripeBillingAddressLine1], 
      address_apartment: params[:stripeBillingAddressApt], 
      address_zip: params[:stripeBillingAddressZip], 
      address_city: params[:stripeBillingAddressCity], 
      address_state: params[:stripeBillingAddressState], 
      address_country: params[:stripeBillingAddressCountry], 
      address_country_code: params[:stripeBillingAddressCountryCode],
      shipping_name: params[:stripeShippingName], 
      shipping_address_line_1: params[:stripeShippingAddressLine1], 
      shipping_address_apartment: params[:stripeShippingAddressApt], 
      shipping_address_zip: params[:stripeShippingAddressZip], 
      shipping_address_city: params[:stripeShippingAddressCity], 
      shipping_address_state: params[:stripeShippingAddressState], 
      shipping_address_country: params[:stripeShippingAddressCountry], 
      shipping_address_country_code: params[:stripeShippingAddressCountryCode])
      


    PurchaseMailer.new_purchase(@artwork, @buyer).deliver

  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end
  
  

end