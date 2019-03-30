using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PgMaskingProxy.Maskers
{
    static public class CharacterMasker
    {
        static private readonly Random _rng = new Random();
        static private readonly Dictionary<char, char> _characterMap = new Dictionary<char, char>();

        static CharacterMasker()
        {
            populateCharacterMap("abcdefghijklmnopqrstuvwxyz");
            populateCharacterMap("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
            populateCharacterMap("1234567890");
        }
        //Random character replacement that preserves formatting (spaces, capitalization, and punctuation). It's best if you need to preserve a join between two text columns, such as a join on a name or email.
        static public string MaskCharacters(string str)
        {
            var output = new StringBuilder();

            int i = 0;
            foreach(var c in str)
            {
                if(char.IsWhiteSpace(c) || char.IsPunctuation(c))
                {
                    output.Append(c);
                }
                else if(_characterMap.Keys.Contains(c))
                {
                    output.Append(_characterMap[c]);
                }
                else
                {
                    // add a new character to the map
                    var keys = new List<char>(_characterMap.Keys);
                    keys = keys.Where(k => (char.IsLower(c) && char.IsLower(k))
                        || (char.IsUpper(c) && char.IsUpper(k))
                        || (!char.IsUpper(c) && !char.IsLower(c))).ToList();
                    var randomChar = keys[_rng.Next(keys.Count)];
                    _characterMap[c] = randomChar;
                    output.Append(randomChar);
                }
                i++;
            }

            return output.ToString();
        }

        static private void populateCharacterMap(string chars)
        {
            var t = new List<char>();
            t.AddRange(chars);
            var shuffledChars = Shuffle<char>(t);
            for(int i = 0; i < chars.Length; i++)
            {
                _characterMap.Add(chars[i], shuffledChars[i]);
            }
        }

        static private List<T> Shuffle<T>(List<T> list)
        {
            int n = list.Count;
            var newList = new List<T>(list);
            while (n > 1) {
                n--;
                int k = _rng.Next(n + 1);
                T value = newList[k];
                newList[k] = newList[n];
                newList[n] = value;
            }
            return newList;
        }


    }
}
