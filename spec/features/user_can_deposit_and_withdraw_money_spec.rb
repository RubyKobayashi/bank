# frozen_string_literal: true

require 'bank'

# As a User
# So I can add money to my bank account
# I would like to be able to deposit money

# As a User
# So I can use the money in my bank account
# I would like to be able to withdraw money

RSpec.describe Bank do
    it 'user can deposit and withdraw money' do
      bank = Bank.new
      bank.deposit(1000)
      expect(bank.balance).to eq(1000)
      bank.withdraw(500)
      expect(bank.balance).to eq(500)
    end
  end
end
