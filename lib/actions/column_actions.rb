module ColumnActions
  def get_header
    @header ||= @csv.shift
  end

  def get_transformed_header
    @theader ||= transform_header get_header
  end

  def transform_header(header)
    column_rules = ColumnRule.filter
    theader = header.dup
    @transform.rules.early.all.find_all(&column_rules).each do |rule|
      action = rule.action
      theader = action.send(action.name, theader, rule) 
    end
    theader
  end

  def late_check_header(header)
    column_rules = ColumnRule.filter
    new_header_values = []
    @transform.rules.late.all.find_all(&column_rules).each do |rule|
      new_header_values = rule.action.send(rule.action.name, header.values, rule) 
    end
    Hash[header.keys.zip(new_header_values)]
  end
end
