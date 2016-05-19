using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Encryption e = new Encryption();
            String[] eValues = e.encrypt("password", 10);
            Console.WriteLine("word: \"password\" \nencrypted word is:\n"+eValues[0]+" length:"+eValues[0].Length);
            Console.WriteLine("salt: " + eValues[1]+" length:"+eValues[1].Length);

            String ePass = e.encrypt("password", eValues[1]);
            Console.WriteLine("Using the salt and password the encrypted password is:\n" + ePass);
            Console.WriteLine("\n\nOld first encryption matches second encryption: " + (eValues[0] == ePass));
            Console.Read();

        }
    }
}
