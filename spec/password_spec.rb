# frozen_string_literal: true

require 'rspec'
require './src/password'

describe Password do
  describe '.new' do
    context 'when create without arguments' do
      it 'object is a PasswordGenerator class' do
        expect(Password.new).to be_a Password
      end
    end

    context 'when create only password' do
      it 'when create with only password argument' do
        random_password = 'FmyyHMX'
        generator = Password.new(random_password)
        expect(generator.value).to eq(random_password)
      end
    end

    context 'when create random password' do
      it 'when create with length and correct type arguments' do
        generator = Password.new
        generator.generate(10, [:numbers])
        expect(generator.length).to eq(10)
      end
    end
  end

  describe '.count_attempts' do
    context 'when create without arguments' do
      it 'return 4_738_381_338_321_616_896' do
        generator = Password.new
        expect(generator.count_attempts).to eq(4_738_381_338_321_616_896)
      end
    end

    context 'when crate random password with 8 characters words type' do
      it 'return 218_340_105_584_896' do
        generator = Password.new
        generator.generate(8, %i[numbers lowercase uppercase])
        expect(generator.count_attempts).to eq(218_340_105_584_896)
      end
    end
  end

  describe '.amount_time' do
    context 'when create without arguments' do
      it 'return 44 years 70 days 2 hours 39 minutes 30 seconds' do
        generator = Password.new
        expect(generator.amount_time).to eq('44 years 70 days 2 hours 39 minutes 30 seconds')
      end
    end

    context 'when generate random password' do
      it 'when create random password with 8 characters words type' do
        generator = Password.new
        generator.generate(8, %i[numbers lowercase uppercase])
        expect(generator.amount_time).to eq('0 years 0 days 17 hours 50 minutes 17 seconds')
      end
    end
  end
end
