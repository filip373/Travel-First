# frozen_string_literal: true
require 'rails_helper'

describe HomeController, type: :controller do
  describe 'GET index' do
    context 'when there are enough places in database' do
      let(:places) { Array.new(3) { build_stubbed(:place) } }

      before do
        allow(Place).to receive(:count).and_return(15)
        allow(Place).to receive(:take_random).and_return(places)
        get :index
      end

      it 'has ok http status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when there are not enough places in database' do
      before { allow(Place).to receive(:count).and_return(3) }

      it 'raises error' do
        expect { get :index }.to raise_error(/Not enough places/)
      end
    end
  end
end
