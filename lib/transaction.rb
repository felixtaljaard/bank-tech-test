require 'date'

class Transaction

  attr_reader :date
  attr_accessor :debit, :credit, :updated_balace

  def initialize
    @date = Date.today
    @credit = nil
    @debit = nil
    @updated_balance = nil
  end
end