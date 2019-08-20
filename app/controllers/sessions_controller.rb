class SessionsController < ApplicationController

    get "/login" do
        redirect "/home" if logged_in?
        @failed= false
        erb :'sessions/login'
    end

    post '/login' do 
        user= User.find_by(username: params[:username])
        if !!user && user.authenticate(params[:password])
            session[:user_id]= user.id
            redirect '/home'
        else
            @failed= true
            erb :'sessions/login'
        end
    end

    get "/signup" do 
        redirect "/home" if logged_in?
        erb :'sessions/signup'
    end

    post "/users" do
        @user= User.create(name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
        if @user.errors.any?
            erb :'sessions/signup'
        else 
            session[:user_id]= @user.id
            redirect '/home'
        end
    end

    delete '/logout' do 
        session.clear
        redirect '/login'
    end

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

end