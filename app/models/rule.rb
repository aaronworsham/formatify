class Rule < ActiveRecord::Base
  belongs_to :transform
  belongs_to :action
  belongs_to :format

  scope :early, where(:when => "early")
  scope :late, where(:when => "late")
end
