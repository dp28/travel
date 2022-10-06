require 'rails_helper'

RSpec.describe CurrencyAmount do
  subject(:currency_amount) { CurrencyAmount.new(currency: currency, amount: amount) }
  let(:currency) { Currency::USD }
  let(:amount) { 100 }

  describe '#currency' do
    subject { currency_amount.currency }

    it 'should return the Currency the CurrencyAmount was created with' do
      expect(currency_amount.currency).to be currency
    end
  end

  describe '#amount' do
    subject { currency_amount.amount }

    it 'should return the amount the CurrencyAmount was created with' do
      expect(currency_amount.amount).to eq amount
    end
  end

  describe '#convert_to' do
    subject(:converted) { currency_amount.convert_to conversion_currency }
    let(:conversion_currency) { Currency::GBP }

    it 'should return a CurrencyAmount with the passed in Currency' do
      expect(converted.currency).to be conversion_currency
    end

    describe 'the (roughly) correct exchanged amount' do
      context 'from USD to GBP' do
        let(:currency) { Currency::USD }
        let(:conversion_currency) { Currency::GBP }
        it 'should be possible, rounded to 3 significant figures' do
          expect(converted.amount.round).to eq 74
        end
      end

      context 'from GBP to USD' do
        let(:currency) { Currency::GBP }
        let(:conversion_currency) { Currency::USD }
        it 'should be possible, rounded to 3 significant figures' do
          expect(converted.amount.round).to eq 135
        end
      end

      context 'from THB to VND' do
        let(:currency) { Currency::THB }
        let(:conversion_currency) { Currency::VND }
        it 'should be possible, rounded to 3 significant figures' do
          expect(converted.amount.round).to eq 70_900
        end
      end
    end
  end
end
