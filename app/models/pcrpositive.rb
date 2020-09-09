class Pcrpositive < ApplicationRecord
  def positive_difference
    # 累計の感染者
    positive = Pcrpositive.all.sum(:positive)
    positive_num = positive.to_i
  end
end
