class Account < ActiveRecord::Base
    belongs_to :sort
    
    validates  :name,presence: { message: '請填寫商品名' }
    validates  :buy_price, presence: { message: '請填寫價格' }
    validates  :num , presence: { message: '請填寫數量' }
    validates  :buy_date ,presence: { message: '請填寫購買日期' }
    validates  :buy_store ,presence: { message: '請填寫購買商店' }
    validates  :sort_id,presence: { message: '請填寫購買類別' }
    # validates  :buy_price, :num ,numericality: true
    # searchable do
    #     text :name, :buy_store
    # end
    
    def self.total_on(date)
        where("date(buy_date) = ?" , date).sum(:buy_price)
    end
end