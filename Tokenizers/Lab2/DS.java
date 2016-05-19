package Tokenizers.Lab2;

//<DS> ::= <DL> | <DL> <DS>
public class DS {
	
	private final Tokenizer t;
	private final DL dl;
	private DS ds;
	private static final int INT = 4;
	
	public DS() {		
		t = Tokenizer.getInstance();
		dl = new DL();
	}

	public void parseDS() {
		if (INT != t.getToken())
		{	
			System.out.print("dl must start with int"); 
			System.exit(0);	
		}
		dl.parseDL();
		if(INT == t.getToken())
		{
			ds = new DS();
			ds.parseDS();
		}
	}
		
	public void printDS() {
		dl.printDL();	
	}
	
	public void execDS() {
	}
	
}
