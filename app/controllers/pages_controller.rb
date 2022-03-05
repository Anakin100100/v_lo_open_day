class PagesController < ApplicationController
    def index 
        @user = User.new
    end

    def ticket 
        @ticket = Ticket.where(user_id: current_user.id).first
    end
end

