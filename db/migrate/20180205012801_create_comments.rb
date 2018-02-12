class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamps
      t.references :prototype, index: true, foreign_key: true
    end
  end
end
