# @param {string} s
# @return {Integer}
def length_of_longest_substring(s)
  max_length = 0
  m = {}
  last_repeat_pos = -1
  s.size.times do |i|
    msi = m[s[i]]
    last_repeat_pos = msi if msi && last_repeat_pos < msi
    max_length = i - last_repeat_pos if i - last_repeat_pos > max_length
    m[s[i]] = i
  end
  max_length
end

puts Time.now
puts length_of_longest_substring("\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~ \"" * 100 ) 
puts Time.now
