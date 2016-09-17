
def length_and_sort(level_choice, word_pool)
  if level_choice == "easy"
    word_pool.keep_if { |word| (word.length >= 4) && (word.length <= 6) }
  elsif level_choice == "normal"
    word_pool.keep_if { |word| (word.length >= 6) && (word.length <= 8) }
  elsif level_choice == "hard"
    word_pool.keep_if { |word| word.length > 8 }
  else
    puts "NOPE"
  end
end

def find_and_replace(guess_count, guessed_letter, random_word)
  1.times do
    if random_word.include?(guessed_letter)
      index_point = random_word.index(guessed_letter)
      puts "#{index_point}"
      random_word.delete_at(index_point)
      print "#{random_word}"
    else
      random_word.include?(guessed_letter)
      puts "You've guessed wrong!"
      guess_count += 1
    end
  end
end

# random_word = ["a", "a", "b"]

# def find_random_word(right_words)
#   random_word = right_words[rand(right_words.length)]
#   puts "#{random_word}"
#   random_word_letter_count = random_word.scan(/./)
#   random_word = random_word_letter_count# string.each_char makes this easy
#   playfield = random_word_letter_count.map{ |letter| letter = "_" }
#   word_as_blanks = playfield.join(" ")
#   print random_word
#   puts "#{word_as_blanks}"
# end

def main()
  guess_count = 0

  guessed_letter = ""
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool = word_pool.readlines.map(&:chomp)
  puts "What level would you like to play? Type Easy, Normal, or Hard."
  print "> "
  level_choice = gets.chomp.downcase
  if length_and_sort(level_choice, word_pool)

    random_word = word_pool[rand(word_pool.length)]

    puts "#{random_word}"
    random_word_letter_count = random_word.scan(/./)
    random_word = random_word_letter_count# string.each_char makes this easy
    playfield = random_word_letter_count.map{ |letter| letter = "_" }
    word_as_blanks = playfield.join(" ")

    print random_word

    puts "#{word_as_blanks}"

    print "> "
    guessed_letter = gets.chomp.downcase
    find_and_replace(guess_count, guessed_letter, random_word)
  else
    puts "failed if"
  end

# random word needs to equal the random word array AFTER it selects it.
  #letter and submission phase and functions
  #loop to play again

end

if __FILE__ == $PROGRAM_NAME
  main
end
