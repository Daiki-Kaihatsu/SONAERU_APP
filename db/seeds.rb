require "csv"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テスト用のユーザー
# 50.times do |n|
#   User.create(
#     email: "test#{n + 1}@example.com",
#     name: "テスト太郎#{n + 1}",
#     password: "foobar",
#     password_confirmation: "foobar"
#   )
# end

# タグ
# Tag.create([
#   {name:'地震'},
#   {name:'津波'},
#   {name:'台風'},
#   {name:'火災'},
#   {name:'備え'},
#   {name:'予防'},
#   {name:'噴火'},
#   {name:'災害対策'},
#   {name:'準備'},
#   {name:'感染症'},
#   {name:'自宅'}
# ])


# --------陽性者数------------
# # 陽性者数のcsvデータ 初期投入
# CSV.foreach('config/csv/pcr_positive_daily.csv', headers: true) do |row|
#   Pcrpositive.create!(
#     :day => row[0],
#     :positive => row[1],
#   )
# end


# lead = CSV.read('config/csv/pcr_positive_daily.csv')
# lead.lastで最後の要素の取得はできる
lead = CSV.read('config/csv/pcr_positive_daily.csv')
lead_last = lead.last 
Pcrpositive.create!(
  :day => lead_last[0],
  :positive => lead_last[1],
  )


# --------PCR検査数------------
# # PCR検査数のcsvデータ 初期投入
# CSV.foreach('config/csv/pcr_tested_daily.csv', headers: true) do |row|
#   Pcrtested.create!(
#     :day => row[0],
#     :pcrtest => row[1],
#   )
# end

# lead = CSV.read('config/csv/pcr_tested_daily.csv')
# lead.lastで最後の要素の取得はできる
lead = CSV.read('config/csv/pcr_tested_daily.csv')
lead_last = lead.last 
Pcrtested.create!(
  :day => lead_last[0],
  :pcrtest => lead_last[1],
  )


  # --------回復者数------------
# # 回復者数のcsvデータ 初期投入
# CSV.foreach('config/csv/recovery_total.csv', headers: true) do |row|
#   Recovery.create!(
#     :day => row[0],
#     :recovery => row[1],
#   )
# end

# lead = CSV.read('config/csv/recovery_total.csv')
# lead.lastで最後の要素の取得はできる
lead = CSV.read('config/csv/recovery_total.csv')
lead_last = lead.last 
Recovery.create!(
  :day => lead_last[0],
  :recovery => lead_last[1],
  )
