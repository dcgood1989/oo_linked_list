class Node
  def next
    @next
  end
  def initialize(data)
    @data = data
  end

  def next=(new_head)
    @next = new_head
  end

  def data
    @data
  end

end

class LinkedList
  def head
    @head
  end

  def head=(new_head)
    @head = new_head
  end

  def initialize(head = nil)
    @head = head
  end

  def to_s
    result = []
    temp = head
    while temp do
      result << temp.data
      temp = temp.next
    end
    return result.join(' => ')
  end
end
