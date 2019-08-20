class PostsController < ApplicationController

    get "/posts" do
        authenticate
        @posts = Post.all
        erb :'posts/index'
    end

    get "/posts/new" do 
        authenticate
        erb :"/posts/new"
    end

end