
def length_and_sort(level_choice, word_pool)
  if level_choice == "EASY"
    word_pool.keep_if { |word| (word.length >= 4) && (word.length <= 6) }
  elsif level_choice == "NORMAL"
    word_pool.keep_if { |word| (word.length >= 6) && (word.length <= 8) }
  elsif level_choice == "HARD"
    word_pool.keep_if { |word| word.length > 8 }
  end
end

def find_and_replace(guess_count, guessed_letter)
  loop do |letter|
    if random_word.include? (guessed_letter)
      index_point = random_word.index
      random_word.replace("!")
    else
      guessed_letter.!include (random_word)
      puts "You've guessed wrong!"
      guess_count -= 1
    end
  end
end

# random_word = ["a", "a", "b"]

def find_random_word(right_words)
  random_word = right_words[rand(right_words.length)]
  puts "#{random_word}"
  random_word_letter_count = random_word.scan(/./) # string.each_char makes this easy
  playfield = random_word_letter_count.map{ |letter| letter = "_" }
  word_as_blanks = playfield.join(" ")
  puts "#{word_as_blanks}"
end

def main()
  guess_count = 0
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool = word_pool.readlines.map(&:chomp)
  puts "What level would you like to play? Type Easy, Normal, or Hard."
  print "> "
  level_choice = gets.chomp.upcase
  if length_and_sort(level_choice, word_pool)
    find_random_word(word_pool)
  else
    puts "You can't do that."
  end
  find_and_replace(guess_count, random_word)

  #letter and submission phase and functions
  #loop to play again

end

if __FILE__ == $PROGRAM_NAME
  main
end
