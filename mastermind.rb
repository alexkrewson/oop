class Game

    def self.play
        @round = 1
        selectPlayer
        while !@finished
            guess
            check
            @round += 1
        end
    end

    private

    def self.selectPlayer
        puts ""
        puts "Human, would you like to be the codemaker(1) or the codebreaker(2)?"
        puts ""
        @selectedPlayer = 0
        @code = []
        while @selectedPlayer != 1 && @selectedPlayer !=  2
            puts "Please enter\"1\" or \"2\"."
            puts ""
            @selectedPlayer = gets.chomp.to_i
            if @selectedPlayer == 1
                while !@code.all? { |peg| (1..6).include?(peg) } || @code.length != 4
                    puts "Please create a code (four numbers, 0 > each < 7)."
                    puts ""
                    @code = gets.chomp.split("").map { |peg| peg.to_i}
                end
            elsif @selectedPlayer == 2
                @code = 4.times.map { 1 + Random.rand(6)}
                
            end
        end

    end

    def self.guess
        @codePegs = [0]
        if @selectedPlayer == 1
            @codePegs = 4.times.map { 1 + Random.rand(6)}
            print "@codePegs: #{@codePegs}" 
            while !@codePegs.all? { |peg| (1..6).include?(peg) } || @codePegs.length != 4
                puts ""
                puts "Round #{@round}/10"
                puts "Codebreaker, enter your guess (four numbers, 0 > each < 7)."
                puts ""
                @codePegs = gets.chomp.split("").map { |peg| peg.to_i}
            end
        end

    end

    def self.check
        @blackKeys = 0
        @whiteKeys = 0
        for i in 0..3
            if @code[i] == @codePegs[i]
                @blackKeys += 1
            end
        end
        @whiteKeys = @code.count { |peg| @codePegs.include?(peg) } - @blackKeys
        puts ""
        puts "Round #{@round} results:"
        puts "Black key pegs: #{@blackKeys}"
        puts "White key pegs: #{@whiteKeys}"
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        if @blackKeys == 4 || @round == 10
            @finished = true
            puts "YOU BROKE THE CODE!" if @blackKeys == 4
            puts "GAME OVER" if @blackKeys != 4
        end
    end
end

Game.play