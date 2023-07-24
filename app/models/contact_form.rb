class ContactForm
  include ActiveModel::Model

  attr_accessor :email, :subject, :message

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :subject , presence: true , length: { minimum: 5, maximum: 50 }
  validates :message , presence: true , length: { minimum: 10, maximum: 1000 }

  

end
