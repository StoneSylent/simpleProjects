package Tokenizers.Lab2;

//<prog> ::= program <DS> begin <SS> end
public class Prog{

	private DS ds;
	private SS ss;
	private final Tokenizer t;
	private static final int BEGIN = 2;
	private static final int END = 3;
	
	public Prog() {
		ds = new DS();
		ss = new SS();
		t = Tokenizer.getInstance();
	}
	
	public void printProg()
	{
		System.out.print("program ");
		ds.printDS();
		System.out.print("begin ");
		ss.printSS();
		System.out.print("end ");
	}
	
	public void execProg()
	{
		ds.execDS();
		ss.execSS();
	}
	
	public void parseProg()
	{
		t.skipToken(); /*program*/
		ds = new DS();
		ds.parseDS();
		if (BEGIN != t.getToken() ) { System.out.println("\nmissing begin"); System.exit(0); }
		t.skipToken(); /*begin*/
		ss = new SS();
		ss.parseSS();
		if (END != t.getToken() ) { System.out.println("\nmissing end for program"); System.exit(0); }
		t.skipToken(); /*end*/
	}
}
