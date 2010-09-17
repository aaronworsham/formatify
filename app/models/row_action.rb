class RowAction < Action

  def delete_if_contains(row, rule)
    if rule.contain.present? and row[rule.column_name].present? and row[rule.column_name] == rule.contain
      return nil
    else
      return row
    end
  end

  def delete_if_matches(row, rule)
    if rule.match.present? and row[rule.column_name].present? and row[rule.column_name] =~ Regexp.new(rule.match)
      return nil
    else
      return row
    end
  end

end
