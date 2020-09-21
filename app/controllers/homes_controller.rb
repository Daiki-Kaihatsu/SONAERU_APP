class HomesController < ApplicationController
  def index
    @positive = Pcrpositive.last
    @pcrtest =  Pcrtested.last
    @recovery = Recovery.last
    # recovery = recovery.recovery
    
    wd = ["日", "月", "火", "水", "木", "金", "土"]
    time = Time.now
    time = time.ago(2.days)
    @time = time.strftime("%Y/%m/%d(#{wd[time.wday]})")
    # time = @positive.day
    # @time = time.to_s.gsub(/-/,"/")
  end
end