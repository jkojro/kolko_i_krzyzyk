module XOX
	class Gra
		attr_reader :gracze, :tablica, :obecny_gracz, :drugi_gracz

		def initialize(gracze, tablica = Tablica.new)
			@gracze = gracze
			@tablica = tablica
			@obecny_gracz, @drugi_gracz = gracze.shuffle
		end

		def switch_players
			@obecny_gracz, @drugi_gracz = @drugi_gracz, @obecny_gracz
		end

		def solicit_move
			"#{obecny_gracz.name} wprowadź liczbę od 1 do 9 żeby wykonać ruch."
		end

		def get_move(human_move = gets.chomp)
			human_move_to_coordinate(human_move)
		end

		def game_over_message
			return "#{obecny_gracz.name} wygrał!" if tablica.game_over == :winner
			return "Remis!" if tablica.game_over == :draw
		end

		def play
			puts "#{obecny_gracz.name} został losowo wybrany jako pierwszy"
			while true
				tablica.formatted_grid
				puts ""
				puts solicit_move
				x, y = get_move
				tablica.set_cell(x, y, obecny_gracz.color)
				if tablica.game_over
					puts game_over_message
					tablica.formatted_grid
					return
				else
					switch_players
				end
			end
		end


	private

		def human_move_to_coordinate(human_move)
			mapping = {
    			"1" => [0, 0],
    			"2" => [1, 0],
    			"3" => [2, 0],
    			"4" => [0, 1],
    			"5" => [1, 1],
    			"6" => [2, 1],
    			"7" => [0, 2],
    			"8" => [1, 2],
    			"9" => [2, 2]
  			}
  			mapping[human_move]
  		end
	end
end
