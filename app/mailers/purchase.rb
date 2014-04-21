class Purchase < ActionMailer::Base
  default from: "from@example.com"

  def new_purchase(artwork, buyer)
    @artwork = artwork
    @buyer = buyer
    mail(to: artwork.user.email, subject: "#{@buyer.name} purchased #{@artwork.title}")
  end
end
