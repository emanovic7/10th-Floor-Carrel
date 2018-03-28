class BooksController < ApplicationController

#get user's books
  get '/books' do
    if logged_in?
      @books = Book.all
      erb :'/books/books_list'
    else
      erb :'/users/login'
    end

  end

#add new book
  get '/books/new' do
    if logged_in?
      erb :'books/add_book'
    else
      redirect to '/login'
    end
  end

#process submitted book info
    post '/books/new' do
      if logged_in?
        if params[:title] = ""
          redirect to '/books/new'
        else
          @book = current_user.books.create(title: params[:title], author: params[:author], subject: params[:subject])
            if @book.save
              redirect to '/books/#{@book.id}'
            else
              redirect to '/books/new'
            end
        end
      else
        redirect '/login'
      end
    end



end
