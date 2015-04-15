# @param {String} s
# @returns {String}
def longest_palindrome(s)
  str = transform s
  p = generate_p str
  length = p.max
  find_substr(str, p.find_index(length), length)[1..-1]
end

def generate_p(s)
  p = Array.new(1000, 0)
  mx = 0
  id = 0
  (1...s.size-1).each do |i|
    p[i] = mx > i ? [p[2*id-i], mx-i].min : 1
    while s[i+p[i]] == s[i-p[i]] 
      p[i] += 1
    end
    if i + p[i] > mx
      mx = i + p[i]
      id = i
    end
  end
  p - [0]
end

def test_generate_p
  r = generate_p(transform("12212321")).join
  p = if r == "12125214121612121"
        "test_generate_p => pass"
      else
        r
      end
  puts p
end


def find_substr(transformed_str, transformed_index, length)
  transformed_str[transformed_index - length + 1 .. transformed_index + length - 1].split("#").join
end

def test_find_substr
  r = find_substr("#a#b#c#d#e#", 5, 4)
  p = if r == "bcd"
        "test_find_substr => pass"
      else
        r
      end
  puts p
end

# insert # into s 
# e.g. s = "abc" => s = "$#a#b#c#"
def transform(str)
  "$##{str.chars.zip(['#'] * str.size).flatten.join}^"
end

def test_transform
  r = transform("abc") 
  p = if r == "$#a#b#c#^"
        "test_insert_into => pass"
      else
        r
      end
  puts p
end

test_transform
test_find_substr
test_generate_p

test_cases = [
  "abb",
  "abcba",
  "bba",
  "z"*499 + "k"*501
]

test_cases.each do |s|
  puts longest_palindrome(s)
  puts longest_palindrome(s).length
end
