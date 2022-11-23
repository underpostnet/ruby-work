class Contact < ApplicationRecord
  belongs_to :user

  validates :full_name, presence: true
  validates :phone, presence: true, uniqueness: true
end
