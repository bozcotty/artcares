class PurchaseMailer < ActionMailer::Base
  default from: "support@artcaring.com"

  def new_purchase(artwork, buyer)
    @artwork = artwork
    @buyer = buyer
    mail(to: artwork.user.email, subject: "#{@buyer.name} purchased this thing: #{@artwork.title}")
  end
end
