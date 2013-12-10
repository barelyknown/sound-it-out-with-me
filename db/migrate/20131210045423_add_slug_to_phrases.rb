class AddSlugToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :slug, :string
  end
end
