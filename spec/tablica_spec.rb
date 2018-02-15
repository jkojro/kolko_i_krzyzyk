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
	end
end