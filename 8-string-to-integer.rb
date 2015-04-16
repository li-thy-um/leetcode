# @param {String} str
# @return {Integer}

MAX_INT = 2147483647
MIN_INT = -2147483648
def my_atoi(str)
  r = str.to_i
  r = r > MAX_INT ? MAX_INT : r
  r = r < MIN_INT ? MIN_INT : r 
end
