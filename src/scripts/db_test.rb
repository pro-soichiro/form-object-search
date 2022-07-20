# frozen_string_literal: true

print 'DBのクエリ発行に関する負荷テストを実行しますか？(yes) > '

unless gets.strip == 'yes'
  puts 'キャンセルしました'
  return
end

Prefecture.transaction do
  convert_count = 0

  10000.times do |n|
    Prefecture.create(name: "#{n + 1}回目")
    convert_count = n
    puts n + 1
  end

  puts "作成数: #{convert_count + 1}件"


  print 'ロールバックしてよろしいでしょうか?(yes) > '

  if gets.strip == 'yes'
    raise ActiveRecord::Rollback
    puts 'ロールバックしました。'
  else
    puts 'データを保存しました。'
  end
end