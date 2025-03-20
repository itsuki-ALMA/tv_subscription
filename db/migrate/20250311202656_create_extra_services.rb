class CreateExtraServices < ActiveRecord::Migration[8.0]
  def change
    create_table :extra_services do |t|
      t.references :signature, null: false, foreign_key: true
      t.references :additional_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
