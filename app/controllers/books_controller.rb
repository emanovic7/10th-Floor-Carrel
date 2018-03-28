class BooksController < ApplicationController


  get '/books/new' do

    erb :'books/add_book'
  end

end
