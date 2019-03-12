# frozen_string_literal: true

require 'bank'

# As a User
# So I can add money to my bank account
# I would like to be able to deposit money

# As a User
# So I can use the money in my bank account
# I would like to be able to withdraw money

RSpec.describe Bank do
  it 'user cannot withdraw money if there is no credit' do
    bank = Bank.new
    expect { bank.withdraw(10) }.to raise_error('You do not have enough credit')
  end

  it 'user cannot withdraw money if there is not enough credit' do
    bank = Bank.new
    bank.deposit(10)
    expect { bank.withdraw(20) }.to raise_error('You do not have enough credit')
  end
end
