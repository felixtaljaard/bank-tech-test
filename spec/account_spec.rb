# frozen_string_literal: true

require 'account'
require 'transaction'

describe Account do
  let(:account) { described_class.new(Account::STARTING_BALANCE, statement, transaction_class) }
  let(:statement) { double(:statement, print: nil) }
  let(:transaction) { double(:transaction, credit: 250, debit: 0, updated_balance: 250) }
  let(:transaction_class) { double(:transaction_class, create: transaction) }

  it 'has a starting balance of £0' do
    expect(account.balance).to eq 0
  end

  it 'can make a deposit' do
    account.deposit(100)
    expect(account.balance).to eq 100
  end

  it 'can withdraw an account' do
    account.deposit(200)
    account.withdraw(150)
    expect(account.balance).to eq 50
  end

  it 'stores the given account as credit or debit in a Transaction object' do
    account.deposit(250)
    expect(transaction.credit).to eq 250
    expect(transaction.debit).to eq 0
    expect(transaction.updated_balance).to eq 250
  end

  describe 'transaction history' do
    it 'is empty when initialized' do
      expect(account.transaction_history).to be_empty
    end

    it 'stores all transactions in an array' do
      expect { account.deposit(250) }.to change { account.transaction_history.length }.by 1
    end
  end
end
