class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_name, :string
    add_column :users, :contact_no, :string
    add_column :users, :website, :string
    add_column :users, :twitter_url, :string
    add_column :users, :color_code, :string
  end
end
