class ChartsController < ApplicationController
  def index
    # 陽性者
    gon.positive = []
    gon.positive << Pcrpositive.pluck(:positive)

    gon.positive_day = []
    gon.positive_day << Pcrpositive.pluck(:day)
    

    # PCR検査数
    gon.pcrtest = []
    gon.pcrtest << Pcrtested.pluck(:pcrtest)

    gon.pcrtested_day = []
    gon.pcrtested_day << Pcrtested.pluck(:day)


    # 回復者数
    gon.recovery = []
    gon.recovery << Recovery.pluck(:recovery)

    gon.recoveryed_day = []
    gon.recoveryed_day << Recovery.pluck(:day)

    @positive = Pcrpositive.last
    @pcrtest =  Pcrtested.last
    @recovery = Recovery.last
    wd = ["日", "月", "火", "水", "木", "金", "土"]
    # time = Time.now
    # @time = time.strftime("%m/%d(#{wd[time.wday]})")
    time = @positive.day
    @time = time.to_s.gsub(/-/,"/")
  end
end