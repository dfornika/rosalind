use std::io;

struct BaseCount {
  a: i32,
  c: i32,
  g: i32,
  t: i32
}

fn main() {
  
  let mut s = String::new();
  let mut count = BaseCount{a: 0, c: 0, g: 0, t: 0};
  
  io::stdin().read_line(&mut s)
        .ok()
        .expect("Failed to read line");

  for base in s.chars() {
    match base {
      'A' => count.a += 1,
      'C' => count.c += 1,
      'G' => count.g += 1,
      'T' => count.t += 1,
      _ => continue,
    }
  }

  println!("{} {} {} {}", count.a, count.c, count.g, count.t);
}
