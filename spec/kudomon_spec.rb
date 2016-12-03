describe Kudomon do
  describe "#initialize" do
    subject(:kudomon) { described_class.new( "Sourbulb" , "grass", [10, 10] ) }

    it 'has a species' do
      expect(kudomon.species).to eq "Sourbulb"
    end

    it 'has a type' do
      expect(kudomon.type).to eq "grass"
    end

    it 'has a position' do
      allow(Kernel).to receive(:rand).and_return(4, 8)
      expect(kudomon.position).to eq [4,8]
    end

    it 'position lies between 1 and max range' do
      500.times do
        expect(kudomon.position[0]).to be_between(1, 10)
        expect(kudomon.position[1]).to be_between(1, 10)
      end
    end
  end
end
