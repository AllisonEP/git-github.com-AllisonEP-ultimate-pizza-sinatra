class PizzaParloursController < ApplicationController

    get '/pizza-parlours' do 
        redirect_if_not_logged_in
        @pizza_parlours = PizzaParlour.all 
        erb :'pizza-parlours/index'
    end 

    get '/pizza-parlours/new' do
        redirect_if_not_logged_in
        erb :'pizza-parlours/new'
    end


    get '/pizza-parlours/:id' do
        find_pizza_parlour
        redirect_if_not_exist
        erb :'pizza-parlours/show'
    end

    get '/pizza-parlours/:id/edit' do
        find_pizza_parlour
        redirect_if_not_exist
        redirect_if_not_owner
        erb :'pizza-parlours/edit'
    end

    post '/pizza-parlours' do
        pizza_parlour = current_user.pizza_parlours.build(params[:pizza_parlour])
  
        if pizza_parlour.save
            redirect '/pizza-parlours'
        else
            redirect '/pizza-parlours/new'
        end
    end



    patch '/pizza-parlours/:id' do
        find_pizza_parlour
        redirect_if_not_owner
        if @pizza_parlour.update(params[:pizza_parlour]) 
            redirect "/pizza-parlours/#{@pizza_parlour.id}"
        else 
            redirect "/pizza-parlours/new"
        end
    end 

    delete '/pizza-parlours/:id' do
        find_pizza_parlour
        redirect_if_not_exist
        @pizza_parlour.destroy
        redirect "/pizza-parlours"
        
    end


    private 

    def find_pizza_parlour
        @pizza_parlour = PizzaParlour.find_by_id(params[:id])
    end
    
    def redirect_if_not_owner
        redirect "/pizza-parlours" unless @pizza_parlour.user == current_user
    end

    def redirect_if_not_exist
        redirect "/pizza-parlours" unless @pizza_parlour
    
    end 
end