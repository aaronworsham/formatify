module RowActions
  def check_row(row, header)
    map = map_row(row, header)
    find_rows = RowRule.filter 
    @transform.rules.all.find_all(&find_rows).each do |r|
      map = r.action.send(r.action.name, map, r)
    end
    map
  end
  
  def map_row(row, header)
    mapped = {}
    tmapped = {}
    header.each_with_index do |column, i|
      next unless column
      mapped[column] = row[i]
    end
    get_transformed_header.each_with_index do |column, i|
      tmapped[column] = check_field(column, mapped[column])
    end
    tmapped
  end

end
