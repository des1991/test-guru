class CreateBadgeRules < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_rules do |t|
      t.string :rule_type, null: false
      t.string :rule_value, null: false
      t.references :badge

      t.timestamps
    end
  end
end
