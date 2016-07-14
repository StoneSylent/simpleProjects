package Tokenizers.Lab1;

public class Tokenize {
	
	public static void main(String[] args) {
		
		String inputFile = args[0];

		Tokenizer t = new Tokenizer(inputFile);
		//loop over file
		while (!t.isEOF())
		{
			//print token int values.
			System.out.print(t.getToken()+" ");
			//go to next token
			t.skipToken();
		}
	}
}

