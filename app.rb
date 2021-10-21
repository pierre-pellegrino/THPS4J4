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

while true
# Instancie le plateau
game = Game.new

# Lance la partie
game.perform
game.play_again == 1 ? break : nil
end
