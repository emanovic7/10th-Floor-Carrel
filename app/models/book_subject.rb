class BookSubject < ActiveRecord::Base

  belongs_to :books
  belongs_to :subjects

end
