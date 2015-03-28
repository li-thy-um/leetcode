# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  int_1 = to_integer(l1)
  int_2 = to_integer(l2)
  to_list_node(int_1 + int_2)
end

def to_list_node(i)
  a = i.to_s.split('').map(&:to_i)
  list_node = ListNode.new(a.pop)
  l1 = list_node
  while a.size > 0
    l2 = ListNode.new(a.pop)
    l1.next = l2
    l1 = l2
  end
  list_node
end

def to_integer(list_node)
  array_list = [] 
  while !list_node.nil?
    array_list << list_node.val
    list_node = list_node.next 
  end
  array_list.reverse.join('').to_i
end

ln = to_list_node 1234567
while !ln.next.nil?
  puts ln.val
  ln = ln.next
end
puts ln.val
puts "--" * 10

ln = to_list_node 1234567
puts to_integer(ln)

