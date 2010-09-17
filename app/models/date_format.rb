class DateFormat < Format
  def apply_to(date)
    a = self.parse_action
    date.send(a[1], a[2])
  end
end
