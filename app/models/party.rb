class Party < ApplicationRecord
  attr_accessor :movie
  has_many :user_parties
  has_many :users, through: :user_parties
  validate :proper_party_duration

  private

  def proper_party_duration
    self.duration >= movie.runtime
  end
end