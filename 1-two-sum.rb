# @param {Integer[]} numbers
# @param {Integer[]} target 
# @return {Integer[]} two integers in an array, ie [index1, index2]
def two_sum(numbers, target)
  r = (numbers & numbers.map { |n| target - n }).sort
  num_1, num_2 = r.first, r.last
  index_1 = numbers.find_index(num_1) + 1 
  index_2 = numbers.rindex(num_2) + 1
  [index_1, index_2].sort
end

test_cases = [
  { numbers: [0, 1, 1, -1], target: 2, output: [2, 3]},
  { numbers: [2, 7, 11, 15], target: 9, output: [1, 2]}
]

test_cases.each do |c|
  puts "*" * 10
  c.each_pair do |k, v|
    puts "#{k}: #{v.inspect}"   
  end
  puts "output`:" + (output = two_sum(c[:numbers], c[:target])).inspect
  puts "result:" + (output == c[:output] ? "PASS" : "FAIL")
  puts "*" * 10
end  
