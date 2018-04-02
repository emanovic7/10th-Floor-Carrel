class SubjectsController < ApplicationController

  get '/subjects' do
    if logged_in?
      @subjects = Subject.all
      erb :'subjects/subjects'
    else
      redirect to '/login'
    end
  end

  get '/subjects/:slug' do
    @subject = Subjects.find_by_slug(params[:slug])
    erb :'/subjects/show_subject'
  end



end
