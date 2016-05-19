package Tokenizers.Lab2;

//<SS> ::= <ST> | <ST> <SS>
public class SS {
	private final Tokenizer t;
	private final ST st;
	private SS ss;
	private static final int IF = 5;
	private static final int WHILE = 8;
	private static final int READ = 10;
	private static final int WRITE = 11;
	private static final int ID = 32;

	public SS() {
		
		t = Tokenizer.getInstance();
		st = new ST();
	}

	public void parseSS() {
		st.parseST();
		boolean isNxtSS = TokenisST();
		if(isNxtSS)
		{
			ss = new SS();
			ss.parseSS();
		}
	}
	
	private boolean TokenisST() {
		int next = t.getToken();
		switch(next)
		{
		case IF:
			return true;
		case WHILE:
			return true;
		case READ:
			return true;
		case WRITE:
			return true;
		case ID:
			return true;
		default:
			return false;
		}
	}

	public void execSS() {
		st.execST();
		if (ss != null)
		{
			ss.execSS();
		}	
	}
	
	public void printSS() {
		st.printST();
		if (ss != null)
		{
			ss.printSS();
		}
	}
}
