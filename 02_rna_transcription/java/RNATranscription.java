import java.util.Scanner;

public class RNATranscription {

    public static void main(String[] args) {
	String s;
	char[] s_array;
	
	Scanner stdin = new Scanner(System.in);
	
	s = stdin.nextLine();
	s_array = s.toCharArray();
	
	for (int i = 0; i < s_array.length; i++) {
	    if (s_array[i] == 'T') {
		s_array[i] = 'U';
	    }
	}
	System.out.println(s_array);
	
    }
    
}
