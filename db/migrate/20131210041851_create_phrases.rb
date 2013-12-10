class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.text :words
      t.string :language

      t.timestamps
    end
  end
end
