class PizzaParloursController < ApplicationController

    get '/pizza-parlours' do 
        redirect_if_not_logged_in
        @pizza_parlours = PizzaParlour.all 
        erb :'pizza-parlours/index'
    end 

    get '/pizza-parlours/new' do
        erb :'pizza-parlours/new'
    end

    post '/pizza-parlours' do
        pizza_parlour = current_user.pizza_parlours.build(params[:pizza_parlour])

        if pizza_parlour.save
            redirect '/pizza-parlours'
        else
            redirect '/pizza-parlours/new'
        end
    end

    get '/pizza-parlours/:id' do
        find_pizza_parlour
        redirect_if_not_exit
        erb :'pizza_parlours/show'
    end

    private 

    def find_pizza_parlour
        @pizza_parlour = PizzaParlour.find_by_id(params[:id])
    end
    

end