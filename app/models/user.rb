class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one :ticket

  # Only after the user is confirmed we can create a ticket
  def after_confirmation
    ticket = Ticket.new(user: self, code: SecureRandom.hex(2))
    ticket.save 
  end

end
