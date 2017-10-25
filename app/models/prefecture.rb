class Prefecture < ApplicationRecord
  has_many :communities, dependent: :destroy
end
