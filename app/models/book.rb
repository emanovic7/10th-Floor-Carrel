class Book < ActiveRecord::Base

  belongs_to :author
  has_many :book_subjects
  has_many :subjects, through: :book_subjects

  def slug
   name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
   Book.all.find do |book|
     book.slug == slug
   end
  end

end
