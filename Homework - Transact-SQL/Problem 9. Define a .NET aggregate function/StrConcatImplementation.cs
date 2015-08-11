using System.Collections.Generic;
using System.Data.SqlTypes;

/// <summary>
/// Calculates the product of numerical values
/// </summary>
[System.Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedAggregate(
    Microsoft.SqlServer.Server.Format.Native,
    IsInvariantToDuplicates = false, // receiving the same value again 
				    // changes the result
    IsInvariantToNulls = false,      // receiving a NULL value changes the result
    IsInvariantToOrder = true,       // the order of the values doesn't 
				    // affect the result
    IsNullIfEmpty = true,            // if no values are given the result is null
    Name = "StrConcat"                 // name of the aggregate

)]


public struct StrConcat
{
    // count only the vowels in the passed-in strings 
    private List<SqlString> strings;

    public void Init()
    {
        strings = new List<SqlString>();
    }


    public void Accumulate(SqlString value)
    {
        strings.Add(value);
    }


    public void Merge(StrConcat value)
    {
        Accumulate(value.Terminate());
    }


    public SqlString Terminate()
    {
        return string.Join(";", strings);
    }
}
