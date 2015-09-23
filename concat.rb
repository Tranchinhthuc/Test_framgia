def bm_concat limit
  str = ""
  limit.times do
    str.concat("abcdefg")
  end
end

def bm_plus limit
  str = ""
  limit.times do
    str += "abcdefg"
  end
end

def diff t1, t2
  puts (t2-t1)
end

limit = 100000
which = "concat"

puts "LIMIT: #{limit} , WHICH: #{which}"
if which == "plus"
  t = Time.now
  bm_plus limit.to_i
  t2 = Time.now
else
  t = Time.now
  bm_concat limit.to_i
  t2 = Time.now
end

diff(t,t2)

which = "plus"

puts "LIMIT: #{limit} , WHICH: #{which}"
if which == "plus"
  t = Time.now
  bm_plus limit.to_i
  t2 = Time.now
else
  t = Time.now
  bm_concat limit.to_i
  t2 = Time.now
end

diff(t,t2)
