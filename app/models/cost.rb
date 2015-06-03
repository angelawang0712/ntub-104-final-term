class Cost < ActiveRecord::Base
    belongs_to :sort
    
    validates  :cost_name, presence: { message: '請填寫預算名稱' }
    validates  :cost_price , presence: { message: '請填寫金額量' }
    validates  :sort_id ,presence: { message: '請填寫要預算的類別' }
    validates  :start_time ,presence: { message: '請填寫開始日期' }
    validates  :end_time,presence: { message: '請填寫結束日期' }
end
