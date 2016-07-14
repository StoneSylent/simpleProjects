package Tokenizers.Lab2;

//<comp> ::= (<OP> <COMPO> <OP>)
public class Comp {

	private final Tokenizer t;
	private final Op op1;
	private final CompO compo;
	private final Op op2;
	
	private static final int RPREN = 21; 
	
	public Comp() { 
		t = Tokenizer.getInstance();
		op1 = new Op();
		compo = new CompO();
		op2 = new Op();
	}
	
	public void parseComp() {
		t.skipToken(); /*(*/
		op1.parseOp();
		compo.parseComp0();
		op2.parseOp();
		if ( RPREN != t.getToken() ) { System.out.println("\nmissing ) in comp"); System.exit(0); }
		t.skipToken(); /*)*/
	}
	
	public void printComp() {
		System.out.print("( ");
		op1.printOp();
		compo.printComp0();
		op2.printOp();
		System.out.print(") ");
	}
	
	public boolean execComp() {
		String action = compo.execComp0();
		switch (action) {
			case "!=":
				return (op1.execOp() != op2.execOp());
			case "==":
				return (op1.execOp() == op2.execOp());
			case "<":
				return (op1.execOp() < op2.execOp());
			case ">":
				return (op1.execOp() > op2.execOp());
			case "<=":
				return (op1.execOp() <= op2.execOp());
			case ">=":
				return (op1.execOp() >= op2.execOp());
		}
		 return false;
	}
	
	

}
