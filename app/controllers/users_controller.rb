class UsersController < ApplicationController

  get '/register' do

    erb :'/users/register'
  end

  post '/register' do
    if params[:user_name] == "" || params[:email] == "" || params[:password_digest] == ""
      redirect to '/register'
    else
      @user=User.create(user_name: params[:user_name], email: params[:email], password: params[:password_digest])
      session[:user_id] = @user.id
      redirect '/users/home_page'
    end
  end


  get '/login' do

    erb :'/users/login'
  end

  post '/login' do

    
  end



end
