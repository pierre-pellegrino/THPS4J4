# Initialise une partie, contrôle son état
class Game
  attr_accessor :players, :board, :player_move

  def initialize
     @board = Board.new
     @player_move = 0
  end


  def get_players_names # Demande les noms des joueurs et les crée
    puts "Choisissez un nom pour le premier joueur, qui jouera avec les #{"X".red} :"
    puts ""
    print "> "
    player1_name = gets.chomp
    puts ""
    puts "Choisissez un nom pour le deuxième joueur, qui jouera avec les #{"O".blue} :"
    puts ""
    print "> "
    player2_name = gets.chomp
    puts ""
    puts "Merci. Bonne chance à #{player1_name} et #{player2_name}."

    @players = [Player.new(player1_name, "X".red), Player.new(player2_name, "O".blue)]
  end

  
  def turn_to_play # Pour savoir quel joueur doit jouer, on utilise "players[turn_to_play]", qui renverra 0, puis 1, puis 0, etc...
    turn = @player_move%2
    @player_move += 1
    return turn
  end

  def player_move # Demande au joueur sur quelle case il veut jouer son coup
    turn = self.turn_to_play
    puts "C'est à #{players[turn].name} de jouer. Placez un #{players[turn].symbol} sur la case de votre choix : "
    puts "Ex : Pour la case A 1, saisissez A1"

    # Récupère le choix de la case et le convertit en index de tableau (ex: a1 -> 00 -> [0][0], b3 -> 12 etc...)
    chosen_case = gets.chomp.downcase.gsub(/[abc123]/, 'a'=>'0', 'b'=>1, 'c'=>2, '1'=>0, '2'=>1, '3'=>2)
    chosen_case = [chosen_case[0].to_i, chosen_case[1].to_i]

    # Vérifie si la case est vide, ajoute le coup du joueur si oui ou demande au joueur de choisir une autre case sinon
    # while (chosen_case[1]<0 || chosen_case[1]>2)
    #   puts "Merci de choisir une case valide"
    #   chosen_case = gets.chomp.downcase.gsub(/[abc123]/, 'a'=>'0', 'b'=>1, 'c'=>2, '1'=>0, '2'=>1, '3'=>2)
    #   chosen_case = [chosen_case[0].to_i, chosen_case[1].to_i]
    # end
    while !board.is_case_empty?(chosen_case)
      puts "Merci de choisir une case vide."
      chosen_case = gets.chomp.downcase.gsub(/[abc123]/, 'a'=>'0', 'b'=>1, 'c'=>2, '1'=>0, '2'=>1, '3'=>2)
      chosen_case = [chosen_case[0].to_i, chosen_case[1].to_i]
    end
      board.cases_array[chosen_case[0]][chosen_case[1]].content = " #{players[turn].symbol} "
      board.turns_played += 1
  end


end