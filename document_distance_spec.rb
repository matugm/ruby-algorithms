require_relative 'document_distance'

describe Document do
  it 'splits document into words' do
    doc = Document.new "the cat is black"
    expect(doc.words).to eq %w(the cat is black)
  end

  it 'counts words' do
    doc = Document.new "test test test"
    expect(doc.count['test']).to eq 3
  end

  it 'calculates the distance between two documents' do
    doc1 = Document.new "the cat is black"
    doc2 = Document.new "the cat is white"
    results = Document.distance(doc1, doc2)

    expect(results).to eq 3
  end
end
