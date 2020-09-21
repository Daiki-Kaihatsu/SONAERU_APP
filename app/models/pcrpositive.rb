class Pcrpositive < ApplicationRecord
  def positive_difference
    # 累計の感染者
    positive = Pcrpositive.all.sum(:positive)
    # 累計の感染者の正規表現
    positive = positive.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse
    positive = positive.chop
    positive = positive.chop
  end
end
