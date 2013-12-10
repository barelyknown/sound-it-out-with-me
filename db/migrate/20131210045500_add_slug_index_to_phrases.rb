class AddSlugIndexToPhrases < ActiveRecord::Migration
  def change
    add_index :phrases, :slug, unique: true
  end
end
