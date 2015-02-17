class CreateGlows < ActiveRecord::Migration
  def change
    create_table :glows do |t|
      t.text :quote
      t.string :author
      t.string :subject
      t.refernces :user

      t.timestamps null: false
    end
  end
end
