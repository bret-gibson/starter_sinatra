class CustomersController < Sinatra::Base
    set :views, "app/views/customers"
    set :method_override, true

    get '/customers' do
        @customers = Customer.all
        erb :index
    end

    get '/customers/new' do
        erb :new
    end

    post '/customers' do
        name = params[:name]
        customer = Customer.create(name: name)
        redirect "/customers/#{customer.id}"
    end

    get '/customers/:id' do
        @customer = Customer.find(params[:id])
        erb :show
    end

    get '/customers/:id/edit' do
        @customer = Customer.find(params[:id])
        erb :edit
    end

    patch '/customers/:id' do
        id = params[:id]
        customer = Customer.find(id)
        customer.update(name: params[:name])
        redirect "customers/#{customer.id}"
    end

    delete '/customers/:id' do 
        id = params[:id]
        customer = Customer.find(id)
        customer.destroy
        redirect '/customers'
    end
end