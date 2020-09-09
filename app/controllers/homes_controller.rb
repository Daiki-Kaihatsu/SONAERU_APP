class HomesController < ApplicationController
  def index
    @positive = Pcrpositive.last
    @pcrtest =  Pcrtested.last
    @recovery = Recovery.last
    wd = ["日", "月", "火", "水", "木", "金", "土"]
    time = Time.now
    @time = time.strftime("%Y/%m/%d(#{wd[time.wday]})")
  end
end
