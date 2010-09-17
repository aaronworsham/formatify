require 'test_helper'

class TransformFieldTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "populate field with bob" do
    faction = FieldAction.create(:name => "populate_with")
    frule = FieldRule.create(:action => faction, :column_name => "column1", :after => "bob") 
    @t = Transformer.new("test/files/test.csv", [frule])
    assert @t.format[1]["column1"] == "bob"
  end
  test "change date format" do
    faction = FieldAction.create(:name => "date_format")
    format = DateFormat.create(:action => "strftime:%x")
    frule = FieldRule.create(:action => faction, :column_name => "column1", :format => format) 
    @t = Transformer.new("test/files/test.csv", [frule])
    assert @t.format.last["column1"] == "01/01/01"
  end
end


 
