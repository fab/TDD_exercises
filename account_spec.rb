require "rspec"
 
require_relative "account"
 
describe Account do

  let(:acct_number) { '1234567890' }
  let(:account) { Account.new(acct_number) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new account with transactions" do
        account.transactions.should eq([0])
      end

      it "creates a new account with a given starting balance" do
        Account.new('1234567890', 10).transactions.should eq([10])
      end
    end
 
    context "with invalid input" do
      it "throws an argument error when not given an acct_number argument" do
        expect { Account.new }.to raise_error(ArgumentError)
      end
    end
  end
 
  describe "#transactions" do
    it "returns account transactions" do
      account.transactions.should eq([0])
    end
  end
 
  describe "#balance" do
    it "returns account balance" do
      account.balance.should eq(0)
    end

    it "should change accordingly to deposits" do
      account.deposit!(10).should eq(10)
    end

    it "should change accordingly to withdrawls" do
      Account.new('1234567890', 10).withdraw!(5).should eq(5)
    end
  end
 
  describe "#account_number" do
    it "should return a hidden account number" do
      account.acct_number.should eq('******7890')
    end

    it "throws an InvalidAccountNumberError when an invalid acct_number is given" do
      expect { Account.new('123456789') }.to raise_error(InvalidAccountNumberError)
    end
  end
 
  describe "deposit!" do
    it "throws a NegativeDepositError if amount to deposit is negative" do
      expect { account.deposit!(-10) }.to raise_error(NegativeDepositError)    
    end
  end
 
  describe "#withdraw!" do
    it "throws a OverdraftError if amount to withdraw is higher than balance" do
      expect { account.withdraw!(10) }.to raise_error(OverdraftError)    
    end
  end
end
