class CreatePlayImages < ActiveRecord::Migration[6.0]
  def change
    create_table :play_images do |t|

      t.timestamps
    end
  end
end
