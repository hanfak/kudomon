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

  describe "#find_distance" do
    let(:mancharred) {double :Kudomon, position: [4,5]}

    it 'calculates the shortest distance using pythagoras same axis' do
      allow(Kernel).to receive(:rand).and_return(4, 8)
      expect(trainer.find_distance(mancharred)).to eq 9
    end

    it 'calculates the shortest distance using pythagoras different axes' do
      allow(Kernel).to receive(:rand).and_return(1, 8)
      expect(trainer.find_distance(mancharred)).to eq 18
    end
  end

  describe "#find_closest_kudomon" do
    let(:sourbulb) {double :Kudomon, name: :a, position: [4,5]}
    let(:chikapu) {double :Kudomon, name: :b, position: [6, 7]}
    let(:mancharred) {double :Kudomon, name: :c, position: [9,9]}
    let(:kudomons) {double :Kudomons, available_kudomons: [ chikapu, sourbulb, mancharred]}
    let(:empty_kudomons) {double :Kudomons, available_kudomons: []}

    it 'returns the kudomon which is closest to trainer' do
      allow(Kernel).to receive(:rand).and_return(1, 1)

      trainer.find_closest_kudomon(kudomons)
      expect(trainer.closest_kudomon).to eq sourbulb
    end

    it 'raises error if no kudomons available' do
      message = 'No more kudomons available here'
      expect{  trainer.find_closest_kudomon(empty_kudomons) }.to raise_error message
    end
  end
end
