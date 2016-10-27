class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :gallery

      t.timestamps
    end
  end
end
