class Request < ApplicationRecord
    belongs_to :user, foreign_key: :user_id
    belongs_to :staff_member, optional: true
    has_many :answers, dependent: :destroy
    validates :text, presence: true, length: {minimum:3 , maximum: 3000}
    
TYPE_OF_REQUEST = ["TYPE_1","TYPE_2","TYPE_3"]
STATUS_OF_REQUEST = ["Opened", "On hold", "Closed"]

end
