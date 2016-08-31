=begin
	This Class will contain all of the methods which modify the deck. This will include:
	checking to see if a set is valid, removing valid/invalid set from deck, and adding
	three new unique cards to the array so that it has 12 cards in total.

	@Author: Chaz Gordish, Jay Lorenz
=end
class Modify
	

=begin
	This will simply take in an integer corresponding to a property (color, shape...)
	and an integer of the type of that property (red, squiggle...) and then return
	the string of the correct type.
	AUTHOR: Chaz Gordish
=end
	def propertyViolated( property, type)
		case property
			when 0 then 
				return "OVAL" if type == 0
				return "SQUIGGLE" if type == 1
				return "DIAMONDS"
			when 1 then
				return "RED" if type == 0
				return "PURPLE" if type == 1
				return "GREEN"
			when 2 then
				return "SOLID" if type == 0
				return "STRIPED" if type == 1
				return "OUTLINED"
			else
				return "ONE" if type == 0
				return "TWO" if type == 1
				return "THREE"
		end
	end


=begin
	Takes in 3 cards and outputs string report of whether they form a set
	or not. Returns boolean value corresponding to the validity of a set.
	@Author: Chaz Gordish
=end
	def checkForSet(c1, c2, c3, deck)

		sum = c3 + c2 + c1
		sum = sum.to_s

		#Ensure that the cards and sum are the correct length
		sum = '0' + sum while sum.length <4
		c1 = c1.to_s
		c1 = '0' + c1 while c1.length <4
		c2 = c2.to_s
		c2 = '0' + c2 while c2.length <4
		c3 = c3.to_s
		c3 = '0' + c3 while c3.length <4
		

		violation = -1

		#iterate through sum elements to check if a property is violated
		for i in 0..3 do
			case sum[i]
				when '0','3','6' #=> Do nothing when sum adds up to 0,3, or 6
				when '1' then violation = 0
				when '2' then 
					if c1[i] != '2' && c2[i] != '2' && c3[i] != '2'
						violation = 1 
					else
						violation = 0
					end
				when '4' then
					if c1[i] != '0' && c2[i] != '0' && c3[i] != '0'
						violation = 1
					else
						violation = 2
					end
				else violation = 2
			end

			if violation != -1
				print "Not a Set! Two cards are #{propertyViolated i,violation} and one card is not!!"
				# decreases the score by 1
				deck.lose
				return false
			end
		end

		# increases the score by 1
		deck.win
		puts "Great! You found a set!!"
		return true
	end

=begin 
	Takes in three integer values, the array of cards, and the deck to get three
	new cards from the deck and place them in the array
	@Author: Jay Lorenz
=end
	def shuffle_three(c1, c2, c3, array, deck)
		old_cards = [array[c1], array[c2], array[c3]]
		new_cards = deck.pick_n(3);
		# redraw new cards until it has 3 new cards that aren't already in the set of 12
		while not (array & new_cards).empty? do
			new_cards = deck.pick_n(3)
		end
		old_cards.each {|card| array.delete(card)}
		new_cards.each {|card| array.push(card)}
		return array
	end
		
end
