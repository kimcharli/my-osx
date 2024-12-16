#$language = "Python3"
#$interface = "1.0"

# https://www.vandyke.com/support/tips/scripting/scripting_essentials.pdf

import SecureCRT
import sys
import platform
import os

def info():
    crt.Dialog.MessageBox(
        "sys.version_info:\r\n{}\r\n\r\nsys.version:\r\n{}\r\n\r\nsys.hexversion:\r\n{}\r\n\r\nplatform.python_version:\r\n{}".format(
            sys.version_info,
            sys.version,
            sys.hexversion,
            platform.python_version()))


def main():
    #info()
    script_path = os.path.realpath(__file__)

	# Here is where we will set the value of the string that will indicate that
	# we have reached the end of the data that we wanted capture with the
	# ReadString method.
    szPrompt = "%"

	# Using GetScriptTab() will make this script 'tab safe' in that all of the
	# script's functionality will be carried out on the correct tab. From here
	# on out we'll use the objTab object instead of the crt object.
    objTab = crt.GetScriptTab()
    objTab.Screen.Synchronous = True

	# Instruct WaitForString and ReadString to ignore escape sequences when
	# detecting and capturing data received from the remote (this doesn't
	# affect the way the data is displayed to the screen, only how it is handled
	# by the WaitForString, WaitForStrings, and ReadString methods associated
	# with the Screen object.
    objTab.Screen.IgnoreEscape = True

    if objTab.Session.Connected != True:
        crt.Dialog.MessageBox(
            "Error.\n" +
            "This script was designed to be launched after a valid "+
            "connection is established.\n\n"+
            "Please connect to a remote machine before running this script.")
        return

    try:
        objTab.Screen.WaitForString(szPrompt)
        objTab.Screen.Send(f"echo # logon script: {script_path}\n")
        objTab.Screen.WaitForString(szPrompt)
        objTab.Screen.Send("cli\n")
    except SecureCRT.ScriptError as e:
        pass
    except Exception as e:
        crt.Dialog.MessageBox(
            "Error.\n" +
            "An error occurred while attempting to send data to the remote.\n\n" +
            "Error Description:\n" +
            f"{type(e)}\n" +
            str(e))
        return

main()

