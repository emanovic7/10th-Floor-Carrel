class AuthorsController < ApplicationController


  get '/authors' do
    if logged_in?
      @authors = Author.all
      erb :'/authors/authors'
    else
      redirect to '/login'
    end
  end


  get '/authors/new' do
    if logged_in?
      erb :'/authors/create_author'
    else
      redirect to '/login'
    end
  end

  post '/authors/new' do
    if logged_in?
      @author = Author.create(name: params[:name])
      @author.save

      erb :'/authors/show_author'
    else
      redirect to '/login'
    end
  end

  get '/authors/:slug' do
    @author = Author.find_by_slug(params[:slug])

    erb :'authors/show_author'
  end


end
