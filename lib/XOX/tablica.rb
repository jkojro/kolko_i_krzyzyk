module XOX
	class Tablica
		attr_reader :grid
		def initialize(input = {})
			@grid = input.fetch(:grid, default_grid)
		end

		def get_cell(x, y)
			grid[y][x]
		end

		def set_cell(x, y, value)
			get_cell(x, y).value = value
		end

		def game_over
			return :winner if winner?
			return :draw if draw?
			false
		end

		def formatted_grid
      		grid.each do |row|
        	puts row.map { |komorka| komorka.value.empty? ? "_" : komorka.value }.join(" ")
      	end
	end


		private

		def default_grid
			Array.new(3) {Array.new(3) {Komorka.new}}
		end

		def winner?
			winning_positions.each do |winning_position|
				next if winning_position_values(winning_position).all_empty?
				return true if winning_position_values(winning_position).all_same?
			end
			false
		end

		def winning_position_values(winning_position)
			winning_position.map { |komorka| komorka.value }
		end

		def winning_positions
			grid + #rows
			grid.transpose + #columns
			diagonals
		end

		def diagonals
			[
				[get_cell(0,0),get_cell(1,1), get_cell(2,2)],
				[get_cell(0,2),get_cell(1,1), get_cell(2,0)]
			]
		end

		def draw?
			grid.flatten.map { |komorka| komorka.value }.none_empty?
		end


	end
end