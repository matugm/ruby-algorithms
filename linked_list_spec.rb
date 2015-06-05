require_relative 'linked_list'

describe LinkedList do
  it 'can append new items to the list' do
    subject.append 'test'
    expect(subject.count).to eq 1
    subject.append 'cat'
    expect(subject.count).to eq 2
  end

  it 'can find an item' do
    subject.append 'test'
    subject.append 'cat'
    subject.append 'atom'

    expect(subject.find('test')).to be_truthy
    expect(subject.find('cat')).to be_truthy
    expect(subject.find('dog')).to be_falsy
    expect(subject.find('atom')).to be_truthy
  end
end
