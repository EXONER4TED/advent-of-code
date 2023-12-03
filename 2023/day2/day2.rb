# part 1
allowed_red = 12
allowed_green = 13
allowed_blue = 14

total = 0

File.open("#{File.dirname(__FILE__)}/day2.input.txt", 'r').each_line do |line|

  /^Game (?<game_id>\d+):/i =~ line
  legal_game = true

  line.split(':')[-1].chomp!.split(';').each do |hand|
    /(?<red>\d+) red/i =~ hand
    /(?<green>\d+) green/i =~ hand
    /(?<blue>\d+) blue/i =~ hand

    legal_game = false if red.to_i > allowed_red || green.to_i > allowed_green || blue.to_i > allowed_blue
  end

  total += game_id.to_i if legal_game
end
puts total

# part 2
total_power = 0

File.open("#{File.dirname(__FILE__)}/day2.input.txt", 'r').each_line do |line|

  highest_red = highest_blue = highest_green = 0
  line.split(':')[-1].chomp!.split(';').each do |hand|
    /(?<red>\d+) red/i =~ hand
    /(?<green>\d+) green/i =~ hand
    /(?<blue>\d+) blue/i =~ hand

    highest_red = red.to_i.nil? || red.to_i < highest_red || red.to_i == 0 ? highest_red : red.to_i
    highest_blue = blue.to_i.nil? || blue.to_i < highest_blue || blue.to_i == 0 ? highest_blue : blue.to_i
    highest_green = green.to_i.nil? || green.to_i < highest_green || green.to_i == 0 ? highest_green : green.to_i
  end

  total_power += highest_red * highest_green * highest_blue
end
puts total_power
