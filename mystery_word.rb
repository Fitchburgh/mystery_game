
def length_and_sort(level_choice, word_pool)
  if level_choice == "easy"
    word_pool.keep_if { |word| (word.length >= 4) && (word.length <= 6) }
  elsif level_choice == "normal"
    word_pool.keep_if { |word| (word.length >= 6) && (word.length <= 8) }
  elsif level_choice == "hard"
    word_pool.keep_if { |word| word.length > 8 }
  end
end

def find_random_word(right_words)
  random_word = right_words[rand(right_words.length)]
  puts "#{random_word}"
  random_word_letter_count = random_word.scan(/./) # string.each_char makes this easy
  playfield = random_word_letter_count.map{ |letter| letter = "_" }
  word_as_blanks = playfield.join(" ")
  puts "#{word_as_blanks}"
end

def find_and_replace(guess_count, random_word, guessed_letter)
  loop do |letter|
  puts "What letter would you like to guess?"
  print "> "
  guessed_letter = gets.chomp.downcase
    while guess_count < 9
      # go back to loop to check letters + need to get another letter
      if random_word.include? (guessed_letter)
        puts "phase one"
        index_point = random_word.index(guessed_letter)
        random_word.delete_at(index_point)
      else
        guess_count += 1 #only increase when guess is wrong
        puts "You've guessed wrong! Minus one guess."
      end
    end
  end
end

# random_word = ["a", "a", "b"]

def main()
  guess_count = 0
  random_word = []
  guessed_letter = "a"
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool = word_pool.readlines.map(&:chomp)
  puts "What level would you like to play? Type Easy, Normal, or Hard."
  print "> "
  level_choice = gets.chomp.downcase
  if length_and_sort(level_choice, word_pool)
    find_random_word(word_pool)
    find_and_replace(guess_count, random_word, guessed_letter)
  else
    puts "You can't do that."
  end
  #letter and submission phase and functions
  #loop to play again

end

if __FILE__ == $PROGRAM_NAME
  main
end
