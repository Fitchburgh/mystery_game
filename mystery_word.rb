
def length_and_sort(level_choice, word_pool)
  if level_choice == "EASY"
    word_pool.keep_if { |word| (word.length >= 4) && (word.length <= 6) }
  elsif level_choice == "NORMAL"
    word_pool.keep_if { |word| (word.length >= 6) && (word.length <= 8) }
  elsif level_choice == "HARD"
    word_pool.keep_if { |word| word.length > 8 }
  else
    puts "You can't do that."
  end
end

def find_random_word(right_words)
  random_word = right_words[rand(right_words.length)]
  puts "#{random_word}"
end

def word_to_blanks(random_word)
  random_word_letter_count = random_word.scan(/./)
  playfield = random_word_letter_count.map{ |letter| letter = "_" }
  playfield.join(" ")
end

def main()
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool = word_pool.readlines.map(&:chomp)
  puts "What level would you like to play? Type Easy, Normal, or Hard."
  print "> "
  level_choice = gets.chomp.upcase
  length_and_sort(level_choice, word_pool)
  find_random_word(word_pool)

  #letter and submission phase and functions
  #loop to play again

end

if __FILE__ == $PROGRAM_NAME
  main
end


# def choose_random()
#   # easy_words = word_pool["EASY"]
#
# end

# word_pool {
#   "EASY" => {
#       1 => "word",
#   },
#   "NORMAL" => {
#       1 => "word",
#   },
#   "HARD" => {
#     1 => "word",
#   }
# }

# def word_array_matches_level(level_choice, word_pool)
#   if word_pool.has_key?(level_choice)
#     # create storage thing containing possible words to choose random from
#     # pick random word
#     # store random word as variable
#   end
# end



#
#
# right_words_easy = []
# word_length_and_word = {}
# word_length_and_word[word_pool.map { |word| word.length}] =  right_words_easy#array of length of all words
# # word_length.each do |word_length|
# #   if word_length >= 4 || word_length <= 6
# #   right_words_easy << word_pool`
# # end
