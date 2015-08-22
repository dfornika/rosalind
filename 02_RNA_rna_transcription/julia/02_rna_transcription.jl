using Match

s = ""
output = ""

s = readline(STDIN)

for i = 1:endof(s)
  @match s[i] begin
    'A' => output = string(output, "A")
    'C' => output = string(output, "C")
    'G' => output = string(output, "G")    
    'T' => output = string(output, "U")
     _  => continue
  end
end

@printf("%s", output)