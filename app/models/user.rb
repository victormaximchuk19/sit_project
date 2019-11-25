class User < ApplicationRecord
    has_many :requests
    validates :name, presence: true, length: {maximum: 50}
    
    before_save :downcase_email
    VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
    validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
                    
    private
                    
    def downcase_email
      self.email = email.downcase  
    end
    
    
end
