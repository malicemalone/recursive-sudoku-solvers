
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
	return check_rows(arr, num - 1)
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

def check_boxes(arr)

	return true if arr == []

	box = []
	idx = 0

	while idx <= 2
		box << arr[idx].slice!(0..2)
		idx +=1
	end

	#check for each number's existence only once in current box
	num = 1
	while num <= 9
		count = 0
		box.each do |sub|
			sub.each do |y|
				if y == num
					count +=1
				end
			end
		end
		return false if count != 1
		num +=1
	end

	arr = arr.delete_if {|x| x == []}
	return check_boxes(arr)
end

# valid and invalid board examples for testing
 valid  =	[[5, 3, 4, 6, 7, 8, 9, 1, 2], 
	         [6, 7, 2, 1, 9, 5, 3, 4, 8],
	         [1, 9, 8, 3, 4, 2, 5, 6, 7],
	        
	         [8, 5, 9, 7, 6, 1, 4, 2, 3],
	         [4, 2, 6, 8, 5, 3, 7, 9, 1],
	         [7, 1, 3, 9, 2, 4, 8, 5, 6],
	        
	         [9, 6, 1, 5, 3, 7, 2, 8, 4],
	         [2, 8, 7, 4, 1, 9, 6, 3, 5],
	         [3, 4, 5, 2, 8, 6, 1, 7, 9]]


invalid =  [[5, 3, 4, 6, 7, 8, 9, 1, 2], 
		        [6, 7, 2, 1, 9, 5, 3, 4, 8],
		        [1, 9, 8, 3, 4, 2, 5, 6, 7],
		        
		        [8, 5, 9, 7, 6, 1, 4, 2, 3],
		        [4, 2, 6, 8, 5, 3, 7, 9, 1],
		        [7, 1, 3, 9, 2, 4, 8, 5, 6],
		        
		        [9, 6, 1, 5, 3, 7, 2, 8, 4],
		        [2, 8, 7, 4, 1, 9, 6, 3, 5],
		        [3, 4, 5, 2, 8, 6, 1, 7, 8]]

check_rows(valid, 9) # => true
check_columns(valid,9)# => true
check_boxes(valid)# => true

check_rows(invalid, 9) # => false
check_columns(invalid, 9)# => false
check_boes(invalid) # => false

# function to return all .rb files within a directory
def requiring_ruby(dir)
	
	ruby_files = Dir["*.rb"]
	return ruby_files if Dir["*.rb"].length == 0

	ruby_files << Dir["*.rb"]
	return requiring_ruby(Dir.chdir + "/")
end

requiring_ruby(Dir.pwd)