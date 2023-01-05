# 誕生日の曜日と経過日数を算出するアルゴリズム
class Calc

  puts "今の曜日を月曜〜日曜で入力してください"
  dayOfWeek = gets

  while dayOfWeek.is_a? String || (dayOfWeek < 1 && dayOfWeek >8)
    if dayOfWeek.include?("日曜")
      dayOfWeek = 1
    elsif dayOfWeek.include?("月曜")
      dayOfWeek = 2
    elsif dayOfWeek.include?("火曜")
      dayOfWeek = 3
    elsif dayOfWeek.include?("水曜")
      dayOfWeek = 4
    elsif dayOfWeek.include?("木曜")
      dayOfWeek = 5
    elsif dayOfWeek.include?("金曜")
      dayOfWeek = 6
    elsif dayOfWeek.include?("土曜")
      dayOfWeek = 7
    else
      puts "月曜〜日曜で入力してください"
      dayOfWeek = gets
    end
  end

  week = {1 => "日曜日", 2 => "月曜日", 3 => "火曜日", 4 => "水曜日", 5 => "木曜日", 6 => "金曜日", 7 => "土曜日"}

  puts "今の年を西暦で入力してください（年は不要）"
  thisYear = gets
  thisYear = thisYear.to_i

  while thisYear < 1900
    puts "1900年以前は入力できません"
    puts "今の年を西暦で入力してください（数値のみ入力）"
    thisYear = gets
    thisYear = thisYear.to_i
  end

  puts "今の月を1〜12で入力してください（月は不要）"
  thisMonth = gets
  thisMonth = thisMonth.to_i

  while thisMonth < 1 || thisMonth > 12
    puts "1〜12で入力してください"
    thisMonth = gets
    thisMonth = thisMonth.to_i
  end

  puts "今の日付を数値で入力してください(日は不要)"
  today = gets
  today = today.to_i

  numOfDays = { 1=>31, 2=>28, 3=>31, 4=>30, 5=>31, 6=>30, 7=>31, 8=>31, 9=>30, 10=>31, 11=>30, 12=>31}
  numOfDays[1]

  while today < 1 || today > numOfDays[thisMonth]
    puts "1~" + numOfDays[thisMonth].to_s + "で入力してください"
    today = gets
    today = today.to_i
  end

  puts "誕生年を西暦で入力してください（年は不要）"
  birthYear = gets
  birthYear = birthYear.to_i

  while birthYear < 1900 || birthYear > thisYear
    puts "1900年以前または未来は入力できません"
    puts "誕生年を西暦で入力してください（数値のみ入力）"
    birthYear = gets
    birthYear = birthYear.to_i
  end

  puts "誕生月を1~12で入力してください（月は不要）"
  birthMonth = gets
  birthMonth = birthMonth.to_i

  while birthMonth < 1 || birthMonth > 12 || (birthYear >= thisYear && birthMonth > thisMonth)
    puts "1〜12で入力してください(未来は不可)"
    birthMonth = gets
    birthMonth = birthMonth.to_i
  end

  puts "誕生日を数値で入力してください(日は不要)"
  birthDay = gets
  birthDay = birthDay.to_i

  while birthDay < 1 || birthDay > numOfDays[birthMonth] || (birthYear >= thisYear && birthMonth >= thisMonth && birthDay > today)
    puts "1~" + numOfDays[birthMonth].to_s + "で入力してください(未来は不可)"
    birthDay = gets
    birthDay = birthDay.to_i
  end

  puts "今日は" + "#{thisYear}年" + "#{thisMonth}月" + "#{today}日" + week[dayOfWeek].to_s + "です"
  puts "生年月日は" + "#{birthYear}年" + "#{birthMonth}月" + "#{birthDay}日"

  sumOfDays = 0

  # 現在の年＝誕生年でない
  if birthYear != thisYear
    # 誕生年から現在の1年前までの経過日数
    for year in birthYear..(thisYear-1) do
      # 閏年
      if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
        sumOfDays = sumOfDays + 366
      # 閏年でない
      else
        sumOfDays = sumOfDays + 365
      end
    end

    # 現在の月＝1
    if thisMonth == 1
       #現在の年の経過日数
       thisYearPastDays = today
    elsif thisMonth >=3 && ((thisYear % 4 == 0 && thisYear % 100 != 0) || thisYear % 400 == 0)
      thisYearPastDays = today + 1
      for month in 1..(thisMonth-1) do
        thisYearPastDays = thisYearPastDays + numOfDays[month]
      end
    else
      thisYearPastDays = today
      for month in 1..(thisMonth-1) do
        thisYearPastDays = thisYearPastDays + numOfDays[month]
      end
    end
    # 誕生月＝1
    if birthMonth == 1
      # 誕生年の経過日数
      birthYearPastDays = birthDay
    elsif birthMonth >=3 && ((birthYear % 4 == 0 && birthYear % 100 != 0) || birthYear % 400 == 0)
      birthYearPastDays = birthDay + 1
      for month in 1..(thisMonth-1) do
        birthYearPastDays = birthYearPastDays + numOfDays[month]
      end
    else
      birthYearPastDays = birthDay
      for month in 1..(birthMonth-1) do
        birthYearPastDays = birthYearPastDays + numOfDays[month]
      end
    end

    sumOfDays = sumOfDays -birthYearPastDays + thisYearPastDays

  #現在の年＝誕生年
  else

    # 現在の月＝1
    if thisMonth == 1
       #現在の年の経過日数
       thisYearPastDays = today
    elsif thisMonth >=3 && ((thisYear % 4 == 0 && thisYear % 100 != 0) || thisYear % 400 == 0)
      thisYearPastDays = today + 1
      for month in 1..(thisMonth-1) do
        thisYearPastDays = thisYearPastDays + numOfDays[month]
      end
    else
      thisYearPastDays = today
      for month in 1..(thisMonth-1) do
        thisYearPastDays = thisYearPastDays + numOfDays[month]
      end
    end
    # 誕生月＝1
    if birthMonth == 1
      # 誕生年の経過日数
      birthYearPastDays = birthDay
    elsif birthMonth >=3 && ((birthYear % 4 == 0 && birthYear % 100 != 0) || birthYear % 400 == 0)
      birthYearPastDays = birthDay + 1
      for month in 1..(thisMonth-1) do
        birthYearPastDays = birthYearPastDays + numOfDays[month]
      end
    else
      birthYearPastDays = birthDay
      for month in 1..(birthMonth-1) do
        birthYearPastDays = birthYearPastDays + numOfDays[month]
      end
    end

    sumOfDays = -birthYearPastDays + thisYearPastDays
  end

  birthdayOfWeek = (sumOfDays % 7)
  if sumOfDays % 7 == 0
    birthdayOfWeek = 1
  end
  puts "誕生から現在までの通算日数は" + sumOfDays.to_s + "日、誕生日の曜日は" + week[birthdayOfWeek].to_s + "です"
  
end