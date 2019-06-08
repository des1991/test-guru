class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, :category_id
    add_foreign_key :tests, :categories

    add_index :questions, :test_id
    add_foreign_key :questions, :tests

    add_index :answers, :question_id
    add_foreign_key :answers, :questions
  end
end
