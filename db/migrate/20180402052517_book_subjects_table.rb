class BookSubjectsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :book_subjects do |i|
      i.integer :book_id
      i.integer :subject_id
    end
  end
end
