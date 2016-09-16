

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


def main()
  word_repo = File.new("/usr/share/dict/words", 'r')
  word_repo.readlines

  puts "What level would you like to play? Type Easy, Normal, or Hard."
  print "> "
  level = gets.chomp.upcase
end

if __FILE__ == $PROGRAM_NAME
  main
end
