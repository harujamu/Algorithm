# 二重ループ

def keisan
  s = 0
  i = 1
  while i < 10
    p = 0
    j = 1
    
  
    while j <= 3
      p = p + j * i
      j = j + 1
    end
    
    s = s + p
    i = i + 1
    
  end
  return s
end

