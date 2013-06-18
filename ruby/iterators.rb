# def conversation
# 	puts "Hello"
# 	yield
# 	puts "Goodbye"
# end

# conversation { puts "Good to meet you!" }
def main
	n_times(3)
end

def n_times(number)
	1.upto(number) do |n|
		yield n
	end
end

n_times do |n|
	puts "#{n} situps"
	puts "#{n} pushups"
	puts "#{n} chinups"
end