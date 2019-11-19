class Request < ApplicationRecord
    belongs_to :user, optional: true
    validates :text, presence: true, length: {minimum:3 , maximum: 3000}
    
    
TYPE_OF_REQUEST = ["TYPE_1","TYPE_2","TYPE_3"]
end
