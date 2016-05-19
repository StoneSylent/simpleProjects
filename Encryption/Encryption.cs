using System.IO;
using System;
using System.Security.Cryptography;
using System.Text;

class Encryption
{
    /*
    requires: word- the string to be encrypted.
              limit- the length limit of the salt.
    returns: [encrypted_word, a new salt value]
    */
    public String[] encrypt(String word, int limit)
    {
        byte[] bSalt = GetSalt(limit);
        String sSalt = Encoding.UTF8.GetString(bSalt);
        //store information
        String eWord = this.encrypt(word, sSalt);
        String[] values = new String[2];
        values[1] = sSalt;
        values[0] = eWord;
        return values;
    }

    //returns: the encrypted word
    public String encrypt(String word, String salt)
    {
        //convert to needed types
        byte[] bSalt = Encoding.UTF8.GetBytes(salt);
        byte[] bPassword = Encoding.UTF8.GetBytes(word);

        return MakeEncrypted(bPassword, bSalt);
    }

    private String MakeEncrypted(byte[] password, byte[] salt)
    {
        using (HMACSHA256 sha = new HMACSHA256(salt))
        {
            byte[] encoded = sha.ComputeHash(password, 0, password.Length);
            return Encoding.UTF8.GetString(encoded);
        }
    }

    //requires: limit- the length of the salt returned.
    private byte[] GetSalt(int limit)
    {
        byte[] salt = new byte[limit];

        using (var random = new RNGCryptoServiceProvider())
        {
            random.GetNonZeroBytes(salt);
        }
        return salt;
    }
}
