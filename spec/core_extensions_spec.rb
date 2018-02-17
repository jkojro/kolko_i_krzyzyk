require "spec_helper"

describe Array do
	context "#all_empty?" do
		it "returns true if all elements of the array are empty" do
			expect(["", "", ""].all_empty?).to be true
		end

		it "returns false if some of the array elements are not empty" do
			expect(["", "1", ""].all_empty?).to be false
		end

		it "returns true for an empty array" do
			expect([].all_empty?).to be true
		end
	end


	context "#all_same?" do
		it "returns true if all elements of the array are the same and empty" do
			expect(["", "", ""].all_same?).to be true
		end

		it "returns true if all elements of the array are the same" do
			expect(["3", "3", "3"].all_same?).to be true
		end

		it "returns true if  the array is empty" do
			expect([].all_same?).to be true
		end

		it "returns false if not every elements of the array are the same" do
			expect(["", "3", "3", Object.new, :a].all_same?).to be false
		end
	end

	context "#any_empty?" do

		it "returns true if any of the elements of the array are empty" do
			expect(["q", "w", "", :p, Object.new].any_empty?).to be true
		end

		it "returns true if all elements of the array are empty" do
			expect(["", "", ""].any_empty?).to be true
		end

		it "returns false if the array is empty" do
			expect([].any_empty?).to be false
		end

		it "returns false if none of the elements of the array are empty" do
			expect(["q", "3", "3", Object.new, :a].any_empty?).to be false
		end
	end


	context "#none_empty?" do

		it "returns true if none of the elements of the array are empty" do
			expect(["q", "w", "4", :p, Object.new].none_empty?).to be true
		end

		it "returns true if the array is empty" do
			expect([].none_empty?).to be true
		end

		it "returns false if any of the elements of the array is not empty" do
			expect(["", "", "", :a].none_empty?).to be false
		end
	end


end