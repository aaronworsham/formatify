module FieldActions
  def check_field(column, value)
    field_rules = FieldRule.filter
    @transform.rules.find_all(&field_rules).each do |r|
      if r.column_name == column
        value = r.action.send(r.action.name, value, r)
      end
    end
    value
  end
end
