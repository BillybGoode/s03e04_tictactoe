https://www.thehackingproject.org/dashboard/courses/1/weeks/3/days/4?locale=fr

Tic tac toe game - 2 players

Game script logic (each line reported as comment in the app.rb file)

Welcome message
Player 1 name ? gets.chomp
Player 2 name ? gets.chomp

Show the board (A,B,C lines and 1,2,3 columns) (3x3 array of hash, keys = A,B,C)

Loops for 9 rounds max
  lets first player choose where to play (gets.chomp)
  check if valid input, if not loop back
  if yes show updated board
  assess if winner ? yes = break
end

win message if winner
tie message if no winner
play again ?
