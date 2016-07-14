package Tokenizers.Lab2;

//<In> ::= read <IDL>;
public class In {

	private final Tokenizer t;
	private final IDL idl;
	private static final int SCOL = 12;
	
	public In() {
	 
		t = Tokenizer.getInstance();
		idl = new IDL();
	}
	
	public void parseIn() {
		t.skipToken(); /*read*/
		idl.parseIDL();
		if (SCOL != t.getToken() ) { System.out.println("\nmissing ; at end read statement"); System.exit(0); }
		t.skipToken(); /*;*/
	}

	public void execIn() {
		idl.execIDL();
	}
	
	public void printIn() {
		System.out.print("read ");
		idl.printIDL();
		System.out.println(" ; ");
	}

}
