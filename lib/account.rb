# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

class Account
  STARTING_BALANCE = 0

  attr_accessor :balance, :transaction_history, :transaction
  attr_reader :statement

  def initialize(balance = STARTING_BALANCE, statement = Statement.new, transaction_class = Transaction)
    @balance = balance
    @transaction_history = []
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @balance += amount
    record(credit_transaction(amount))
  end

  def withdraw(amount)
    @balance -= amount
    record(debit_transaction(amount))
  end

  def print_statement
    @statement.print(@transaction_history)
  end

  private

  def credit_transaction(amount)
    @transaction = @transaction_class.create(amount, 0, @balance)
  end

  def debit_transaction(amount)
    @transaction = @transaction_class.create(0, amount, @balance)
  end

  def record(_transaction)
    @transaction_history << transaction
  end
end
