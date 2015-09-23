def read_file
  line_num=0
  text=File.open('readfile.txt').read
  text.gsub!(/\r\n?/, "\n")
  array = text.each_line.map{|line| line}
end

def bfs(u, v, a, dx, dy, n, m)
  qx = Array.new(n,0)
  qy = Array.new(m,0)
  x,y,xx,yy,first,last,k = 0
  first = 0
  last = 0
  qx[first] = u
  qy[first] = v
  begin
    x = qx[first]
    y = qy[first]
    first += 1

    8.times do |i|
      xx = x + dx[i]
      yy = y + dy[i]
      if a[xx]
        if a[xx][yy]=='X'
          a[xx][yy] = '_'
          last += 1
          qx[last] = xx
          qy[last] = yy
        end
      end
    end
  end until first > last
end

def run(n, m, b, dx, dy)
  count = 0
  n.times do |x|
    m.times do |y|
      if b[x][y] == "X"
        count += 1
        b[x][y] = "_"
        bfs(x, y, b, dx, dy, n, m)
      end
    end
  end
  puts count+1
end

# Main program
dx = [-1,-1,-1,0,0,1,1,1]
dy = [-1,0,1,-1,1,-1,0,1]
b = read_file
c = b.delete(b.first).split
n = c.first.to_i
m = c.last.to_i
b = b.map{|e| e.split}
run(n,m,b,dx,dy)






