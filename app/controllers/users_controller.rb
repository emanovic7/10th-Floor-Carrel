class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])

    erb :'users/personal'
  end


  get '/register' do

      erb :'/users/register'
  end

  post '/register' do
      if params[:user_name] == "" || params[:email] == "" || params[:password_digest] == ""
        redirect to '/register'
      else
        @user=User.create(user_name: params[:user_name], email: params[:email], password: params[:password_digest])
        session[:user_id] = @user.id
        erb :'/users/personal'
      end
  end


  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/books/books_list'
    end
  end

  post '/login' do
    @user = User.find_by(user_name: params[:user_name])
      if @user !=nil && @user.password == params[:password]
        session[:user_id] = @user.id
        redirect to '/books/books_list'
      else
        redirect to '/login'
      end
  end



  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    else
      redirect to '/login'
    end
  end

  #list user's books' subjects

  get '/users/books/subjects' do
    if logged_in?
      @subjects = Subject.all #make subjects controller?
      erb :'/subjects/subjects'
    else
      redirect to '/login'
    end
  end

end
