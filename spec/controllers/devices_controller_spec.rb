require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  subject { create(:device_one) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:device_one) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:device_one, name: '') }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all Device as @devices' do
      get :index, params: {}, session: valid_session
      expect(assigns(:devices)).to eq([subject])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested device as @device' do
      get :show, params: {id: subject.to_param}, session: valid_session
      expect(assigns(:device)).to eq(subject)
    end
  end

  describe 'GET #new' do
    it 'assigns a new device as @device' do
      get :new, params: {}, session: valid_session
      expect(assigns(:device)).to be_a_new(Device)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested device as @device' do
      get :edit, params: {id: subject.to_param}, session: valid_session
      expect(assigns(:device)).to eq(subject)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Device' do
        expect {
          post :create, params: {device: valid_attributes}, session: valid_session
        }.to change(Device, :count).by(1)
      end

      it 'assigns a newly created device as @device' do
        post :create, params: {device: valid_attributes}, session: valid_session
        expect(assigns(:device)).to be_a(Device)
        expect(assigns(:device)).to be_persisted
      end

      it 'redirects to the created device' do
        post :create, params: {device: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Device.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved device as @device' do
        post :create, params: {device: invalid_attributes}, session: valid_session
        expect(assigns(:device)).to be_a_new(Device)
      end

      it 're-renders the "new" template' do
        post :create, params: {device: invalid_attributes}, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) { subject { create(:device_one) } }
      let(:new_attributes) { FactoryGirl.attributes_for(:device_one, name: 'Nexus') }

      it 'updates the requested device' do
        put :update, params: {id: subject.to_param, device: new_attributes}, session: valid_session
        subject.reload
        expect(subject.name).to eq(new_attributes[:name])
      end

      it 'assigns the requested device as @device' do
        put :update, params: {id: subject.to_param, device: valid_attributes}, session: valid_session
        expect(assigns(:device)).to eq(subject)
      end

      it 'redirects to the device' do
        put :update, params: {id: subject.to_param, device: valid_attributes}, session: valid_session
        expect(response).to redirect_to(subject)
      end
    end

    context 'with invalid params' do
      it 'assigns the device as @device' do
        put :update, params: {id: subject.to_param, device: invalid_attributes}, session: valid_session
        expect(assigns(:device)).to eq(subject)
      end

      it 're-renders the "edit" template' do
        put :update, params: {id: subject.to_param, device: invalid_attributes}, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) { subject { create(:device_one) } }
    it 'destroys the requested device' do
      expect {
        delete :destroy, params: {id: subject.to_param}, session: valid_session
      }.to change(Device, :count).by(-1)
    end

    it 'redirects to the mice list' do
      delete :destroy, params: {id: subject.to_param}, session: valid_session
      expect(response).to redirect_to(devices_url)
    end
  end
end
