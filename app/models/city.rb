class City < ApplicationRecord
  has_many :users

  # ---- Validation 

   validates :zip_code, presence: true
   validates :name, presence: true, length: { in: 2..50 }
end
