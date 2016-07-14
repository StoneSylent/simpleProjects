package Tokenizers.Lab2;

//<LOOP> ::= while <COND> loop <SS> end;
public class Loop {

	private final Tokenizer t;
	private final Cond cond;
	private final SS ss;
	private static final int LOOP = 9;
	private static final int END = 3;
	private static final int SCOL = 12;
	
	public Loop() {
		t = Tokenizer.getInstance();
		cond = new Cond();
		ss = new SS();
	}
	
	public void parseLoop() {
		t.skipToken(); /*while*/
		cond.parseCond();
		if (LOOP != t.getToken() ) { System.out.println("\nmissing loop in while"); System.exit(0); }
		t.skipToken(); /*loop*/
		ss.parseSS();
		if (END != t.getToken() ) { System.out.println("\nmissing end for while loop"); System.exit(0); }
		t.skipToken();/*end*/
		if (SCOL != t.getToken() ) { System.out.println("\nmissing ; after end while"); System.exit(0); }
		t.skipToken();/*;*/
	}
	
	public void printLoop() {
		System.out.print("while ");
		cond.printCond();
		System.out.println("loop ");
		ss.printSS();
		System.out.println("end ; ");	
	}
	
	public void execLoop() {
		while (cond.execCond())
		{
			ss.execSS();
		}
	}
	
	

}
