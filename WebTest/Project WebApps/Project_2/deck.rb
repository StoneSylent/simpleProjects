=begin
	This Class is used to create a deck. This includes printing the deck,
	picking n random cards from the deck, converting numbers of each card
	to a new base,	and keeping the score of the deck. 
	
	@Author: Brandon Stone, Jay Lorenz
=end

class Deck

  #@array = Array.new

  #create a deck of n cards
  def initialize (n=0)
    @array = Array.new	
    @array = (0...n).to_a
    @score = 0
  end

  #prints deck
  def print
    puts "#{@array}"
  end
  
=begin
	ASUMMES: new_base and old_base are between 2 and 36
	Converts the deck card numbers into a new base. Assumes cards are of base 10
	unless otherwize specified in parameter passing.  
	
	@Author: Brandon Stone
=end
  
  def aoi_to_new_base (new_base,old_base=10)
    if (old_base == 10)
      @array.each {|x| @array[@array.index(x)] = x.to_s(new_base)}
      @array.each {|x| @array[@array.index(x)] = x.to_i}
    elsif (new_base == 10)
      @array.each {|x| @array[@array.index(x)] = x.to_s}
      @array.each {|x| @array[@array.index(x)] = x.to_i(old_base)}
    elsif (new_base != 10 and old_base !=10)
      @array = aoi_to_new_base(10,old_base)
      @array = aoi_to_new_base(new_base)
    end
    return @array
  end

=begin
	ASUMMES: n > 0
	RETURNS: array of n random cards, removing them from the deck  
=end
  
  def pick_n (n)
    n_cards = @array.sample(n)
    @array = @array - n_cards
    return n_cards
  end

  #converts deck to array
  def to_a
    return @array
  end

  #converts array to deck
  def to_deck (array)
    @array = array
  end

  #increases player score if they won
  def win
    @score = @score + 1
  end
  #decreases player score if they lose
  def lose
    @score = @score - 1
  end
  #reports the player current score
  def score_value
    return @score
  end

end
