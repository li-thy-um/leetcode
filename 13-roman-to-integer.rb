HASH = {
  I: 1,
  V: 5,
  X: 10,
  L: 50,
  C: 100,
  D: 500,
  M: 1000
}

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  prev_i = 0
  s.chars.map(&:to_sym).map { |sym| HASH[sym] }.reverse.inject(0) do |num, i|
    r = if i >= prev_i
          num + i
        else
          num - i
        end
    prev_i = i
    r
  end
end

require './12-integer-to-roman.rb'

(1..3999).each do |i|
  roman = int_to_roman(i)
  i_ = roman_to_int(roman)
  puts "#{i} => #{roman} => #{i_}"
  break if i != i_
end
