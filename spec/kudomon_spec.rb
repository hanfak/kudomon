describe Kudomon do
  subject(:kudomon) { described_class.new( "Sourbulb" , "grass" ) }

  describe "#initialize" do

    it 'has a species' do
      expect(kudomon.species).to eq "Sourbulb"
    end

    it 'has a type' do
      expect(kudomon.type).to eq "grass"
    end

    describe '#position' do
      it 'has a position' do
        allow(Kernel).to receive(:rand).and_return(4, 8)
        expect(kudomon.position).to eq [4,8]
      end

      it 'position lies between 1 and max range' do
        max_x_range = 5
        max_y_range = 9
        mancharred = Kudomon.new("Mancharred" , "fire", [max_x_range, max_y_range] )
        500.times do
          expect(mancharred.position[0]).to be_between(1, max_x_range)
          expect(mancharred.position[1]).to be_between(1, max_y_range)
        end
      end

      it 'has a default range' do
        500.times do
          expect(kudomon.position[0]).to be_between(1, 10)
          expect(kudomon.position[1]).to be_between(1, 10)
        end
      end
    end
  end
end
