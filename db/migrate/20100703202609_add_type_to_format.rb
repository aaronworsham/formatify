class AddTypeToFormat < ActiveRecord::Migration
  def self.up
    add_column :formats, :type, :string
  end

  def self.down
    remove_column :formats, :type
  end
end
