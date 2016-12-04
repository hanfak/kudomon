describe BattleController do
  subject(:battle_ctrl) { described_class.new(trainer_1,trainer_2) }

  let(:chikapu) {double :Kudomon,  type: "electric"}
  let(:sourbulb) {double :Kudomon, type: "grass"}
  let(:mancharred) {double :Kudomon, type: "fire"}
  let(:dodo) {double :Kudomon, type: "psychic"}

  let(:trainer_1) {double :Trainer, name: "han", captured_kudomons: [sourbulb, mancharred]}
  let(:trainer_2) {double :Trainer, name: "bobby", captured_kudomons: [chikapu,dodo]}


  describe '#initialize' do
    it 'has trainers to fight' do
      expect(battle_ctrl.trainers).to eq [trainer_1, trainer_2]
    end
  end

  describe 'pick_kudomons' do
    it 'picks random kudomon' do

      allow(Kernel).to receive(:rand).and_return(0, 0)
      battle_ctrl.pick_kudomons
      expect(battle_ctrl.trainer_1_kudomon).to eq sourbulb
      expect(battle_ctrl.trainer_2_kudomon).to eq chikapu
    end
  end
end
