def main()
  read_full_pool()

  puts "What level would you like to play? Type Easy, Normal, or Hard."
  print "> "
  level = gets.chomp.upcase


end

if __FILE__ == $PROGRAM_NAME
  main
end

word_pool {
  "EASY" => [*4..6] => {
      1 => "word",
  },
  "NORMAL" => [*6..8] => {
      1 => "word",
  },
  "HARD" => [*8..24] => {
    1 => "word",
  }
}

def read_full_pool(word_pool)
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool.readlines.map(&:chomp)
end

def length_and_sort(word_pool)
  right_words = 
end

def word_array_matches_level(level_choice, word_pool)
  if word_pool.has_key?(level_choice)
    # create storage thing containing possible words to choose random from
    # pick random word
    # store random word as variable
end

def choose_random()
  easy_words = word_pool["EASY"]

end
