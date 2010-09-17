class Format < ActiveRecord::Base

  def parse_action
    regexp = Regexp.new('([A-Za-z0-9_\?]+):?([A-Za-z0-9%]+)?')
    regexp.match(self.action)
  end

end
