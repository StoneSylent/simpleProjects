package Tokenizers.Lab2;

//<COND> ::= <comp>|!<COND>|[<COND> && <COND>] | [<COND> or <COND>]
public class Cond {

	private final Tokenizer t;
	private int altNo;
	private Comp comp;
	private Cond cond1;
	private Cond cond2;
	
	private static final int AND = 18;
	private static final int EMP = 15;
	private static final int LBRC = 16;
	private static final int LPRIN = 20;
	
	public Cond() {
		 
		t = Tokenizer.getInstance();
	}
	
	public void parseCond() {
		int token = t.getToken();
		if (EMP == token) {
			altNo = 1;
			t.skipToken(); /*!*/
			cond1 = new Cond();
			cond1.parseCond();
		} else if (LBRC == token) {
			t.skipToken(); /*[*/
			cond1 = new Cond();
			cond1.parseCond();
			if (AND == t.getToken()) { 
				altNo = 2; 
			} else if (t.tokenVal("or") == t.getToken()) { 
				altNo = 3; 
			} else { 
				System.out.println("unidentified token after condition"); 
				System.exit(0); 
			}
			cond2 = new Cond();
			cond2.parseCond();
			if (t.tokenVal("]") != t.getToken()) { 
				System.out.println("\ncondition missing ]"); 
				System.exit(0); 
			}
			t.skipToken(); /*]*/
		} else if ( LPRIN == t.getToken() ) { 
			altNo = 0;
			comp = new Comp();
			comp.parseComp();
		}
	}

	public void printCond() {
		switch(altNo) {
		case 0:
			comp.printComp();
			break;
		case 1:
			System.out.print("! ");
			cond1.printCond();
			break;
		case 2:
			System.out.print("[ ");
			cond1.printCond();
			System.out.print("&& ");
			cond2.printCond();
			System.out.print("] ");
			break;
		case 3:
			System.out.print("[ ");
			cond1.printCond();
			System.out.print("or ");
			cond2.printCond();
			System.out.print("] ");
			break;
		}
		
	}
	
	public boolean execCond() {
		if(altNo == 1) {
			return !cond1.execCond();
		} else if (altNo == 2) {
			return (cond1.execCond() && cond2.execCond());
		} else if (altNo == 3) {
			return (cond1.execCond() || cond2.execCond());
		} else if (altNo == 0) {
			return comp.execComp();
		}	
		return false;
	}
}
