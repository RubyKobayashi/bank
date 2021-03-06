# frozen_string_literal: true

require 'bank_account'

# As a User
# So I can see how much money is in my bank account
# I would like to be able to see my bank balance on my bank statement

RSpec.describe BankStatement do
  it 'user can see the bank balance' do
    bank_account = BankAccount.new
    allow(bank_account).to receive(:date_today).and_return('12/03/2019')
    bank_statement = BankStatement.new(bank_account)
    bank_account.deposit(1000)
    expect { bank_statement.prepare_to_print }.to output("                            \n date       || credit || debit || balance \n 12/03/2019 || 1000   ||       || 1000    \n                            \n").to_stdout
  end
end
