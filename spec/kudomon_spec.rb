describe Kudomon do
  let(:space) {double :Geospace, random_position: [1,1]}

  subject(:kudomon) { described_class.new( "Sourbulb" , "grass", space ) }

  describe "#initialize" do
    it 'has a species' do
      expect(kudomon.species).to eq "Sourbulb"
    end

    it 'has a type' do
      expect(kudomon.type).to eq "grass"
    end
  end

  describe '#position' do
    it 'calls random_position when setting position of kudonom' do
      expect(space).to receive(:random_position)
      kudomon.position
    end
  end
end
