require 'rails_helper'

RSpec.describe Currency do
  shared_examples_for 'a currency' do
    describe '#code' do
      subject { currency.code }
      it { should eq code }
    end

    describe '#name' do
      subject { currency.name }
      it { should eq name }
    end

    describe '#exchange_rate_to_dollars' do
      subject { currency.exchange_rate_to_dollars }
      it { should eq exchange_rate_to_dollars }
    end

    describe '#symbol' do
      subject { currency.symbol }
      it { should eq symbol }
    end

    it 'should be discoverable by code' do
      expect(Currency.find_by_code(code)).to be currency
    end

    it 'should be discoverable by string code' do
      expect(Currency.find_by_code(code.to_s)).to be currency
    end
  end

  describe 'Currency::USD' do
    subject(:currency) { Currency::USD }

    it_should_behave_like 'a currency' do
      let(:code) { :USD }
      let(:name) { 'dollars' }
      let(:symbol) { '$' }
      let(:exchange_rate_to_dollars) { 1.0 }
    end
  end

  describe 'Currency::GBP' do
    subject(:currency) { Currency::GBP }

    it_should_behave_like 'a currency' do
      let(:code) { :GBP }
      let(:name) { 'pounds' }
      let(:symbol) { '£' }
      let(:exchange_rate_to_dollars) { 1.34670 }
    end
  end

  describe 'Currency::THB' do
    subject(:currency) { Currency::THB }

    it_should_behave_like 'a currency' do
      let(:code) { :THB }
      let(:name) { 'baht' }
      let(:symbol) { '฿' }
      let(:exchange_rate_to_dollars) { 0.0312192 }
    end
  end

  describe 'Currency::VND' do
    subject(:currency) { Currency::VND }

    it_should_behave_like 'a currency' do
      let(:code) { :VND }
      let(:name) { 'dong' }
      let(:symbol) { '₫' }
      let(:exchange_rate_to_dollars) { 0.0000440622 }
    end
  end

  describe 'Currency::KIP' do
    subject(:currency) { Currency::LAK }

    it_should_behave_like 'a currency' do
      let(:code) { :LAK }
      let(:name) { 'kip' }
      let(:symbol) { '₭' }
      let(:exchange_rate_to_dollars) { 0.00012 }
    end
  end
end
