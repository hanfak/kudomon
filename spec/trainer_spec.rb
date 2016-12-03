describe Trainer do
  subject(:trainer) { described_class.new( "Han" ) }

  describe "#initialize" do
    it 'has a name' do
      expect(trainer.name).to eq "Han"
    end

    describe "#position" do
      it 'has a position' do
        allow(Kernel).to receive(:rand).and_return(4, 8)
        expect(trainer.position).to eq [4,8]
      end

      it 'position lies between 1 and max range' do
        max_x_range = 5
        max_y_range = 9
        trainer_2 = Trainer.new("Arya" ,  [max_x_range, max_y_range] )

        500.times do
          expect(trainer_2.position[0]).to be_between(1, max_x_range)
          expect(trainer_2.position[1]).to be_between(1, max_y_range)
        end
      end

      it 'has a default range' do
        500.times do
          expect(trainer.position[0]).to be_between(1, 10)
          expect(trainer.position[1]).to be_between(1, 10)
        end
      end
    end
  end
end
