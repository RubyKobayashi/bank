# frozen_string_literal: true

require 'bank'

# As a User
# So I can see how much money is in my bank account
# I would like to be able to see my bank balance

RSpec.describe Bank do
  it 'user can see the bank balance' do
    bank = Bank.new
    expect(bank.balance).to eq(0)
    bank.deposit(1000)
    expect(bank.balance).to eq(1000)
    bank.withdraw(500)
    expect(bank.balance).to eq(500)
  end
end
