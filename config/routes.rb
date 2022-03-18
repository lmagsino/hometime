Rails.application.routes.draw do
  post 'reservations/create', :to => 'reservations#create'
end
