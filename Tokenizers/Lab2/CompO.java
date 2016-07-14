package Tokenizers.Lab2;

//<COMPO> ::= != | == | < | > | <= | >=
public class CompO {

	private final Tokenizer t;
	private int compo;
	
	public CompO() {
		t = Tokenizer.getInstance();
	}
	
	public void parseComp0() {
		//assign compo to which to print
		compo = t.getToken();
		t.skipToken();
	}
	
	public void printComp0() {
		switch(compo)
		{
		 case 14:
			 System.out.print("= ");
			break;
		 case 25:
			 System.out.print("!= ");
			break;
		 case 26:
			 System.out.print("== ");
			break;
		 case 27:
			 System.out.print("< ");
			break;
		 case 28:
			 System.out.print("> ");
			break;
		 case 29:
			 System.out.print("<= ");
			break;
		 case 30:
			 System.out.print(">= ");
			break;
		}
	}

	public String execComp0() {
		switch(compo)
		{
		 case 14:
			 return "=";
		 case 25:
			 return "!=";
		 case 26:
			 return "==";
		 case 27:
			 return "<";
		 case 28:
			 return ">";
		 case 29:
			 return "<=";
		 case 30:
			 return ">=";
		}		
		return null;
	}
}
