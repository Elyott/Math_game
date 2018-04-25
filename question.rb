class Question
  attr_reader :answer, :number1, :number2

  # def initialize()
  #   @number1 = 0
  #   @number2 = 0

  # end

  def self.new_question
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    return "What does #{@number1} plus #{@number2} equal?"
  end

  def self.answer
    @answer = @number1 + @number2
  end
end
