package Tokenizers.Lab2;

//<DL> ::= int  <IDL>;
public class DL {
	private final Tokenizer t;
	private final IDL idl;
	private static final int SCOL = 12;
	
	public DL() {
		
		t = Tokenizer.getInstance();
		idl = new IDL();
	}
	public void parseDL() {
		
		t.skipToken(); /*int*/
		idl.parseIDL();
		if ( SCOL != t.getToken() ) 
		{ 
			System.out.println("\nmissing ; at end of dl"); 
			System.exit(0); 
		}
		t.skipToken(); /*;*/
	}
	
	
	public void printDL() {
		System.out.print("int ");
		idl.printIDL();
		System.out.println(" ;");
	}
}
