class Message
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :subject
  attribute :content

  validates :name, :email, :subject, presence: true
  validates :email, format: /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates :content, length: { maximum: 700 }
end
