class CreateAvailablePilots < ActiveRecord::Migration[7.0]
  def change
    create_table :available_pilots do |t|
      t.string :name
      t.string :image
    end
  end
end
