class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :size
      t.string :color
      t.belongs_to :user

      t.timestamps
    end
  end
end
