class CreateAvailableModels < ActiveRecord::Migration[7.0]
  def change
    create_table :available_models do |t|
      t.string :model
      t.string :image
    end
  end
end
