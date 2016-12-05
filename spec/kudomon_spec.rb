describe Kudomon do
  let(:space) {double :Geospace, random_position: [1,1]}

  subject(:kudomon) { described_class.new( "Sourbulb" , :grass, space, 10, 2) }

  let(:trainer_1) {double :Trainer, name: "Han"}
  let(:chikapu) {double :Kudomon,  type: :electric, health_points: 10, combat_points: 2, attack: nil}
  let(:titan) {double :Kudomon,  type: :rock, health_points: 10, combat_points: 2, attack: nil}

  describe "#initialize" do
    it 'has a species' do
      expect(kudomon.species).to eq "Sourbulb"
    end

    it 'has a type' do
      expect(kudomon.type).to eq :grass
    end

    it 'has health points' do
      expect(kudomon.health_points).to eq 10
    end

    it 'has combat points' do
      expect(kudomon.combat_points).to eq 2
    end

    describe '#position' do
      it 'calls random_position when setting position of kudonom' do
        expect(space).to receive(:random_position)
        kudomon.position
      end
    end
  end

  describe '#stores_hunter' do
    it 'stores the trainer that is hunting it' do
      kudomon.stores_hunter(trainer_1)
      expect(kudomon.hunter).to eq "Han"
    end
  end

  describe "#attack" do
    it 'attacks other kudomon' do
      expect(chikapu).to receive(:reduce_health).with(1)
      kudomon.attack(chikapu)
    end

    it 'attacks with special attacks' do
      expect(titan).to receive(:reduce_health).with(2)
      kudomon.attack(titan)
    end
  end

  describe "#reduce_health" do
    it 'reduces health points' do
      kudomon.reduce_health(Kudomon::NORMAL_HIT)
      expect(kudomon.health_points).to eq 8
    end

    it 'reduces health points by bonus' do
      kudomon.reduce_health(Kudomon::BONUS_HIT)
      expect(kudomon.health_points).to eq 6
    end
  end
end
