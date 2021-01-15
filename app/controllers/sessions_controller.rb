class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end


    post '/signup' do
        user = User.new(params)
        binding.pry
        if user.save 
            session[:user_id] = user.id
            redirect "/"
        else redirect '/signup'
        end
    end

    get "/login" do
    erb :'sessions/login'
    end

    post "/login" do
        user = User.find_by_username(params[:username])

        if user && user.authentificate(params[:password])
            session[:user_id] = user.id
            redirect "/"
        else
            redirect "/login"
        end
     end


    get '/logout' do 
        session.clear
         redirect "/"
    end


end 
