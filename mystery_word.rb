def main()
  read_full_pool()

  puts "What level would you like to play? Type Easy, Normal, or Hard."
  print "> "
  level_choice = gets.chomp.upcase

  error_message = "You can't do that."

end

if __FILE__ == $PROGRAM_NAME
  main
end

word_pool {
  "EASY" => {
      1 => "word",
  },
  "NORMAL" => {
      1 => "word",
  },
  "HARD" => {
    1 => "word",
  }
}

def read_full_pool(word_pool)
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool = word_pool.readlines.map(&:chomp)
end

def length_and_sort(level_choice, word_pool)
  if level_choice == "EASY"
    word_pool.map { |word| word.length} #array of length of all words
  elsif level_choice == "NORMAL"
  elsif level_choice == "HARD"
  else
    return error_message
  end
end

word_pool.length == 4 # || word_pool.length == 5 || word_pool.length == 6
  # right_words_easy = Hash.new()



def word_array_matches_level(level_choice, word_pool)
  if word_pool.has_key?(level_choice)
    # create storage thing containing possible words to choose random from
    # pick random word
    # store random word as variable
end

def choose_random()
  easy_words = word_pool["EASY"]

end
