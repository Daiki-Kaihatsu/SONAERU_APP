# 陽性者数のcsvファイルを取得

require 'open-uri'
# ダウンロード先のパスを指定
@path = 'https://www.mhlw.go.jp/content/pcr_positive_daily.csv'

# filename の一番後ろのスラッシュに続く要素を返します。
# ここではpcr_positive_daily.csvを取得
fileName = File.basename(@path)

open(fileName, 'wb') do |output|     #※１
  open(@path) do |data|
    output.write(data.read)          #※２
  end
end