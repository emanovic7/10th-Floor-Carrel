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
        redirect to '/login'
      end
    end

  #individual book
  get '/books/:id' do
    if logged_in?
      @book = Book.find_by_id(params[:id])
      erb :'/books/show_book'
    else
      redirect to '/login'
    end
  end

  #edit book
  get '/books/:id/edit' do
    if logged_in?
      @book = Book.find_by_id(params[:id])
        if @book && @book.user == current_user
          erb :'books/edit_book'
        else
          redirect to '/books'
        end
    else
      redirect to '/login'
    end
  end


end
