# frozen_string_literal: true

require 'bank'
require 'bank_statement'

# As a User
# So I can see how much money is in my bank account
# I would like to be able to see my bank balance

RSpec.describe BankStatement do
  it 'user can see the bank balance' do
    bank = Bank.new
    bank_statement = BankStatement.new(bank)
    bank.deposit(1000)
    expect { bank_statement.print }.to output("1000\n").to_stdout
  end
end
