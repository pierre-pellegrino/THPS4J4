# Représente chaque case du plateau
class BoardCase
  attr_accessor :index, :content

  def initialize(index)
    @index = index
    @content = " "
  end

end