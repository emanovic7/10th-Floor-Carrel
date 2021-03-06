class Author < ActiveRecord::Base

  has_many :books
  has_many :users, through: :books
  has_many :subjects, through: :books

  def slug
    unless name.nil?
      self.name.gsub(" ","-").downcase
    end
  end

  def self.find_by_slug(slug)
   Author.all.find do |author|
     author.slug == slug
  end
 end

end
