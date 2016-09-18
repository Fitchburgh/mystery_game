def get_level_choice()
  level_options = ["easy", "normal", "hard", "exit"]
  puts "What level would you like to play?"
  print "Type Easy, Normal, Hard, or Exit."
  print " > "
  level_choice = gets.chomp.downcase
  while level_options.include?(level_choice) == false
    puts "Like....what level did you mean, dawg?"
    print " > "
    level_choice = gets.chomp.downcase
  end
  return level_choice
end

def get_list(word_length_min, word_length_max, word_pool)
  word_pool.keep_if {|word| (word.length >= word_length_min) && (word.length <= word_length_max) }
  return word_pool
end

def get_random_word(right_length_words)
  selected_word = right_length_words[rand(right_length_words.length)].downcase
  return selected_word
end

def word_as_blanks(random_word)
  random_word_letter_array = random_word.scan(/./) # scans for one letter, returns each letter as an item in array

end

# random_word_letter_count = random_word.scan(/./)
# random_word = random_word_letter_count # string.each_char makes this easy
# playfield = random_word_letter_count.map{ |letter| letter = "_" }
# word_as_blanks = playfield
# joined_blanks = word_as_blanks.join(" ")
# puts joined_blanks

# def find_and_replace(guessed_letter, random_word, word_as_blanks)
#   random_word.each do |letter|
#     while random_word.include?(guessed_letter)
#       index_point = random_word.index(guessed_letter)
#       random_word.delete_at(index_point)
#       random_word.insert(index_point, "!")
#       word_as_blanks.each do |blank|
#         word_as_blanks.delete_at(index_point)
#         word_as_blanks.insert(index_point, guessed_letter)
#       end
#     end
#   end
# end

def main()
  difficulty_length = {
    "easy" => [4, 6],
    "normal" => [6, 8],
    "hard" => [8, 25]
  }
  guess_count = 0
  guessed_letter = ""
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool = word_pool.readlines.map(&:chomp)
  choice = get_level_choice
  min_max_length = difficulty_length[choice]
  right_length_words = get_list(min_max_length[0], min_max_length[1], word_pool)
  random_word = get_random_word(right_length_words)
  puts "#{random_word}"
end

if __FILE__ == $PROGRAM_NAME
  main
end
