class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_many :subjects

end
