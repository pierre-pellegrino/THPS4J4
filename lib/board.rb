# Plateau de jeu, contient les 9 cases et le nombre de tours joués
class Board
  attr_accessor :cases_array, :turns_played

  def initialize
    #Tableau à deux dimensions, chaque entrée représente une ligne et contient trois colonnes
    @cases_array =  [[BoardCase.new("A 1"), BoardCase.new("A 2"), BoardCase.new("A 3")], 
                    [BoardCase.new("B 1"), BoardCase.new("B 2"), BoardCase.new("B 3")], 
                    [BoardCase.new("C 1"), BoardCase.new("C 2"), BoardCase.new("C 3")]]

    @turns_played = 0
  end
  
  def show
    puts (" "*40 + " "*9 + "|" + " "*9 + "|" + " "*9)

    puts (" "*40 + " "*3 + show_case(cases_array[0][0]) + " "*3 + "|" + " "*3 + show_case(cases_array[0][1]) + " "*3 + "|" +  " "*3 +show_case(cases_array[0][2]) + " "*3)

    puts (" "*40 + " "*9 + "|" + " "*9 + "|" + " "*9)

    puts (" "*40 + "-"*9 + "|" + "-"*9 + "|" + "-"*9) #Barre

    puts (" "*40 + " "*9 + "|" + " "*9 + "|" + " "*9)

    puts (" "*40 + " "*3 + show_case(cases_array[1][0]) + " "*3 + "|" + " "*3 + show_case(cases_array[1][1]) + " "*3 + "|" +  " "*3 + show_case(cases_array[1][2]) + " "*3)

    puts (" "*40 + " "*9 + "|" + " "*9 + "|" + " "*9)

    puts (" "*40 + "-"*9 + "|" + "-"*9 + "|" + "-"*9) #Barre

    puts (" "*40 + " "*9 + "|" + " "*9 + "|" + " "*9)

    puts (" "*40 + " "*3 + show_case(cases_array[2][0]) + " "*3 + "|" + " "*3 + show_case(cases_array[2][1]) + " "*3 + "|" +  " "*3 + show_case(cases_array[2][2]) + " "*3)

    puts (" "*40 + " "*9 + "|" + " "*9 + "|" + " "*9)

    puts ""
    puts ""

  end

  def show_case(current_case) # Affiche l'index d'une case si elle est vide, son contenu si elle a été jouée
    current_case.content == " " ? current_case.index : current_case.content
  end

  def is_case_empty?(case_index) # Vérifie que la case demandée par le joueur est bien vide, retourne vrai si oui, faux sinon
    @cases_array[case_index[0]][case_index[1]].content == " " ? true : false
  end

end