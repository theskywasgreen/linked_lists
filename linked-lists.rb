class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    @size += 1
    if @head.nil? # set head and tail to current node if head is nil
      @head = node
      @tail = node
    else
# set the current tail's 'next pointer'
# (i.e the node before the one currently being appended) to point towards this current node.
      @tail.next = node
# then change tail to this current node
      @tail = node
    end
  end

  def prepend(node)
    @size += 1
    if @head.nil?
      @head = node
      @tail = node
    else
# set the node to be prepended's next pointer to current @head node (i.e the node that began as head)
      node.next = @head
# now set current node as new @head
      @head = node
    end
  end

  def head
    return 0 if @head.nil?
    puts @head
  end

  def tail
    return 0 if @tail.nil?
    puts @tail
  end

  def at(index)
    return @head if index == 0
    return @tail if index == @size - 1
    current = @head
    index.times { current = current.next }
    current
  end

# removes last element from list
  def pop
    @tail = at(@size - 1)
    @tail.next = nil
    @size -= 1
  end

  def contains?(value)
    current = @head
    @size.times do
      return true if current.value == value
      current = current.next
    end
    false
  end

  def find(data)
    return nil if contains?(value) == false
    current = @head
    @size.times do |index|
      return index if current.value == data
      current = current.next
    end
  end

  def to_s
    current = @head
    string = ''
    @size.times do
      if current == @tail
        string += "( #{current.value} ) -> nil"
      else
        string += "( #{current.value} ) -> "
        current = current.next
      end
    end
    string
  end

  def insert_at(value, index)
    node = Node.new(value)
    previous = at(index - 1)
    current = at(index)
    previous.next = node
    node.next = current
    @size += 1
  end

  def remove_at(index)
    current = at(index)
    next_node = current.next
    previous = at(index - 1)
    previous.next = next_node
    current.next = nil
    @size -= 1
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

l = LinkedList.new
names = Node.new("Nicky")
others = Node.new("Maria")
now = Node.new("Andy")
another = Node.new("Jeremy")
l.append(names)
l.append(others)
l.append(now)
l.append(another)
l.remove_at(1)
p l.to_s


# a = l.at(0)
# puts a.value
# b = l.at(2)
# puts b.value
