class Account < ApplicationRecord
  include Rodauth::Model(RodauthMain)
  has_many :exercises
  has_one :profile
  enum :status, unverified: 1, verified: 2, closed: 3
end
