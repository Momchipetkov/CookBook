class AddAttachmentIconToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :recipes, :icon
  end
end
