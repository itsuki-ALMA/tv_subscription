class CreateSignatures < ActiveRecord::Migration[8.0]
  def change
    create_table :signatures do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pack, null: false, foreign_key: true
      t.references :subscription_plan, null: false, foreign_key: true
      t.decimal :totalValue

      t.timestamps
    end
  end
end
