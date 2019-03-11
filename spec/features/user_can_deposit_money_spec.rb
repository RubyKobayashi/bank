# frozen_string_literal: true

require 'bank'

RSpec.describe Bank do
  describe '#deposit' do
    it 'user can deposit money' do
      bank = Bank.new
      bank.deposit(1000)
      expect(bank.balance).to eq(1000)
    end
  end
end
