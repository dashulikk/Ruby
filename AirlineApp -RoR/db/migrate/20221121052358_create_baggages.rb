class CreateBaggages < ActiveRecord::Migration[7.0]
  def change
    create_table :baggages do |t|
      t.float :weight
      t.integer :count
      t.references :plane
      t.timestamps
    end
  end
end
