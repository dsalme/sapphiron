require 'rails_helper'

RSpec.describe MovementPatternsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/movement_patterns').to route_to('movement_patterns#index')
    end

    it 'routes to #new' do
      expect(get: '/movement_patterns/new').to route_to('movement_patterns#new')
    end

    it 'routes to #show' do
      expect(get: '/movement_patterns/1').to route_to('movement_patterns#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/movement_patterns/1/edit').to route_to('movement_patterns#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/movement_patterns').to route_to('movement_patterns#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/movement_patterns/1').to route_to('movement_patterns#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/movement_patterns/1').to route_to('movement_patterns#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/movement_patterns/1').to route_to('movement_patterns#destroy', id: '1')
    end
  end
end
