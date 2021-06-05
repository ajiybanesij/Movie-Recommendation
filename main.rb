file = File.open('all_ratings.txt')
file_data = file.read

films = {}

file_data.each_line.with_index do |line, index|
  next if index.zero?

  _id, imdb, name, categories = line.split("\t")
  categories = categories.chomp!.split('|')

  film = {
    name: name,
    imdb: imdb
  }

  categories.each do |category|
    films[category] = [] if films[category].nil?
    films[category].push film
  end
end

films.each do |category, _value|
  films[category].sort_by! { |film| film[:imdb] }.reverse!
end

puts 'Select Movie Topic'
print films.keys.join(' - ')
puts ''

topic = gets.chomp

puts films[topic].count

films[topic].each do |film|
  puts film[:name]
  puts 'Do you want watch ? (y/n)'
  ans = gets.chomp

  break if ans.downcase == 'y'
end
