# frozen_string_literal: true

# As a User
# So I can use the money in my bank account
# I would like to be able to withdraw money

RSpec.describe BankAccount do
  it 'user cannot withdraw money if there is no credit' do
    bank_account = BankAccount.new
    expect { bank_account.withdraw(10) }.to raise_error('You do not have enough credit')
  end

  it 'user cannot withdraw money if there is not enough credit' do
    bank_account = BankAccount.new
    bank_account.deposit(10)
    expect { bank_account.withdraw(20) }.to raise_error('You do not have enough credit')
  end
end
