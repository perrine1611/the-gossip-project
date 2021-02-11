class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :join_table_pm_recipients
  has_many :received_messages, through: :join_table_pm_recipients, source: :private_message 
  has_secure_password

  # ---- Validation 

   validates :first_name, presence: true, length: { minimum: 2 }
   validates :last_name, presence: true, length: { minimum: 2 }
   validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
   validates :age, presence: true
   validates :description, presence: true, length: { maximum: 500 }
   
   validates :password, presence: true, length: { minimum: 6 }

end
