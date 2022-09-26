class ChangeEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string, default: "Введите свою почту"
  end
end
