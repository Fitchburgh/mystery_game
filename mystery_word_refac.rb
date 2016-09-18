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

def word_to_array(random_word)
  random_word_letter_array = random_word.scan(/./) # scans for one letter, returns each letter as an item in array
  return random_word_letter_array
end

def word_to_underscores(random_word_letter_array)
  word_as_underscores = random_word_letter_array.map{ |letter| letter = "_"}
  return word_as_underscores
end

def correct_word_guess(guess, random_word_string)
  if guess == random_word_string
    win_condition = true
    puts "You win!"
    return win_condition
  else
    false
  end
end

def get_index_of_guess(letter_array, guess, random_word_string, guess_count)
  if guess == random_word_string
    correct_word_guess(guess, random_word_string)
    exit
  elsif letter_array.include? guess
    index_point = letter_array.index(guess)
    return index_point
  else

    puts "Wrong answer."
    guess_count += 1
    puts "#{guess_count}"
  end
end

# if get_index_of_guess returns nil, need to ask for another letter because letter wasn't in word

def get_index_replace_letter(letter_array, index_point)
  if index_point != nil
    letter_array.delete_at(index_point)
    letter_array = letter_array.insert(index_point, "!")
    return letter_array
  else
    puts "is nil"
    # if this, needs to ask for another letter
  end
end

def add_guess_to_underscores(all_guesses, underscore_array, index_point, guess)
  underscore_array.delete_at(index_point)
  underscore_array_with_guesses = underscore_array.insert(index_point, guess)
  return underscore_array_with_guesses
end

def find_and_replace(letter_array, index_point, all_guesses, underscore_array, guess)
  if get_index_replace_letter(letter_array, index_point)
    add_guess_to_underscores(all_guesses, underscore_array, index_point, guess)
  end
end

def same_letter_check(all_guesses, guess)
  if dupes_letter = all_guesses.include?(guess)
    # guess_count -= 1
    return dupes_letter
  else
    return false
  end
end

def everything(random_word_letter_array, guess, index_of_guess, all_guesses, word_as_underscores, guess_count, random_word_string)
  5.times do
    until correct_word_guess(guess, random_word_string) == true
      puts "What's your letter guess or entire word"
      guess = gets.chomp.downcase
      index_of_guess = get_index_of_guess(random_word_letter_array, guess, random_word_string, guess_count)
      puts "after index, before replacing shit"
      find_and_replace_var = find_and_replace(random_word_letter_array, index_of_guess, all_guesses, word_as_underscores, guess)
      puts "after find and replace function"
      if same_letter_check(all_guesses, guess)
        puts "You can't do that"
        guess_count += 1
      end
      all_guesses << guess
      return word_as_underscores.join(" ")

    end
  end
end




def main()
  guess = ""
  index_of_guess = []
  underscore_with_guesses = []
  word_after_a_correct_guess = []
  difficulty_length = {
    "easy" => [4, 6],
    "normal" => [6, 8],
    "hard" => [8, 25]
  }
  all_guesses = []
  guess_count = 0
  word_pool = File.new("/usr/share/dict/words", 'r')
  word_pool = word_pool.readlines.map(&:chomp)
  choice = get_level_choice
  min_max_length = difficulty_length[choice]
  right_length_words = get_list(min_max_length[0], min_max_length[1], word_pool)
  random_word = get_random_word(right_length_words)
  puts "#{random_word}"
  random_word_letter_array = word_to_array(random_word)
  word_as_underscores = word_to_underscores(random_word_letter_array)
  joined_word = word_as_underscores.join(" ")
  puts "#{random_word_letter_array}"
  puts "#{joined_word}"
  # puts "What's your letter guess or entire word"
  # guess = gets.chomp.downcase
  # correct_word_guess(guess, random_word)

  # put fxn here that does these 3 functions:

    do_everything = everything(random_word_letter_array, guess, index_of_guess, all_guesses, word_as_underscores, guess_count, random_word)
  # end fxn
  puts "#{all_guesses}"
  puts "do everything: #{do_everything}"

end

if __FILE__ == $PROGRAM_NAME
  main
end
