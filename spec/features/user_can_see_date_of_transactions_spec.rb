# frozen_string_literal: true

require 'bank'

# As a User
# So I can have a time referenced record
# I would like to record the dates of when the transactions were made

RSpec.describe BankStatement do
  it 'user can see the date of transaction, ' do
    bank = Bank.new
    bank.deposit(1000)
    bank.deposit(2000)
    bank.withdraw(500)
    bank_statement = BankStatement.new(bank)
    p bank_statement.print
    expect { bank_statement.print }.to output("                            \n date       || credit || debit || balance \n 12/03/2019 || 1000   ||       || 1000    \n 12/03/2019 || 2000   ||       || 3000    \n 12/03/2019 ||        || 500   || 2500    \n                            \n").to_stdout
  end
end
