class Room < ApplicationRecord
  
  has_many :chat, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  
end
