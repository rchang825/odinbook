class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.text :content
      t.string :caption
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
