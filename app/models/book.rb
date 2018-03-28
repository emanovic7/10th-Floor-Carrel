class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_many :subjects

  def slug
   name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
   Book.all.find do |book|
     book.slug == slug
   end
  end

end
