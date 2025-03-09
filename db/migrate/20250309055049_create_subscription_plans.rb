class CreateSubscriptionPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :subscription_plans do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
