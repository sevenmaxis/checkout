require 'spec_helper'

describe "Checkout" do

  let(:checkout) { Checkout.new(FruitTea.new, Strawberry.new) }

  it "FR, SR, FR, FR, CF total $22.45" do
    checkout.scan('FR')
    checkout.scan('SR')
    checkout.scan('FR')
    checkout.scan('FR')
    checkout.scan('CF')
    
    checkout.total.should == 22.45
  end

  it "FR, FR total $3.11" do
    checkout.scan('FR')
    checkout.scan('FR')
    
    checkout.total.should == 3.11
  end

  it "SR, SR, FR, SR total $16.61" do
    checkout.scan('SR')
    checkout.scan('SR')
    checkout.scan('FR')
    checkout.scan('SR')
    
    checkout.total.should == 16.61
  end

  it "FR, FR, FR, FR total $6.22" do
    4.times { checkout.scan('FR') }

    checkout.total.should == 6.22
  end

  it "SR, SR, SR, SR, SR, SR, SR total $27" do
    7.times { checkout.scan('SR') }

    checkout.total.should == 31.5
  end

  it "SR, SR total $10" do
    2.times { checkout.scan('SR') }

    checkout.total.should == 10.0
  end
end