class CreateSubjectsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |s|
      s.string :name
      s.integer :book_id
    end
  end
end
