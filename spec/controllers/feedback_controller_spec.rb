require 'rails_helper'

RSpec.describe FeedbackController, type: :controller do
  describe 'POST deliver' do
    before { post :deliver, params: { feedback_form: feedback_form } }

    context 'with valid email address and not empty message' do
      let(:feedback_form) { attributes_for(:feedback_form) }

      it 'sends email' do
        expect(ActionMailer::Base.deliveries).not_to be_empty
      end

      it 'redirects to home' do
        expect(response).to redirect_to(root_url)
      end

      it 'contains notice flash message' do
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid email address' do
      let(:feedback_form) { attributes_for(:feedback_form, email: 'test') }

      it 'redirects to home' do
        expect(response).to redirect_to(root_url)
      end

      it 'contains alert flash message' do
        expect(flash[:alert]).to be_present
      end
    end

    context 'with empty message' do
      let(:feedback_form) { attributes_for(:feedback_form, message: '') }

      it 'redirects to home' do
        expect(response).to redirect_to(root_url)
      end

      it 'contains alert flash message' do
        expect(flash[:alert]).to be_present
      end
    end
  end
end
