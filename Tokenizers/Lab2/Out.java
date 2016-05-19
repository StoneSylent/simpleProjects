package Tokenizers.Lab2;

//<out> ::= write <IDL>;
public class Out {

	private final Tokenizer t;
	private final IDL idl;
	private static final int SCOL = 12;
	
	public Out() {
	 
		t = Tokenizer.getInstance();
		idl = new IDL();
	}
	
	public void parseOut() {
		t.skipToken(); /* write */
		idl.parseIDL();
		if (SCOL != t.getToken() ) { System.out.println("\nmissing ; for end of write"); System.exit(0); }
		t.skipToken(); /*;*/
	}

	public void printOut() {
		System.out.print("write ");
		idl.printIDL();
		System.out.println("; ");
	}
	
	public void execOut() {
		idl.execIDL();
	}
}
