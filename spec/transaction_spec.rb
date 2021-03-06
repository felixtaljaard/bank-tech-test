# frozen_string_literal: true

require 'transaction'
require 'account'

describe Transaction do
  let(:new_account) { Account.new }
  let(:deposit) { described_class.new(250, 0, new_account.balance) }

  before do
    new_account.deposit(250)
  end

  describe 'date' do
    it 'store todays date' do
      expect(deposit.date).to eq Date.today
    end
  end

  describe 'credit' do
    it 'can store given amount as credit' do
      expect(deposit.credit).to be 250
    end
  end

  describe 'debit' do
    it 'can store given amount as debit' do
      expect(deposit.debit).to be 0
    end
  end

  describe 'updated_balance' do
    it 'can store the balance after transaction is added' do
      expect(deposit.updated_balance).to eq 250
    end
  end
end
