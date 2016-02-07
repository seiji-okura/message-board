class Message < ActiveRecord::Base
  #名前は必須入力かつ20文字以内
  validates :name, length:{maximum: 20 }, presence: true
  
  #内容は必須入力かつ2文字以上30文字以下
  validates :body, length:{minimum: 2, maximum: 30}, presence: true
  
  validates :age, numericality:{only_integer: true}, presence: true
  
  validate :age_validation
  
  #18歳未満はNG
  def age_validation
    if !age.nil? && age < 18
      errors[:base] << "%{year}年ROMってろ！" % {year: (18 - age)}
    end
  end
  
end
