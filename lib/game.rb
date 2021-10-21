# Initialise une partie, contrôle son état
class Game
  attr_accessor :players, :board, :player_move
  @@games_played = 0

  def initialize
     @board = Board.new
     @player_move = 0
     @@games_played += 1
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
    puts "(Ex : Pour la case A 1, saisissez A1)"
    puts ""
    print "> "

    # Récupère le choix de la case et le convertit en index de tableau (ex: a1 -> 00 -> [0][0], b3 -> 12 etc...)
    chosen_case = gets.chomp.downcase.gsub(/[abc123]/, 'a'=>'0', 'b'=>1, 'c'=>2, '1'=>0, '2'=>1, '3'=>2)
    chosen_case = [chosen_case[0].to_i, chosen_case[1].to_i]
    chosen_case[0]>2 ? chosen_case[0] = 0 : nil
    chosen_case[1]>2 ? chosen_case[1] = 0 : nil

    # Vérifie si la case est vide, ajoute le coup du joueur si oui ou demande au joueur de choisir une autre case sinon
    while !board.is_case_empty?(chosen_case)
      puts "Merci de choisir une case valide."
      puts ""
      print "> "
      chosen_case = gets.chomp.downcase.gsub(/[abc123]/, 'a'=>'0', 'b'=>1, 'c'=>2, '1'=>0, '2'=>1, '3'=>2)
      chosen_case = [chosen_case[0].to_i, chosen_case[1].to_i]
      chosen_case[0]>2 ? chosen_case[0] = 0 : nil
      chosen_case[1]>2 ? chosen_case[1] = 0 : nil
    end
      board.cases_array[chosen_case[0]][chosen_case[1]].content = " #{players[turn].symbol} "
      board.turns_played += 1
  end


  def game_over? # Vérifie si un joueur gagne la partie
    result = false
    # Ces lignes de code contrôlent les colonnes, lignes et diagonales
    board.cases_array[0][0].content != " " && board.cases_array[0][0].content == board.cases_array[0][1].content && board.cases_array[0][1].content == board.cases_array[0][2].content ? result = true : nil
    board.cases_array[1][0].content != " " && board.cases_array[1][0].content == board.cases_array[1][1].content && board.cases_array[1][1].content == board.cases_array[1][2].content ? result = true : nil
    board.cases_array[2][0].content != " " && board.cases_array[2][0].content == board.cases_array[2][1].content && board.cases_array[2][1].content == board.cases_array[2][2].content ? result = true : nil

    board.cases_array[0][0].content != " " && board.cases_array[0][0].content == board.cases_array[1][0].content && board.cases_array[1][0].content == board.cases_array[2][0].content ? result = true : nil
    board.cases_array[0][1].content != " " && board.cases_array[0][1].content == board.cases_array[1][1].content && board.cases_array[1][1].content == board.cases_array[2][1].content ? result = true : nil
    board.cases_array[0][2].content != " " && board.cases_array[0][2].content == board.cases_array[1][2].content && board.cases_array[1][2].content == board.cases_array[2][2].content ? result = true : nil

    board.cases_array[0][0].content != " " && board.cases_array[0][0].content == board.cases_array[1][1].content && board.cases_array[1][1].content == board.cases_array[2][2].content ? result = true : nil
    board.cases_array[2][0].content != " " && board.cases_array[2][0].content == board.cases_array[1][1].content && board.cases_array[1][1].content == board.cases_array[0][2].content ? result = true : nil

    return result
  end


  def show_winner # Affiche le résultat de la partie
    puts ""
    puts "Félicitations, c'est #{players[(@player_move+1)%2].name} qui gagne avec les #{players[(@player_move+1)%2].symbol} !"
    puts ""
  end

  def show_equality # Message en cas d'égalité
    puts "Égalité !"
    puts ""
  end

  def play_again # Propose de rejouer : Si elle retourne 0, on arrête, si elle retourne 1, on rejoue.
    puts "C'était ta #{@@games_played == 1 ? "1ère" : "#{@@games_played}ème"} partie. On en refait une ?"
    puts ""
    puts "0 - Oui"
    puts "1 - Non"
    puts ""
    print "> "
    return answer = gets.chomp.to_i
  end

  def perform
    self.game_title
    self.get_players_names
    while self.board.turns_played < 9
      self.game_title
      self.board.show
      self.player_move
      self.game_over? ? break : nil
    end
    if self.board.turns_played <9
      self.game_title
      self.board.show
      self.show_winner
      gets.chomp
    else
      self.game_title
      self.board.show
      self.show_equality
      gets.chomp
    end
  end


  def game_title # Affiche l'en-tête du jeu
    system("clear")
    puts " _______ _____ _____   _______       _____   _______ ____  ______ ".gray.center(120)
    puts "|__   __|_   _/ ____| |__   __|/\\   / ____| |__   __/ __ \\|  ____|".gray.center(120)
    puts "   | |    | || |         | |  /  \\ | |         | | | |  | | |__   ".gray.center(120)
    puts "   | |    | || |         | | / /\\ \\| |         | | | |  | |  __|  ".gray.center(120)
    puts "   | |   _| || |____     | |/ ____ \\ |____     | | | |__| | |____ ".gray.center(120)
    puts "   |_|  |_____\\_____|    |_/_/    \\_\\_____|    |_|  \\____/|______| ".gray.center(120)
    puts ""
    puts ""
  end


end