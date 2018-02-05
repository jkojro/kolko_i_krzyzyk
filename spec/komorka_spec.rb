require "spec_helper"

module XOX
	describe Komorka do
		
		context "#initialize" do
			it "is initialized with a value of '' by default" do
				komorka = Komorka.new
				expect(komorka.value).to eq ''
			end

			it "is initioalized with a value of 'X' " do
				komorka = Komorka.new("X")
				expect(komorka.value).to eq "X"
			end
		end





	end
end