# @param {Integer[]} height
# @return {Integer}
# @complexity O(n)
def max_area(height)
  max = 0
  l, r = 0, height.size - 1
  while r > l
    max = [max, area(height, l, r)].max
    if height[l] < height[r]
      begin l += 1 end while r > l && height[l-1] >= height[l]
    else
      begin r -= 1 end while r > l && height[r+1] >= height[r]
    end
  end
  max
end

def area(height, l, r)
  raise 'right <= left' if r <= l
  [height[l], height[r]].min * (r - l)
end

puts max_area([1,1])
puts max_area([10,9,8,7,6,5,4,3,2,1])
