# @param {Integer} x
# @return {Integer}
def reverse(x)
  return 0 if x == 0
  r = x.abs.to_s.reverse.to_i * x.abs / x
  r > 2**31 - 1 || r < 1 - 2**31 ? 0 : r
end

puts reverse(123456)
puts reverse(-123456)
