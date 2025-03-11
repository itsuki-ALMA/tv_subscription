class CreatePackServices < ActiveRecord::Migration[8.0]
  def change
    create_table :pack_services do |t|
      t.references :additional_service, null: false, foreign_key: true
      t.references :pack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
