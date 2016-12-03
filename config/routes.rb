Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'tickets', :to => 'ticket_clos#index', :via => 'get'
  match 'tickets/action', :to => 'ticket_clos#action', :as => 'action', :via => 'get'
  match "tickets/data", :to => "ticket_clos#data", :as => "data", :via => "get"
  match "tickets/db_action", :to => "ticket_clos#db_action", :as => "db_action", :via => "post"
  match "tickets/submit_form", :to => "ticket_clos#submit_form", :as => "submit_form", :via => [:get, :post]
  match "tickets/action_submit", :to => "ticket_clos#action_submit", :as => "action_submit", :via => [:get, :post]
  match 'tickets/form', :to => 'ticket_clos#form', :as => 'form', :via => 'get'
  match 'tickets/import/:period', :to => 'ticket_clos#import', :via => 'get'
  match 'tickets/export/:period', :to => 'ticket_clos#export', :via => 'get'
  resources :societe
end
