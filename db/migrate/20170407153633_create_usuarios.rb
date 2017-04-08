class CreateUsuarios < ActiveRecord::Migration[5.0]
  def self.up
    create_table :usuarios do |t|
      t.integer :twitter_id
      t.string :screen_name
      t.integer :numero_followers

      t.timestamps
    end
  end

  def self.down
  	drop_table :usuarios
  end
end
