class Transform < ActiveRecord::Base
  has_many :rules
  has_many :column_rules
  has_many :row_rules
  has_many :field_rules
end
