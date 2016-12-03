describe Trainer do
  subject(:trainer) { described_class.new( "Han" ) }

  describe "#initialize" do
    it 'has a name' do
      expect(trainer.name).to eq "Han"
    end

    it 'has a random position'
  end
end
