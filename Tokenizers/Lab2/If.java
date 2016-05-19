package Tokenizers.Lab2;

//<IF> ::= IF <COND> then <SS> end;|IF <COND> then <SS> else <SS> end;
public class If {

	private final Tokenizer t;
	private final Cond cond;
	private final SS ss1;
	private SS ss2;
	private int altNo;
	
	private static final int THEN = 6; 
	private static final int ELSE = 7;
	private static final int END = 3;
	private static final int PREN = 12;
	
	public If() {
	 
		t = Tokenizer.getInstance();
		cond = new Cond();
		ss1 = new SS();
	}
	
	public void parseIf() {
		t.skipToken(); /*if*/
		cond.parseCond();
		if ( THEN != t.getToken() ) { System.out.println("\nexpecting then after if condition"); System.exit(0); }
		ss1.parseSS();
		if ( ELSE == t.getToken() ) {  
			altNo=1;
			t.skipToken(); /*else*/
			ss2 = new SS();
			ss2.parseSS();
		} else {
			altNo=0;
		}
			
		if ( END != t.getToken() ) { System.out.println("\nexpecting end after if conditon"); System.exit(0); }
		t.skipToken(); /*end*/
		if ( PREN != t.getToken() ) { System.out.println("\nexpecting ; after end"); System.exit(0); }
		t.skipToken(); /*;*/
	}
	
	public void printIf() {
		System.out.println("if ");
		cond.printCond();
		System.out.println("then ");
		ss1.printSS();
		if(altNo==1) {
			System.out.println("else ");
			ss2.printSS();
		}
		System.out.println("end ; ");		
	}

	public void execIf() {
		if(cond.execCond())
		{
			ss1.execSS();
		} else if(ss2 != null)
		{
			ss2.execSS();
		}	
	}
}
