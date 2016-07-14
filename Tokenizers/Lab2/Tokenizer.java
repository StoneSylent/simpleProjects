package Tokenizers.Lab2;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Scanner;

/*
 * Author: Brandon Stone
 */
public class Tokenizer {

	private static Tokenizer instance = null;
	//scanner used to read file.
	private static Scanner s;
	//latest line to be read from file
	private static String line = ""; //line==null -> EOF
	//latest token found
	private static String token = null;
	//latest character type
	private static String tType = null;
	//Constants for intVal()
	private final static int INTEGER = 31;
	private final static int IDENTIFIER = 32;
	private final static int NOTOKENFOUND = -1;
	//Map used to store intVal()s
	private static final Map<String,Integer> core = new HashMap<String,Integer>(30);
	
	/*
	 * Load intVal based on Core Language
	 */
	private void LoadCoreValues()
	{
		String[] reservedWords = 	{"program","begin","end","int","if","then","else","while","loop","read","write"};
		String[] specialSymbols = {";",",","=","!","[","]","&&","||","(",")","+","-","*","!=","==","<",">","<=",">="};
		
		//Assign mapping starting at a value of 1 for reserved words
		for (int i=0;i<reservedWords.length;i++)
		{
			core.put(reservedWords[i], i+1);
		}
		//Assign mapping for special symbols
		for (int i=0; i<specialSymbols.length; i++)
		{	
			core.put(specialSymbols[i], reservedWords.length + i+1 );
		}
	}
	
	protected Tokenizer()
	{
		//instantiation end
	}
	public static Tokenizer getInstance()
	{
		if (instance == null) {
			instance = new Tokenizer();
		}
		return instance;	
	}
	
	/*
	 * Constructor for Tokenizer class
	 * requires inputfile to tokenize
	 */
	public void init(String inputFile) 
	{		
		if (instance != null)
		{
			try {
				s = new Scanner(new FileReader(inputFile));
			} catch (FileNotFoundException e) {
				System.out.println("\nnot a valid inputFile");
			}
			//load mapping of reserved words and special symbols
			LoadCoreValues();
			instance = new Tokenizer();
		}
	}
	
	/*
	* requires a token to exist in the program
	* ensures no leading whitespace in line
	* returns current token.
	*/
	public int getToken() {
		//previous token remembered?
		if (token != null)
		{	
			return tokenVal(); 
		}
		else //need a new token.
		{
			//get position of next token
			int tokenStart = findTokenStart();
			//remove leading whitespace
			line = line.substring(tokenStart);
			//create char[] representation of line
			char[] characters = line.toCharArray();
			//get type of token
			tType = getType(characters[0]);
			if (Objects.equals(tType, "lowercase"))
			{
				token = getLowerToken(characters);
			}
			else if (Objects.equals(tType, "uppercase"))
			{
				token = getIdentifierToken(characters);
			}
			else if (Objects.equals(tType, "int"))
			{
				token = getIntToken(characters);
			}
			else if (Objects.equals(tType, "special"))
			{
				token = getSpecialToken(characters);
			}
			else 
			{
				System.out.println("Error this should not be seen");
				System.exit(0);
			}
			//token was found ok.
			return tokenVal();
		}
	}
	
