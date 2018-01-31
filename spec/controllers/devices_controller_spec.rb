require 'rails_helper'
require 'support/auth_helper'

RSpec.describe DevicesController, type: :controller do
  include AuthHelper
  before(:each) do
    http_login
  end

  subject { create(:device_one) }
  let(:valid_attributes) { FactoryBot.attributes_for(:device_one) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:device_one, name: '') }

  describe 'GET #index' do
    it 'assigns all Device as @devices' do
      get :index, params: {}
      expect(assigns(:devices)).to eq([subject])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested device as @device' do
      get :show, params: {id: subject.to_param}
      expect(assigns(:device)).to eq(subject)
    end
  end

  describe 'GET #new' do
    it 'assigns a new device as @device' do
      get :new, params: {}
      expect(assigns(:device)).to be_a_new(Device)
    end

    it 'redirects to index when max records created' do
      (25 - Device.count).times do |_|
        create(:device_one)
      end

      get :new, params: {}
      expect(response).to redirect_to(devices_url)
    end

  end

  describe 'GET #edit' do
    it 'assigns the requested device as @device' do
      get :edit, params: {id: subject.to_param}
      expect(assigns(:device)).to eq(subject)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Device' do
        expect {
          post :create, params: {device: valid_attributes}
        }.to change(Device, :count).by(1)
      end

      it 'assigns a newly created device as @device' do
        post :create, params: {device: valid_attributes}
        expect(assigns(:device)).to be_a(Device)
        expect(assigns(:device)).to be_persisted
      end

      it 'redirects to the created device' do
        post :create, params: {device: valid_attributes}
        expect(response).to redirect_to(Device.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved device as @device' do
        post :create, params: {device: invalid_attributes}
        expect(assigns(:device)).to be_a_new(Device)
      end

      it 're-renders the "new" template' do
        post :create, params: {device: invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) { subject { create(:device_one) } }
      let(:new_attributes) { FactoryBot.attributes_for(:device_one, name: 'Nexus') }

      it 'updates the requested device' do
        put :update, params: {id: subject.to_param, device: new_attributes}
        subject.reload
        expect(subject.name).to eq(new_attributes[:name])
      end

      it 'assigns the requested device as @device' do
        put :update, params: {id: subject.to_param, device: valid_attributes}
        expect(assigns(:device)).to eq(subject)
      end

      it 'redirects to the device' do
        put :update, params: {id: subject.to_param, device: valid_attributes}
        expect(response).to redirect_to(subject)
      end
    end

    context 'with invalid params' do
      it 'assigns the device as @device' do
        put :update, params: {id: subject.to_param, device: invalid_attributes}
        expect(assigns(:device)).to eq(subject)
      end

      it 're-renders the "edit" template' do
        put :update, params: {id: subject.to_param, device: invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) { subject { create(:device_one) } }
    it 'destroys the requested device' do
      expect {
        delete :destroy, params: {id: subject.to_param}
      }.to change(Device, :count).by(-1)
    end

    it 'redirects to the mice list' do
      delete :destroy, params: {id: subject.to_param}
      expect(response).to redirect_to(devices_url)
    end
  end
end
