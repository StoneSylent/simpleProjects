#Test Cases for Modify class.
#AUTHOR: Chaz Gordish


require '../modify_deck'
require '../deck'

describe "Modify.propertyViolated" do 

	it 'Converts input with property 0 and type 0 to corresponding string' do
		expect(Modify.new.propertyViolated(0,0)).to eq("OVAL")
	end

	it 'Converts input with property 0 and type 1 to corresponding string' do
		expect(Modify.new.propertyViolated(0,1)).to eq("SQUIGGLE")
	end

	it 'Converts input with property 0 and type 2 to corresponding string' do
		expect(Modify.new.propertyViolated(0,2)).to eq("DIAMONDS")
	end

	it 'Converts input with property 1 and type 0 to corresponding string' do
		expect(Modify.new.propertyViolated(1,0)).to eq("RED")
	end

	it 'Converts input with property 1 and type 1 to corresponding string' do
		expect(Modify.new.propertyViolated(1,1)).to eq("PURPLE")
	end

	it 'Converts input with property 1 and type 2 to corresponding string' do
		expect(Modify.new.propertyViolated(1,2)).to eq("GREEN")
	end

	it 'Converts input with property 2 and type 0 to corresponding string' do
		expect(Modify.new.propertyViolated(2,0)).to eq("SOLID")
	end

	it 'Converts input with property 2 and type 1 to corresponding string' do
		expect(Modify.new.propertyViolated(2,1)).to eq("STRIPED")
	end

	it 'Converts input with property 2 and type 2 to corresponding string' do
		expect(Modify.new.propertyViolated(2,2)).to eq("OUTLINED")
	end

	it 'Converts input with property 3 and type 0 to corresponding string' do
		expect(Modify.new.propertyViolated(3,0)).to eq("ONE")
	end

	it 'Converts input with property 3 and type 1 to corresponding string' do
		expect(Modify.new.propertyViolated(3,1)).to eq("TWO")
	end

	it 'Converts input with property 3 and type 2 to corresponding string' do
		expect(Modify.new.propertyViolated(3,2)).to eq("THREE")
	end

end

describe "Modify.checkForSet" do

	#SUCCESSFUL TESTS
	it 'return true if 0, 1, 2 forming a set' do
		expect(Modify.new.checkForSet(0,1,2,Deck.new)).to be true
	end

	it 'return true if 0, 1001, 2002 forming a set' do
		expect(Modify.new.checkForSet(0,1001,2002,Deck.new)).to be true
	end

	it 'return true if 1010,1121,1202 forming a set' do
		expect(Modify.new.checkForSet(1010,1121,1202,Deck.new)).to be true 
	end

	it 'return true if 2021,1102,210 forming a set' do
		expect(Modify.new.checkForSet(2021,1102,210,Deck.new)).to be true
	end


	#NUMBER FAILURE TESTS
	it ' 0,0,2 not forming a set' do
		expect(Modify.new.checkForSet(0,0,2,Deck.new)).to be false
	end

	it ' 0,1,0 not forming a set' do
		expect(Modify.new.checkForSet(0,1,0,Deck.new)).to be false
	end

	it ' 0,1,1 not forming a set' do
		expect(Modify.new.checkForSet(0,1,1,Deck.new)).to be false
	end

	it ' 1,2,1 not forming a set' do
		expect(Modify.new.checkForSet(1,2,1,Deck.new)).to be false
	end

	it ' 2,2,1 not forming a set' do
		expect(Modify.new.checkForSet(2,2,1,Deck.new)).to be false
	end

	it ' 2,0,2 not forming a set' do
		expect(Modify.new.checkForSet(2,0,2,Deck.new)).to be false
	end


	#SHAPE FAILURE TESTS
	it ' 0,222,2222 not forming a set' do
		expect(Modify.new.checkForSet(0,222,2222,Deck.new)).to be false
	end

	it ' 1000,1222,2222 not forming a set' do
		expect(Modify.new.checkForSet(1000,1222,2222,Deck.new)).to be false
	end

	it ' 0,2222,2222 not forming a set' do
		expect(Modify.new.checkForSet(0,2222,2222,Deck.new)).to be false
	end


	#COLOR FAILURE TESTS
	it ' 2000,2222,2222 not forming a set' do
		expect(Modify.new.checkForSet(2000,2222,2222,Deck.new)).to be false
	end

	it ' 1100,1222,1122 not forming a set' do
		expect(Modify.new.checkForSet(1100,1222,1122,Deck.new)).to be false
	end

	it ' 0,22,122 not forming a set' do
		expect(Modify.new.checkForSet(0,22,122,Deck.new)).to be false
	end

end

	#test cases for shuffle_three
	#Author Jincheng Liu
describe "Modify#shuffle_three" do
	it 'remove three elements from array with ten elements, check the size' do
		expect(Modify.new.shuffle_three(0,1,2,Deck.new(10).to_a,Deck.new(30)).size).to eq(10)
	end
	
	it 'remove three elements from array with ten elements, and check if it removes the correct' do
		expect(Modify.new.shuffle_three(0,1,2,Deck.new(10).to_a,Deck.new(30)) & Deck.new(10).to_a).to match_array([3,4,5,6,7,8,9])
	end
	it 'remove three elements from array with seven elements, check the size' do
		expect(Modify.new.shuffle_three(0,1,2,Deck.new(7).to_a,Deck.new(30)).size).to eq(7)
	end
	it 'remove three elements from array with seven elements , and check if it removes the correct' do
		expect(Modify.new.shuffle_three(0,1,2,Deck.new(7).to_a,Deck.new(30)) & Deck.new(7).to_a).to match_array([3,4,5,6])
	end
end
