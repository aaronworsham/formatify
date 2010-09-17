class ColumnAction < Action

  def delete_column(h, r)
    if r.column_name
      h.delete(r.column_name)
      return h
    else
      return nil
    end
  end
  def add_column(h, r)
    if r.column_name
      h << r.column_name
    else
     return nil
    end 
  end
  def change_column_name(h, r)
    if r.before and r.after and h.include?(r.before) 
      h[h.rindex(r.before)] = r.after
      return h
    else
      return nil
    end
  end
  def move_column(h,r)
    if r.column_name and r.position and h.include?(r.column_name)
      h.delete(r.column_name)
      h.insert(r.position, r.column_name)
    else
      return nil
    end
  end
end