	/*
	 *  returns the string value of getToken();
	 */
	public String getStringToken()
	{
		getToken();
		return token;
	}
	
	
	/*
	* returns a valid token
	* requires characters[0] to be of type lowercase
	*/
	private String getLowerToken(char[] characters) 
	{
		//current token to be returned.
		String currentToken = "";
		
		//look at each character
		for (char ch: characters)
		{
			//check if whitespace
			boolean ws = Character.isWhitespace(ch);
			//check type
			String type = getType(ch);
			//check if token is valid
			boolean currIsValid = core.containsKey(currentToken);
			
			//not whitespace and new ch is lowercase.
			if (!ws && Objects.equals(type, "lowercase"))
			{
				currentToken = currentToken.concat(String.valueOf(ch));
			}
			//not whitespace and special ch, token found, must be valid token
			else if (!ws && Objects.equals(type, "special") && currIsValid )
			{
				return currentToken;
			}
			//whitespace found, and token is a valid token
			else if ( ws  && currIsValid )
			{
				return currentToken;
			}
			else if ( ws )// token was not valid 
			{
				System.out.println("\n"+currentToken+"is not a valid reserved word!");
				System.exit(0);
			}
			else 
			{
				System.out.println("\n lower: "+currentToken+ch+": does not have a valid ending");
				System.exit(0);
			}
		}
		//ran out of tokens to process (end of line)
		return currentToken;
	}

	private String getIdentifierToken(char[] characters) 
	{
		//current token to be returned.
		String currentToken = "";
		//pos of current character
		int i;
		//look at each character
		for (i=0; i<characters.length; i++)
		{
			//working with char ch
			char ch = characters[i];
			//check if whitespace
			boolean ws = Character.isWhitespace(ch);
			//check type
			String type = getType(ch);

			if ( !ws && Objects.equals(type, "uppercase"))
			{
				currentToken = currentToken.concat(String.valueOf(ch));
			}
			//not whitespace and special ch, token found, must be valid token
			else if ( !ws && Objects.equals(type, "special"))
			{
				return currentToken;
			}
			//whitespace found
			else if ( ws )
			{
				return currentToken;
			}
			else if (Objects.equals(type, "int"))
			{
				currentToken = currentToken.concat(String.valueOf(ch));
			}
			else
			{
				System.out.println("\n"+"not a valid identifier!");
				System.exit(0);
			}
		}
		//ran out of tokens to process (end of line)
		return currentToken;
	}

	private String getSpecialToken(char[] characters) 
	{
		//current token to be returned.
		String currentToken = "";
		//pos of current character
		int i;
		//look at each character
		for (i=0; i<characters.length; i++)
		{
			//working with char ch
			char ch = characters[i];
			//check if whitespace
			boolean ws = Character.isWhitespace(ch);
			//check type
			String type = getType(ch);
			//check if token is in core
			boolean isCore = core.containsKey(currentToken+ch);
			
			//not whitespace and new ch is an integer.
			if (!ws && Objects.equals(type, "special"))
			{
				//check if next character makes currentToken also special
				if ( i+1 < characters.length && core.containsKey(currentToken+ch+characters[i+1]) )
				{
					currentToken = currentToken.concat(String.valueOf(ch));
				}
				else if ( isCore ) //token is in core but token.concant(ch) is not!
				{
					currentToken = currentToken.concat(String.valueOf(ch));
					return currentToken;
				}
				else //not a real special character
				{
					//shouldn't ever see this.
					System.out.println("\n"+ch+" is not a valid symbol");
					System.exit(0);
				}
			}
			//not whitespace and special ch
			else if ( ws )
			{
				return currentToken;
			}
			else //not whitespace, not special token, not valid special
			{
				System.out.println("\n"+currentToken+ch+" is not a valid token!");
				System.exit(0);
			}
		}
		//ran out of tokens to process
		return currentToken;
	}

	private String getIntToken(char[] characters) {
		//token to be returned
		String currentToken = "";
		//look at each character
		for (char ch: characters)
		{
			//check if whitespace
			boolean ws = Character.isWhitespace(ch);
			//check type
			String type = getType(ch);
			
			//not whitespace and new ch is an integer.
			if (!ws && Objects.equals(type, "int"))
			{
				currentToken = currentToken.concat(String.valueOf(ch));
			}
			//not whitespace and special ch
			else if (!ws && Objects.equals(type, "special"))
			{
				return currentToken;
			}
			else if ( ws )
			{
				return currentToken;
			}
			else //ch type cannot follow integer 
			{
				System.out.println("invalid type follows int");
				System.exit(0);
			}
		}
		//ran out of tokens to process
		return currentToken;
	}

