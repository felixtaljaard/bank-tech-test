require 'account'
require 'transaction'

describe Account do
  let(:transaction) { double(:transaction, :credit => 250, :debit => 0, :updated_balance => 250) }

  it 'has a starting balance of £0' do
    expect(subject.balance).to eq 0
  end

  it 'can make a deposit' do
    subject.deposit(100)
    expect(subject.balance).to eq 100
  end

  it 'can withdraw an amount' do
    subject.deposit(200)
    subject.withdraw(150)
    expect(subject.balance).to eq 50
  end

  it 'stores the given amount as credit or debit in a Transaction object' do
    subject.deposit(250)
    expect(transaction.credit).to eq 250
    expect(transaction.debit).to eq 0
    expect(transaction.updated_balance).to eq 250
  end

  describe 'transaction history' do
    it 'is empty when initialized' do
      expect(subject.transaction_history).to be_empty
    end

    it 'stores all transactions in an array' do
      expect { subject.deposit(250) }.to change { subject.transaction_history.length }.by 1
    end

  end
end