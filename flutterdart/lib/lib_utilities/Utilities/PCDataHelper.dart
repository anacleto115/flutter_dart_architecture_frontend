// ignore_for_file: curly_braces_in_flow_control_structures

class PCDataHelper
{
  static String namePc()
  {
    return "Device";
  }

  static String userPc()
  {
    return "Administrator";
  }

  static String domainUser()
  {
    return namePc() + "/" + userPc();
  }

  static String versionSO()
  {
    return "Windows 10";
  }

  static String ipPc()
  {
    return "localhost";
  }
}