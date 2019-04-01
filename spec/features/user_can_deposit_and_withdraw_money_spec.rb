# frozen_string_literal: true

# As a User
# So I can add money to my bank account
# I would like to be able to deposit money

# As a User
# So I can use the money in my bank account
# I would like to be able to withdraw money

RSpec.describe BankAccount do
  it 'user can deposit and withdraw money' do
    bank_account = BankAccount.new
    bank_account.deposit(1000)
    expect(bank_account.balance).to eq(1000)
    bank_account.withdraw(500)
    expect(bank_account.balance).to eq(500)
  end
end
