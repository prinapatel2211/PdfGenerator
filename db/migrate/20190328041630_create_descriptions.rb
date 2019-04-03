class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.string :feature
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
