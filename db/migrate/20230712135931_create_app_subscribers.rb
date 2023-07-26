class CreateAppSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :app_subscribers do |t|
      t.string :email
      t.string :locale

      t.timestamps
    end
  end
end
