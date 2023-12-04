class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.belongs_to :plane, index: true
      t.belongs_to :airport, index: true
    end
  end
end
