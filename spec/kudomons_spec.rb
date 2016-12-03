describe Kudomons do
  subject(:kudomons) { described_class.new }

  describe '#add_kudomon' do
    let(:mancharred) {double :Kudomon, position: [4,5]}

    it 'can add a kudomon to attribute' do
      kudomons.add_kudomon(mancharred)
      expect(kudomons.avialable_kudomons).to eq [mancharred]
    end
  end
end
