class ChangePackIdToBeNullableInSignatures < ActiveRecord::Migration[6.0]
  def change
    change_column_null :signatures, :pack_id, true
  end
end
