using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace PgMaskingProxy.Helpers
{
    static public class FunctionGetter
    {
        private static Dictionary<string, Func<string,string>> _methodNameMapper = null;
        //Creates a mapping from the masking_function value in config.json to an actual method that can be invoked.
        static public Dictionary<string, Func<string,string>> GetAllMaskingFunctions()
        {

            if(_methodNameMapper!=null)
            {
                return _methodNameMapper;
            }

            string nameSpace = "PgMaskingProxy.Maskers";

            var classes = Assembly.GetExecutingAssembly().GetTypes()
                    .Where(t => String.Equals(t.Namespace, nameSpace, StringComparison.Ordinal))
                    .ToArray();

            IEnumerable<MethodInfo> maskingMethods = new List<MethodInfo>();
            foreach(var c in classes)
            {
                var methods = c.GetMethods().Where(m=>m.ReturnType==typeof(string) && m.GetParameters().Length==1 && m.GetParameters()[0].ParameterType==typeof(string));
                maskingMethods = maskingMethods.Concat(methods);
            }
            _methodNameMapper = new Dictionary<string, Func<string, string>>();
            foreach(var method in maskingMethods)
            {
                if(!_methodNameMapper.ContainsKey(method.Name.ToLower()))
                {
                    _methodNameMapper.Add(method.Name.ToLower(), (s) => (string)method.Invoke(null,new string[1]{s}));
                }
            }
            return _methodNameMapper;
        }
    }
}
