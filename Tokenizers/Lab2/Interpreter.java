package Tokenizers.Lab2;

public class Interpreter{
	private static final int PROGRAM = 1;
	
	public static void main(String[] args) {
		String coreProgram = args[0];
		String inputData = args[1];
		//reads the core program
		Tokenizer t = Tokenizer.getInstance();
		t.init(coreProgram);
		//reads the input for 'read's
		InputReader r = InputReader.getInstance();
		r.init(inputData);
		
		if (PROGRAM != t.getToken() ) {	
			System.out.print("program expected at start of file.");
			System.exit(0);	
		}
		
		Prog program = new Prog();
		program.parseProg();
		program.printProg();
		program.execProg();	
	}
}
