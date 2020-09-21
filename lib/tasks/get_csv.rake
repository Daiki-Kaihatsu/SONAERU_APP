namespace :get_csv do
  desc "厚生労働省のサイトからcsvファイルを取得するタスク"
  require 'open-uri'
  task csv_scraping: :environment do

      # ダウンロード先のパスを指定
@positive = 'https://www.mhlw.go.jp/content/pcr_positive_daily.csv'
@pcrtest = 'https://www.mhlw.go.jp/content/pcr_tested_daily.csv'
@recovery = 'https://www.mhlw.go.jp/content/recovery_total.csv'


# filename の一番後ろのスラッシュに続く要素を返します。
# 陽性者数データを取得
positived = File.basename(@positive)

open(positived, 'wb') do |output|     #※１
  open(@positive) do |data|
    output.write(data.read)          #※２
  end
end

# PCR検査数データの取得
pcrtested = File.basename(@pcrtest)

open(pcrtested, 'wb') do |output|     #※１
  open(@pcrtest) do |data|
    output.write(data.read)          #※２
  end
end

# 回復者数データの取得
recoveried = File.basename(@recovery)

open(recoveried, 'wb') do |output|     #※１
  open(@recovery) do |data|
    output.write(data.read)          #※２
  end
end

# 取得したcsvファイルを移動
FileUtils.mv('pcr_positive_daily.csv','config/csv')
FileUtils.mv('pcr_tested_daily.csv','config/csv')
FileUtils.mv('recovery_total.csv','config/csv')
end
end