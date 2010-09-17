require 'csv'
require 'actions/column_actions'
require 'actions/row_actions'
require 'actions/field_actions'
class Transformer
  include ColumnActions
  include RowActions
  include FieldActions

  attr_accessor :csv, :header, :transform, :results

  def initialize(f,t)
    @transform = t
    @csv   = CSV.read(f)
  end

  def format
    @results = []
    @csv.each do |row|
      @results << check_row(row, get_header)
    end
    @results[0] = late_check_header(@results[0])
    return @results.compact
  end
end
