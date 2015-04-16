# @param {String} s
# @param {Integer} nrows
# @returns {String}
def convert(s, nrows)
  n = nrows
  return s if n == 1
  r = ""
  n.times do |row|
    char, col = s[row], 0
    while !char.nil?
      st = col * (2 * n - 2)
      char = s[row + st]
      r += char if !char.nil?
      if row != 0 && row != n - 1
        char1 = s[n * 2 - 2 - row + st]
        r += char1 if !char1.nil? 
      end
      col += 1
    end
  end
  r
end

puts convert("PAYPALISHIRING", 2)
puts convert("ab", 1)
