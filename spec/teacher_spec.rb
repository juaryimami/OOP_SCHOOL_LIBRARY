require_relative '../classes/teacher'

describe Teacher do
  it 'correctly sets the age, specialization, name and parent_permission' do
    teacher = Teacher.new(25, 'Math', 'John', parent_permission: true)
    expect(teacher.age).to eq 25
    expect(teacher.specialization).to eq 'Math'
    expect(teacher.name).to eq 'John'
    expect(teacher.parent_permission).to eq true
  end
end

describe '#can_use_services?' do
  it 'returns true' do
    teacher = Teacher.new(25, 'Math')
    expect(teacher.can_use_services?).to eq true
  end
end
