=begin
	The converToString method ASUMMES:
	The argument passed is an integer which has digits of 0,1,2 ONLY

	The method will output a string representation of the shapes and the number of shapes,
	 which corresponds to each card. Color and inside appearance will be printed as strings
	 because they aren't as easy to convey in a terminal.
	description of card passed in the argument

	AUTHOR: Chaz Gordish
=end
class ConvertToString
	

	def convertToString(deck)

		#Create strings to output cards (each card is six lines tall)
		s1 =""; s2 =""; s3 = ""; s4 = ""; s5 = ""; s6 = ""; cardNum =""

		#Iterate through each card
		12.times do |n|

			number = deck[n].to_s
			#Ensure number is correct length (Ruby omits leading zeros)
			number = '0' + number while number.length <4

			#Assign a cards count property to variable
			count = number[3].to_i + 1

			cardNum << "CARD #{n+1}:"

			#Create visual representation of a cards shape property
			case number[0]
				when '0' then 
					count.times do s1 << ("  __   ") end
					count.times do s2 << (" |  |  ") end
					count.times do s3 << (" |  |  ") end
					count.times do s4 << (" |  |  ") end
					count.times do s5 << (" |__|  ") end
				when '1' then 
					count.times do s1 << ("  __   ") end
					count.times do s2 << (" /  /  ") end
					count.times do s3 << (" |  |  ") end
					count.times do s4 << (" |  |  ") end
					count.times do s5 << (" /__/  ") end
				when '2' then
					count.times do s1 << ("  /\\   ") end
					count.times do s2 << (" /  \\  ") end
					count.times do s3 << (" |  |  ") end
					count.times do s4 << (" \\  /  ") end
					count.times do s5 << ("  \\/   ") end
			end
			

			#Print out word description of the remaining card properties
			# that cannot be easily represented in a terminal
			case number[1]
				when '0' then s6 << " RED,"
				when '1' then s6 << " PURPLE,"
				when '2' then s6 << " GREEN,"
			end

			case number[2]
				when '0' then s6 << " SOLID"
				when '1' then s6 << " STRIPED"
				when '2' then s6 << " OUTLINED"
			end


			#Make each string the same length so everything is aligned
			cardNum << " " while cardNum.length <(28*((n+1)%4))
			s1 << " " while s1.length <(28*((n+1)%4))
			s2 << " " while s2.length <(28*((n+1)%4))
			s3 << " " while s3.length <(28*((n+1)%4))
			s4 << " " while s4.length <(28*((n+1)%4))
			s5 << " " while s5.length <(28*((n+1)%4))
			s6 << " " while s6.length <(28*((n+1)%4))


			#Print out four cards at a time, then reset strings for next four cards
			if (n+1)%4 == 0
				puts("#{cardNum}\n#{s1}\n#{s2}\n#{s3}\n#{s4}\n#{s5}\n#{s6}\n\n")
				s1 =""; s2 =""; s3 = ""; s4 = ""; s5 = ""; s6 = ""; cardNum =""
			end
		end
	
	end

end
