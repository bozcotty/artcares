class PurchaseThanksMailer < ActionMailer::Base
  default from: "support@artcaring.com"

   def new_purchase_thanks(artwork, buyer)
    @artwork = artwork
    @buyer = buyer
    
    mail(to: buyer.email, subject: "ArtCaring thanks you for your purchase of #{@artwork.title}, by #{@artwork.user.full_name}")
  end
end
