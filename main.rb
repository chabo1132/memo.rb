require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"
memo_type = gets.to_i

if memo_type == 1 
  p "拡張子を除いたファイル名を入力してください"
  memo_name = gets.chomp
  p "メモしたい内容を記入してください"
  p "入力完了したらctrl + D"
  memo_contents = readlines
  CSV.open("#{memo_name}.csv", "w") do |row|
    row << memo_contents
  end
  p memo_name + "が作成されました"

elsif memo_type == 2
  p "csvファイル一覧"
  Dir.foreach('.') do |item|
    next if item == '.' or item == '..'
      if(item.slice(-3,3) == "csv") then
        puts item
      end
  end
  p "編集したいファイル名を拡張子をのぞいて入力してください"
  memo_name = gets.chomp
  if File.exists?("#{memo_name}.csv")
    p "ファイル名: #{memo_name}.csv"
    p "メモの内容"
    CSV.foreach("#{memo_name}.csv") do |row|
      p row
    end
      p "メモしたい内容を追記してください"
      p "入力完了したらctrl + D"
      memo_contents = readlines
      CSV.open("#{memo_name}.csv", "a") do |row|
        row << memo_contents
      end
      p memo_name + "が編集されました"
    else
      p "最初からやり直してください"
  end
else
  p "ruby main.rbを再度入力して半角英数で1or2を入力してください"
end