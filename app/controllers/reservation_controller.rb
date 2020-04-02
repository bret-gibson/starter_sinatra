class ReservationController < Sinatra::Base

    set :views, "app/views/reservations"
    set :method_override, true


    get '/reservations' do
        @reservations = Reservation.all
        # @customer = Customer.find(reservation.customer_id).name
        # @restaurant = Restaurant.find(reservation.restaurant_id).name
        erb :index
    end
    
    get '/reservations/new' do
        @customers = Customer.all
        @restaurants = Restaurant.all
        erb :new
    end

    post '/reservations' do
        reservation = Reservation.create(restaurant_id: params[:restaurant] , customer_id: params[:customer], date: params[:date])
        redirect "/reservations/#{reservation.id}"
    end

    get '/reservations/:id' do
        @reservation = Reservation.find(params[:id])
        erb :show
    end


end