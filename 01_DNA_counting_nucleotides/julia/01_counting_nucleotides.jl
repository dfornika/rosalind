using Match

s = ""

count = {"a" => 0, "c" => 0, "g" => 0, "t" => 0}

s = readline(STDIN)

for i = 1:endof(s)
  @match s[i] begin
    'A' => count["a"] += 1
    'C' => count["c"] += 1
    'G' => count["g"] += 1
    'T' => count["t"] += 1
     _  => continue
  end
end

@printf("%d %d %d %d\n", count["a"], count["c"], count["g"], count["t"])