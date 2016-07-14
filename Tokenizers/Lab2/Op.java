package Tokenizers.Lab2;

//<OP> ::= <INT> | <ID> | (<EXP>)
public class Op {

	private final Tokenizer t;
	private Int _int;
	private Id id;
	private Exp exp;
	private int altNo;
	private static final int RPRIN = 21;
	
	public Op() {
	 
		t = Tokenizer.getInstance();
	}
	
	public void parseOp() {
		int i = t.getToken();
		switch (i){
		case 31:
			altNo = 1;
			_int = new Int();
			_int.parseInt();
			break;
		case 32:
			altNo = 2;
			id = Id.parseId();
			break;
		case 20:
			altNo = 3;
			t.skipToken(); /*(*/
			exp = new Exp();
			exp.parseExp();
			if ( RPRIN != t.getToken() ) { System.out.println("\nmissing ) at end of expression"); System.exit(0); }
			t.skipToken(); /*)*/
			break;
		default:
			System.out.println("not a valid op format"); 
			System.exit(0);
		}
		
	}
	
	public void printOp() {
		switch(altNo){
		case 1:
			_int.printInt();
			break;
		case 2:
			id.printId();
			break;
		case 3:
			System.out.print("( ");
			exp.printExp();
			System.out.print(") ");
			break;
		}	
	}

	public int execOp() {
		switch(altNo){
		case 1:
			return _int.execInt();
		case 2:
			return id.val;
		case 3:
			return exp.execExp();	
		}
		return 0;
	}
}
