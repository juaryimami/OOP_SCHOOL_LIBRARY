require_relative '../classes/corrector'

describe Corrector do
  let(:corrector) { Corrector.new }
  name = 'namethatistolong'

  it 'corrects the name to have 10 caracters and camel case' do
    expect(corrector.correct_name(name)).to eq('Namethatis')
  end
end
