# part 1
puts File.open("#{File.dirname(__FILE__)}/day1.input.txt", 'r').inject(0) { |total, line| total += "#{line.scan(/\d/).join('')[0]}#{line.scan(/\d/).join('')[-1]}".to_i }

# part 2
puts File.open("#{File.dirname(__FILE__)}/day1.input.txt", 'r').inject(0) { |total, line| str_to_int_hash = { 'zero' => 0,'one' => 1,'two' => 2,'three' => 3,'four' => 4,'five' => 5,'six' => 6,'seven' => 7,'eight' => 8,'nine' => 9 }; numbers_from_string = line.to_enum(:scan, /\d|one|two|three|four|five|six|seven|eight|nine/).map { Regexp.last_match }.join(','); total += "#{numbers_from_string.split(',')[0].to_i != 0 ? numbers_from_string.split(',')[0].to_i : str_to_int_hash[numbers_from_string.split(',')[0]]}#{numbers_from_string.split(',')[-1].to_i != 0 ? numbers_from_string.split(',')[-1].to_i : str_to_int_hash[numbers_from_string.split(',')[-1]]}".to_i }
