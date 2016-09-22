require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe 'GET show' do
    context 'when given no id given' do
      it 'raises error' do
        expect { get :show }.to raise_error(/No route/)
      end
    end

    context 'when given id does not exist' do
      it 'raises error' do
        expect { get :show, params: { id: 5 } }.to raise_error(/Couldn't find/)
      end
    end

    context 'when given id exists' do
      let(:place) { create(:place) }
      before { get :show, params: { id: place.id } }
      it 'returns ok http status' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
