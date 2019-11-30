class Answer < ApplicationRecord
    belongs_to :request, optional: true
end
