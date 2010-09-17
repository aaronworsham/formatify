class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.integer :transform_id
      t.integer :action_id
      t.integer :format_id
      t.string :before
      t.string :after
      t.string :match
      t.string :contain
      t.string :conditional
      t.string :type
      t.string :position
      t.string :column_name
      t.string :when

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end
