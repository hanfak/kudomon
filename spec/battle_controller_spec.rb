describe BattleController do
  subject(:battle_ctrl) { described_class.new(trainer_1,trainer_2) }

  let(:chikapu) {double :Kudomon, species: 'chikapu', type: :electric, health_points: 10, combat_points: 2, attack: nil, reduce_health: 10,hunter: 'bobby'}
  let(:sourbulb) {double :Kudomon, species: 'sourbulb',  type: :grass, health_points: 10, combat_points: 2, attack: nil, reduce_health: 10, hunter: 'han'}
  let(:mancharred) {double :Kudomon, species: 'mancharred', type: :fire, health_points: 10, combat_points: 2, attack: nil}
  let(:dodo) {double :Kudomon, species: 'dodo' ,type: :psychic, health_points: 10, combat_points: 2, attack: nil,hunter: 'bobby'}

  let(:trainer_1) {double :Trainer, name: "han", captured_kudomons: [sourbulb, mancharred]}
  let(:trainer_2) {double :Trainer, name: "bobby", captured_kudomons: [chikapu,dodo]}

  describe '#initialize' do
    it 'has trainers to fight' do
      expect(battle_ctrl.trainers).to eq [trainer_1, trainer_2]
    end
  end

  describe '#pick_kudomons' do
    it 'picks random kudomon' do
      allow(Kernel).to receive(:rand).and_return(0, 0)
      battle_ctrl.pick_kudomons
      expect(battle_ctrl.trainer_1_kudomon).to eq sourbulb
      expect(battle_ctrl.trainer_2_kudomon).to eq chikapu
    end
  end

  describe '#choose_order' do
    it 'picks order' do
      battle_ctrl.pick_kudomons
      allow(Kernel).to receive(:rand).and_return(0)
      expect(battle_ctrl.choose_order).to eq [sourbulb, chikapu]
    end
  end

  describe 'fight' do
    it 'returns first fighter as winner after fighting' do
      allow(Kernel).to receive(:rand).and_return(0, 0)
      battle_ctrl.pick_kudomons
      allow(Kernel).to receive(:rand).and_return(0)
      allow(sourbulb).to receive(:reduce_health).and_return(8,6,4,2,0)
      allow(chikapu).to receive(:reduce_health).and_return(8,6,4,2,0)
      4.times {battle_ctrl.fight}
      allow(chikapu).to receive(:health_points).and_return(0)

      expect(battle_ctrl.fight).to eq 'han won with sourbulb'
    end

    it 'returns second fighter as winner after fighting' do
      allow(Kernel).to receive(:rand).and_return(0, 0)
      battle_ctrl.pick_kudomons
      allow(Kernel).to receive(:rand).and_return(1)
      allow(sourbulb).to receive(:reduce_health).and_return(8,6,4,2,0)
      allow(chikapu).to receive(:reduce_health).and_return(8,6,4,2,0)
      4.times {battle_ctrl.fight}
      allow(sourbulb).to receive(:health_points).and_return(0)

      expect(battle_ctrl.fight).to eq 'bobby won with chikapu'
    end

    it 'returns first fighter as winner after fighting kudomon that is weak against its kudomon' do
      allow(Kernel).to receive(:rand).and_return(0, 1)
      battle_ctrl.pick_kudomons
      allow(Kernel).to receive(:rand).and_return(0)
      allow(sourbulb).to receive(:reduce_health).with(1).and_return(6,2)
      allow(dodo).to receive(:reduce_health).with(2).and_return(8,6)
      2.times { battle_ctrl.fight}
      allow(sourbulb).to receive(:health_points).and_return(-2)

      expect(battle_ctrl.fight).to eq 'bobby won with dodo'
    end
  end

end
