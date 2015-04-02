# @param {Integer[]} nums1 (Array A)
# @param {Integer[]} nums2 (Array B)
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  raise "Empty inputs" if nums1.size + nums2.size == 0
  return nums2.sorted_median if nums1.size == 0
  return nums1.sorted_median if nums2.size == 0
  solve(nums1, nums2, 0, nums1.size-1, 0, nums2.size-1)
end

def solve(n1, n2, i1, j1, i2, j2)

  l1 = j1 - i1 + 1
  l2 = j2 - i2 + 1
  mi1 = n1.index_of_sorted_median(i1, j1)
  mi2 = n2.index_of_sorted_median(i2, j2)
  m1 = n1.sorted_median(i1, j1)
  m2 = n2.sorted_median(i2, j2)
 
  case
  
  when l1 == 1 && l2 == 1
    (n1[i1] + n2[i2]) / 2.0  
  
  when l1 == 1
    n2.median_single i2, j2, n1[i1]
  
  when l2 == 1
    n1.median_single i1, j1, n2[i2]

  when l1 == 2
    n2.median_double i2, j2, n1[i1], n1[j1]

  when l2 == 2
    n1.median_double i1, j1, n2[i2], n2[j2]

  when m1 == m2
    m1

  when m1 > m2
    x = j1 - mi1[1] 
    y = mi2[0] - i2 
    z = x < y ? x : y
    solve(n1, n2, i1, j1 - z, i2 + z, j2)
  
  when m1 < m2
    solve(n2, n1, i2, j2, i1, j1) 
  
  end
end

class Array

  def prev(i)
    i - 1 < 0 ? nil : self[i - 1]
  end

  def next(i)
    self[i + 1]
  end

  # precondition => n1 <= n2
  def median_double(i = 0, j = self.size - 1, n1, n2)
    mi1, mi2 = self.index_of_sorted_median(i, j)
    m1, m2 = self[mi1], self[mi2]
    l = j - i + 1 
    if l.even?
      m1_prev = self.prev(mi1)
      m2_next = self.next(mi2)
      case
      when n2 <= m1
        [[n2, m1_prev].compact.max, m1]
      when m1 <= n1 && n2 <= m2
        [n1, n2]
      when n1 <= m1 && m1 <= n2 && n2 <= m2
        [m1, n2]
      when m1 <= n1 && n1 <= m2 && m2 <= n2
        [n1, m2]
      when n1 <= m1 && m2 <= n2
        [m1, m2]
      when m2 <= n1
        [m2, [n1, m2_next].compact.min]
      end
    else
      m, mi = m1, mi1
      m_prev = self.prev(mi)
      m_next = self.next(mi)
      case
      when n1 <= m && m <= n2
        [m, m]
      when n2 <= m
        [[m_prev, n2].compact.max] * 2
      when m <= n1
        [[m_next, n1].compact.min] * 2
      end
    end.reduce(0, &:+) / 2.0
  end

  def median_single(i = 0, j = self.size - 1, n)
    mi1, mi2 = self.index_of_sorted_median(i, j)
    m1, m2 = self[mi1], self[mi2]
    l = j - i + 1
    if l.even?
      case 
      when n <= m1
        [m1, m1]
      when n >= m2
        [m2, m2]
      else
        [n, n]
      end
    else
      m, mi = m1, mi1
      case
      when n < (m_prev = self.prev(mi))
        [m, m_prev]
      when n > (m_next = self.next(mi))
        [m, m_next]
      else
        [n, m]
      end
    end.reduce(0, &:+) / 2.0
  end
  
  def index_of_sorted_median(i = 0, j = self.size - 1)
    raise "Empty Array Error" if self.size == 0

    # Special cases.
    i, j = j, i if i > j
    return [i, i] if i == j
    i = 0 if i < 0
    j = self.size - 1 if j >= self.size
    
    # Compute index of median
    n = j - i + 1
    if n.even?
      [i+n/2-1, i+n/2]
    else
      m = (n+1)/2-1
      [i+m, i+m]
    end
  end

  def sorted_median(i = 0, j = self.size - 1)
    i1, i2 = index_of_sorted_median(i, j) 
    (self[i1] + self[i2]) / 2.0
  end
end

puts find_median_sorted_arrays([1,2,6,7], [3,4,5,8])
