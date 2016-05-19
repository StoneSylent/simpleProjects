package Tokenizers.Lab2;

//<EXP> ::= <FAC>|<FAC>+<EXP>|<FAC>-<EXP>
public class Exp {

	private final Tokenizer t;
	private Exp exp;
	private final Fac fac;
	private int altNo = 0;
	private static final int MINUS = 23;
	private static final int PLUS = 22;
	
	public Exp() { 
		t = Tokenizer.getInstance();
		fac = new Fac(); 
	}
	
	public void parseExp() {
		fac.parseFac();
		if (PLUS == t.getToken()) { 
			altNo = 2;
		} else if (MINUS == t.getToken()) {
			altNo = 3;
		}
		if (altNo != 0)
		{
			t.skipToken(); /*+or-*/
			exp = new Exp();
			exp.parseExp();
		}
	}
	
	public void printExp() {
		fac.printFac();
		if (altNo == 0) {
			return;
		} else if (altNo == 2) {
			System.out.print("+ ");
		} else if (altNo == 3) {
			System.out.print("- ");
		}
		exp.printExp();
	}
	
	public int execExp() {
		if (altNo == 0) {
			return fac.execFac();
		} else if (altNo == 2) {
			return (fac.execFac() + exp.execExp());
		} else if (altNo == 3) {
			return (fac.execFac() - exp.execExp());
		}
		return 0;
	}
	
}