	/*
	 * returns what type of token ch belongs to.
	 * return "int" 
	 * return "uppercase"
	 * return "lowercase"
	 * return "special"
	 */
	private String getType(char ch)
	{
		if (Character.isUpperCase(ch))
		{
			return "uppercase";
		}
		else if (Character.isDigit(ch))
		{
			return "int";
		}
		else if (Character.isLowerCase(ch))
		{
			return "lowercase";
		}
		else
		{
			return "special";
		}
	}
	
	/*
	 * ensures removal of token from line.
	 * ensures new line contains token or finds EOF.
	 */
	public void skipToken() {		
		//remove token from line
		if (token != null)
		{
			line = line.substring(token.length());
		}
		//check if new token in line
		int pos = findFirstNotWhitespace(line.toCharArray());
		
		//read line until next token found
		while (pos == -1 && s.hasNextLine())
		{
			//read next line
			line = s.nextLine();
			//check for start of token
			pos = findFirstNotWhitespace(line.toCharArray());
		}
		
		//no token found till eof
		if (pos == -1)
		{
			//set EOF tag
			line = null;
		}
		//reset token values
		token = null;
		tType = null;
	}
	
	/*
	 * returns the value (int) of the current token
	 */
	private int tokenVal()
	{
		//check that token is keyword or special
		if( core.containsKey(token))			
		{ 
			//return the value
			return core.get(token); 
		}
		else
		{
			 try{ //see if token is integer
				 Integer.parseInt(token);
			        return INTEGER;
			     }
			     catch(NumberFormatException e){
			    	 //token must be an identifier
			    	 return IDENTIFIER;	        
			     }
		}	
	}
	
	public int tokenVal(String word)
	{
		if (core.containsKey(word))
		{
			return core.get(word);
		}
		else
		{
			 try{ //see if token is integer
				 //noinspection ResultOfMethodCallIgnored
				 Integer.parseInt(word);
			        return INTEGER;
			     }
			     catch(NumberFormatException e){
			    	 //token must be an identifier
			    	 return IDENTIFIER;	        
			     }
		}
	}
	
	/*
	* returns true if input does not contain more tokens.
	*/	
	public boolean isEOF()
	{
		if (line == null || findTokenStart() == NOTOKENFOUND)
		{
			s.close();
			System.out.println("EOF");
			return true;
		}
		return false;
	}
	
	/*
	 * returns the start of a token
	 * returns -1 if no token found
	 */
	private int findTokenStart() {

		int tokenStart = NOTOKENFOUND;
		//find starting position of token
		while ( tokenStart == NOTOKENFOUND)
		{
			//empty line, but more lines to read
			if (line.length() == 0 && s.hasNextLine()) 
			{
				//read next line
				line = s.nextLine(); 
			}
			//empty line, and no more lines to read
			else if (line.length() == 0 && !s.hasNextLine() )
			{
				return NOTOKENFOUND;
			}
			//line not empty
			else if (line.length() > 0)
			{
				//convert to characters[]
				char[] characters = line.toCharArray();
				//find position of token in line.
				tokenStart = findFirstNotWhitespace(characters);
				//empty line if no token found.
				if (tokenStart == NOTOKENFOUND)
				{	
					//empty the line.
					line = "";	
				}
			}
		}
		//token was found!
		return tokenStart;
	}
	
	/*
	 * returns position of first non-whitespace character
	 * returns -1 if characters[] contains only whitespace.
	 * requires characters != null
	 * ensures characters[] unchanged.	
	 */
	private int findFirstNotWhitespace(char[] characters) 
	{
		//find starting position of token
		for(int i=0; i<characters.length; i++)
		{
			//check if character is not whitespace.
			if(!Character.isWhitespace( characters[i]))
			{
				//non-whitespace found, return position 
				return i;
			}
		}
		//no non-whitespace in char[].
		return -1;
	}

}

