class CreateTagPrototypeIndices < ActiveRecord::Migration
  def change
    create_table :tag_prototype_indices do |t|
      t.integer :prototype_id
      t.integer :tag_id
    end
  end
end
