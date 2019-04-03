class Users < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :text
    add_column :users, :description, :text
    add_column :users, :role, :string
    add_column :users, :avatar, :string
    add_column :users, :logo, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :facebook_url, :string
  end
end
