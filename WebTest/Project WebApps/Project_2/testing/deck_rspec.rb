#!/user/bin/ruby -w
require '../deck'
require 'rspec/expectations'
#Author Jincheng Liu

describe "Deck#new" do
    context "with one parameter " do
        it "has parameter n = 0" do 
         expect(Deck.new(0).to_a).to match_array([])
        end
	it "has parameter n = 1" do
	 expect(Deck.new(1).to_a).to eq([0])
	end
	it "has parameter n = 5" do
	 expect(Deck.new(5).to_a).to eq([0,1,2,3,4])
	end
	it "has parameter n<0" do
	 expect(Deck.new(-1).to_a).to eq([])
	end
    end

    context " with zero parameter " do
	it "uses the defaut parameter" do
	 expect(Deck.new.to_a).to eq([])
	end
    end
end

describe  "Deck#aoi_to_new_base" do
    it " convert from base 10 to base 3 " do
	expect(Deck.new(5).aoi_to_new_base(3,10)).to match_array([0,1,2,10,11])
    end
    it " convert from base 10 to base 2 " do
	expect(Deck.new(5).aoi_to_new_base(2,10)).to match_array([0,1,10,11,100])
    end
end

describe "Deck#pick_n" do
    it "n = 3" do
	expect(Deck.new(5).pick_n(3).size).to eq(3)
    end
    it "n <=0" do
	expect(Deck.new(5).pick_n(-1).size).to eq(0)
    end
    it "n = 10" do
	expect(Deck.new(15).pick_n(10).size).to eq(10)
    end
end

