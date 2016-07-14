package Tokenizers.Lab2;

//<FAC> ::= <OP> | <OP> * <FAC>
public class Fac {

	private final Tokenizer t;
	private final Op op;
	private Fac fac;
	private int altNo = 0;
	private static final int MULT = 24;
	
	public Fac() {
	 
		t = Tokenizer.getInstance();
		op = new Op();
	}
	
	public void parseFac() {
		op.parseOp();
		if ( MULT == t.getToken() ){
			t.skipToken(); //*
			altNo =1;
			fac.parseFac();
		}
	}

	public int execFac() {
		return 0;
	}
	
	public void printFac() {
		op.printOp();
		if (altNo == 1)
		{
			System.out.print("* ");
			fac.printFac();
		}
	}

}
