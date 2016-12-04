describe MultiplayerCaptureController do
  subject(:capture_ctlr) {described_class.new(kudomons, trainer_1,trainer_2)}

  let(:sourbulb) {double :Kudomon, name: :a, position: [4,5]}
  let(:chikapu) {double :Kudomon, name: :b, position: [6, 7]}
  let(:mancharred) {double :Kudomon, name: :c, position: [9,9]}
  let(:pikabu) {double :Kudomon, name: :c, position: [2,1]}
  let(:kudomons) {double :Kudomons, available_kudomons: [ chikapu, sourbulb, mancharred]}

  let(:trainer_1) {double :Trainer, position: [1,1] }
  let(:trainer_2) {double :Trainer, position: [3,1] }
  let(:trainer_3) {double :Trainer, position: [5,3] }
  describe 'stores kudomons' do
    it 'initializes with a list of kudomons' do
      expect(capture_ctlr.get_kudomons).to eq kudomons
    end
  end

  describe 'stores players' do
    subject(:capture_ctlr_2) {described_class.new(kudomons, trainer_1)}

    it 'initializes with a player' do
      expect(capture_ctlr_2.get_trainers[0]).to eq trainer_1
    end

    context 'stores more than one player' do
      it 'initializes with a 2 players ' do
        expect(capture_ctlr.get_trainers).to eq [trainer_1, trainer_2]
      end
    end
  end

  describe '#spot_kudomon' do
    it 'call #find_closest_kudomon' do
      expect(trainer_1).to receive(:find_closest_kudomon).with(kudomons)
      capture_ctlr.spot_kudomon(trainer_1)
    end

    it 'raises error if trainer is not part of game' do
      message = 'Trainer not part of game, add trainer to game'
      expect{capture_ctlr.spot_kudomon(trainer_3) }.to raise_error message
    end
  end
end
