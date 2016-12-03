describe Geospace do
  subject(:space) { described_class.new }

  describe "#random_position" do
    it 'creates a random position' do
      allow(Kernel).to receive(:rand).and_return(4, 8)
      expect(space.random_position).to eq [4,8]
    end

    it 'position lies between 1 and max range' do
      max_x_range = 5
      max_y_range = 9
      space_2 = Geospace.new( [max_x_range, max_y_range] )

      500.times do
        expect(space_2.random_position[0]).to be_between(1, max_x_range)
        expect(space_2.random_position[1]).to be_between(1, max_y_range)
      end
    end

    it 'has a default range' do
      500.times do
        expect(space.random_position[0]).to be_between(1, 10)
        expect(space.random_position[1]).to be_between(1, 10)
      end
    end
  end

  describe "#find_distance" do
    let(:mancharred) {double :Kudomon, name: :c, position: [9,9]}
    let(:trainer_1) {double :Trianer, position: [1,8]}
    let(:trainer_2) {double :Trianer, position: [1,1]}

    it 'calculates the shortest distance using pythagoras same axis' do
      expect(space.find_distance(trainer_1, mancharred)).to eq 65
    end

    it 'calculates the shortest distance using pythagoras different axes' do
      expect(space.find_distance(trainer_2, mancharred)).to eq 128
    end
  end

end
