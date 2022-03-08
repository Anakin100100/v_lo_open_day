Rails.application.routes.draw do 
  devise_for :users
  root to: "pages#index"
  get "/ticket" => "pages#ticket"
  get "/admin_panel" => "pages#admin_panel"
  post "/ticket_checking_form" => "pages#ticket_checking_form"
  get "/unauthorised_admin_panel_entry" => "pages#unauthorised_admin_panel_entry"
  post "/tour_selection_form" => "pages#tour_selection_form"
end
