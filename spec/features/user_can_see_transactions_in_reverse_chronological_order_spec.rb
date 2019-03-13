# frozen_string_literal: true

require 'bank'

# As a User
# So I have a convenient time referenced record
# I would like to see transactions on my bank balance in reverse chronological order

# As a User
# So I can have a physical record
# I would like to print bank statements with dates, type of transaction and bank balance

RSpec.describe BankStatement do
  it 'user can see transactions in reverse chronological order, ' do
    bank = Bank.new
    allow(bank).to receive(:date_today).and_return('10/03/2019')
    bank.deposit(1000)
    allow(bank).to receive(:date_today).and_return('11/03/2019')
    bank.deposit(2000)
    allow(bank).to receive(:date_today).and_return('12/03/2019')
    bank.withdraw(500)
    bank_statement = BankStatement.new(bank)
    expect { bank_statement.format }.to output("                            \n date       || credit || debit || balance \n 12/03/2019 ||        || 500   || 2500    \n 11/03/2019 || 2000   ||       || 3000    \n 10/03/2019 || 1000   ||       || 1000    \n                            \n").to_stdout
  end
end
