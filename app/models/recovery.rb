require 'active_support/core_ext/numeric/conversions'

class Recovery < ApplicationRecord
  def recovery_difference
    # 1日あたりの回復者数
    recovery_today = Recovery.last
    today = recovery_today.recovery

    # 前日までの回復者数
    yesterday = Recovery.all
    yesterday = yesterday[-2]
    yesterday = yesterday.recovery

    # 前日比の計算
    today_num = today.to_i 
    yesterday_num = yesterday.to_i

    difference =  today_num - yesterday_num 
    difference = difference.to_s
  end
end
