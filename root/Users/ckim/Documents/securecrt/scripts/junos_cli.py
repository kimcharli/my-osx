#$language = "Python3"
#$interface = "1.0"

import SecureCRT
import sys
import platform

def info():
    crt.Dialog.MessageBox(
        "sys.version_info:\r\n{}\r\n\r\nsys.version:\r\n{}\r\n\r\nsys.hexversion:\r\n{}\r\n\r\nplatform.python_version:\r\n{}".format(
            sys.version_info,
            sys.version,
            sys.hexversion,
            platform.python_version()))


def main():
    #info()
    tab = crt.GetScriptTab()

    if tab.Session.Connected != True:
        crt.Dialog.MessageBox(
            "Error.\n" +
            "This script was designed to be launched after a valid "+
            "connection is established.\n\n"+
            "Please connect to a remote machine before running this script.")
        return

    # Ensure that we don't "miss" data coming from the remote by setting
    # our Screen's Synchronous flag to true.
    tab.Screen.Synchronous = True

    tab.Screen.WaitForString("%")
    tab.Screen.Send("echo # junos_cli\n")
    tab.Screen.WaitForString("%")
    tab.Screen.Send("cli\n")


main()

