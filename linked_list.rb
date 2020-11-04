#Each node holds a single element of data and a link or pointer to the next node in the list.

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = @head
  end

  def append(value)
    new_node = Node.new(value)
    if !@head
      @head = new_node
      @tail = new_node
    else @tail.next_node = new_node
        @tail = new_node
    end
  end

  def prepend(value)
     if !@head
      new_node = Node.new(value)
      @head = new_node
      @tail = new_node
    else new_node = Node.new(value, @head)
      @head = new_node
    end
  end

  def size
    #returns total number of nodes in the list
    node_count = 0
    node = @head
    while node
      node_count += 1
      node = node.next_node
      #if node == nil
        #break
      #end
    end
    return node_count
  end

  def at(index)
    #returns node at the index
    node = @head
    index_counter = 0
    while node
      current_node = node
      return current_node if index_counter == index 
      next_node = current_node.next_node
      node = next_node
      index_counter += 1
    end
    return "No node at the listed index"
  end

  def pop
    #removes last element from list
     
    @tail = at(size - 2)
    @tail.next_node = nil
  end

  def contains?(value)
    node = @head
    while node
      return true if node.value == value
      node = node.next_node
    end
    return false
  end

  def find(value)
    index_counter = 0
    node = @head
    while node
      return index_counter if node.value == value
      node = node.next_node
      index_counter += 1
    end
    return nil
  end

  def to_s
    #( value ) -> ( value ) -> ( value ) -> nil
    str = ""
    node = @head
    while node
      str += "( #{node.value} ) -> "
      node = node.next_node
    end
    return str + "nil"
  end
end

class Node
   attr_accessor :next_node, :value
  def initialize (value = nil, next_node = nil)
  @value = value
  @next_node = next_node
  end
end

list = LinkedList.new
list.prepend(4)
list.prepend(3)
list.prepend(2)
list.prepend(1)
list.append(6)



p list.to_s