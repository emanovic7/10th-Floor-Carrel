class Subject < ActiveRecord::Base

  belongs_to :books

  def slug
   name.downcase.gsub(" ","-")
 end

 def self.find_by_slug(slug)
  Subject.all.find do |subject|
    subject.slug == slug
  end
 end

end
