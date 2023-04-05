# spec/learning_rspec_spec.rb
require_relative '../lib/calculator'
require_relative '../lib/user'

# This file is a rewrite of calculator_spec.rb for the purpose of learning calculator_spec.rb's contents. Writing it required viewing the orginal at the same time.

describe Calculator do
  let(:calculator) { described_class.new }
  subject(:calc) { calculator }

  describe '#add' do
    it 'returns the sum of two numbers' do
      a = 5
      b = 3
      expect(calc.add(a, b)).to eq(8)
    end
  end

  describe '#subtract' do
    it 'returns the difference between two numbers' do
      a = 7
      b = 2
      expect(calc.subtract(a, b)).to be > 4
    end
  end

  describe '#multiply' do
    let(:double_number) { double("Number", value: 3) }

    it 'returns the product of two numbers' do
      allow(double_number).to receive(:value).and_return(3)

      result = calc.multiply(double_number.value, 4)

      expect(result).to eql(12)
    end
  end

  describe '#divide' do
    context 'when divisor is not zero' do
      it 'returns the quotient of two numbers' do
        expect(calc.divide(9,3)).to be_within(0.01).of(3)
      end
    end

    context 'when divisor is zero' do
      it 'raises an error' do
        expect {calc.divide(9, 0)}.to raise_error(ZeroDivisionError)
      end
    end
  end

  describe 'built-in matchers' do
    it 'demonstrates various matchers' do
      expect('hello').to start_with('h')
      expect('hello').to end_with('o')
      expect([1, 2, 3]).to include(2)
      expect({ a: 1, b: 2 }).to have_key(:a)
      expect({ a: 1, b: 2 }).to have_value(2)
      expect(3.14).to be_within(0.01).of(3.14)
    end
  end

  describe 'stubs and mocks' do
    let(:user) { instance_double('User') }

    before do
      allow(user).to receive(:name).and_return('Alice')
    end

    it 'uses stubbed method on a test double' do
      expect(user.name).to eq('Alice')
    end

    it 'verifies that the expected method was called on the test double' do
      user.name
      expect(user).to have_received(:name)
    end
  end
end