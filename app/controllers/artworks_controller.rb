class ArtworksController < ApplicationController

   def index 
    if params[:category]
      @artworks = Artwork.where(category: params[:category].downcase).paginate(page: params[:page], per_page: 30)
    elsif params[:min_price] || params[:max_price]
      @artworks = Artwork.where(price: price_range).paginate(page: params[:page], per_page: 30)
    else
      @artworks = Artwork.all.paginate(page: params[:page], per_page: 30)
    end
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

  #avoid reloading art images, category choice 
    if params[:artwork][:category].blank?
      params[:artwork].delete("category")
    end

    # if params[:artwork][:art_image_1].blank?
    #   params[:artwork].delete("art_image_1")
    # end

    # if params[:artwork][:art_image_2].blank?
    #   params[:artwork].delete("art_image_1")
    # end

    # if params[:artwork][:art_image_3].blank?
    #   params[:artwork].delete("art_image_1")
    # end


    @patient_campaign = PatientCampaign.find(params[:patient_campaign_id])
    @artwork = Artwork.find(params[:id])
    @artwork.user = current_user

    status = params[:artwork].delete(:status)

    if current_user.role == 'admin'
      @artwork.status = status
    end

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
      redirect_to welcome_dashboard_path
    else
      flash[:error] = "There was an error deleting the artwork."
      render :show
    end
  end
  
  def buy
    @artwork = Artwork.find(params[:artwork_id])

    charge = Stripe::Charge.create(
      :card        => params[:stripeToken],
      # amount is in cents! (includes price + shipping price)
      :amount      => @artwork.stripe_amount,
      :description => "#{params[:stripeEmail]} purchased #{@artwork.title}",
      :currency    => 'usd'
            )
    
    @user = @artwork.user

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
      shipping_address_country_code: params[:stripeShippingAddressCountryCode]).first_or_create
      

    PurchaseMailer.new_purchase(@artwork, @buyer).deliver
    PurchaseThanksMailer.new_purchase_thanks(@artwork, @buyer).deliver

    #decrement artwork quantity to 0, triggers "Sold" message in show view
    @artwork.update_attribute(:quantity, @artwork.quantity -= 1)

    @artwork.status = 'sold'
    @artwork.save
    if @artwork.save
      render 'buy'
    else
      redirect_to :back, error: 'There was an error processing your purchase.'
    end
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end
  

def price_range
 (params[:min_price].to_i || 0)..(params[:max_price].to_i || 1_000_000_000)
end

 
  

end