require_relative 'address'

describe Address do
  let(:address) {
    Address.new(contact_details)
  }
  let(:address1) { '10 Something lane' }
  let(:address2) { }
  let(:city) { 'test' }
  let(:country) { 'UK' }
  let(:postcode) { 'Sk3 0XN' }
  let(:contact_details) {
    {
      'address1' => address1,
      'address2' => address2,
      'country'  => country_code,
      'city'     => city,
      'zip'      => postcode,
    }
  }
  let(:country_code) { 'GB' }
  let(:street) { 'Something lane' }
  let(:house_number) { 10 }

  describe 'initialize' do
    it 'initializes' do
      address
    end
  end

  describe '#house_number' do
    subject { address.house_number }

    context 'house number present' do
      xit 'returns the house no.' do
        expect(subject).to eq(10)
      end
    end

    context 'house number not present' do
      let(:address1) { 'Something lane' }

      xit 'returns nothing' do
        expect(subject).to be_nil
      end
    end

    context 'house number not present' do
      let(:address1) { 'Something lane' }
      let(:address2) { '' }
      xit 'returns nothing' do
        expect(subject).to be_nil
      end
    end

    context 'when number appears after street name' do
      let(:address1) { 'Something lane 10' }

      xit 'returns the house no.' do
        expect(subject).to eq(10)
      end
    end

    context 'when number attached to street name' do
      let(:address1) { 'Somethinglane10' }

      xit 'returns the house no.' do
        expect(subject).to eq(10)
      end
    end

    context 'when the number appears in the street name' do
      let(:address1) { 'Super House' }
      let(:address2) { '10 Example Street' }

      xit 'returns the house no.' do
        expect(subject).to eq(10)
      end
    end
  end

  describe '#house_name' do
    subject { address.house_name }

    context 'only one line' do
      let(:address1) { 'Flat 14 Blah Street' }

      xit 'returns the correct house name' do
        expect(subject).to eq(address1)
      end
    end

    context 'only first line' do
      let(:address1) { 'Special Characters 14, Blah Street' }

      xit 'returns the correct house name' do
        expect(subject).to eq('Special Characters 14')
      end
    end

    context 'not defined' do
      let(:address1) { '' }

      xit 'raises an error' do
        expect { subject }.to raise_error(StandardError)
      end
    end
  end

  describe '#street' do
    subject { address.street }

    context 'not defined' do
      let(:address1) { '12 Special Characters lane' }
      let(:address2) { '' }

      xit 'returns address1 without a house number' do
        expect(subject).to eq('Special Characters lane')
      end
    end

    context 'when street lumped with house number' do
      let(:address1) { 'Flat 14 Blah Street' }

      xit 'returns address1 without a house number' do
        expect(subject).to eq('Flat  Blah Street')
      end
    end

    context 'returns 2nd address line' do
      let(:address1) { 'Flat 14' }
      let(:address2) { 'Blah Street' }

      xit 'returns correct street name' do
        expect(subject).to eq(address2)
      end
    end

    context 'returns 2nd part of the 1st address' do
      let(:address1) { 'Flat 14, Blah Street' }

      xit 'returns correct street name' do
        expect(subject).to eq('Blah Street')
      end
    end

    context 'returns 2nd part of the 1st address without the trailing number' do
      let(:address1) { '14 Blah Street 14' }

      xit 'returns correct street name' do
        expect(subject).to eq('Blah Street')
      end
    end

    context 'returns unknown' do
      let(:address1) { '14 , ' }

      xit 'returns correct street name' do
        expect(subject).to eq('')
      end
    end

    context 'bad character in address' do
      let(:address1) { '27 Seaway Gardens' }
      let(:address2) { 'St. Marys Bay' }

      xit 'returns the correct street name without the bad character' do
        expect(subject).to eq('Seaway Gardens St Marys Bay')
      end
    end
  end
end