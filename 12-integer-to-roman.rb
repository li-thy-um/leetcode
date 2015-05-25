# @param {Integer} num
# @return {String}
def int_to_roman(num)
  hash = make_hash num.to_s.size
  nums = num.to_s.chars.map(&:to_i)
  i = nums.shift
  hash[i] + if nums.join =~ /^0*$/ then "" else int_to_roman(nums.join.to_i) end
end

def make_hash(size)
  c = {
    1 => [:I, :V, :X],
    2 => [:X, :L, :C],
    3 => [:C, :D, :M],
    4 => [:M, :V_, :X_]
  }[size]
  {
    1 => "#{c[0]}",
    2 => "#{c[0]}#{c[0]}",
    3 => "#{c[0]}#{c[0]}#{c[0]}",
    4 => "#{c[0]}#{c[1]}",
    5 => "#{c[1]}",
    6 => "#{c[1]}#{c[0]}",
    7 => "#{c[1]}#{c[0]}#{c[0]}",
    8 => "#{c[1]}#{c[0]}#{c[0]}#{c[0]}",
    9 => "#{c[0]}#{c[2]}"
  }
end

(1..3999).each do |i|
  puts "#{i} => #{int_to_roman(i)}"
end
