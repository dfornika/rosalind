use std::io;

fn main() {
  
  let mut input = String::new();
  let mut output = String::new();
  
  io::stdin().read_line(&mut input)
        .ok()
        .expect("Failed to read line");

  let s = input.trim();
  
  for base in s.chars() {
    match base {
      'A' | 'C' | 'G' => output.push(base),
      'T' => output.push('U'),
       _  => continue
    }
  }
  
  println!("{}", output);
}
