class ColumnRule < Rule
  def self.filter
    Proc.new{|x| x.is_a? ColumnRule}
  end
end
