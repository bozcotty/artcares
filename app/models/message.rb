class Message
  include ActiveAttr::Model

    # attr_accessible :name, :email, :subject, :content

    attribute :name
    attribute :email
    attribute :subject
    attribute :content

    validates_presence_of :name, :email, :subject
    validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
    validates_length_of :content, :maximum => 700
end