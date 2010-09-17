require 'test_helper'

class TransformRowTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "skip row containing w in column 1" do
    raction = RowAction.create(:name => "delete_if_contains")
    rrule = RowRule.create(:action => raction, :column_name => "column1", :contain => "w") 
    @t = Transformer.new("test/files/test.csv", [rrule])
    assert @t.format.class == Array
  end
  test "skip row matching w in column 1" do
    raction = RowAction.create(:name => "delete_if_matches")
    rrule = RowRule.create(:action => raction, :column_name=> "column1", :match => "w") 
    @t = Transformer.new("test/files/test.csv", [rrule])
    assert @t.format.class == Array
  end

end


 
