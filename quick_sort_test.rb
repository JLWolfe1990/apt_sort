require 'minitest/autorun'
require_relative 'quick_sort.rb'

class QuickSortTest < Minitest::Test
  def test_that_the_output_is_correct_for_a_more_complex_case
    assert_equal "#1 - Kessenich\n#1A - Kessenich\n#1B - Adams\n#8 - Johnson\n#10A - Wolfe\n#50 - Smith\n#100 - Sanders", QuickSort.perform_sort("sample_input.txt")
  end

  def test_that_the_output_is_correct_for_the_basic_example
    assert_equal "#1A - Kessenich\n#1B - Adams\n#8 - Johnson\n#50 - Smith\n#100 - Sanders", QuickSort.perform_sort("basic_input.txt")
  end
end
