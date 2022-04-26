require 'account'

describe Account do
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
end