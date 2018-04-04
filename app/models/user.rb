class User < ActiveRecord::Base

  has_secure_password

  has_many :books
  has_many :authors, through: :books

  def slug
    #unless user_name.nil?
      self.user_name.gsub(" ","-").downcase
    #end
  end

  def self.find_by_slug(slug)
   User.all.find do |user|
     user.slug == slug
  end
 end

end
