class ApplicationController < Sinatra::Base

    configure do 
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, SESSION_SECRET
    end 

    not_found do
        404
    end

    get '/' do
        erb :index
    end

    get '/home' do 
        authenticate
        @posts = Post.all
        erb :home
    end

    get "/error" do
        erb :error, layout: false
    end

    helpers do

        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find_by(id: session[:user_id])
        end

        def authenticate
            if !logged_in?
                redirect '/login'
            end
        end

        def authenticate_user(post)
            authenticate
            redirect "/error" if !post
            redirect "/error" if current_user != post.user
        end

    end

end