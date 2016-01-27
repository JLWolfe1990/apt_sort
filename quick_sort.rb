class QuickSort
  def self.parse_file(file_path=nil)
    result = []
    unless file_path
      @live = true
      puts "Please enter the relative file path"
      file_path = gets.chomp
    end
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
    else
      puts "Your file does not exist"
    end

    result
  end

  def self.perform_sort(file_path=nil)
    print_array QuickSort.parse_file(file_path).compact.collect { |array| array.sort! {|a,b| a.match(/[A-Z]{1,}.-./).to_s <=> b.match(/[A-Z]{1,}.-./).to_s} }.flatten
  end

  def self.print_array(array)
    string = array.join("\n")
    puts string if @live
    string
  end

end
