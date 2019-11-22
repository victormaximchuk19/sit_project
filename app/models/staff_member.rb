class StaffMember < ApplicationRecord
  validates :name, presence: true, uniqueness: {scope: :name}
  validates :password_digest, :presence => true,
                       :length => {:within => 6..40}
                       
end
