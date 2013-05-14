require "rspec"
 
require_relative "account"
 
describe Account do

  let(:acct_number) { '12345678' }
  let(:account) { Account.new(acct_number) }

  describe "#initialize" do
    it "should create an account" do
      # expect { Account.new('12345678') }.to eq(account)
    end
    #has an account number


    #starting balanace of 0

  end
 
  describe "#transactions" do
 
  end
 
  describe "#balance" do
 
  end
 
  describe "#account_number" do
 
  end
 
  describe "deposit!" do
 
  end
 
  describe "#withdraw!" do
 
  end
end
