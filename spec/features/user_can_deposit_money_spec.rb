# frozen_string_literal: true

require 'bank'

# As a User
# So I can add money to my bank account
# I would like to be able to deposit money

RSpec.describe Bank do
  describe '#deposit' do
    it 'user can deposit money' do
      bank = Bank.new
      bank.deposit(1000)
      expect(bank.balance).to eq(1000)
    end
  end
end
