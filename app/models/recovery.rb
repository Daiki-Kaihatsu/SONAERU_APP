# require 'active_support/core_ext/numeric/conversions'

class Recovery < ApplicationRecord

  # 1日当たりの回復者
  def recovery_difference
    # 1日あたりの回復者数
    # recovery_today = Recovery.last
    # today = recovery_today.recovery
    today = Recovery.last.recovery

    # 前日までの回復者数
    yesterday = Recovery.all
    yesterday = yesterday[-2]
    yesterday = yesterday.recovery

    # 前日比の計算
    today_num = today.to_i 
    yesterday_num = yesterday.to_i

    difference =  today_num - yesterday_num 
    # difference = difference.to_s
  end

  # カンマ区切り
  def recovery_canma
    recovery = Recovery.last
    recovery = recovery.recovery
    recovery = recovery.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse
    # recovery.delete!('.')
  end


end
