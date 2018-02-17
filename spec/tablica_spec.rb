require "spec_helper"

module XOX
	describe Tablica do

		context "#initialize" do
			it "initializes the board with a grid" do
				expect {Tablica.new(grid: "tablica")}.to_not raise_error
			end

			it "sets the grid with tree rows by default" do
				tablica = Tablica.new
				expect(tablica.grid).to have(3).things
			end

			it "creates three things in each row by default" do
				tablica = Tablica.new
				tablica.grid.each do |row|
					expect(row).to have(3).things
				end
			end
		end

		context "#tablica" do
			it "returns the grid 'tablica' " do
				tablica = Tablica.new(grid: "tablica")
				expect(tablica.grid).to eq "tablica"
			end
		end

		context "#get_cell" do
			it "returns the cell based on (x,y) coordinate" do
				grid = [["", "", ""], ["", "", "test-cell"], ["", "", ""]]
				tablica = Tablica.new(grid: grid)
				expect(tablica.get_cell(2, 1)).to eq "test-cell"
			end
		end

		context "#set_cell" do
			it "sets a value to the cell with (x, y) coordinate" do
				Cat = Struct.new(:value)
				grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
				tablica = Tablica.new(grid: grid)
				tablica.set_cell(0, 0, "bingo")
				expect(tablica.get_cell(0, 0).value).to eq "bingo"
			end
		end


		TestCell = Struct.new(:value)
		let(:x_cell) { TestCell.new("X") }
		let(:y_cell) { TestCell.new("Y") }
		let(:empty) { TestCell.new }


		context "#game_over" do
  			it "returns :winner if winner? is true" do
    			tablica = Tablica.new
    			tablica.stub(:winner?) { true }
   				expect(tablica.game_over).to eq :winner
  			end
 
  			it "returns :draw if winner? is false and draw? is true" do
    			tablica = Tablica.new
    			tablica.stub(:winner?) { false }
    			tablica.stub(:draw?) { true }
    			expect(tablica.game_over).to eq :draw
  			end
 
  			it "returns false if winner? is false and draw? is false" do
    			tablica = Tablica.new
    			tablica.stub(:winner?) { false }
    			tablica.stub(:draw?) { false }
    			expect(tablica.game_over).to be false
  			end

  			it "returns :winner when row has objects with values that are all the same" do
  				grid = [
  					[x_cell, y_cell, x_cell],
  					[x_cell, x_cell, x_cell],
  					[y_cell, y_cell, empty]
  				]
  				tablica = Tablica.new(grid: grid)
  				expect(tablica.game_over).to eq :winner
  			end

  			it "returns :winner when columns has objects with values that are all the same" do
  				grid = [
  					[x_cell, y_cell, x_cell],
  					[x_cell, x_cell, empty],
  					[x_cell, y_cell, empty]
  				]
  				tablica = Tablica.new(grid: grid)
  				expect(tablica.game_over).to eq :winner
  			end

  			it "returns :winner when diagonals has objects with values that are all the same" do
  				grid = [
  					[x_cell, empty, y_cell],
  					[empty, y_cell, x_cell],
  					[y_cell, y_cell, empty]
  				]
  				tablica = Tablica.new(grid: grid)
  				expect(tablica.game_over).to eq :winner
  			end

  			it "returns :draw when all cells on the board are taken" do
  				grid = [
  					[x_cell, y_cell, x_cell],
  					[y_cell, x_cell, x_cell],
  					[y_cell, x_cell, y_cell]
  				]
  				tablica = Tablica.new(grid: grid)
  				expect(tablica.game_over).to eq :draw
  			end

  			it "returns false when there is no winner of draw" do
  				grid = [
  					[x_cell, y_cell, x_cell],
  					[x_cell, empty, empty],
  					[y_cell, y_cell, empty]
  				]
  				tablica = Tablica.new(grid: grid)
  				expect(tablica.game_over).to be false
  			end
		end
	end
end