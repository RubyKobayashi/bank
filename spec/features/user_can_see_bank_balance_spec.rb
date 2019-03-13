# frozen_string_literal: true

require 'bank'
require 'bank_statement'

# As a User
# So I can see how much money is in my bank account
# I would like to be able to see my bank balance

RSpec.describe BankStatement do
  it 'user can see the bank balance' do
    bank = Bank.new
    allow(bank).to receive(:date_today).and_return('12/03/2019')
    bank_statement = BankStatement.new(bank)
    bank.deposit(1000)
    expect { bank_statement.format }.to output("                            \n date       || credit || debit || balance \n 12/03/2019 || 1000   ||       || 1000    \n                            \n").to_stdout
  end
end
