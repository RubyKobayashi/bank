# frozen_string_literal: true

#:nodoc:
class BankStatement
  def initialize(bank)
    @bank = bank
  end

  def print
    p @bank.balance
  end
end
