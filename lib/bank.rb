# frozen_string_literal: true

#:nodoc:
class Bank
  def initialize
    @bank_balance = 0
  end

  def deposit(amount)
    @bank_balance += amount
  end

  def withdraw(amount)
    @bank_balance -= amount
  end


  def balance
    @bank_balance
  end
end
