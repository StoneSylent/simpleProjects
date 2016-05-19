package Tokenizers.Lab2;

//<IDL> ::= <ID> | <ID>, <IDL>
public class IDL {

	private final Tokenizer t;
	private Id id;
	private IDL idl;
	private static final int COM = 13;
	private int idCount =0;
	
	public IDL() {
		 
		t = Tokenizer.getInstance();
	}
	
	public void parseIDL() {
		id = Id.parseId();
		idCount++;
		if( COM == t.getToken() ) {
			t.skipToken(); /*,*/
			idl = new IDL();
			idl.parseIDL();
		}
	}

	public void execIDL() {
		id.execId();
		if(idl != null)
		{
			idl.execIDL();
		}	
	}
	
	public void printIDL() {
		id.printId();	
		if(idl != null)
		{
			System.out.print(", ");
			idl.printIDL();
		}
	}
}
