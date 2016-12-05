describe MultiplayerCaptureController do
  subject(:capture_ctlr) {described_class.new(kudomons, trainer_1,trainer_2)}

  let(:sourbulb) {double :Kudomon, position: [4,5], hunter: 'Bobby'}
  let(:chikapu) {double :Kudomon,  position: [6, 7], stores_hunter: nil,  hunter: nil}
  let(:mancharred) {double :Kudomon,  position: [9,9], hunter: "Noddy"}
  let(:pikabu) {double :Kudomon, position: [3,1], stores_hunter: nil, hunter: nil}
  let(:kudomons) {double :Kudomons, available_kudomons: [ chikapu, sourbulb, mancharred], remove: nil}

  let(:trainer_1) {double :Trainer, name: "han", position: [1,1], find_closest_kudomon: nil, closest_kudomon: pikabu}
  let(:trainer_2) {double :Trainer, name: 'Noddy' , capture_kudomon: nil, position: [5,1], closest_kudomon: mancharred, remove: nil }
  let(:trainer_3) {double :Trainer, name: 'Bobby', position: [5,3], find_closest_kudomon: nil, closest_kudomon: chikapu}

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

  describe '#initiate_capture' do
    it 'calls #stores_hunter' do
      capture_ctlr.spot_kudomon(trainer_1)
      expect(trainer_1).to receive(:closest_kudomon).and_return(pikabu)
      allow(Kernel).to receive(:rand).and_return(4)
      capture_ctlr.initiate_capture(trainer_1, 4)
    end

    it 'raises error if no kudomon spotted' do
      allow(trainer_1).to receive(:closest_kudomon).and_return nil
      message = 'No closest kudomon, find closest kudomon first'
      expect{capture_ctlr.initiate_capture(trainer_1, 1) }.to raise_error message
    end

    it 'raises error if closest kudomon has a hunter' do
      allow(trainer_1).to receive(:closest_kudomon).and_return mancharred
      message = 'Cannot initiate capture, it already has a hunter'
      expect{capture_ctlr.initiate_capture(trainer_1, 1)}.to raise_error message
    end

    it 'does not store hunter if matches code' do
      allow(Kernel).to receive(:rand).and_return(3)
      capture_ctlr.initiate_capture(trainer_3, 4)
      expect(trainer_3.closest_kudomon.hunter).to eq nil
    end
  end

  describe '#capture' do
    it 'raises error if not initaited first' do
      message = 'You have not initiated capture'
      expect{capture_ctlr.capture(trainer_1) }.to raise_error message
    end

    context 'capturing hunted kudomon' do
      it 'captures kudomon' do
        expect(trainer_2).to receive(:capture_kudomon)
        capture_ctlr.capture(trainer_2)
      end

      it 'removes kudomon from available_kudomons' do
        expect(kudomons).to receive(:remove).with(trainer_2.closest_kudomon)
        capture_ctlr.capture(trainer_2)
      end

      it 'removes closests kudomon from trainer' do
        expect(trainer_2).to receive(:remove)
        capture_ctlr.capture(trainer_2)
      end
    end

    context 'does not capture not hunted kudomon' do
      it 'raises error if trainer is not the hunter of kudomon' do
        message = 'you are not the hunter of this kudomon'
        allow(trainer_2).to receive(:closest_kudomon).and_return sourbulb
        expect{capture_ctlr.capture(trainer_2) }.to raise_error message
      end

    end
  end
end
