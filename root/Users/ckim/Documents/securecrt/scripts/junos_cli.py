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

    tab.Screen.Send("cli\r")

    while False:
        # WaitForStrings as called here will wait for an occurance of one
        # of the strings that are part of the g_vWaitFors array defined
        # above.  When one of the strings is detected, the index of the
        # string withint the array will be returned as the value of the
        # nIndex variable.  Note that nIndex will be 1-based, rather than
        # 0-based.
        nIndex = tab.Screen.WaitForStrings(g_vWaitFors)

        # Now that we've discovered text in the "nIndex"th item of our array,
        # send the "nIndex"th item of the g_vRespondWiths array:
        tab.Screen.Send(g_vRespondWiths[nIndex] + "\n")

        # Now that we've sent the corresponding command, loop back up to the
        # top and wait again for another trigger string to appear...

g_vWaitFors = [
    "%"
]

g_vRespondWiths = [
    "cli\r"
]

main()

