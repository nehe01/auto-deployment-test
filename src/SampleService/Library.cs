using System;
using System.IO;

namespace SampleService
{
  public static class Library
  {
    public static void WriteLog(string message)
    {
      StreamWriter sw = null;
      try
      {
        sw = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "\\Log.txt", true);
        sw.WriteLine(DateTime.Now.ToString() + ": " + message);
        sw.Flush();
        sw.Close();
      }
      catch (Exception e)
      {
      }
    }
  }
}