class PurchaseMailer < ActionMailer::Base
  default from: 'support@artcaring.com'

  def new_purchase(artwork, buyer)
    @artwork = artwork
    @buyer = buyer
    mail(to: [artwork.user.email, 'support@artcaring.com'], subject: "#{@buyer.name} purchased: #{@artwork.title}")
  end
end
