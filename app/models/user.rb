class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one :ticket

  # Only after the user is confirmed we can create a ticket
  def after_confirmation
    if Ticket.where(tour: "1").count < 100
      @tour = "1"
    elsif Ticket.where(tour: "2").count < 100
      @tour = "2"
    else
      @tour = "3"
    end
    ticket = Ticket.new(user: self, code: SecureRandom.hex(2), tour: @tour)
    ticket.save 
  end

end
