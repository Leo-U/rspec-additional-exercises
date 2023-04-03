# spec/learning_rspec_spec.rb
require_relative '../lib/calculator'
require_relative '../lib/user'

# This spec file is designed to teach you the following RSpec concepts:
# - Let Variables
# - Implicit and Explicit Subject
# - A variety of built-in-matchers
# - Setting values for instance variables to create test conditions
# - The 'Arrange, Act & Assert' testing pattern
# - Stubs, Mocks, and Doubles
# - Test Driven Development

# Imagine we have a simple class called Calculator with the following methods:
# - add(a, b)
# - subtract(a, b)
# - multiply(a, b)
# - divide(a, b)

RSpec.describe Calculator do
  # Let Variables
  # Use 'let' to define a memoized helper method.
  let(:calculator) { Calculator.new }

  # Implicit and Explicit Subject
  # 'subject' is an instance of the described class by default.
  # You can also give it an explicit name.
  subject(:calc) { calculator }

  # A variety of built-in-matchers
  describe '#add' do
    it 'returns the sum of two numbers' do
      # Setting values for instance variables to create test conditions
      a = 5
      b = 3

      # The 'Arrange, Act & Assert' testing pattern
      # Arrange: Set up the necessary preconditions for the test.
      # Act: Execute the code being tested.
      # Assert: Check if the result meets the expected outcome.

      # Act & Assert
      expect(calc.add(a, b)).to eq(8) # Use built-in 'eq' matcher to check for equality
    end
  end

  # More built-in matchers
  describe '#subtract' do
    it 'returns the difference between two numbers' do
      expect(calc.subtract(7, 2)).to be > 4 # Use built-in 'be >' matcher to check if greater than
    end
  end

  # Stubs, Mocks, and Doubles
  describe '#multiply' do
    # Use 'double' to create a test double (mock object) with the specified methods and return values.
    let(:double_number) { double("Number", value: 3) }

    it 'returns the product of two numbers' do
      # Use 'allow' to stub a method on the test double.
      allow(double_number).to receive(:value).and_return(3)

      # Act
      result = calc.multiply(double_number.value, 4)

      # Assert
      expect(result).to eql(12) # Use built-in 'eql' matcher to check for value equality
    end
  end

  # Test Driven Development (TDD) example
  # 1. Write a failing test.
  # 2. Write just enough code to make the test pass.
  # 3. Refactor the code, ensuring the test still passes.

  describe '#divide' do
    context 'when divisor is not zero' do
      it 'returns the division result of two numbers' do
        # Test not yet implemented, will fail
        expect(calc.divide(9, 3)).to be_within(0.01).of(3) # Use built-in 'be_within' and 'of' matchers
      end
    end

    context 'when divisor is zero' do
      it 'raises an error' do
        # Test not yet implemented, will fail
        expect { calc.divide(9, 0) }.to raise_error(ZeroDivisionError) # Use built-in 'raise_error' matcher
      end
    end
  end
  
  # Additional built-in matchers
  describe 'built-in matchers' do
    it 'demonstrates various matchers' do
    expect("hello").to start_with("h") # Use built-in 'start_with' matcher
    expect("hello").to end_with("o") # Use built-in 'end_with' matcher
    expect([1, 2, 3]).to include(2) # Use built-in 'include' matcher
    expect({ a: 1, b: 2 }).to have_key(:a) # Use built-in 'have_key' matcher
    expect({ a: 1, b: 2 }).to have_value(2) # Use built-in 'have_value' matcher
    expect(3.14).to be_within(0.01).of(3.14) # Use built-in 'be_within' and 'of' matchers
    end
  end

  # More on Stubs and Mocks
  describe 'stubs and mocks' do
    # Create a test double of a 'User' class
    let(:user) { instance_double("User") }

    before do
      # Stub the 'name' method on the 'user' double
      allow(user).to receive(:name).and_return("Alice")
    end

    it 'uses stubbed method on a test double' do
      expect(user.name).to eq("Alice")
    end

    it 'verifies that the expected method was called on the test double' do
      user.name
      expect(user).to have_received(:name)
    end
  end
end

