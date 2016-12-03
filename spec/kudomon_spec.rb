describe Kudomon do
  describe "#initialize" do
    subject(:kudomon) { described_class.new( "Sourbulb" , "grass" ) }

    it 'has a species' do
      expect(kudomon.species).to eq "Sourbulb"
    end
    
    it 'has a type'
    it 'has a position'
  end
end
