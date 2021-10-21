require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'game'
require 'board'
require 'board_case'
require 'player'
require 'colorize'

# Instancie le plateau
game = Game.new

# Instancie les joueurs
game.get_players_names

# Affiche le plateau
game.board.show

# Jeu
while game.board.turns_played < 9
  # Récupère les coups des joueurs
  game.player_move
  game.board.show
end
puts "ÉGALITAY"