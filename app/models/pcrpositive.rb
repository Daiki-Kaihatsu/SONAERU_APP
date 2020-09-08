# class Pcrpositive < ApplicationRecord
#   def positive_difference
#     # 今日の陽性者数
#     today = Pcrpositive.last
#     today_num = today.positive

#     # 機能の陽性者数
#     yesterday = Pcrpositive.all
#     yesterday = yesterday[-2]
#     yesterday_num = yesterday.positive
#     binding.pry

#   end
# end

class Pcrpositive < ApplicationRecord
  def positive_difference
    # 累計の感染者
    positive = Pcrpositive.all.sum(:positive)
    positive_num = positive.to_i
  end
end
