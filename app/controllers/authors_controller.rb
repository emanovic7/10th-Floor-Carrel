class AuthorsController < ApplicationController

  get '/authors' do
    if logged_in?
      @authors = Author.all
      erb :'/authors/authors'
    else
      redirect to '/login'
    end
  end


end
