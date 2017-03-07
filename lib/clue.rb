class Clue
  attr_reader :question, :answer, :category, :parent
  def initialize(clue, parent)
    @question = clue[:answer]
    @answer = clue[:question]
    @category = clue[:category]
    # @parent = parent
  end
    
end