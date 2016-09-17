
def length_and_sort(level_choice, word_pool)
  if level_choice == "easy"
    word_pool.keep_if { |word| (word.length >= 4) && (word.length <= 6) }
  elsif level_choice == "normal"
    word_pool.keep_if { |word| (word.length >= 6) && (word.length <= 8) }
  elsif level_choice == "hard"
    word_pool.keep_if { |word| word.length > 8 }
  end
end

def find_and_replace(guess_count, guessed_letter, random_word, word_as_blanks)
  if
    random_word.include?(guessed_letter) == false
    puts "You've guessed wrong! Try again."
    guess_count += 1
  elsif
    random_word.each do |letter|
      while random_word.include?(guessed_letter)
        index_point = random_word.index(guessed_letter)
        word_as_blanks << guessed_letter
        random_word.delete_at(index_point)
        word_as_blanks.insert(index_point, word_as_blanks.delete_at(-1))
        deleted = word_as_blanks.delete_at(-1)
        random_word.insert(index_point, "!")
      end
    end
  end
end

def main()
  guess_count = 0
  guessed_letter = ""
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool = word_pool.readlines.map(&:chomp)
  puts "What level would you like to play? Type Easy, Normal, or Hard."
  print "> "
  level_choice = gets.chomp.downcase
  if length_and_sort(level_choice, word_pool)
    random_word = word_pool[rand(word_pool.length)].downcase

    puts "#{random_word}"

    random_word_letter_count = random_word.scan(/./)
    random_word = random_word_letter_count# string.each_char makes this easy
    playfield = random_word_letter_count.map{ |letter| letter = "_" }
    word_as_blanks = playfield
    thing = word_as_blanks.join(" ")
    puts thing

    puts "#{word_as_blanks}"

    print "> "

    guessed_letter = gets.chomp.downcase
    find_and_replace(guess_count, guessed_letter, random_word, word_as_blanks)
    puts "#{word_as_blanks}"
  else
    puts "Like....what level did you mean dawg?"
  end
  #loop to play again
end

if __FILE__ == $PROGRAM_NAME
  main
end
