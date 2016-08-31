#Test Cases for deck class.
#AUTHOR: Brandon Stone

#!/usr/bin/ruby -w
require '../deck'

puts "Decks"
deck1 = Deck.new(10)
deck1.print
deck2 = Deck.new(0)
deck2.print
deck3 = Deck.new(-1)
deck3.print
deck4 = Deck.new(1)
deck4.print

puts "Arrays"
hand1 = deck1.to_a
puts "#{hand1}"
hand1 = deck2.to_a
puts "#{hand1}"
hand1 = deck3.to_a
puts "#{hand1}"

puts "conversions"
deck1.aoi_to_new_base(2)
deck1.print
deck1.aoi_to_new_base(10,2)
deck1.print
deck1.aoi_to_new_base(3)
deck1.aoi_to_new_base(2,3)
deck1.print

puts "pick_n"
deck1 = Deck.new(10)
deck1.print
thing1 =deck1.pick_n(10)
puts "#{thing1}"
thing2 =deck1.pick_n(1)
puts "#{thing2}"
thing3 =deck1.pick_n(0)
puts "#{thing3}"

puts "to_deck"
a1 = Array.new
a1 = (0..10).to_a
puts "Array =#{a1}"
deck2.to_deck(a1)
deck2.print








