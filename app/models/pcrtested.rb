require 'active_support/core_ext/numeric/conversions'

class Pcrtested < ApplicationRecord
  def pcrtest_sum
    # 累計のPCR検査数
    pcrtest = Pcrtested.all.sum(:pcrtest)
    pcrtest = pcrtest.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse
    pcrtest = pcrtest.chop
    pcrtest = pcrtest.chop
    # pcrtest_num = pcrtest.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse
  end
end
