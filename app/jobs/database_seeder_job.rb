class DatabaseSeederJob < ApplicationJob
    queue_as :default

    def perform
      ActiveRecord::Base.transaction do
      #  create_items
      end
    end

    private

    # def create_items
    #   10.times do |i|
    #     Item.create!(
    #       name: "Camperita piola",
    #       description: "Campera con capucha bobo",
    #       price: 50.00,
    #     )
    #   end
    # end

  end