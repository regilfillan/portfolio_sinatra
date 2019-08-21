class PostsController < ApplicationController

    get "/posts" do
        authenticate
        @posts = Post.all
        erb :'posts/index'
    end

    get "/posts/new" do 
        authenticate
        erb :'/posts/new'
    end

    post "/posts" do
        authenticate
        u= current_user
        p= u.posts.build(location: params[:location], days: params[:days], budget: params[:budget], transport: params[:transport], accommodation: params[:accommodation])
        if p.save
            redirect "/posts"
        else
            @message= "There was an issue submitting your post."
            erb :'/posts/new'
        end
    end

    delete "/posts/:id" do
        authenticate
        p= Post.find_by(id: params[:id])
        if p 
            p.destroy
            redirect "/posts"
        end
    end

    get "/posts/:id/edit" do 
        authenticate
        @post = Post.find_by(:id params[:id])
        if 
    end

end