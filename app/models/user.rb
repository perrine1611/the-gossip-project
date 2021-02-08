class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :join_table_pm_recipients
  has_many :received_messages, through: :join_table_pm_recipients, source: :private_message 
end
