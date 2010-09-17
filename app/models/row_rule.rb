class RowRule < Rule

  def self.filter
    Proc.new{|x| x.is_a? RowRule}
  end

end
