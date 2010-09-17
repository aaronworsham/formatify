require 'test_helper'

class TransformColumnTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  setup do
    caction = ColumnAction.create(:name => "delete_column")
    crule = ColumnRule.create(:action => caction, :column_name => "column1") 
    @t = Transformer.new("test/files/test.csv", [crule])
  end
  
  test "can get full header" do
    assert @t.get_header.size == 4
  end

  test "can get transformed header" do
    assert @t.get_transformed_header.size == 3
  end

  test "returns an array of 3 rows" do
    assert @t.format.class == Array
  end

  test "returns a transformed map" do
    assert @t.format[1].size == 3
  end
  
end
