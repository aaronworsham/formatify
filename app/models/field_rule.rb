class FieldRule < Rule

  def self.filter
    Proc.new{|x| x.is_a? FieldRule}
  end
end
