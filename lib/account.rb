require_relative 'transaction'

class Account
  ::STARTING_BALANCE = 0

  attr_accessor :balance, :transaction_history, :transaction

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    record(credit_transaction(amount))
  end

  def withdraw(amount)
    @balance -= amount
    record(debit_transaction(amount))
  end

  private

  def credit_transaction(amount, transaction = Transaction)
    @transaction = transaction.create(amount, 0, @balance)
  end

  def debit_transaction(amount, transaction = Transaction)
    @transaction = transaction.create(0, amount, @balance)
  end

  def record(transaction)
    @transaction_history << @transaction
  end


end
