class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_many :book_subjects
  has_many :subjects, through: :book_subjects

  def slug
    unless name.nil?
      self.name.gsub(" ","-").downcase
    end
  end

  def self.find_by_slug(slug)
   Book.all.find do |book|
     book.slug == slug
   end
  end

end
