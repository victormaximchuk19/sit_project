class Answer < ApplicationRecord
    belongs_to :request, foreign_key: :request_id
end
