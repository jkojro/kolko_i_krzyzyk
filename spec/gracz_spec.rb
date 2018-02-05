require "spec_helper"

module XOX
	describe Gracz do
		context "#initialize" do

			it "raises an exeption when initialized with {}" do
				expect { Gracz.new({})}.to raise_error
			end

			it "does not raise an error when initialized with a valid input hash" do
				input = {color: "X", name: "Someone"}
				expect {Gracz.new(input)}.to_not raise_error
			end
		end

		context "#color" do

			it "returns a color" do
				input = {color: "X", name: "Someone"}
				gracz = Gracz.new(input)
				expect(gracz.color).to eq "X"
			end
		end

		context "#name" do
			it "returns a name" do
				input = {color: "X", name: "Someone"}
				gracz = Gracz.new(input)
				expect(gracz.name).to eq "Someone"
			end
		end
	end
end