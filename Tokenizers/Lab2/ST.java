package Tokenizers.Lab2;

//<ST> ::= <ASSIGN>|<IF>|<LOOP>|<IN>|<OUT>
public class ST {

	private final Tokenizer t;
	private Assign assign;
	private If _if;
	private Loop loop;
	private In in; 
	private Out out;
	private int altNo;

	private static final int ID_TOKEN = 32;
	private static final int IF_TOKEN = 1;
	private static final int LOOP_TOKEN = 8;
	private static final int IN_TOKEN = 10;
	private static final int OUT_TOKEN = 11;

	
	public ST() {
		 
		t = Tokenizer.getInstance();
	}
	
	public void parseST() {
		int i = t.getToken();
		switch(i){
		case ID_TOKEN: //id = something
			altNo = 1;
			assign = new Assign();
			assign.parseAssign();
			break;
		case IF_TOKEN:
			altNo = 2;
			_if = new If();
			_if.parseIf();
			break;
		case LOOP_TOKEN:
			altNo = 3;
			loop = new Loop();
			loop.parseLoop();
			break;
		case IN_TOKEN: /*read*/
			altNo = 4;
			in = new In();
			in.parseIn();
			break;
		case OUT_TOKEN:
			altNo = 5;
			out = new Out();
			out.parseOut();
			break;
		}
		
	}
	
	public void printST() {
		switch(altNo) {
		case 1:
			assign.printAssign();
			break;
		case 2:
			_if.printIf();
			break;
		case 3:
			loop.printLoop();
			break;
		case 4:
			in.printIn();
			break;
		case 5:
			out.printOut();
			break;
		}
		
	}
	
	public void execST() {
		switch(altNo) {
		case 1:
			assign.execAssign();
			break;
		case 2:
			_if.execIf();
			break;
		case 3:
			loop.execLoop();
			break;
		case 4:
			in.execIn();
			break;
		case 5:
			out.execOut();
			break;
		}
		
	}
}
