package Tokenizers.Lab2;

//<INT> ::= <DIG> | <DIG><INT>
public class Int {

	private final Tokenizer t;
	private String number;

	public Int() {
		t = Tokenizer.getInstance();
	}
	
	public void parseInt() {
		number = t.getStringToken();
		t.skipToken(); /*dig*/
	}

	public int execInt() {
		return 0;
	}
	
	public void printInt() {
		System.out.print(number+" ");
	}

}
