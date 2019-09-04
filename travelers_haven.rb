
def ip(x)
  p x & (x - 1) == 0
end

def ex(f, &b)
  f.readlines.each { |l| yield l if not l =~ /^\s*#/ }
end



module Enumerable
  def lp(&b)
    return self.lazy.select(&b),
        self.lazy.select { |x| not b[x] }
  end
end

class Array
  def zzz(n)
    0.step(self.size-1, n).map do |i|
      self[i, n]
    end
  end
end

class Hash
  def f()
    h = self.clone
    self.each do |k, v|
      h.merge!(h.delete(k).f) if v.is_a? Hash
    end
    h
  end
end