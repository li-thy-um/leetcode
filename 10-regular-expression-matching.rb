# @param {String} s
# @param {String} p
# @return {Boolean}

def is_match(s, p)

  return s.nil? if p.nil?
  return p.nil? if s.nil?
  return s == "" if p == ""
  return true if p.size == 1 && s.size == 1 && ( p[0] == s[0] || p[0] == "." )
  
  p = compact p

  if p[1] == "*"
    i = -1
    while i < s.size && ( i < 0 || p[0] == "." || p[0] == s[i])
      return true if is_match(s[i+1..-1], p[2..-1])  
      i += 1 
    end
    return false
  end
  
  if p[0] == "."
    is_match(s[1..-1], p[1..-1])
  else
    s[0] == p[0] ? is_match(s[1..-1], p[1..-1]) : false
  end
end

def compact(p)
  if p.include?("*")

    a, b, r1, r2 = p.split("*"), "", "", ""
    
    if p[-1] != "*" 
      b = a[-1]
      a = a[0...-1]
    end
    
    a.each do |s|
      if s != r2[-1] 
        r1 += s + "*"
        r2 += s
      end
    end
    
    r1 += b if p[-1] != "*"
    p = r1
  end
  p
end

puts compact("b*.c*..*.b*b*.*c*")

puts "==="

puts is_match("bcaccbbacbcbcab", "b*.c*..*.b*b*.*c*")

puts is_match("a", "ab*") == true ? 'pass' : 'fail'
puts is_match("aa", "a") == false ? 'pass' : 'fail'
puts is_match("aa", "aa") == true ? 'pass' : 'fail'
puts is_match("aaa", "aa") == false ? 'pass' : 'fail'
puts is_match("aa", "a.") == true ? 'pass' : 'fail'

puts is_match("aa", "a*") == true ? 'pass' : 'fail'

puts is_match("aa", ".*") == true ? 'pass' : 'fail'
puts is_match("ab", ".*c") == false ? 'pass' : 'fail'
puts is_match("abc", ".*c") == true ? 'pass' : 'fail'

puts is_match("abdc", ".*d.*c") == true ? 'pass' : 'fail'

puts is_match("aaa", "a*a") == true ? 'pass' : 'fail'

puts is_match("ab", ".*") == true ? 'pass' : 'fail'
puts is_match("aab", "c*a*b") == true ? 'pass' : 'fail'
