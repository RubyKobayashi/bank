# frozen_string_literal: true

require 'bank'

RSpec.describe Bank do
  let(:bank) { described_class.new }

  describe '#deposit' do
    it 'can add to balance' do
      bank.deposit(1000)
      expect(bank.balance).to eq(1000)
    end
  end

  describe '#withdraw' do
    it 'detracts from the balance' do
      bank.deposit(1000)
      bank.withdraw(500)
      expect(bank.balance).to eq(500)
    end
  end
end
