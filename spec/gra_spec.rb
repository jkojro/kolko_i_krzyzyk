require "spec_helper"

module XOX
	describe Gra do
		
		let (:bob) { Gracz.new({color: "X", name: "bob"})}
		let (:frank) {Gracz.new({color: "O", name: "frank"})}


		context "#initialize" do
			it "randomly selects a current_player" do
				Array.any_instance.stub(:shuffle) { [frank, bob]}
				gra = Gra.new([bob, frank])
				expect(gra.obecny_gracz).to eq frank
			end

			it "randomly selects an other player" do
        		Array.any_instance.stub(:shuffle) { [frank, bob] }
        		gra = Gra.new([bob, frank])
        		expect(gra.drugi_gracz).to eq bob
        	end
        end


        context "#switch_players" do
        	it "will set @obecny_gracz to @drugi_gracz" do
        		gra = Gra.new([frank, bob])
        		drugi_gracz = gra.drugi_gracz
        		gra.switch_players
        		expect(gra.obecny_gracz).to eq drugi_gracz
        	end

        	it "will set @drugi_gracz to @obecny_gracz" do
        		gra = Gra.new([frank, bob])
        		obecny_gracz = gra.obecny_gracz
        		gra.switch_players
        		expect(gra.drugi_gracz).to eq obecny_gracz
        	end
        end


        context "#solicit_move" do
        	it "asks the player to make a move" do
        		gra = Gra.new([bob, frank])
        		gra.stub("obecny_gracz") {bob}
        		expected = "bob wprowadź liczbę od 1 do 9 żeby wykonać ruch."
        		expect(gra.solicit_move).to eq expected
        	end
        end


        context "#get_move" do
        	it "converts human_move of '1' do [0,0]" do
        		gra = Gra.new([bob, frank])
        		expect(gra.get_move("1")).to eq [0,0]
        	end

        	it "converts human_move of '7' do [0,2]" do
        		gra = Gra.new([bob, frank])
        		expect(gra.get_move("7")).to eq [0,2]
        	end
        end

        context "#game_over_message" do
        	it "prints the winner name if there is a winner" do
        		gra = Gra.new([bob, frank])
        		gra.stub(:obecny_gracz) { bob }
        		gra.tablica.stub(:game_over) {:winner}
        		expect(gra.game_over_message).to eq "bob wygrał!"
        	end

        	it "prints the draw if there is draw" do
        		gra = Gra.new([bob, frank])
        		gra.stub(:obecny_gracz) { bob }
        		gra.tablica.stub(:game_over) {:draw}
        		expect(gra.game_over_message).to eq "Remis!"
        	end
        end


	end
end