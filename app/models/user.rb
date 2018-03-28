class User < ActiveRecord::Base

  has_secure_password

  has_many :books
  has_many :authors, through: :books

  def slug
   user_name.downcase.gsub(" ","-")
 end

 def self.find_by_slug(slug)
   User.all.find do |user|
     user.slug == slug
   end
 end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end


  def logged_in?
    !!current_user
  end


end
