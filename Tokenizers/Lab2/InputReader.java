package Tokenizers.Lab2;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;

/*
 * Author: Brandon Stone
 */
public class InputReader {

	private static InputReader instance = null;
	//scanner used to read file.
	private static Scanner s;
	
	protected InputReader()
	{
		//instantiation end
	}
	public static InputReader getInstance()
	{
		if (instance == null) {
			instance = new InputReader();
		}
		return instance;	
	}
	
	/*
	 * Constructor for  class
	 * requires inputfile
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
			instance = new InputReader();
		}
	}
	
	public int getToken() {
		if (s.hasNext())
		{
			return Integer.parseInt(s.next());
		}
		return 0;
	}	
}
