class AddOtpSecretToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :otp_secret, :string
    add_column :users, :last_otp, :string
  end
end
