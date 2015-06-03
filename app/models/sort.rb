class Sort < ActiveRecord::Base
    has_many :accounts
    has_many :costs
    
    validates  :title,presence: { message: '請填寫類別' }
end
