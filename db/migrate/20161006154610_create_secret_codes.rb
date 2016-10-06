class CreateSecretCodes < ActiveRecord::Migration
  def change
    create_table :secret_codes do |t|
      t.string :secret

      t.timestamps null: false
    end
  end
end
