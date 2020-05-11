class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.integer :time_count
      t.string :image_url
      t.timestamps
    end
  end
end
