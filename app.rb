require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'game'
require 'board'
require 'board_case'
require 'player'
require 'colorize'

system("clear")
puts " _______ _____ _____   _______       _____   _______ ____  ______ ".gray.center(120)
puts "|__   __|_   _/ ____| |__   __|/\\   / ____| |__   __/ __ \\|  ____|".gray.center(120)
puts "   | |    | || |         | |  /  \\ | |         | | | |  | | |__   ".gray.center(120)
puts "   | |    | || |         | | / /\\ \\| |         | | | |  | |  __|  ".gray.center(120)
puts "   | |   _| || |____     | |/ ____ \\ |____     | | | |__| | |____ ".gray.center(120)
puts "   |_|  |_____\\_____|    |_/_/    \\_\\_____|    |_|  \\____/|______| ".gray.center(120)
puts ""
puts ""

# Instancie le plateau
game = Game.new

# Instancie les joueurs
game.get_players_names

# Jeu
while game.board.turns_played < 9
    game.game_title
    game.board.show
    game.player_move
    game.game_over? ? break : nil
  end
  if game.board.turns_played <9
    game.game_title
    game.show_winner
    gets.chomp
  else
    game.game_title
    puts "ÉGALITAY"
  end
  
