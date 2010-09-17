class FieldAction < Action
  def populate_with(field, rule)
    if field and rule.after
      return rule.after
    else
      return field
    end
  end
  def date_format(field, rule)
    date = field.to_date rescue nil
    if date and rule.format
      rule.format.apply_to(date)
    else
      return field
    end
  end
end
