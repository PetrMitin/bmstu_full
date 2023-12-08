class Result < ApplicationRecord
  validates :n, uniqueness: { scope: :m }
end
