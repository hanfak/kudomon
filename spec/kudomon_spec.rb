describe Kudomon do
  let(:space) {double :Geospace, random_position: [1,1]}

  subject(:kudomon) { described_class.new( "Sourbulb" , "grass", space ) }

  let(:trainer_1) {double :Trainer, name: "Han"}

  describe "#initialize" do
    it 'has a species' do
      expect(kudomon.species).to eq "Sourbulb"
    end

    it 'has a type' do
      expect(kudomon.type).to eq "grass"
    end

    describe '#position' do
      it 'calls random_position when setting position of kudonom' do
        expect(space).to receive(:random_position)
        kudomon.position
      end
    end
  end

  describe '#stores_hunter' do
    it 'stores the trainer that is hunting it' do
      kudomon.stores_hunter(trainer_1)
      expect(kudomon.hunter).to eq "Han"
    end
  end
end
