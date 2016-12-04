describe Kudomons do
  subject(:kudomons) { described_class.new }

  let(:mancharred) {double :Kudomon}
  let(:sourbulb) {double :Kudomon}
  let(:chikapu) {double :Kudomon}

  describe '#add_kudomon' do
    it 'can add a kudomon to attribute' do
      kudomons.add_kudomon(mancharred)
      expect(kudomons.available_kudomons).to eq [mancharred]
    end

    it 'can add a kudomon to attribute' do
      add_several_kudomons
      expect(kudomons.available_kudomons).to eq [mancharred, sourbulb, chikapu]
    end
  end

  describe "#remove" do
    it 'removes a specific kudomon from avaialbe kudomons' do
      add_several_kudomons
      kudomons.remove mancharred

      expect(kudomons.available_kudomons).to eq [sourbulb, chikapu]
    end
  end

  private
    def add_several_kudomons
      [mancharred, sourbulb, chikapu].each do |kudomon|
        kudomons.add_kudomon(kudomon)
      end
    end
end
