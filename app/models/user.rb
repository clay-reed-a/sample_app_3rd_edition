class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 } 
                      # a str w/ at least one word chars,
                      # pluses, hypens or periods,
                      # followed by an @ 
                      # followed by at least one latin letter, 
                      # digit 
                      # hypen or period,
                      # followed by a period 
                      # followed by latin letters 
                      # case-insensive    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    length: {maximum: 255}, uniqueness: {case_sensitive: false}
end
