class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:admin_panel]

    def index 
        @user = User.new
    end

    def ticket 
        @ticket = Ticket.where(user_id: current_user.id).first
        if Ticket.where(tour: "1").count >= 100
            @disable_radio_button_tour_1 = true
        else 
            @disable_radio_button_tour_1 = false
        end
        if Ticket.where(tour: "2").count >= 100
            @disable_radio_button_tour_2 = true
        else 
            @disable_radio_button_tour_2 = false
        end
        if Ticket.where(tour: "3").count >= 100
            @disable_radio_button_tour_3 = true
        else 
            @disable_radio_button_tour_3 = false
        end
    end

    def admin_panel
        if current_user.admin == false 
            redirect_to "/unauthorised_admin_panel_entry"
        end

        if params.fetch("ticket_code", nil) != nil
            @ticket = Ticket.where(code: params.fetch("ticket_code", nil)).first
        end
    end

    def unauthorised_admin_panel_entry
    end

    def ticket_checking_form 
        redirect_to controller: 'pages', action: 'admin_panel', ticket_code: params.dig("code", "ticket_code")
    end

    def tour_selection_form 
        ticket = current_user.ticket
        ticket.tour = params["ticket_tour_change"]["tour"]
        ticket.save
        redirect_to controller: "pages", action: "ticket"
    end
end

