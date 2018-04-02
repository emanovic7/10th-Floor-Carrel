class Subject < ActiveRecord::Base

  has_many :book_subjects
  has_many :books, through: :book_subjects
  has_many :authors, through: :books


  def slug
   name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Subject.all.find do |subject|
      subject.slug == slug
  end
 end

end
