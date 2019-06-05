class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column(:tests, :level, :integer, :default => 1)

    change_column(:answers, :correct, :boolean, :default => false)
  end
end
