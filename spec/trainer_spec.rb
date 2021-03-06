describe Trainer do
  let(:space) {double :Geospace, random_position: [1,1]}
  let(:space2) {double :Geospace, random_position: [1,8]}

  subject(:trainer) { described_class.new( "Han", space ) }

  let(:sourbulb) {double :Kudomon,  position: [4,5]}
  let(:chikapu) {double :Kudomon,  position: [6, 7]}
  let(:mancharred) {double :Kudomon, position: [9,9]}
  let(:kudomons) {double :Kudomons, available_kudomons: [ chikapu, sourbulb, mancharred], remove: nil}

  describe "#initialize" do
    it 'has a name' do
      expect(trainer.name).to eq "Han"
    end

    describe "#postion" do
      it 'calls random_position when setting position of trainer' do
        expect(space).to receive(:random_position)
        trainer.position
      end
    end
  end

  describe "#find_closest_kudomon" do
    let(:pikabu) {double :Kudomon, position: [6, 7]}
    let(:empty_kudomons) {double :Kudomons, available_kudomons: []}
    let(:same_kudomons) {double :Kudomons, available_kudomons: [ pikabu, chikapu]}

    it 'returns the kudomon which is closest to trainer' do
      allow(space).to receive(:find_distance).and_return(61,25, 128)
      trainer.find_closest_kudomon(kudomons)

      expect(trainer.closest_kudomon).to eq sourbulb
    end

    it 'raises error if no kudomons available' do
      message = 'No more kudomons available here'
      expect{trainer.find_closest_kudomon(empty_kudomons) }.to raise_error message
    end

    it 'returns the first kudomon if more than one kudomon equidistant to trainer' do
      allow(space).to receive(:find_distance).and_return(61,61)
      trainer.find_closest_kudomon(same_kudomons)

      expect(trainer.closest_kudomon).to eq pikabu
    end
  end

  describe "#capture_kudomon" do
    it 'stores the closest_kudomon' do
      allow(space).to receive(:find_distance).and_return(61,25, 128)
      trainer.find_closest_kudomon(kudomons)
      trainer.capture_kudomon

      expect(trainer.captured_kudomons).to eq [sourbulb]
    end
  end

  describe '#remove' do
    it 'sets closest_kudomon to nil' do
      allow(space).to receive(:find_distance).and_return(61,25, 128)
      trainer.find_closest_kudomon(kudomons)
      trainer.remove
      expect(trainer.closest_kudomon).to eq nil
    end
  end
end
