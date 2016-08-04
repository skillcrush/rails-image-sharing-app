class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change


  end

  add_column :users, :password_digest, :string
  remove_column :users, :password
end
