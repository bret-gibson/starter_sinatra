class RestaurantsController < Sinatra::Base
    set :views, "app/views/restaurants"
    set :method_override, true

    get '/restaurants' do
        @restaurants = Restaurant.all
        erb :index
    end

    get '/restaurants/new' do
        erb :new
    end

    post '/restaurants' do
        restaurant = Restaurant.create(name: params[:name], cuisine: params[:cuisine])
        redirect "restaurants/#{restaurant.id}"
    end

    get '/restaurants/:id' do
        @restaurant = Restaurant.find(params[:id])
        erb :show
    end

    get '/restaurants/:id/edit' do
        @restaurant = Restaurant.find(params[:id])
        erb :edit
    end

    patch '/restaurants/:id' do
        restaurant = Restaurant.find(params[:id])
        restaurant.update(name: params[:name], cuisine: params[:cuisine])
        redirect "/restaurants/#{restaurant.id}"
    end

    delete '/restaurants/:id' do
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        redirect '/restaurants'
    end
end