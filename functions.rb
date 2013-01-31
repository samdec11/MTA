def menu
  puts `clear`
  puts 'Subway Trip Mapper'.color("#cc0033")
  print "Choose (T)rain or (Q)uit."
  gets.chomp.downcase
end

def error
  puts 'Invalid entry. Please enter one of the provided choices.'
  gets
end

def starting
  $mta = {
  :n => ['ts','34','28n','23n','us','8'],
  :l => ["8av",'6av','us','3av','1av'],
  :s => ['gc','33','28s','23s','us','astor']
  }

  case $response
  when 'n'
    puts "\nAt which stop will your trip begin?"
    print "(#{$mta[:n].join("), (")}) "
    $t_start = gets.chomp.downcase
  when 'l'
    puts "\nAt which stop will your trip begin?"
    print "(#{$mta[:l].join("), (")}) "
    $t_start = gets.chomp.downcase
  when 's'
    puts "\nAt which stop will your trip begin?"
    print "(#{$mta[:s].join("), (")}) "
    $t_start = gets.chomp.downcase
  end
end

def over
  case $answer
  when 'n'
    puts "(#{$mta[:n].join("), (")}) "
    $t_end = gets.chomp.downcase
  when 'l'
    puts "(#{$mta[:l].join("), (")}) "
    $t_end = gets.chomp.downcase
  when 's'
    puts "(#{$mta[:s].join("), (")}) "
    $t_end = gets.chomp.downcase
  end
end

def train
  puts "\nOn which train will your trip start?"
  print 'Choose (N), (L), or (S)ix '
  $response = gets.chomp.downcase
  starting
  puts "\nOn which train will your trip end?"
  print 'Choose (N), (L), or (S)ix '
  $answer = gets.chomp.downcase
  puts "\nAt which stop will your trip end?"
  over
  if $response == $answer
    num = (($mta[$response.to_sym]).index($t_start) - ($mta[$answer.to_sym]).index($t_end)).abs
    puts "\n#{num} stops until your destination.".color(:yellow)
    gets
  else
    first = (($mta[$response.to_sym]).index($t_start) - ($mta[$response.to_sym]).index('us')).abs
    second = (($mta[$answer.to_sym]).index($t_end) - ($mta[$answer.to_sym]).index('us')).abs
    num = first + second
    puts "\n#{num} stops until your destination.".color(:yellow)
    gets
end
end