# frozen_string_literal: true

# spec/controllers/plays_controller_spec.rb

require 'rails_helper'

RSpec.describe PlaysController, type: :controller do
  # Routes
  describe 'Routes' do
    it { expect(get: '/plays/home').to route_to({ controller: 'plays', action: 'home' }) }
    it { expect(post: '/plays').to route_to({ controller: 'plays', action: 'create' }) }
    it { expect(get: '/plays/game').to route_to({ controller: 'plays', action: 'game' }) }
    it { expect(post: '/store_images').to route_to({ controller: 'plays', action: 'store_images' }) }
  end

  describe 'Return Play Image instance variable' do
    describe '#home', search: true do
      it 'Play Image instance ' do
        get :home
        expect(response.status).to be 200
      end
    end
  end

  describe 'create a play record' do
    describe '#create', search: true do
      it 'create a play record ' do
        total_play = Play.count
        post :create, params: {
          play: {
            timer_count: 5,
            image_url: 'http://localhost:3000/plays/'
          }
        }
        expect(Play.count).to be total_play+1
      end
    end
  end

  describe 'return all plays and shuffled images' do
    describe '#game', search: true do
      it 'all plays' do
        get :game
        expect(response.status).to be 200
      end
    end
  end

  describe 'Create a Play image record' do
    describe '#store_images', search: true do
      it 'Create a Play image record ' do
        file = fixture_file_upload('/test.jpg')
        total_play_image = PlayImage.count
        post :store_images, params: {
          play_image: { image: [file] }
        }
        expect(PlayImage.count).to be (total_play_image+1)
      end
    end
  end
end
