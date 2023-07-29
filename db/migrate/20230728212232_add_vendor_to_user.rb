class AddVendorToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :app_users, :vendor, foreign_key: {to_table: :app_vendors}
  end
end
