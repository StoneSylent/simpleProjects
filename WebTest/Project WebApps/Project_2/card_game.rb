#!/usr/bin/ruby -w
require './deck'
require './convert_to_string'
require './modify_deck'

=begin
	Generates a new deck of 81 cards, then performs the operations
	for the game, including checking for sets, reshuffling the cards
	and keep score for the user
	@Author: Weichao Mao; Jincheng Liu; Jay Lorenz; Brandon Stone
=end
puts "------*--Please expand your terminal to a maximum size--*------"
puts "press any key to continue"
gets 

deck = Deck.new(81)
deck.aoi_to_new_base(3)
card_array = Array.new
card_array = deck.pick_n(12)

while true do
	puts "\nThe 12 play cards are:\n"
	ConvertToString.new.convertToString(card_array)

	puts "\nEnter first card of set (using number to left of card): "
	c1 = gets
	c1 = c1.to_i
	while c1 < 1 || c1 > 12 do
		puts"    Enter a valid number: "
		c1 = gets
		c1 = c1.to_i
	end
	puts "Enter second card of set: "
	c2 = gets
	c2 = c2.to_i
	while c2 < 1 || c2 > 12 || c2 == c1 do
		puts "    Enter a valid number: "
		c2 = gets
		c2 = c2.to_i
	end
	puts "Enter third card of set: "
	c3 = gets()
	c3 = c3.to_i	
	while c3 < 1 || c3 > 12 || c3 == c2 || c3 == c1 do
		puts "    Enter a valid number: "
		c3 = gets
		c3 = c3.to_i
	end

	#This class takes the three cards and outputs to the screen if they are a set.
	#If it is not a set, the output will give a reason why it is not a set.
	Modify.new.checkForSet(card_array[c1-1], card_array[c2-1], card_array[c3-1], deck)
	
	puts "\nCurrent score is : #{deck.score_value} "
	puts "\nWant to play another round? (Type q to quit, type any other key to continue)"
	
	reply=gets.chomp!
	
	#if "q" ,quit; otherwise, replace three cards and play another round
	if reply=="q" then
		puts"Goodbye!"
		break
	else
		puts "\nReshuffling your cards now, please wait."
		card_array = Modify.new.shuffle_three(c1, c2, c3, card_array, deck)
	end

end
