class CreateMeasures < ActiveRecord::Migration[7.2]
  def change
    create_table :measures do |t|
      t.float :weight
      t.integer :cincture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
