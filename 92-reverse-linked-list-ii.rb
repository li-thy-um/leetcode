# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  list = []
  m, n = m - 1, n - 1
  until head == nil
    list << head.val
    head = head.next
  end
  list = list[0...m] + list[m..n].reverse + list[n+1..-1]
  head = nil
  list.reverse.each do |val|
    node = ListNode.new(val)
    node.next = head
    head = node
  end
  head
end
# Testcase

head = nil
5.times do |i|
  node = ListNode.new(5-i)
  node.next = head
  head = node
end

head = reverse_between head, 2, 4

puts head.inspect

head = ListNode.new(5)
head = reverse_between head, 1, 1
puts head.inspect
