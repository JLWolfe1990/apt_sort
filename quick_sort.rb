require 'minitest/autorun'

class QuickSort
  def self.parse_file(file_path)
    result = []
    full_path = File.expand_path(file_path)

    if File.exists? full_path
      File.open(full_path, 'r').each do |line|
        index = line.match(/[0-9]{1,}/).to_s.to_i

        if result[index]
          result[index] = result[index] << line.chomp
        else
          result[index] = [line.chomp]
        end
      end
    end

    result
  end

  def self.perform(file_path)
    print_array QuickSort.parse_file(file_path).compact.collect { |array| array.sort! {|a,b| a.match(/[A-Z]{1,}.-./).to_s <=> b.match(/[A-Z]{1,}.-./).to_s} }.flatten
  end

  def self.print_array(array)
    array.join("\n")
  end

end

class QuickSortTest < Minitest::Test
  def test_that_the_output_is_correct_for_a_more_complex_case
    assert_equal "#1 - Kessenich\n#1A - Kessenich\n#1B - Adams\n#8 - Johnson\n#10A - Wolfe\n#50 - Smith\n#100 - Sanders", QuickSort.perform("sample_input.txt")
  end

  def test_that_the_output_is_correct_for_the_basic_example
    assert_equal "#1A - Kessenich\n#1B - Adams\n#8 - Johnson\n#50 - Smith\n#100 - Sanders", QuickSort.perform("basic_input.txt")
  end
end
