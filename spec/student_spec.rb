require_relative '../classes/student.rb'


describe Student do
  describe '#initialize' do
    let(:age) { 10 }
    let(:name) { 'John' }
    let(:classroom) { 'B201' }
    let(:parent_permission) { true }

    subject { described_class.new(age, name, classroom, parent_permission: parent_permission) }

    it 'sets the age' do
      expect(subject.age).to eq(age)
    end

    it 'sets the name' do
      expect(subject.name).to eq(name)
    end

    it 'sets the classroom' do
      expect(subject.classroom).to eq(classroom)
    end

    it 'sets the parent permission' do
      expect(subject.parent_permission).to eq(parent_permission)
    end
  end

  describe '#play_hooky' do
    subject { described_class.new(10) }

    it 'returns a string' do
      expect(subject.play_hooky).to be_a(String)
    end

    it 'returns ¯\(ツ)/¯' do
      expect(subject.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    let(:student) { described_class.new(10) }
    let(:classroom) { double('classroom', students: []) }

    subject { student.classroom = classroom }

    it 'sets the classroom' do
      subject

      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end

    context 'when student already belongs to the classroom' do
      before { classroom.students << student }

      it 'does not add student to the classroom again' do
        subject

        expect(student.classroom).to eq(classroom)
        expect(classroom.students.count(student)).to eq(1)
      end
    end
  end
end