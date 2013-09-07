class AddImageColumnToItems < ActiveRecord::Migration
  def self.up
    add_attachment :items, :image
  end

  def self.down
    remove_attachment :items, :image
  end
end
