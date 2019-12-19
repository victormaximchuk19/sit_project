class Answer < ApplicationRecord
    belongs_to :request, foreign_key: :request_id
    validates :answer_text, presence: :true
end
