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

  describe 'GET new' do
    it 'returns ok http status' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    context 'with invalid place' do
      let(:place) { attributes_for(:place, name: '') }

      it 'returns ok http status' do
        post :create, params: { place: place }
        expect(response).to have_http_status(200)
      end

      it 'does not persist place in database' do
        expect { post :create, params: { place: place } }
          .not_to change { Place.count }
      end
    end

    context 'with less than 3 slides' do
      let(:place) { attributes_for(:place, slides_count: 2) }

      it 'does not persist place in database' do
        expect { post :create, params: { place: place } }
          .not_to change { Place.count }
      end

      it 'returns proper flash message' do
        post :create, params: { place: place }
        expect(flash[:error]).to be_present
      end

      it 'returns ok http status' do
        post :create, params: { place: place }
        expect(response).to have_http_status(200)
      end
    end

    context 'with valid place' do
      let(:place) do
        attributes_for(
          :place, slides_attributes: Array.new(3) { attributes_for(:slide) }
        )
      end

      it 'persists place in database' do
        expect { post :create, params: { place: place } }
          .to change { Place.count }.by 1
      end

      it 'persists slides in database' do
        expect { post :create, params: { place: place } }
          .to change { Slide.count }.by 3
      end

      it 'redirects to created place' do
        post :create, params: { place: place }
        expect(response).to redirect_to(place_path(Place.last))
      end
    end
  end
end
