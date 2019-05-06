class Game
	
	def self.move
		showBoard
		while !@finished
			movePrompt
			showBoard
			checkForWinner
			@turn += 1			
		end
	end
	
	private

	@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	@turn = 1
	@finished = false

	def self.showBoard
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts " #{@board[0]}  #{@board[1]}  #{@board[2]} "
		puts " #{@board[3]}  #{@board[4]}  #{@board[5]} "
		puts " #{@board[6]}  #{@board[7]}  #{@board[8]} "
		puts ""
		puts ""
	end

	def self.movePrompt
		player = 1 if @turn % 2 != 0
		player = 2 if @turn % 2 == 0
		puts ""
		puts "Player #{player}, make your move."
		puts ""
		makeMove
		while (@board[@thisMove].is_a? String) || ![1, 2, 3, 4, 5, 6, 7, 8, 9].include?(@thisMove + 1)
			showBoard
			puts ""
			puts "INVALID MOVE"
			puts ""
			puts "PLAYER #{player}, PLEASE MAKE A VALID MOVE"
			puts ""
			makeMove
		end
		@board[@thisMove] = ["X", "O"][player - 1]
	end

	def self.makeMove
		@thisMove = ""
			@thisMove = gets.chomp.to_i - 1
	end

	def self.checkForWinner
		if @board[0] == "X" && @board[1] == "X" && @board[2] == "X" ||
			 @board[3] == "X" && @board[4] == "X" && @board[5] == "X" ||
			 @board[6] == "X" && @board[7] == "X" && @board[8] == "X" ||

			 @board[0] == "X" && @board[3] == "X" && @board[6] == "X" || 
			 @board[1] == "X" && @board[4] == "X" && @board[7] == "X" ||
			 @board[2] == "X" && @board[5] == "X" && @board[8] == "X" ||

			 @board[0] == "X" && @board[4] == "X" && @board[8] == "X" ||
			 @board[2] == "X" && @board[4] == "X" && @board[6] == "X"

			@finished = true
			puts "Player one wins!"
			puts ""
		elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O" || 
			    @board[3] == "O" && @board[4] == "O" && @board[5] == "O" ||
			    @board[6] == "O" && @board[7] == "O" && @board[8] == "O" ||

			    @board[0] == "O" && @board[3] == "O" && @board[6] == "O" || 
		    	@board[1] == "O" && @board[4] == "O" && @board[7] == "O" ||
	        @board[2] == "O" && @board[5] == "O" && @board[8] == "O" ||

			    @board[0] == "O" && @board[4] == "O" && @board[8] == "O" ||
			    @board[2] == "O" && @board[4] == "O" && @board[6] == "O"

			@finished = true
			puts "Player two wins!"
			puts ""
		elsif @board.all? { |spot| spot.is_a? String}
			puts "GAME OVER"
			puts ""
			@finished = true
		end
	end


end


Game.move