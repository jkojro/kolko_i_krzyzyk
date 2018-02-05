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
	end
end