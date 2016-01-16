
def check_rows(arr, num)

	return true if num == 0
	count = 0

	arr.each do |sub|
		sub.each do |y|
			if y == num
				count +=1
			end
		end
	end

	return false if count != 9
	return check_sudoku_rows(arr, num - 1)
end

def check_columns(arr, num)
	return true if num == 0
	count = 0

	columns_array = arr.transpose
	columns_array.each do |sub|
		sub.each do |y|
			if y == num
				count +=1
			end
		end
	end

	return false if count != 9
	return check_columns(arr, num-1)
end

def check_boxes(arr, num)
	return true if num == 0
	grouped_array = []
	arr.each do |sub|
		sub.each_slice(3) do |y|
			grouped_array << y
		end
	end
	# p grouped_array
	box = []
	idx = 0
	if grouped_array.length == 3
		box = grouped_array
	else
		while idx < 9
			box << grouped_array[idx] if idx % 3 == 0
			idx += 3
		end
	end
	# p box
	count = 0
	box.each do |sub|
		sub.each do |y|
			if y == num
				count +=1
			end
		end
	end
	# p count
	return false if count != 1
	return check_boxes(arr, num-1)
end


check_boxes(arr, 9, 2)


# function to return all .rb files within a directory
def requiring_ruby(dir)
	
	ruby_files = Dir["*.rb"]
	return ruby_files if Dir["*.rb"].length == 0

	ruby_files << Dir["*.rb"]
	return requiring_ruby(Dir.chdir + "/")
end

requiring_ruby(Dir.pwd)


