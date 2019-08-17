class PostsController < ApplicationController

    get "/posts" do
        authenticate
    end

end