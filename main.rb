file = File.open("all_ratings.txt")
file_data = file.read

films = {}
i = 0
file_data.each_line do |line|
  if i != 0
    i = i + 1
    data = line.split("\t")
    data[3] = data[3].chomp!.split("|")
    film = {
      name: data[2],
      imdb: data[1]
    }
    data[3].each { |item|
      films[item] = [] unless films.key?(item)
      film_array = films[item]
      film_array.push(film)
      films[item] = film_array
    }
    a = data
  end
  i = i + 1
end

films.each do |key, value|
  films[key].sort_by! { |k| k[:imdb] }.reverse!
end
puts "Select Movie Topic"
print films.keys
puts ""

index = 0
topic = gets.chomp
loop do

  if films.key?(topic)
    puts films[topic][index][:name]
    puts "Do you want watch ? (y/n)"
    ans = gets.chomp
    if ans == "y"
      break
    else
      index = index + 1
    end
  end

end


