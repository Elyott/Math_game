require_relative 'question'
require_relative 'player'

class Main
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @currentPlayer = @player1
    start_play
  end

  def start_play
    while @player1.lives > 0 && @player2.lives > 0
      play_round
    end
  end

  def next_player
    if(@currentPlayer == @player1)
      @currentPlayer = @player2
    else
      @currentPlayer = @player1
    end
  end

  def play_round

    puts "P1: #{ @player1.lives }/3 vs P2: #{ @player2.lives }/3"
    @question = Question.new_question

    if @currentPlayer == @player1
      puts "Player 1: #{@question}"
    else
      puts "Player 2: #{@question}"
    end

    @question_answer = Question.answer

    @player_answer = gets.chomp

    if @player_answer.to_i == @question_answer.to_i
      puts "You are amazing!"
    else
      puts "You putz!"
      @currentPlayer.lose_life
    end

    if @currentPlayer.lives == 0
      next_player
      if @currentPlayer == @player1
        puts "----- Winner -----"
        puts "Player 1 Wins with a score of #{ @player1.lives }/3"
        puts "----- Game Over -----"
      else
        puts "----- Winner -----"
        puts "Player 2 Wins with a score of #{ @player2.lives }/3"
        puts "----- Game Over -----"
      end
    else
      puts "----- Next Player -----"
      next_player
    end

  end

end

main = Main.new