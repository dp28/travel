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

  describe 'Currency::LAK' do
    subject(:currency) { Currency::LAK }

    it_should_behave_like 'a currency' do
      let(:code) { :LAK }
      let(:name) { 'kip' }
      let(:symbol) { '₭' }
      let(:exchange_rate_to_dollars) { 0.00012 }
    end
  end

  describe 'Currency::KHR' do
    subject(:currency) { Currency::KHR }

    it_should_behave_like 'a currency' do
      let(:code) { :KHR }
      let(:name) { 'riel' }
      let(:symbol) { '៛' }
      let(:exchange_rate_to_dollars) { 0.00025 }
    end
  end

  describe 'Currency::MYR' do
    subject(:currency) { Currency::MYR }

    it_should_behave_like 'a currency' do
      let(:code) { :MYR }
      let(:name) { 'ringgit' }
      let(:symbol) { 'RM' }
      let(:exchange_rate_to_dollars) { 0.2551 }
    end
  end

  describe 'Currency::SGD' do
    subject(:currency) { Currency::SGD }

    it_should_behave_like 'a currency' do
      let(:code) { :SGD }
      let(:name) { 'Singapore dollars' }
      let(:symbol) { 'S$' }
      let(:exchange_rate_to_dollars) { 0.759529 }
    end
  end

  describe 'Currency::IDR' do
    subject(:currency) { Currency::IDR }

    it_should_behave_like 'a currency' do
      let(:code) { :IDR }
      let(:name) { 'rupiah' }
      let(:symbol) { 'Rp' }
      let(:exchange_rate_to_dollars) { 0.0000726904 }
    end
  end

  describe 'Currency::AUD' do
    subject(:currency) { Currency::AUD }

    it_should_behave_like 'a currency' do
      let(:code) { :AUD }
      let(:name) { 'Australian dollars' }
      let(:symbol) { 'A$' }
      let(:exchange_rate_to_dollars) { 0.768527 }
    end
  end

  describe 'Currency::ARS' do
    subject(:currency) { Currency::ARS }

    it_should_behave_like 'a currency' do
      let(:code) { :ARS }
      let(:name) { 'Argentinian pesos' }
      let(:symbol) { 'ARS $' }
      let(:exchange_rate_to_dollars) { 0.0496560 }
    end
  end

  describe 'Currency::CLP' do
    subject(:currency) { Currency::CLP }

    it_should_behave_like 'a currency' do
      let(:code) { :CLP }
      let(:name) { 'Chilean pesos' }
      let(:symbol) { 'CLP $' }
      let(:exchange_rate_to_dollars) { 0.00167581 }
    end
  end

  describe 'Currency::BOB' do
    subject(:currency) { Currency::BOB }

    it_should_behave_like 'a currency' do
      let(:code) { :BOB }
      let(:name) { 'Bolivianos' }
      let(:symbol) { 'B$' }
      let(:exchange_rate_to_dollars) { 0.144196 }
    end
  end
end
