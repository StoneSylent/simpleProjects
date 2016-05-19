package Tokenizers.Lab2;

//<ID> ::= <LET> | <LET><ID> | <LET><INT>
public class Id {

	private static Tokenizer t;
	private static InputReader r;
	public final String name;
	public int val;
	public Boolean initialized;
	public static final Id[] eIds = new Id[20];
	public static int idCount = 0;
	
	private Id(String n)
	{
		name = n;
		initialized = false;
	}
	
	public static Id parseId() {
		 
		t = Tokenizer.getInstance();
		r = InputReader.getInstance();
		String idName = t.getStringToken();
		for(int i=0; i<idCount; i++)
		{
			if (eIds[i].name.equals(idName))
			{
				t.skipToken(); /*id*/
				return eIds[i];
			}
		}
		Id nId = new Id(idName);
		eIds[idCount] = nId;
		idCount++;
		t.skipToken(); /*id*/
		return nId;
	}
	
	public void execId() {
		if (this.initialized)
		{
			System.out.println("\n"+this.name+"="+this.val);
		} else {
			this.val = r.getToken();
			this.initialized = true;
		}
	}
	
	public void printId() {
		System.out.print(this.name+" ");
		idCount--;
	}
}
