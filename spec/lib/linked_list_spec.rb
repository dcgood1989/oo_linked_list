require 'spec_helper'

# Read everything in http://en.wikipedia.org/wiki/Linked_list above the 
# table of Contents

describe Node do
  describe '#next' do
    it 'returns nil when there is no next Node' do
      expect(Node.new('any data').next).to be_nil
    end
  
    it 'return the next Node when one has been set' do
      next_node = Node.new('next data')
      head = Node.new('data')
      head.next = next_node
  
      expect(head.next).to eq next_node
    end
  end

  describe '#data' do
    it 'returns the value set on construction' do
      expect(Node.new('data').data).to eq 'data'
    end

    it 'raises a NoMethodError exception when code tries to modify the value of data' do
      node = Node.new('initial value is the only value and cannot change')
      expect {
        node.data = 'fooza'
      }.to raise_error NoMethodError
    end
  end
end

describe LinkedList do
  describe 'constructor' do
    it 'is initialized with a reference to the head node' do
      head = Node.new('data')
      linked_list = LinkedList.new(head)
      expect(linked_list.head).to eq head
    end

    it 'can be constructed without a head' do
      linked_list = LinkedList.new
      expect(linked_list.head).to eq nil
    end

    it 'allows for a new head node to be set' do
      linked_list = LinkedList.new(Node.new('data'))
      new_head = Node.new('fresh data')
      linked_list.head = new_head

      expect(linked_list.head).to eq new_head
    end
  end

  describe '#to_s' do
    it 'returns a blank string for an empty list' do
      expect(LinkedList.new.to_s).to eq ''
    end

    it 'returns a String of the linked listed, separated by =>' do
      head = Node.new('data')
      linked_list = LinkedList.new(head)
      next_node = Node.new('fresh data')
      head.next = next_node
      next_next_node = Node.new('freshest data')
      next_node.next = next_next_node

      expect(linked_list.to_s).to eq 'data => fresh data => freshest data'
      expect(linked_list.head).to eq head
    end
  end
end
