import java.util.Scanner;
import java.util.Hashtable;



public class CountingNucleotides {
    private static class BaseCount {
	public int a;
	public int c;
	public int g;
	public int t;

	public BaseCount( int a, int c, int g, int t){
	    this.a = a;
	    this.c = c;
	    this.g = g;
	    this.t = t;
	}
    }

    public static void main(String[] args) {
	String s;
	Scanner stdin = new Scanner(System.in);
	BaseCount count = new BaseCount(0, 0, 0, 0);
	
	s = stdin.nextLine();

	for (char base : s.toCharArray()) {
	    switch (base) {
	    case 'A': count.a++;
		break;
	    case 'C': count.c++;
		break;
	    case 'G': count.g++;
		break;
	    case 'T': count.t++;
		break;
	    }
	}
	
	System.out.format("%d %d %d %d\n", count.a, count.c, count.g, count.t);
    }
    
}
