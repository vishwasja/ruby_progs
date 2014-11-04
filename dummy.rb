class Hash
  undef []
  def method_missing( symbol, *args )
    p args
  end
end


h = {a: 1, b: 2}
p h[:a]
