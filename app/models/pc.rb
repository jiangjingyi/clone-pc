class Pc < ApplicationRecord
    #テーブルの読込
    self.table_name = 'MST_PC'
    #半角英数字と記号のみの正規表現
    VALID_REGEX =  /\A[a-zA-Z0-9!-~]+\z/.freeze
      
    validates :PC_NUM , 
               presence:{message:'を入力してください'},
               format: {
                with: VALID_REGEX, message: 'は半角英数字と記号で入力してください'
              }
    validates :PC_TYPE, 
               presence:{message:'を入力してください'},
               format: {
                with: VALID_REGEX, message: 'は半角英数字と記号で入力してください'
              }
    validates :PC_NANE, presence:{message:'を入力してください'}
    
end
