


#given_rot_string = 'htslwfyaqfyntsx ts ijhtinsl ymj xjhwjy rjxxflj!'

class Crypto
	class << self
		def hash_gen(num)
			@rot_num = num
			@rot_hash = {}
			"A".ord.upto("Z".ord) do |c|
				alpha_num = ((c - "A".ord + num) % 26 + "A".ord).chr()
				@rot_hash.merge!(c.chr() => alpha_num)
			end
			"a".ord().upto("z".ord()) do |c|
				alpha_num = ((c - "a".ord() + num) % 26 + "a".ord()).chr()
				@rot_hash.merge!(c.chr() => alpha_num)
			end
		end

		def hash_return()
			@rot_hash
		end

		def shift_message(message, shift_factor)
			Crypto.hash_gen(shift_factor)
			ret_message = ""
			message.chars.to_a.each do |c|
				if @rot_hash[c] != nil
					ret_message << @rot_hash[c]
				else
					ret_message << c
				end
			end
			ret_message
		end

		def encode(message)
			shift_message(message, @rot_num)
		end

		def decode(message)
			shift_message(message, -1*@rot_num)
		end

	end

end

Crypto.hash_gen(5)
#puts Crypto.hash_return()
puts Crypto.shift_message("Hello", 5)
puts Crypto.shift_message("Hello", -5)
puts Crypto.encode("Hello.  I LiKe pAnCaKes!")
puts Crypto.decode(Crypto.encode("Hello.  I LiKe pAnCaKes!"))
