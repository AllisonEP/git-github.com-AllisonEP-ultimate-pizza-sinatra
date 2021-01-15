class PizzaParloursController < ApplicationController

    get '/pizza-parlours' do 
        redirect_if_not_logged_in
        @pizza_parlours = PizzaParlour.all 
        erb :'pizza-parlours/index'
    end 



end