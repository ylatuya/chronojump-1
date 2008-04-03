## $Id$
##
## BEGIN LICENSE BLOCK
##
## Copyright (C) 2002  Damon Courtney
## 
## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License
## version 2 as published by the Free Software Foundation.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License version 2 for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the
##     Free Software Foundation, Inc.
##     51 Franklin Street, Fifth Floor
##     Boston, MA  02110-1301, USA.
##
## END LICENSE BLOCK

if {[info exists ::InstallJammer]} { return }

namespace eval ::InstallAPI {}
namespace eval ::InstallJammer {}

set ::debug   "on"
set ::verbose 0

set ::conf(osx)      [string equal $::tcl_platform(os) "Darwin"]
set ::conf(unix)     [string equal $::tcl_platform(platform) "unix"]
set ::conf(windows)  [string equal $::tcl_platform(platform) "windows"]

set ::conf(threaded) [info exists ::tcl_platform(threaded)]

set ::info(Debugging) 0

## Trace the virtual text array for changes and execute any
## attached commands or auto-update actions.
trace add variable ::info write ::InstallJammer::VirtualTextTrace

proc ::InstallJammer::VirtualTextTrace { name1 name2 op } {
    upvar #0 ::info($name2) var

    if {[info exists ::InstallJammer::UpdateVarCmds($name2)]} {
        foreach cmd $::InstallJammer::UpdateVarCmds($name2) {
            uplevel #0 $cmd
        }
    }

    if {[info exists ::InstallJammer::AutoUpdateVars($name2)]
        && $var ne $::InstallJammer::AutoUpdateVars($name2)} {
        set ::InstallJammer::AutoUpdateVars($name2) $var
        ::InstallJammer::UpdateWidgets -updateidletasks 1
    }
}

proc ::InstallJammer::SourceCachedFile { file {namespace "::"} } {
    if {[info exists ::InstallJammer::files($file)]} {
        namespace eval $namespace $::InstallJammer::files($file)
        return 1
    }
    return 0
}

namespace eval ::InstallAPI {}
namespace eval ::InstallJammer {}
set conf(version)     1.2.5
set info(Platform)    Windows
set info(InstallerID) 14D0F88B-CF45-381F-F0CD-463187F27A3B
array set ::InstallJammer::languagecodes {de German en English es Spanish fr French hu Magyar it Italian nl Nederlands pl Polish pt_br {Brazilian Portuguese}}
array set info {
AllowLanguageSelection
Yes

AppName
Chronojump

ApplicationID
0FE82DCF-FD52-6B6B-EEFD-1B78D283C4A9

ApplicationURL
http://www.gnome.org/projects/chronojump

BuildFailureAction
{Fail (recommended)}

BuildVersion
6

CancelledInstallAction
{Rollback and Stop}

CleanupCancelledInstall
Yes

Company
{Chronojump team}

CompressionMethod
zlib

Copyright
{}

CreateDesktopShortcut
Yes

DefaultLanguage
Spanish

ExtractSolidArchivesOnStartup
No

IncludeDebugging
Yes

InstallDir
<%PROGRAM_FILES%>/<%AppName%>

InstallMode
Standard

InstallType
Typical

InstallVersion
0.6.2.6

LaunchApplication
Yes

MajorVersion
0

MinorVersion
6

PackageDescription
{}

PackageLicense
{}

PackageMaintainer
{}

PackageName
<%ShortAppName%>

PackagePackager
{}

PackageRelease
<%PatchVersion%>

PackageSummary
{}

PackageVersion
<%MajorVersion%>.<%MinorVersion%>

PatchVersion
2

ProgramExecutable
<%InstallDir%>/chronojump-<%InstallVersion%>/windows/chronojump.bat

ProgramFolderAllUsers
No

ProgramFolderName
<%AppName%>

ProgramLicense
<%InstallDir%>/LICENSE.txt

ProgramName
{}

ProgramReadme
<%InstallDir%>/README.txt

ShortAppName
Chronojump

UpgradeApplicationID
{}

Version
0.6.2.6

}
array set ::InstallJammer::CommandLineOptions {
debug
{Debugging Switch Yes No {} {run installer in debug mode}}

debugconsole
{ShowConsole Switch Yes No {} {run installer with a debug console open}}

mode
{InstallMode Choice No No {Console Default Silent Standard} {set the mode to run the installer in}}

prefix
{InstallDir String No No {} {set the installation directory}}

test
{Testing Switch Yes No {} {run installer without installing any files}}

}
array set ::InstallJammer::Properties {
073E3F8C-ADC8-8230-15C8-2F8108592782,Active
Yes

073E3F8C-ADC8-8230-15C8-2F8108592782,BackButton,subst
1

073E3F8C-ADC8-8230-15C8-2F8108592782,Buttons
Back/Next/Cancel

073E3F8C-ADC8-8230-15C8-2F8108592782,CancelButton,subst
1

073E3F8C-ADC8-8230-15C8-2F8108592782,Caption,subst
1

073E3F8C-ADC8-8230-15C8-2F8108592782,Component
{}

073E3F8C-ADC8-8230-15C8-2F8108592782,Conditions
{0 conditions}

073E3F8C-ADC8-8230-15C8-2F8108592782,FileLabel,subst
1

073E3F8C-ADC8-8230-15C8-2F8108592782,ID
{}

073E3F8C-ADC8-8230-15C8-2F8108592782,Icon
<%Icon%>

073E3F8C-ADC8-8230-15C8-2F8108592782,Message,subst
1

073E3F8C-ADC8-8230-15C8-2F8108592782,NextButton,subst
1

073E3F8C-ADC8-8230-15C8-2F8108592782,ProgressValue,subst
1

073E3F8C-ADC8-8230-15C8-2F8108592782,Subtitle,subst
1

073E3F8C-ADC8-8230-15C8-2F8108592782,Title,subst
1

099A6D97-6A29-C866-5C8E-E131E2D8715E,Active
Yes

099A6D97-6A29-C866-5C8E-E131E2D8715E,Component
{}

099A6D97-6A29-C866-5C8E-E131E2D8715E,Conditions
{0 conditions}

099A6D97-6A29-C866-5C8E-E131E2D8715E,ExecuteAction
{After Pane is Displayed}

099A6D97-6A29-C866-5C8E-E131E2D8715E,ID
{}

099A6D97-6A29-C866-5C8E-E131E2D8715E,IgnoreErrors
No

099A6D97-6A29-C866-5C8E-E131E2D8715E,State
disabled

099A6D97-6A29-C866-5C8E-E131E2D8715E,Text
{}

099A6D97-6A29-C866-5C8E-E131E2D8715E,Widget
{Back Button;Next Button}

12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F,Active
Yes

12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F,CheckCondition
{Before Action is Executed}

12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F,Component
{}

12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F,FailureFocus
{}

12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F,FailureMessage
{}

12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F,Filename
<%ProgramExecutable%>

12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F,ID
{}

12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F,Operator
exists

19F2DF18-82AF-7F49-64C2-061CFB249FD3,Active
Yes

19F2DF18-82AF-7F49-64C2-061CFB249FD3,CheckCondition
{Before Action is Executed}

19F2DF18-82AF-7F49-64C2-061CFB249FD3,Component
{}

19F2DF18-82AF-7F49-64C2-061CFB249FD3,FailureFocus
{}

19F2DF18-82AF-7F49-64C2-061CFB249FD3,FailureMessage
{}

19F2DF18-82AF-7F49-64C2-061CFB249FD3,ID
{}

19F2DF18-82AF-7F49-64C2-061CFB249FD3,Operator
true

19F2DF18-82AF-7F49-64C2-061CFB249FD3,String
<%LaunchApplication%>

21617B35-8D01-5A86-DB35-86E5F090902A,Active
Yes

21617B35-8D01-5A86-DB35-86E5F090902A,CheckCondition
{Before Pane is Displayed}

21617B35-8D01-5A86-DB35-86E5F090902A,Comment
{Do not display this pane if this is an upgrade install unless there is more than one installation present}

21617B35-8D01-5A86-DB35-86E5F090902A,Component
{}

21617B35-8D01-5A86-DB35-86E5F090902A,FailureFocus
{}

21617B35-8D01-5A86-DB35-86E5F090902A,FailureMessage
{}

21617B35-8D01-5A86-DB35-86E5F090902A,ID
{}

21617B35-8D01-5A86-DB35-86E5F090902A,Script
{!<%UpgradeInstall%> || <%PreviousInstallCount%> != 1}

2204086F-F5B9-392D-E5E1-8C0EDFB4D38B,Active
Yes

2204086F-F5B9-392D-E5E1-8C0EDFB4D38B,CheckCondition
{Before Action is Executed}

2204086F-F5B9-392D-E5E1-8C0EDFB4D38B,Component
{}

2204086F-F5B9-392D-E5E1-8C0EDFB4D38B,FailureFocus
{}

2204086F-F5B9-392D-E5E1-8C0EDFB4D38B,FailureMessage
{}

2204086F-F5B9-392D-E5E1-8C0EDFB4D38B,Filename
<%ProgramExecutable%>

2204086F-F5B9-392D-E5E1-8C0EDFB4D38B,ID
{}

2204086F-F5B9-392D-E5E1-8C0EDFB4D38B,Operator
exists

25BB083B-B2C6-F7C4-1452-A26D799DA353,Active
Yes

25BB083B-B2C6-F7C4-1452-A26D799DA353,Alias
{Cancel Actions}

25BB083B-B2C6-F7C4-1452-A26D799DA353,Conditions
{}

25BB083B-B2C6-F7C4-1452-A26D799DA353,ID
{}

294C1998-2566-C983-7BE0-ECB818A339C6,Active
Yes

294C1998-2566-C983-7BE0-ECB818A339C6,Component
{}

294C1998-2566-C983-7BE0-ECB818A339C6,Conditions
{0 conditions}

294C1998-2566-C983-7BE0-ECB818A339C6,ExecuteAction
{After Pane is Displayed}

294C1998-2566-C983-7BE0-ECB818A339C6,ID
{}

294C1998-2566-C983-7BE0-ECB818A339C6,IgnoreErrors
No

294C1998-2566-C983-7BE0-ECB818A339C6,UpdateFilePercentage
No

294C1998-2566-C983-7BE0-ECB818A339C6,UpdateFileText
No

3ED374ED-8769-C2E1-A5B4-2611FF0E8792,Active
Yes

3ED374ED-8769-C2E1-A5B4-2611FF0E8792,CheckCondition
{Before Action is Executed}

3ED374ED-8769-C2E1-A5B4-2611FF0E8792,Component
{}

3ED374ED-8769-C2E1-A5B4-2611FF0E8792,FailureFocus
{}

3ED374ED-8769-C2E1-A5B4-2611FF0E8792,FailureMessage
{}

3ED374ED-8769-C2E1-A5B4-2611FF0E8792,ID
{}

3ED374ED-8769-C2E1-A5B4-2611FF0E8792,Operator
false

3ED374ED-8769-C2E1-A5B4-2611FF0E8792,String
<%UpgradeInstall%>

43A515B8-D335-D77D-4CF0-025B35D62CFD,Active
Yes

43A515B8-D335-D77D-4CF0-025B35D62CFD,CheckCondition
{Before Action is Executed}

43A515B8-D335-D77D-4CF0-025B35D62CFD,Component
{}

43A515B8-D335-D77D-4CF0-025B35D62CFD,FailureFocus
{}

43A515B8-D335-D77D-4CF0-025B35D62CFD,FailureMessage
{}

43A515B8-D335-D77D-4CF0-025B35D62CFD,ID
{}

43A515B8-D335-D77D-4CF0-025B35D62CFD,Operator
true

43A515B8-D335-D77D-4CF0-025B35D62CFD,String
<%GuiMode%>

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,Active
Yes

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,AdditionalArguments
{}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,CommandLineArguments
{}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,Component
{}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,Conditions
{}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,ExecuteAction
{After Pane is Displayed}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,FileName
<%ShortAppName%>-uninstall

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,ID
{}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,IconPath
{}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,IconPathIndex
0

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,IgnoreErrors
No

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,InstallForAllUsers
{}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,ProgramFolderName
<%ProgramFolderName%>

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,ShortcutName
{Uninstall <%AppName%>}

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,ShortcutType
Application

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,TargetFileName
<%Uninstaller%>

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,WindowState
normal

446BFF70-66AA-8729-5EB1-E5DFB83FCCA9,WorkingDirectory
<%InstallDir%>

48B4932D-8D72-1214-5078-F33A9BD89960,Action
{}

48B4932D-8D72-1214-5078-F33A9BD89960,Active
Yes

48B4932D-8D72-1214-5078-F33A9BD89960,Background
white

48B4932D-8D72-1214-5078-F33A9BD89960,BrowseType
directory

48B4932D-8D72-1214-5078-F33A9BD89960,Checked
{}

48B4932D-8D72-1214-5078-F33A9BD89960,Component
{}

48B4932D-8D72-1214-5078-F33A9BD89960,Conditions
{}

48B4932D-8D72-1214-5078-F33A9BD89960,ExecuteAction
{After Pane is Displayed}

48B4932D-8D72-1214-5078-F33A9BD89960,Foreground
system

48B4932D-8D72-1214-5078-F33A9BD89960,Height
{}

48B4932D-8D72-1214-5078-F33A9BD89960,ID
{}

48B4932D-8D72-1214-5078-F33A9BD89960,IgnoreErrors
No

48B4932D-8D72-1214-5078-F33A9BD89960,LabelJustify
left

48B4932D-8D72-1214-5078-F33A9BD89960,LabelSide
top

48B4932D-8D72-1214-5078-F33A9BD89960,LabelWidth
0

48B4932D-8D72-1214-5078-F33A9BD89960,OffValue
0

48B4932D-8D72-1214-5078-F33A9BD89960,OnValue
1

48B4932D-8D72-1214-5078-F33A9BD89960,Text,subst
1

48B4932D-8D72-1214-5078-F33A9BD89960,Type
checkbutton

48B4932D-8D72-1214-5078-F33A9BD89960,Value
{}

48B4932D-8D72-1214-5078-F33A9BD89960,VirtualText
CreateDesktopShortcut

48B4932D-8D72-1214-5078-F33A9BD89960,Width
{}

48B4932D-8D72-1214-5078-F33A9BD89960,X
185

48B4932D-8D72-1214-5078-F33A9BD89960,Y
180

4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68,Active
Yes

4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68,CheckCondition
{Before Action is Executed}

4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68,Component
{}

4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68,FailureFocus
{}

4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68,FailureMessage
{}

4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68,Filename
<%ProgramExecutable%>

4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68,ID
{}

4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68,Operator
exists

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Action
{}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Active
Yes

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Background
white

4C465E6F-9D44-F4D7-8064-5ECE64239B91,BrowseType
directory

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Checked
{}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Component
{}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Conditions
{2 conditions}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,ExecuteAction
{After Pane is Displayed}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Foreground
system

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Height
{}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,ID
{}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,IgnoreErrors
No

4C465E6F-9D44-F4D7-8064-5ECE64239B91,LabelJustify
left

4C465E6F-9D44-F4D7-8064-5ECE64239B91,LabelSide
top

4C465E6F-9D44-F4D7-8064-5ECE64239B91,LabelWidth
0

4C465E6F-9D44-F4D7-8064-5ECE64239B91,OffValue
0

4C465E6F-9D44-F4D7-8064-5ECE64239B91,OnValue
1

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Text,subst
1

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Type
checkbutton

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Value
{}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,VirtualText
LaunchApplication

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Width
{}

4C465E6F-9D44-F4D7-8064-5ECE64239B91,X
185

4C465E6F-9D44-F4D7-8064-5ECE64239B91,Y
160

53A63017-8385-B8EE-142A-65136147FA12,Active
Yes

53A63017-8385-B8EE-142A-65136147FA12,Component
{}

53A63017-8385-B8EE-142A-65136147FA12,Conditions
{0 conditions}

53A63017-8385-B8EE-142A-65136147FA12,ExecuteAction
{After Pane is Displayed}

53A63017-8385-B8EE-142A-65136147FA12,ID
{}

53A63017-8385-B8EE-142A-65136147FA12,IgnoreErrors
No

54A3E55E-DDE6-CD53-6011-02D33DF5BFDE,Active
Yes

54A3E55E-DDE6-CD53-6011-02D33DF5BFDE,Alias
{Startup Actions}

54A3E55E-DDE6-CD53-6011-02D33DF5BFDE,Conditions
{0 conditions}

54A3E55E-DDE6-CD53-6011-02D33DF5BFDE,ID
{}

5D86A438-171D-8286-765B-F1A104123527,Active
Yes

5D86A438-171D-8286-765B-F1A104123527,CheckCondition
{Before Action is Executed}

5D86A438-171D-8286-765B-F1A104123527,Component
{}

5D86A438-171D-8286-765B-F1A104123527,FailureFocus
{}

5D86A438-171D-8286-765B-F1A104123527,FailureMessage
{}

5D86A438-171D-8286-765B-F1A104123527,ID
{}

5D86A438-171D-8286-765B-F1A104123527,Operator
false

5D86A438-171D-8286-765B-F1A104123527,String
<%InstallStopped%>

629F9BF2-5725-73EA-6F47-EA9E75ABFDE7,Action
{Install Actions}

629F9BF2-5725-73EA-6F47-EA9E75ABFDE7,Active
Yes

629F9BF2-5725-73EA-6F47-EA9E75ABFDE7,Component
{}

629F9BF2-5725-73EA-6F47-EA9E75ABFDE7,Conditions
{0 conditions}

629F9BF2-5725-73EA-6F47-EA9E75ABFDE7,EvaluateConditions
Yes

629F9BF2-5725-73EA-6F47-EA9E75ABFDE7,ExecuteAction
{After Pane is Displayed}

629F9BF2-5725-73EA-6F47-EA9E75ABFDE7,ID
{}

629F9BF2-5725-73EA-6F47-EA9E75ABFDE7,IgnoreErrors
No

70364F59-3542-E36E-FC43-18B295772C15,Active
Yes

70364F59-3542-E36E-FC43-18B295772C15,BackButton,subst
1

70364F59-3542-E36E-FC43-18B295772C15,Buttons
Next/Cancel

70364F59-3542-E36E-FC43-18B295772C15,CancelButton,subst
1

70364F59-3542-E36E-FC43-18B295772C15,Caption,subst
1

70364F59-3542-E36E-FC43-18B295772C15,Component
{}

70364F59-3542-E36E-FC43-18B295772C15,Conditions
{0 conditions}

70364F59-3542-E36E-FC43-18B295772C15,ID
{}

70364F59-3542-E36E-FC43-18B295772C15,Image
<%Image%>

70364F59-3542-E36E-FC43-18B295772C15,Message,subst
1

70364F59-3542-E36E-FC43-18B295772C15,NextButton,subst
1

70364F59-3542-E36E-FC43-18B295772C15,WizardOptions
{-bg white -separator 0}

7BB33D54-49D1-24FA-27C9-D8C442EF0711,Active
Yes

7BB33D54-49D1-24FA-27C9-D8C442EF0711,CheckCondition
{Before Action is Executed}

7BB33D54-49D1-24FA-27C9-D8C442EF0711,Component
{}

7BB33D54-49D1-24FA-27C9-D8C442EF0711,FailureFocus
{}

7BB33D54-49D1-24FA-27C9-D8C442EF0711,FailureMessage
{}

7BB33D54-49D1-24FA-27C9-D8C442EF0711,ID
{}

7BB33D54-49D1-24FA-27C9-D8C442EF0711,Operator
true

7BB33D54-49D1-24FA-27C9-D8C442EF0711,String
<%GuiMode%>

82C326B5-E226-6800-A589-31AA016CC09E,Active
Yes

82C326B5-E226-6800-A589-31AA016CC09E,Comment
{Ask the user if they want to proceed with the install.}

82C326B5-E226-6800-A589-31AA016CC09E,Component
{}

82C326B5-E226-6800-A589-31AA016CC09E,Conditions
{2 conditions}

82C326B5-E226-6800-A589-31AA016CC09E,ExecuteAction
{After Pane is Displayed}

82C326B5-E226-6800-A589-31AA016CC09E,ExitType
Cancel

82C326B5-E226-6800-A589-31AA016CC09E,ID
{}

82C326B5-E226-6800-A589-31AA016CC09E,IgnoreErrors
No

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,Active
Yes

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,CheckCondition
{Before Action is Executed}

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,Component
{}

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,DefaultButton
Yes

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,FailureFocus
{}

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,FailureMessage
{}

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,ID
{}

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,Icon
info

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,Message,subst
1

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,ResultVirtualText
Answer

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,Title,subst
1

8938D967-84AB-9BC6-DFEC-AA60B8C1390A,TrueValue
No

8CD31907-2778-AC4C-A178-FB58C43712DF,Active
Yes

8CD31907-2778-AC4C-A178-FB58C43712DF,BackButton,subst
1

8CD31907-2778-AC4C-A178-FB58C43712DF,Buttons
Back/Next/Cancel

8CD31907-2778-AC4C-A178-FB58C43712DF,CancelButton,subst
1

8CD31907-2778-AC4C-A178-FB58C43712DF,Caption,subst
1

8CD31907-2778-AC4C-A178-FB58C43712DF,Component
{}

8CD31907-2778-AC4C-A178-FB58C43712DF,Conditions
{0 conditions}

8CD31907-2778-AC4C-A178-FB58C43712DF,ID
{}

8CD31907-2778-AC4C-A178-FB58C43712DF,Icon
<%Icon%>

8CD31907-2778-AC4C-A178-FB58C43712DF,Message,subst
1

8CD31907-2778-AC4C-A178-FB58C43712DF,NextButton,subst
1

8CD31907-2778-AC4C-A178-FB58C43712DF,Subtitle,subst
1

8CD31907-2778-AC4C-A178-FB58C43712DF,Text,subst
1

8CD31907-2778-AC4C-A178-FB58C43712DF,Title,subst
1

97C38F94-90CA-6717-CC51-78D0D43EE48A,Active
Yes

97C38F94-90CA-6717-CC51-78D0D43EE48A,AdditionalArguments
{}

97C38F94-90CA-6717-CC51-78D0D43EE48A,CommandLineArguments
{}

97C38F94-90CA-6717-CC51-78D0D43EE48A,Component
{}

97C38F94-90CA-6717-CC51-78D0D43EE48A,Conditions
{2 conditions}

97C38F94-90CA-6717-CC51-78D0D43EE48A,ExecuteAction
{After Pane is Displayed}

97C38F94-90CA-6717-CC51-78D0D43EE48A,FileName
<%ShortAppName%>-desktop

97C38F94-90CA-6717-CC51-78D0D43EE48A,ID
{}

97C38F94-90CA-6717-CC51-78D0D43EE48A,IconPath
{}

97C38F94-90CA-6717-CC51-78D0D43EE48A,IconPathIndex
0

97C38F94-90CA-6717-CC51-78D0D43EE48A,IgnoreErrors
No

97C38F94-90CA-6717-CC51-78D0D43EE48A,InstallForAllUsers
<%ProgramFolderAllUsers%>

97C38F94-90CA-6717-CC51-78D0D43EE48A,ShortcutName
<%AppName%>

97C38F94-90CA-6717-CC51-78D0D43EE48A,ShortcutType
Application

97C38F94-90CA-6717-CC51-78D0D43EE48A,TargetFileName
<%ProgramExecutable%>

97C38F94-90CA-6717-CC51-78D0D43EE48A,WindowState
normal

97C38F94-90CA-6717-CC51-78D0D43EE48A,WorkingDirectory
<%InstallDir%>

9A10D654-6137-2828-5047-AFF307DE53B8,Active
Yes

9A10D654-6137-2828-5047-AFF307DE53B8,CheckCondition
{Before Action is Executed}

9A10D654-6137-2828-5047-AFF307DE53B8,Component
{}

9A10D654-6137-2828-5047-AFF307DE53B8,FailureFocus
{}

9A10D654-6137-2828-5047-AFF307DE53B8,FailureMessage
{}

9A10D654-6137-2828-5047-AFF307DE53B8,ID
{}

9A10D654-6137-2828-5047-AFF307DE53B8,Operator
false

9A10D654-6137-2828-5047-AFF307DE53B8,String
<%InstallStopped%>

ACE850F7-7260-0918-ED4D-A043B59676BD,Active
Yes

ACE850F7-7260-0918-ED4D-A043B59676BD,Component
{}

ACE850F7-7260-0918-ED4D-A043B59676BD,Conditions
{1 condition}

ACE850F7-7260-0918-ED4D-A043B59676BD,ExecuteAction
{After Pane is Displayed}

ACE850F7-7260-0918-ED4D-A043B59676BD,ID
{}

ACE850F7-7260-0918-ED4D-A043B59676BD,IgnoreErrors
No

ACE850F7-7260-0918-ED4D-A043B59676BD,Message
<%BuildUninstallText%>

ACE850F7-7260-0918-ED4D-A043B59676BD,UninstallDirectory
<%InstallDir%>

ACE850F7-7260-0918-ED4D-A043B59676BD,UninstallFilename
uninstall<%Ext%>

AIX-ppc,Active
No

AIX-ppc,DefaultDirectoryPermission
0755

AIX-ppc,DefaultFilePermission
0755

AIX-ppc,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

AIX-ppc,FallBackToConsole
Yes

AIX-ppc,InstallDir
<%Home%>/<%ShortAppName%>

AIX-ppc,InstallMode
Standard

AIX-ppc,InstallType
Typical

AIX-ppc,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

AIX-ppc,ProgramFolderAllUsers
No

AIX-ppc,ProgramFolderName
<%AppName%>

AIX-ppc,ProgramLicense
<%InstallDir%>/LICENSE.txt

AIX-ppc,ProgramName
{}

AIX-ppc,ProgramReadme
<%InstallDir%>/README.txt

AIX-ppc,PromptForRoot
Yes

AIX-ppc,RequireRoot
No

AIX-ppc,RootInstallDir
/usr/local/<%ShortAppName%>

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,Active
Yes

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,Attributes
{}

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,CompressionMethod
{}

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,Destination
<%InstallDir%>

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,FileSize
12719916

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,FileUpdateMethod
{Update files with more recent dates}

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,ID
{}

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,Name
{Program Files}

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,Permissions
{}

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,Size
{}

B183954F-56CA-1FEB-17B0-63A0F9D2CA1C,Version
{}

B683709A-621C-49B3-69E1-A80071C1CACE,Active
Yes

B683709A-621C-49B3-69E1-A80071C1CACE,Alias
{Setup Actions}

B683709A-621C-49B3-69E1-A80071C1CACE,Conditions
{0 conditions}

B683709A-621C-49B3-69E1-A80071C1CACE,ID
{}

B68C718A-7D67-2AE8-FDD8-525A5B934E19,Active
Yes

B68C718A-7D67-2AE8-FDD8-525A5B934E19,CheckCondition
{Before Action is Executed}

B68C718A-7D67-2AE8-FDD8-525A5B934E19,Component
{}

B68C718A-7D67-2AE8-FDD8-525A5B934E19,FailureFocus
{}

B68C718A-7D67-2AE8-FDD8-525A5B934E19,FailureMessage
{}

B68C718A-7D67-2AE8-FDD8-525A5B934E19,ID
{}

B68C718A-7D67-2AE8-FDD8-525A5B934E19,Operator
false

B68C718A-7D67-2AE8-FDD8-525A5B934E19,String
<%UpgradeInstall%>

B9C43883-A007-209B-5187-6894BC5C7C65,Active
Yes

B9C43883-A007-209B-5187-6894BC5C7C65,CheckCondition
{Before Action is Executed}

B9C43883-A007-209B-5187-6894BC5C7C65,Component
{}

B9C43883-A007-209B-5187-6894BC5C7C65,FailureFocus
{}

B9C43883-A007-209B-5187-6894BC5C7C65,FailureMessage
{}

B9C43883-A007-209B-5187-6894BC5C7C65,ID
{}

B9C43883-A007-209B-5187-6894BC5C7C65,Operator
true

B9C43883-A007-209B-5187-6894BC5C7C65,String
<%CreateDesktopShortcut%>

BBFC8BB2-978A-6A82-64A5-956543B03628,Active
Yes

BBFC8BB2-978A-6A82-64A5-956543B03628,AdditionalArguments
{}

BBFC8BB2-978A-6A82-64A5-956543B03628,CommandLineArguments
{}

BBFC8BB2-978A-6A82-64A5-956543B03628,Component
{}

BBFC8BB2-978A-6A82-64A5-956543B03628,Conditions
{1 condition}

BBFC8BB2-978A-6A82-64A5-956543B03628,ExecuteAction
{After Pane is Displayed}

BBFC8BB2-978A-6A82-64A5-956543B03628,FileName
<%ShortAppName%>-program

BBFC8BB2-978A-6A82-64A5-956543B03628,ID
{}

BBFC8BB2-978A-6A82-64A5-956543B03628,IconPath
{}

BBFC8BB2-978A-6A82-64A5-956543B03628,IconPathIndex
0

BBFC8BB2-978A-6A82-64A5-956543B03628,IgnoreErrors
No

BBFC8BB2-978A-6A82-64A5-956543B03628,InstallForAllUsers
{}

BBFC8BB2-978A-6A82-64A5-956543B03628,ProgramFolderName
<%ProgramFolderName%>

BBFC8BB2-978A-6A82-64A5-956543B03628,ShortcutName
<%AppName%>

BBFC8BB2-978A-6A82-64A5-956543B03628,ShortcutType
Application

BBFC8BB2-978A-6A82-64A5-956543B03628,TargetFileName
<%ProgramExecutable%>

BBFC8BB2-978A-6A82-64A5-956543B03628,WindowState
normal

BBFC8BB2-978A-6A82-64A5-956543B03628,WorkingDirectory
<%InstallDir%>

C603314B-D0E6-64D1-4F05-0E8226B3B689,Active
Yes

C603314B-D0E6-64D1-4F05-0E8226B3B689,Components
CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3

C603314B-D0E6-64D1-4F05-0E8226B3B689,Description,subst
1

C603314B-D0E6-64D1-4F05-0E8226B3B689,DisplayName,subst
1

C603314B-D0E6-64D1-4F05-0E8226B3B689,ID
{}

C603314B-D0E6-64D1-4F05-0E8226B3B689,Name
Typical

C603314B-D0E6-64D1-4F05-0E8226B3B689,ShowSetupType
Yes

C7ED3A19-3E0D-1162-F05C-367D3ABE881F,Active
Yes

C7ED3A19-3E0D-1162-F05C-367D3ABE881F,CheckCondition
{Before Next Pane is Displayed}

C7ED3A19-3E0D-1162-F05C-367D3ABE881F,Component
{}

C7ED3A19-3E0D-1162-F05C-367D3ABE881F,FailureFocus
{}

C7ED3A19-3E0D-1162-F05C-367D3ABE881F,FailureMessage
<%DirectoryPermissionText%>

C7ED3A19-3E0D-1162-F05C-367D3ABE881F,Filename
<%InstallDir%>

C7ED3A19-3E0D-1162-F05C-367D3ABE881F,ID
{}

C7ED3A19-3E0D-1162-F05C-367D3ABE881F,Permission
{can create}

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,Active
Yes

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,Checked
Yes

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,ComponentGroup
{}

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,Description,subst
1

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,DisplayName,subst
1

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,FileGroups
B183954F-56CA-1FEB-17B0-63A0F9D2CA1C

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,ID
{}

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,Name
{Default Component}

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,RequiredComponent
Yes

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,ShowComponent
Yes

CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3,Size
{}

D8492003-5C19-FCC6-D2C2-BC6E7D29FD09,Active
Yes

D8492003-5C19-FCC6-D2C2-BC6E7D29FD09,CheckCondition
{Before Action is Executed}

D8492003-5C19-FCC6-D2C2-BC6E7D29FD09,Component
{}

D8492003-5C19-FCC6-D2C2-BC6E7D29FD09,FailureFocus
{}

D8492003-5C19-FCC6-D2C2-BC6E7D29FD09,FailureMessage
{}

D8492003-5C19-FCC6-D2C2-BC6E7D29FD09,ID
{}

D8492003-5C19-FCC6-D2C2-BC6E7D29FD09,Operator
false

D8492003-5C19-FCC6-D2C2-BC6E7D29FD09,String
<%UpgradeInstall%>

DF44E112-7C44-054E-DDC6-7B8E119C230E,Active
Yes

DF44E112-7C44-054E-DDC6-7B8E119C230E,Alias
{Install Actions}

DF44E112-7C44-054E-DDC6-7B8E119C230E,Conditions
{0 conditions}

DF44E112-7C44-054E-DDC6-7B8E119C230E,ID
{}

E082CAC8-715F-5B82-42E3-7B2FD48577E9,Active
Yes

E082CAC8-715F-5B82-42E3-7B2FD48577E9,CheckCondition
{Before Action is Executed}

E082CAC8-715F-5B82-42E3-7B2FD48577E9,Component
{}

E082CAC8-715F-5B82-42E3-7B2FD48577E9,FailureFocus
{}

E082CAC8-715F-5B82-42E3-7B2FD48577E9,FailureMessage
{}

E082CAC8-715F-5B82-42E3-7B2FD48577E9,ID
{}

E082CAC8-715F-5B82-42E3-7B2FD48577E9,Operator
false

E082CAC8-715F-5B82-42E3-7B2FD48577E9,String
<%UpgradeInstall%>

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Active
Yes

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,BackButton,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,BrowseButton,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,BrowseText,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Buttons
Back/Next/Cancel

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,CancelButton,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Caption,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Component
{}

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Conditions
{2 conditions}

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,DestinationLabel,subst
0

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,ID
{}

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Icon
<%Icon%>

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Message,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,NextButton,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Subtitle,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Title,subst
1

E55EF3C7-ED39-DCC2-538F-81A46E080F8A,VirtualText
InstallDir

E791CEF9-CCAA-8936-1114-79C5BF368152,Active
Yes

E791CEF9-CCAA-8936-1114-79C5BF368152,CheckCondition
{Before Action is Executed}

E791CEF9-CCAA-8936-1114-79C5BF368152,Component
{}

E791CEF9-CCAA-8936-1114-79C5BF368152,FailureFocus
{}

E791CEF9-CCAA-8936-1114-79C5BF368152,FailureMessage
{}

E791CEF9-CCAA-8936-1114-79C5BF368152,Filename
<%ProgramExecutable%>

E791CEF9-CCAA-8936-1114-79C5BF368152,ID
{}

E791CEF9-CCAA-8936-1114-79C5BF368152,Operator
exists

E99F83E5-0807-6800-4DA6-CF3A4A12E5BF,Active
Yes

E99F83E5-0807-6800-4DA6-CF3A4A12E5BF,Components
CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3

E99F83E5-0807-6800-4DA6-CF3A4A12E5BF,Description,subst
1

E99F83E5-0807-6800-4DA6-CF3A4A12E5BF,DisplayName,subst
1

E99F83E5-0807-6800-4DA6-CF3A4A12E5BF,ID
{}

E99F83E5-0807-6800-4DA6-CF3A4A12E5BF,Name
Custom

E99F83E5-0807-6800-4DA6-CF3A4A12E5BF,ShowSetupType
Yes

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,Active
Yes

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,BackButton,subst
1

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,Buttons
Next/Cancel

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,CancelButton,subst
1

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,Caption,subst
1

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,Component
{}

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,Conditions
{0 conditions}

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,ID
{}

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,Image
<%Image%>

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,Message,subst
1

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,NextButton,subst
1

EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,WizardOptions
{-bg white -separator 0}

F6416306-44AC-E54D-969B-11D71563C442,Active
Yes

F6416306-44AC-E54D-969B-11D71563C442,Component
{}

F6416306-44AC-E54D-969B-11D71563C442,Conditions
{0 conditions}

F6416306-44AC-E54D-969B-11D71563C442,ExecuteAction
{After Pane is Displayed}

F6416306-44AC-E54D-969B-11D71563C442,ID
{}

F6416306-44AC-E54D-969B-11D71563C442,IgnoreErrors
No

F68AA157-4B17-FABA-4523-B0D105E7260F,Active
Yes

F68AA157-4B17-FABA-4523-B0D105E7260F,Comments
{}

F68AA157-4B17-FABA-4523-B0D105E7260F,Component
{}

F68AA157-4B17-FABA-4523-B0D105E7260F,Conditions
{1 condition}

F68AA157-4B17-FABA-4523-B0D105E7260F,Contact
{}

F68AA157-4B17-FABA-4523-B0D105E7260F,DisplayIcon
<%ProgramExecutable%>

F68AA157-4B17-FABA-4523-B0D105E7260F,DisplayName
<%AppName%>

F68AA157-4B17-FABA-4523-B0D105E7260F,DisplayVersion
<%Version%>

F68AA157-4B17-FABA-4523-B0D105E7260F,ExecuteAction
{After Pane is Displayed}

F68AA157-4B17-FABA-4523-B0D105E7260F,HelpLink
{}

F68AA157-4B17-FABA-4523-B0D105E7260F,HelpTelephone
{}

F68AA157-4B17-FABA-4523-B0D105E7260F,ID
{}

F68AA157-4B17-FABA-4523-B0D105E7260F,IgnoreErrors
No

F68AA157-4B17-FABA-4523-B0D105E7260F,InstallDate
{<%Date %Y%m%d%>}

F68AA157-4B17-FABA-4523-B0D105E7260F,InstallLocation
<%InstallDir%>

F68AA157-4B17-FABA-4523-B0D105E7260F,InstallSource
<%InstallSource%>

F68AA157-4B17-FABA-4523-B0D105E7260F,Publisher
<%Company%>

F68AA157-4B17-FABA-4523-B0D105E7260F,QuietUninstallString
{<%Uninstaller%> -S}

F68AA157-4B17-FABA-4523-B0D105E7260F,Readme
<%ProgramReadme%>

F68AA157-4B17-FABA-4523-B0D105E7260F,RegistryKeyName
<%ApplicationID%>

F68AA157-4B17-FABA-4523-B0D105E7260F,URLInfoAbout
<%ApplicationURL%>

F68AA157-4B17-FABA-4523-B0D105E7260F,URLUpdateInfo
<%ApplicationURL%>

F68AA157-4B17-FABA-4523-B0D105E7260F,UninstallString
<%Uninstaller%>

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,Active
Yes

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,Component
{}

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,Conditions
{}

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ConsoleTitle
{<%AppName%> Setup}

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ExecuteAction
{After Pane is Displayed}

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ExecuteAsRoot
No

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ExecuteInConsole
No

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ID
{}

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,IgnoreErrors
No

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,IncludeStderr
No

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ProgramCommandLine
<%ProgramExecutable%>

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ProgressiveOutputWidget
{}

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ResultVirtualText
ExternalProgramResult

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,ShowProgressiveOutput
No

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,StatusVirtualText
ExternalProgramStatus

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,WaitForProgram
No

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,WatchProgressiveOutput
No

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,WatchRegularExpression
{^:([^ ]+) (.*):$}

F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23,WorkingDirectory
<%InstallDir%>

FC32BEF7-192F-A3D5-C190-6F5BDF2B783E,Active
Yes

FC32BEF7-192F-A3D5-C190-6F5BDF2B783E,Alias
{Finish Actions}

FC32BEF7-192F-A3D5-C190-6F5BDF2B783E,Conditions
{0 conditions}

FC32BEF7-192F-A3D5-C190-6F5BDF2B783E,ID
{}

FreeBSD-4-x86,Active
No

FreeBSD-4-x86,DefaultDirectoryPermission
0755

FreeBSD-4-x86,DefaultFilePermission
0755

FreeBSD-4-x86,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

FreeBSD-4-x86,FallBackToConsole
Yes

FreeBSD-4-x86,InstallDir
<%Home%>/<%ShortAppName%>

FreeBSD-4-x86,InstallMode
Standard

FreeBSD-4-x86,InstallType
Typical

FreeBSD-4-x86,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

FreeBSD-4-x86,ProgramFolderAllUsers
No

FreeBSD-4-x86,ProgramFolderName
<%AppName%>

FreeBSD-4-x86,ProgramLicense
<%InstallDir%>/LICENSE.txt

FreeBSD-4-x86,ProgramName
{}

FreeBSD-4-x86,ProgramReadme
<%InstallDir%>/README.txt

FreeBSD-4-x86,PromptForRoot
Yes

FreeBSD-4-x86,RequireRoot
No

FreeBSD-4-x86,RootInstallDir
/usr/local/<%ShortAppName%>

FreeBSD-x86,Active
No

FreeBSD-x86,DefaultDirectoryPermission
0755

FreeBSD-x86,DefaultFilePermission
0755

FreeBSD-x86,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

FreeBSD-x86,FallBackToConsole
Yes

FreeBSD-x86,InstallDir
<%Home%>/<%ShortAppName%>

FreeBSD-x86,InstallMode
Standard

FreeBSD-x86,InstallType
Typical

FreeBSD-x86,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

FreeBSD-x86,ProgramFolderAllUsers
No

FreeBSD-x86,ProgramFolderName
<%AppName%>

FreeBSD-x86,ProgramLicense
<%InstallDir%>/LICENSE.txt

FreeBSD-x86,ProgramName
{}

FreeBSD-x86,ProgramReadme
<%InstallDir%>/README.txt

FreeBSD-x86,PromptForRoot
Yes

FreeBSD-x86,RequireRoot
No

FreeBSD-x86,RootInstallDir
/usr/local/<%ShortAppName%>

HPUX-hppa,Active
No

HPUX-hppa,DefaultDirectoryPermission
0755

HPUX-hppa,DefaultFilePermission
0755

HPUX-hppa,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

HPUX-hppa,FallBackToConsole
Yes

HPUX-hppa,InstallDir
<%Home%>/<%ShortAppName%>

HPUX-hppa,InstallMode
Standard

HPUX-hppa,InstallType
Typical

HPUX-hppa,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

HPUX-hppa,ProgramFolderAllUsers
No

HPUX-hppa,ProgramFolderName
<%AppName%>

HPUX-hppa,ProgramLicense
<%InstallDir%>/LICENSE.txt

HPUX-hppa,ProgramName
{}

HPUX-hppa,ProgramReadme
<%InstallDir%>/README.txt

HPUX-hppa,PromptForRoot
Yes

HPUX-hppa,RequireRoot
No

HPUX-hppa,RootInstallDir
/usr/local/<%ShortAppName%>

Linux-x86,Active
Yes

Linux-x86,DefaultDirectoryPermission
0755

Linux-x86,DefaultFilePermission
0755

Linux-x86,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

Linux-x86,FallBackToConsole
Yes

Linux-x86,InstallDir
<%Home%>/<%ShortAppName%>

Linux-x86,InstallMode
Standard

Linux-x86,InstallType
Typical

Linux-x86,ProgramExecutable
<%InstallDir%>/chronojump-<%InstallVersion%>/linux/chronojump.sh

Linux-x86,ProgramFolderAllUsers
No

Linux-x86,ProgramFolderName
<%AppName%>

Linux-x86,ProgramLicense
<%InstallDir%>/LICENSE.txt

Linux-x86,ProgramName
{}

Linux-x86,ProgramReadme
<%InstallDir%>/README.txt

Linux-x86,PromptForRoot
Yes

Linux-x86,RequireRoot
No

Linux-x86,RootInstallDir
/usr/local/<%ShortAppName%>

MacOS-X,Active
No

MacOS-X,DefaultDirectoryPermission
0755

MacOS-X,DefaultFilePermission
0755

MacOS-X,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

MacOS-X,FallBackToConsole
Yes

MacOS-X,InstallDir
<%Home%>/<%ShortAppName%>

MacOS-X,InstallMode
Standard

MacOS-X,InstallType
Typical

MacOS-X,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

MacOS-X,ProgramFolderAllUsers
No

MacOS-X,ProgramFolderName
<%AppName%>

MacOS-X,ProgramLicense
<%InstallDir%>/LICENSE.txt

MacOS-X,ProgramName
{}

MacOS-X,ProgramReadme
<%InstallDir%>/README.txt

MacOS-X,PromptForRoot
Yes

MacOS-X,RequireRoot
No

MacOS-X,RootInstallDir
/usr/local/<%ShortAppName%>

Solaris-sparc,Active
No

Solaris-sparc,DefaultDirectoryPermission
0755

Solaris-sparc,DefaultFilePermission
0755

Solaris-sparc,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

Solaris-sparc,FallBackToConsole
Yes

Solaris-sparc,InstallDir
<%Home%>/<%ShortAppName%>

Solaris-sparc,InstallMode
Standard

Solaris-sparc,InstallType
Typical

Solaris-sparc,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

Solaris-sparc,ProgramFolderAllUsers
No

Solaris-sparc,ProgramFolderName
<%AppName%>

Solaris-sparc,ProgramLicense
<%InstallDir%>/LICENSE.txt

Solaris-sparc,ProgramName
{}

Solaris-sparc,ProgramReadme
<%InstallDir%>/README.txt

Solaris-sparc,PromptForRoot
Yes

Solaris-sparc,RequireRoot
No

Solaris-sparc,RootInstallDir
/usr/local/<%ShortAppName%>

TarArchive,Active
No

TarArchive,CompressionLevel
6

TarArchive,DefaultDirectoryPermission
0755

TarArchive,DefaultFilePermission
0755

TarArchive,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

TarArchive,FallBackToConsole
Yes

TarArchive,InstallDir
<%Home%>/<%ShortAppName%>

TarArchive,InstallMode
Standard

TarArchive,InstallType
Typical

TarArchive,OutputFileName
<%ShortAppName%>-<%Version%>.tar.gz

TarArchive,ProgramExecutable
{}

TarArchive,ProgramFolderAllUsers
No

TarArchive,ProgramFolderName
<%AppName%>

TarArchive,ProgramLicense
<%InstallDir%>/LICENSE.txt

TarArchive,ProgramName
{}

TarArchive,ProgramReadme
<%InstallDir%>/README.txt

TarArchive,PromptForRoot
Yes

TarArchive,RequireRoot
No

TarArchive,RootInstallDir
/usr/local/<%ShortAppName%>

TarArchive,VirtualTextMap
{<%InstallDir%> <%ShortAppName%>}

Windows,Active
Yes

Windows,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

Windows,IncludeTWAPI
No

Windows,InstallDir
<%PROGRAM_FILES%>/<%AppName%>

Windows,InstallMode
Standard

Windows,InstallType
Typical

Windows,ProgramExecutable
<%InstallDir%>/chronojump-<%InstallVersion%>/windows/chronojump.bat

Windows,ProgramFolderAllUsers
No

Windows,ProgramFolderName
<%AppName%>

Windows,ProgramLicense
<%InstallDir%>/LICENSE.txt

Windows,ProgramName
{}

Windows,ProgramReadme
<%InstallDir%>/README.txt

Windows,WindowsIcon
{Setup Blue Screen.ico}

ZipArchive,Active
No

ZipArchive,CompressionLevel
6

ZipArchive,DefaultDirectoryPermission
0755

ZipArchive,DefaultFilePermission
0755

ZipArchive,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

ZipArchive,FallBackToConsole
Yes

ZipArchive,InstallDir
<%Home%>/<%ShortAppName%>

ZipArchive,InstallMode
Standard

ZipArchive,InstallType
Typical

ZipArchive,OutputFileName
<%ShortAppName%>-<%Version%>.zip

ZipArchive,ProgramExecutable
{}

ZipArchive,ProgramFolderAllUsers
No

ZipArchive,ProgramFolderName
<%AppName%>

ZipArchive,ProgramLicense
<%InstallDir%>/LICENSE.txt

ZipArchive,ProgramName
{}

ZipArchive,ProgramReadme
<%InstallDir%>/README.txt

ZipArchive,PromptForRoot
Yes

ZipArchive,RequireRoot
No

ZipArchive,RootInstallDir
/usr/local/<%ShortAppName%>

ZipArchive,VirtualTextMap
{<%InstallDir%> <%ShortAppName%>}

}


proc RaiseStep { wizard id } {
set widget [$id widget get Caption]
if {$widget ne ""} {
if {![string length [::InstallJammer::GetText $id Caption]]} {
grid remove $widget
} else {
grid $widget
}
}

set widget [$id widget get Message]
if {$widget ne ""} {
if {![string length [::InstallJammer::GetText $id Message]]} {
grid remove $widget
} else {
grid $widget
}
}

set widget [$id widget get ClientArea]
if {$widget ne ""} {
grid configure $wizard.buttons -pady {18 5}
} else {
grid configure $wizard.buttons -pady 5
}
}

proc CreateWindow.StartCopyingFiles {wizard id} {
    CreateWindow.CustomTextPane1 $wizard $id

    set text [$id widget get Text]
    $text configure -bg [style configure . -background]
}

proc CreateWindow.CopyFiles {wizard id} {
    CreateWindow.CustomBlankPane2 $wizard $id

    set base [$id widget get ClientArea]

    grid rowconfigure    $base 0 -weight 1
    grid columnconfigure $base 0 -weight 1

    set frame [frame $base.frame]
    grid $frame -row 0 -column 0 -sticky new

    grid rowconfigure    $frame 1 -weight 1
    grid columnconfigure $frame 0 -weight 1

    Label $frame.file -anchor w -elide 1 -ellipsis {[...]} -elideside center
    grid  $frame.file -row 0 -column 0 -sticky new -padx [list 0 10]
    $id widget set FileLabel -widget $frame.file

    ttk::progressbar $frame.progress
    grid $frame.progress -row 1 -column 0 -sticky ew
    $id widget set ProgressValue -widget $frame.progress -type progress
}

proc CreateWindow.SelectDestination {wizard id} {
    variable info

    CreateWindow.CustomBlankPane2 $wizard $id

    set base [$id widget get ClientArea]

    set varName [$id get VirtualText]

    grid rowconfigure    $base 0 -weight 1
    grid columnconfigure $base 0 -weight 1

    labelframe $base.frame -relief groove -bd 2
    grid $base.frame -row 0 -column 0 -sticky sew
    $id widget set DestinationLabel -widget $base.frame

    grid rowconfigure    $base.frame 0 -weight 1
    grid columnconfigure $base.frame 0 -weight 1

    Label $base.frame.destination -anchor nw -textvariable ::info($varName)  -elide 1 -elideside center -ellipsis {[...]}
    grid  $base.frame.destination -row 0 -column 0 -sticky ew -padx 5 -pady 3

    Button $base.frame.browse -command  [list ::InstallAPI::PromptForDirectory -virtualtext $varName]
    grid $base.frame.browse -row 0 -column 1 -sticky nw -padx 5 -pady [list 0 5]
    $id widget set BrowseButton -widget $base.frame.browse
}

proc CreateWindow.SetupComplete {wizard id} {
    CreateWindow.CustomBlankPane1 $wizard $id
}

proc CreateWindow.Welcome {wizard id} {
    CreateWindow.CustomBlankPane1 $wizard $id
}

proc CreateWindow.CustomTextPane1 {wizard id} {
    CreateWindow.CustomBlankPane2 $wizard $id

    set base [$id widget get ClientArea]

    grid rowconfigure    $base 0 -weight 1
    grid columnconfigure $base 0 -weight 1

    frame $base.frame
    grid  $base.frame -row 0 -column 0 -sticky news
    
    grid rowconfigure    $base.frame 0 -weight 1
    grid columnconfigure $base.frame 0 -weight 1

    if {![$id get TextFont font]} { set font TkTextFont }

    text $base.frame.text  -bg white -font $font -wrap word -highlightthickness 0  -yscrollcommand "$base.frame.vs set"  -xscrollcommand "$base.frame.hs set"
    grid $base.frame.text -row 0 -column 0 -sticky news
    $id widget set Text -widget $base.frame.text

    ttk::scrollbar $base.frame.vs -command "$base.frame.text yview"
    grid $base.frame.vs -row 0 -column 1 -sticky ns

    ttk::scrollbar $base.frame.hs -command "$base.frame.text xview"  -orient horizontal
    grid $base.frame.hs -row 1 -column 0 -sticky ew
}

proc CreateWindow.CustomBlankPane2 {wizard id} {
    set base  [$wizard widget get $id]
    set frame $base.titleframe

    grid rowconfigure    $base 3 -weight 1
    grid columnconfigure $base 0 -weight 1

    frame $frame -bd 0 -relief flat -background white
    grid  $frame -row 0 -column 0 -sticky nsew

    grid rowconfigure    $frame 1 -weight 1
    grid columnconfigure $frame 0 -weight 1

    Label $frame.title -background white -anchor nw -justify left -autowrap 1  -font TkCaptionFont -textvariable [$wizard variable $id -text1]
    grid $frame.title -row 0 -column 0 -sticky new -padx 5 -pady 5
    $id widget set Title -widget $frame.title

    Label $frame.subtitle -background white -anchor nw -autowrap 1  -justify left -textvariable [$wizard variable $id -text2]
    grid $frame.subtitle -row 1 -column 0 -sticky new -padx [list 20 5]
    $id widget set Subtitle -widget $frame.subtitle

    label $frame.icon -borderwidth 0 -background white -anchor c
    grid  $frame.icon -row 0 -column 1 -rowspan 2
    $id widget set Icon -widget $frame.icon -type image

    Separator $base.separator -relief groove -orient horizontal
    grid $base.separator -row 1 -column 0 -sticky ew 

    Label $base.caption -anchor nw -justify left -autowrap 1  -textvariable [$wizard variable $id -text3]
    grid $base.caption -row 2 -sticky nsew -padx 8 -pady [list 8 4]
    $id widget set Caption -widget $base.caption

    frame $base.clientarea
    grid  $base.clientarea -row 3 -sticky nsew -padx 8 -pady 4
    $id widget set ClientArea -widget $base.clientarea -type frame

    Label $base.message -anchor nw -justify left -autowrap 1  -textvariable [$wizard variable $id -text4]
    grid $base.message -row 4 -sticky nsew -padx 8 -pady [list 4 8]
    $id widget set Message -widget $base.message
}

proc CreateWindow.CustomBlankPane1 {wizard id} {
    set base [$wizard widget get $id]

    grid rowconfigure    $base 1 -weight 1
    grid columnconfigure $base 1 -weight 1

    label $base.image -borderwidth 0
    grid  $base.image -row 0 -column 0 -rowspan 2 -sticky nw
    $id widget set Image -type image -widget $base.image

    Label $base.title -height 3 -bg white -font TkCaptionFont  -autowrap 1 -anchor nw -justify left
    grid $base.title -row 0 -column 1 -sticky ew -padx 20 -pady [list 20 10]
    $id widget set Caption -type text -widget $base.title

    Label $base.message -bg white -autowrap 1 -anchor nw -justify left
    grid  $base.message -row 1 -column 1 -sticky news -padx 20
    $id widget set Message -type text -widget $base.message

    Separator $base.sep -orient horizontal
    grid $base.sep -row 2 -column 0 -columnspan 2 -sticky ew
}


array set ::InstallJammer::files {files.tcl {proc ::InstallJammer::InitFiles {} {
File ::E8F5A846-2BA2-E453-2411-41458B874846 -name chronojump-0.6.2.6 -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6 -size 4096 -mtime 1207237521 -filemethod "Update files with more recent dates"
File ::15192365-9824-3B16-A59E-09FCFFE62F43 -name data -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::EE0A8EBF-A025-6ED1-FD8F-8F52BF4D20CF -name chronojump.prg -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 1845248 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::9FF93A40-3107-0F44-C71C-8149A569951C -name chronojump.prg.mdb -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 307665 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::277B2C35-3932-1D72-494A-495B4416D1E6 -name chronojump_mini.prg -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 26624 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::D4A5EEF9-AA4D-DD2B-0D0E-FC6213AEC522 -name chronojump_mini_validate.prg -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 27136 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::4C56BA3C-E459-B607-05F1-CB7082E222B3 -name NPlot.dll -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 147968 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9512F366-4B36-1603-3F6F-4E81D98002E8 -name NPlot.dll.config -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 307 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::0BF3C4E6-E25B-F980-E24B-B2197410DADD -name NPlot.Gtk.dll -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 8704 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A45680D5-F90D-A338-A4A4-D9625B35CFC3 -name NPlot.Gtk.dll.config -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 307 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::AB91FADA-1BA2-A4F5-4926-BC9413338997 -name readreg.bat -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 3731 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::7963240F-1A45-FCB4-C28F-1A209FDE73E1 -name sqlite3.dll -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 362029 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::B69BE624-9CAF-7EA9-F4D0-45243002E1A8 -name version.txt -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data -size 8 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A7536604-4267-2401-E453-EBEDCF042547 -name linux_dlls -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/linux_dlls -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1F44BEA5-C652-C43C-D01E-0B51DA36F197 -name NPlot.dll -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/linux_dlls -size 147968 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A35E9E42-F6D5-354D-E227-7FE7ABD6C9DF -name NPlot.dll.config -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/linux_dlls -size 307 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::9476D7FD-0055-8DF6-39F2-5A95F0F29F52 -name NPlot.Gtk.dll -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/linux_dlls -size 8704 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::8F56D159-7A3B-17F9-EC38-A90CC2B5052C -name NPlot.Gtk.dll.config -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/linux_dlls -size 307 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::026132DC-7AD8-1B59-9569-04009FEC5C6C -name locale -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9B441FCA-B2A2-C0D5-5664-01516ADBEE3C -name ar -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9A4C5BA4-2431-7A6A-2AF0-971B046F3DF4 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F8C6F230-E4CF-3AF3-1DA6-86245823BF9E -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn -size 241 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B6FAAA87-D33B-7402-A0AD-D0FD3ADF0BEF -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9527A6FF-FE19-A5FD-680E-CA4F8D3485E4 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::FEFF22E5-51D4-3E35-5840-70DC0859B633 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::DA4F8A37-35AB-6B84-C35A-B66D50291588 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A3810B1F-E846-FE98-600B-8BDB83C44494 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::E82F84E1-9BBC-4834-7C34-B38D5472877A -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::EA580AB2-3DEB-F134-1DAC-59F269A1C418 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::5AAD5259-F11D-0E6C-D6F0-34B5A6A884AE -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::7EC102AC-EA4F-60E7-33C0-26727596B269 -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::8D2C9EDA-AF60-285D-0E33-A705A59F291C -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES -size 2067 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::5505C9D9-23C2-4F72-4D80-C32C0154DB67 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0FE65735-6606-BC1F-25A6-CE4CEA081CC4 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn -size 372 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7B572493-F0BA-FCC8-80EE-3116776C8229 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::C7632D80-6D14-7A2A-3947-12A585059336 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::CA1DFBE8-4648-EF6B-08EE-34D96760944A -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::C74BA06E-945D-E977-A77F-B9879866BFB0 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::E4FE3672-823D-FB69-6C83-31CBF57187AF -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::86EE23AF-4BD4-6DFD-23CA-995D099FE2A2 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/text-base -size 2067 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::88502DEC-C98D-C124-03E6-3EBD9A3614DF -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::2C2CAA0B-555F-BCA3-E084-AA44A6508826 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::87694CAE-C8F4-F4D1-0D7B-D338564FFBC0 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3356017A-9854-9115-537F-BC184C7AE2EF -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ar/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::64F8E079-7CB2-8E70-5DC1-04690E79066B -name ca -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::20A845CA-D6D1-0760-8143-449595DE126C -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::900D54A9-3D7C-2780-D830-FF3FF8FDC3D3 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn -size 241 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::6AC27F0A-0AA8-C91F-4B49-9ACCE3B2D5DC -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::DB1E8D67-324F-F1B3-28AC-5BFDD2BD4F40 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::3F24DAE7-C4E4-B961-ECDF-5C22737C1F30 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A0DC7B29-1DDF-EC41-D420-99DA1C807645 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::30C310F5-1333-FD44-0D73-7BD04988E090 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::B0887385-1806-60A8-2112-492058E96965 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1AD4B9DD-B2FA-D3D5-1289-26C5546F3520 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::C8E80CB3-5E27-0E95-8482-25222F5B7FDF -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::30F0FC21-379A-24C2-A3CF-D0A35C4B552C -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::8E9690A6-BA18-0BBB-9AAE-57285DDC520F -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES -size 54592 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4853BB3D-D7EF-9194-4941-06787540432C -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::5148343B-939B-4749-6A82-541CAA70D88E -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn -size 375 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::AE6FD214-CC2F-C9D3-F93E-645268B439A7 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::652DE929-A651-451D-07F6-68A707E3FCB7 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::11298053-7FCF-0C1B-7BDB-D58AAF5B39EA -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::CD54266C-43C2-380F-D396-8FBC09B46500 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::EDCD2743-303E-E03C-4F09-94317E0043BF -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4B210966-FD8C-599D-FAC8-BC81B68CFFC1 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/text-base -size 54592 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::031597D2-857B-E96C-F72F-8779FBCDD10E -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::196A3299-3E31-63CD-91BE-41835A67E124 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::39E08D70-B1D4-1827-4C32-998423FD5BFC -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4DB4B164-E7BB-E55A-5FD9-30020FF24A10 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/ca/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::81BBA58E-2EF9-044B-4FA1-E08736F86BC1 -name dz -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::DAD8B2A6-8B6C-18F6-B710-6C1406AE18BF -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::2B3B78CB-FBC1-0BE5-63A6-BE954236018C -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn -size 241 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::381A21C6-60A3-16E6-10F4-0374F9F6A405 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::146CA690-C9DA-0D6B-1291-F325137D2112 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::989B6773-56BA-1361-F5A0-D2B48FDA61D5 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::E8C45052-50EE-B72E-1303-441167AA44F3 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::EEE21838-A366-21F1-1F9E-CA4CDFB8B48C -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::5095C6CD-EA13-52C8-A500-3F9405AB14F6 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::94A3D7E4-ADA6-D5AA-E97D-910BB11BCD1E -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::39A5767D-FB90-604C-CE8E-6F7F28000FD4 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::5C5C8C13-46F9-A13A-8AE0-01B6C00D0634 -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::E1DEA92D-9419-397E-8744-EFCDC3321586 -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES -size 71911 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::879CC222-DAAE-1726-34EF-2055A8FD9BD3 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::2FDB29B7-76E9-BF0D-A04F-2D0EB227B2A9 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn -size 372 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::663E2A87-F086-6108-CC7B-2B7D05ADB236 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::B723F100-79B5-18E9-4995-CC8DB31F7367 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::27305001-C426-E4AD-0651-04C1CF4621AD -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::12F7F41F-5B9E-D957-7093-839FEEA38E88 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::78F0C342-FC49-4F81-6A61-5ABD1E763F82 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::FECD11F2-02CD-CCC5-D832-C5D01E4EE9E8 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/text-base -size 71911 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::FFBD90BA-96E9-B0C5-24B3-6D3B44ED00F7 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1A6CA0C4-F6C8-FA87-CFCF-745FB02704D1 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::98170923-5B85-DA11-6E44-847156871B2A -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::2DB81954-B93A-6BFC-8C3F-62B34A8F0F32 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/dz/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::503959AC-CD7F-1093-8CE2-E149C2DAB9AC -name en_GB -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1FF4FAC4-89FC-5847-8A27-F89E1ED8F135 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::7941E7BC-1B1A-686F-9892-FCEFCE70D09D -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn -size 292 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A3E00D9E-CFDE-04F3-3F9F-47224FA8AD3D -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::BC8CFACF-4B9B-BB61-34AE-A8FBEA619A59 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::07465F8C-994F-1657-BF9E-3091DA06E563 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::FEEA15F6-2BE4-1210-A8A9-617883521CE1 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::242C5077-2536-D063-E55B-71574FFEC40A -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::0D66834C-8A48-8B09-1405-891CFAD2FBF0 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::B222B19E-A1A2-B4C4-9F08-832730DEB548 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::DD212125-273B-66B3-DF0C-EBCD8F5802ED -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4D68AF64-051F-A628-D307-7B48A88578D5 -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::AC4D55B1-B88D-03C1-9B9F-A38DEDA0E509 -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES -size 36798 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::8B88BE24-45C4-83FE-B393-2AF66CBF33C6 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::53F15978-FCBB-DF96-815D-516522123F02 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn -size 423 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::10145D60-513D-19E4-05FA-F863CA757D84 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::0F4A3D6E-8D1E-C85B-C8BE-446510DC3E70 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::64AE6426-7CF1-E4E0-DD2E-AAD649E7AE45 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::92019609-DB89-FC59-E79B-733EF03C6330 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::D417B10C-F960-309A-2A16-14CC6C813981 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::7CB9F00E-4564-94E5-CFC8-0F3EBFA25AF7 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/text-base -size 36798 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::D1EE1677-AE2D-8E06-80A7-ED9A8DEBC01E -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::70A06C2F-CEC1-F051-5DB4-64D940EAD636 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::883A5C78-4625-FC60-45B5-72265C6184E3 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::6CD4F267-2C4E-025D-4767-923A824BC43B -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/en_GB/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::9A02969B-7BC6-202A-3647-BDD25F9781A9 -name es -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::297C97BE-9081-35F6-4843-2F5B3E853291 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4BF22DA2-27C9-8538-3DA2-37E463854DE7 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn -size 289 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::3AA25877-6B0A-E96A-84E9-875F9CDD3154 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::72361BAC-217F-257F-37FE-BDD93F297DA5 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::175D8E7F-2C63-903B-86DC-B306A8E36566 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1C256D11-FB8A-E3EF-A1E5-492AF2896611 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::FA0A1745-7F72-BF23-FE3C-4A18F8A9C16D -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4E1571A2-6255-A5FA-1B35-1D2DA40288EA -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::C40874C2-63C9-F887-F857-B2D8BC1CB961 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::316D9A81-91A4-4039-EB23-63FC7C2B36D7 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::816610E1-83CB-930B-CE86-EA1222D3AD81 -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::67C1D29F-26EA-7B50-CBE6-1BF077361AA8 -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES -size 59261 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::64F57E0D-B64C-26BE-7821-61E57DE04564 -name es.po -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES -size 56514 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::3EC09563-4BFE-736B-4F43-B0010056FA87 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A1096863-3874-5491-EB35-8F05C0FE20AB -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn -size 542 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::6DCB2B76-4833-43F9-A689-54CAA704B4C2 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::2C9A2207-7ABC-ADA5-D4AB-FA9539C965A1 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::CD81EF29-8F15-C2D1-4842-146BDBE52285 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::990EF9E4-D009-67F0-36E3-755C25CDC120 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::81D9C0B0-25D8-D96A-7144-5777BB12E173 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::C3EE8C50-7668-5736-7169-4BE5084C26DF -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/text-base -size 59261 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::48F9EAEC-9444-5B0C-20B5-248321991462 -name es.po.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/text-base -size 56514 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::5AA53B6B-40F0-280A-F8CC-A9393ECD1F8A -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::5C736AFF-4E43-D49F-980B-C7604578A541 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::51D7575A-8EBE-E310-4F52-756AE44E24DA -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::3146EFAF-6770-059B-47D8-DAD94218F82F -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/es/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::0062D08C-682B-0322-F27F-9F4A9801CC03 -name fi -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::42EED29C-27C7-36E1-94F1-27F71167EF2F -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::7ED40D06-E513-2A96-CE5C-E25791D5E82F -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn -size 289 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::BF6B5A02-1853-A2D5-D6B4-B7D7E411F2BE -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4FD480FF-295D-3366-0BAA-D51518BEA729 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::C1E52A66-4D0A-C052-978E-2EC123518979 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::AC202185-10A2-FA6E-51C5-2EECC2B7F401 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::D53693D6-73D2-6FD2-7822-75D26F5F1C28 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::2042A9B1-3413-DE9F-6EE5-2E0AB8B7D93B -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::7564ABD8-2085-C6A6-2B58-4C75D4E6E257 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4298EA0F-0FE8-5133-56DC-E50482077728 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::B5B9E3CE-B1AD-7455-FA6B-7717E9F5BA9E -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::20A33EB3-E4EC-A854-5672-9B8A533A8652 -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES -size 33608 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::2567FC74-3D16-F562-9421-D01395F4B02D -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::82243E74-CEBA-E4D7-2060-04DDE8FF9C5B -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn -size 420 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::9BA63BC9-EE10-708B-BC89-70A08D0400AF -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::CEF20302-99C5-2826-A72D-00C49B2FA136 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::AEB8B1AF-F0A7-0BDD-A47F-7938322A4AA0 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::7904D0B5-E756-F534-9A80-1CC42066393C -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::24608D68-AEDB-81FE-0381-2216D3603EF1 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::EFFBE085-8100-A426-5698-04AB70436437 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/text-base -size 33608 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4A5270FB-5F6F-51D6-78AE-30C97B0B880D -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::850A9399-32E7-1E97-150B-74D0B7284A53 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::EC1C69FA-A7CF-4EEC-66BF-59A31DA3D675 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::BA572494-780B-912B-A954-EAD8878B8815 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fi/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::FB645AD0-F4F1-5470-F538-C1C0DC488942 -name fr -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::43B760B1-7C23-C918-710E-1CC28E9BB881 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::E9F11C64-DEF4-D5C7-E7B9-588A85631428 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn -size 289 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::5AD692D8-55B9-2BAB-ACDB-F8D18CD50A03 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B815A4AD-B409-3592-7306-418AC241A88B -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::19B74673-5178-B662-6A2C-C51F7AE0CB8B -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::5DB3DC3A-FDF7-DAB4-12FB-175AC2039C20 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1F7848AE-2FE8-A619-CD1A-0D8980574808 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9000D823-C9DC-254B-970C-4B19A9F296BD -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::39AEE7A5-BD76-3F72-4DCB-844C4D206ED9 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::83D7E4B3-FB6F-419D-E355-34C1E5CBF9B0 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::EFF8A114-2678-8521-61C4-FA52A5861452 -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::A51DE262-90FB-721C-CE15-0EB06F736F7D -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES -size 56213 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DD302E03-8E2C-A8CB-0419-7162D0A9F029 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B57DB001-272C-96B0-0139-B1B9CA55EACF -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn -size 423 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F2BB90DD-A1C6-81C1-5FFD-366036C48C03 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B1F7E990-8101-CC9B-6136-B34A1A826BA9 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::44E455DB-9216-24A4-0D51-5D703F1D4AFE -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3B6E4F95-2A55-4018-31C1-0A55253E5D2B -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::532A81D1-E00E-84D9-FC87-0E20A18EF1D2 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::30A4F13B-7587-6184-5E50-8DFF3931153F -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/text-base -size 56213 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3FCF11F5-E802-A6BE-8F87-7EC3EED246A2 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B96B9EAE-C6EF-4CF7-60BC-96EDBAB9F22F -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B5B42C8C-8052-0F8D-BBD5-0154C5B8B49C -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::41864983-EFF5-4E03-B7BF-3D6CA447635E -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/fr/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D9F1ABE7-83EC-66C3-E3B0-90ED64970BDB -name nb -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/nb -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::BA1D8AAA-E4AA-36FC-A6F8-84EDBE7B8C49 -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/nb/LC_MESSAGES -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D7BFCC52-F884-02AF-04DA-EFF545BB3629 -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/nb/LC_MESSAGES -size 1836 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0E4E2F5D-6F87-1742-2AA8-C03F8ADA70E4 -name oc -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::479B98F0-E204-A4E4-C81B-A3EC0B212C37 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::56DE8ACE-A0BE-76DE-CAAC-52F9D9A95B23 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn -size 241 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::0AE6D828-3448-3B21-E603-2072746EAC2F -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::F323C416-FEF2-0E35-5B5F-43C906C11656 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::FB5A441E-0576-B079-B60F-40CF95460B65 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::0A7C91E9-BE6D-4307-306A-B7F90019ADA5 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::CC97DB93-9273-D8A6-7F44-EF9927225CC1 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::6B9E094F-A2E7-B4E3-F08F-50BF86F11B30 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4889AF5D-1C86-6C42-3151-323181DD37DB -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::40D09926-0115-447C-2148-B9F3A892A2FA -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::DC31E547-9E6F-CD3A-327C-BAB00C287C9E -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::648EF1EA-9BC3-B3EE-979E-BCED7AA8AB33 -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES -size 4142 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1AD79B85-8395-4F23-44D0-7C32416A37B6 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::6AC607B4-57BE-3269-86FF-A96B2AB15CF8 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn -size 375 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::36D5C297-B657-5B8A-0F9C-28C5251E5B2F -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::C1950792-35C5-F6BE-1E65-6BBD409DD8FD -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::238DD0EA-2183-4F20-C7B5-9CFA7B5D348C -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1B932387-497A-63EC-3E17-735C822E6320 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::26EBBA5E-5C13-C938-6C9E-F43722206833 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::7C118F33-10D5-EA53-BE75-5C9A42BDD302 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/text-base -size 4142 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::73B1D4FA-7E70-8513-571D-3B55414B21FE -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A50775A5-34AE-E0AE-A72B-714202C004B0 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::9F442485-DA0E-3498-800D-898FA249D7E6 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::BE99BE40-C471-3902-8ACD-CEFF716FC4B7 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/oc/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::452EE186-EDA4-2A80-C5E3-93BE3411936B -name pt -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::91325E5F-9621-8A61-4155-FCD379FE3FD6 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B80478CB-0F91-7DDE-95AF-41F5371039D0 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn -size 241 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::6F3BF2D9-7F12-5FEB-770D-2A0ED199FF66 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DC3A33B4-950D-FA85-2964-E29DF1C75FD0 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::659B80AC-DD86-EB3E-ED55-E3216693CC9C -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::24F21F88-D234-BDE9-16D2-377A580A91AB -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::CA77997E-B45D-E298-ECE2-A72C2A7D1415 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DF861F20-CBB7-7735-C488-AB67AE37E302 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::CD265B8B-2637-F04E-7A32-C4127F1D082C -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9244BC58-619A-EE6C-D1CB-87D7C59062D3 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::479F2397-8CF4-AB79-3082-8BB77A70EF4B -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::BD569BA1-A3B4-AEFE-DA2F-84DE487AF952 -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES -size 37538 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::613CDE58-1FF0-F8A5-B57A-E0E10AB5B772 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::AA402221-4D2E-4273-3EFA-0616A2FB9A1C -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn -size 372 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B06AFE13-818D-49AC-5807-4703880FFA52 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::80F20851-CB0D-E40F-8EB3-BC4729CA53F1 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::549383BD-17FB-516A-8293-2E9BC4F1AB5B -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9931B459-DAB7-90AB-B5DF-9AC90FE0EEC6 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::FC2A7295-7B5D-081B-3EC7-1E6B7BFEB19F -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::CF704F73-CC42-CF3C-53BF-39515D9D3029 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/text-base -size 37538 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B2E3F008-E489-5153-E9C8-855FEA18864C -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::15F5AFEE-50E2-F471-3522-DD9344839431 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B75ACAF2-2399-1228-2498-B18F8A64AE82 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::84FE0D27-BFFC-0F94-C930-F34F3DA960B3 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B4A7DEF7-77E0-C019-2D85-8B7712ADF5D1 -name pt_BR -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::44778727-831F-8DE7-3863-8A147762CFDF -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3FE1B352-F539-647F-B650-F6767523FF07 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn -size 292 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::5625BAD3-C964-01EE-4841-1443F2C7C921 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::160CF82C-7F25-B0D5-E8A2-5352ECF4C35D -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F423E8A1-B478-6E04-11DD-57934F0874B0 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7E2FD362-BE9D-DDA5-0C39-372B7C73AA7B -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::61FFAFD8-4858-A95A-B48D-5AFB098E0961 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::622F5FB0-DE74-B643-577A-CB99CD633A23 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::49EEEADA-79A3-5D61-78D5-ADA2B9056FEE -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::96F4E1F3-F413-4374-EDD1-F8A1D74F4AAE -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::464EC636-CE68-DA27-0848-75A659DEC97D -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::947C3006-39B8-389A-0542-648F8992610E -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES -size 4855 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::A99B9CC3-199E-11A0-7C49-F02730138CDE -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::6F9D8731-2B09-A4BD-B732-27885173EB72 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn -size 423 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::BD817E73-BA80-8187-8CA2-DA1DC805FDC6 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::676A3678-DD4C-0555-776C-82ABA6548087 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9CA51DFA-C923-95AE-6624-E6C073870C5B -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::E35C4874-9383-04AA-F6B4-7B0B3DA3C3C4 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D3263574-9E74-5A28-9A7D-7EA0FD501085 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::4DC325DD-3DC6-E3B1-13A9-5857157DE284 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/text-base -size 4855 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::C8F9631A-E395-272D-FBCC-E48F3F654BEA -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D52CADE2-74F9-86D8-FDC3-5FCBAD9B4D2A -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F54D712F-B02D-65D0-9F0F-F170228115B9 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0B1FFFFC-2098-2516-D193-407A1004894E -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/pt_BR/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::62AC2CA4-4D83-7493-98B1-04A7ACB0C520 -name sv -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::731C76F4-86DA-9070-11D8-AB51094DA469 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::5333D8E8-5597-E404-FF22-B723FD9990BB -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn -size 289 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B168BA15-DE3B-3C45-28C9-59C108362B4E -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::11E80ED8-4BE8-A6C8-CF44-E1C5D50F2D9A -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::18FFCE5F-7452-C867-A553-31FB4C7C325B -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::977768AC-3341-4BAD-9469-770A5D76B2D5 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::C46D3B70-4A70-6135-A858-56C56E99BFC8 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::488E807A-35A8-B1AD-1DDA-DB0A05954AF1 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::74864C22-360B-D837-7F32-431297FD2F12 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::8C50B585-F2FC-7639-6485-FDADA8DB6C79 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D203EB7D-F479-1135-355E-BD8F4B21437C -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9FC86096-04AF-4307-FD81-10CAE01FF6A6 -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES -size 15332 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DA9D12F8-1909-E50B-A91B-85369F9B513E -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::6401A88C-761D-FF02-1D23-728863A321F8 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn -size 420 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::2785DE8F-080C-BB25-55F4-888CDE4FFFA0 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::BBD9A7B3-5F50-205F-DF19-F7325A8DA690 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9CB9FF57-C0F4-4249-6A97-6E475BC31D2E -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::48BFAEEA-E76E-D6FF-1CA5-FC49B305B6D4 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::20F74FAF-6BC3-1022-8AB6-270C9B59FCDC -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::082FBA25-9203-A790-9142-8E15A19615BE -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/text-base -size 15332 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::079B4CF1-86B6-5C3D-E5B1-22D28E19232A -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::E1BF8567-C983-BE1B-C462-56FF4CE5B6EB -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::BCB359C9-C519-E2FA-454B-0D8A53C811CA -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D78E9C05-786B-2584-4B59-DD0C109D1CF6 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/sv/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::5543C418-9C52-5E04-5D59-70037502792E -name vi -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::527773E6-F0DF-3A56-CD8E-17FEA0E7C109 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::25302F6F-6668-0499-AB1A-713FC23760D6 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn -size 289 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::FAF9DEF5-0700-286E-B15F-4138F68DF0EC -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F28F927E-493A-6819-706C-FCCD5DE5774A -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::85C728A5-2FA4-CE24-D827-3683F9EF7DAA -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::46AC5EF8-7159-69BA-DBF4-91D5F614C8B5 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::23FDC26D-0952-58F5-513A-F888EC923006 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F45CD727-EA9A-DC26-5290-7A0B74C7E16E -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::FD369C52-0235-002A-71AF-749C0160BDD3 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B00927BD-750A-C56C-8F69-6B3F56CDDAA6 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7D1C07CA-21FF-D6DE-D1CD-E890DF45B55F -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::052B27C2-E11B-DC68-3204-45F5B28A22EA -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES -size 38193 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1372F723-255E-1388-6FEA-6C805426AF15 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::CECAAD86-22B1-953F-C593-09BF2CF52299 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn -size 420 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::992323CC-D4A6-7613-600C-DB10CE40E863 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B2568390-23F4-6EB0-5A4C-65B01F4CB5CF -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::2BFFCDF1-1AFE-AD6D-BE20-352BAA6017B6 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::95C81AA3-8709-BD9D-F548-8847D7B9EBF3 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0E04EF04-B60E-C484-A4A8-928C31BF0AA9 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DEAE3993-0B57-B6D3-90C2-050221E06F2B -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/text-base -size 38193 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::A0E05B0B-8771-B898-2E99-53032E0BADDE -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::8094C4C1-2E69-5375-CD61-902E68839678 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::E7C09603-264D-FFC4-55AC-4980A8CA6B66 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D70FCF95-93B9-C19D-4DA1-17CB64D69922 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/vi/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::75347817-8A6D-F10E-5CE6-5043088B05FA -name zh_CN -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F386087E-0D9D-029A-3F89-9702E657C1AB -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F0779B8B-8F44-94F9-6F5E-10E7481A10F7 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn -size 292 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3DBDDDE3-AB13-AF0F-DAEA-8D8EF31F8E77 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::2A627F45-67FF-5A06-7E70-294061FE38E1 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1353DDDB-341E-FDB3-240E-58551C9160B6 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1DC40AB8-41C1-759F-4894-F8169BE432B2 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7ECE3237-9A15-97FA-1F61-0CD3719825A5 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7C0F46E8-7D13-57A0-6EE2-A87C00F02611 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::A62BF7C0-9B50-0236-3596-AE5C01E3FF00 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::BD8300E0-C5BF-69EE-13F0-B527DBEA67C3 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::471308AE-C5BE-4056-CEE1-70909308B059 -name LC_MESSAGES -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::FEC53B6F-970D-A63B-88D8-BFB0C81A098A -name chronojump.mo -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES -size 1612 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::4F6BC61B-8A81-6B6B-6D47-EA2A41FA1D94 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7BEA6741-855F-1371-5985-1477222A80F3 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn -size 423 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::5852A26E-1B39-3D56-2792-DF19CBD9274B -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3C407945-1F4D-02B2-F108-2B8E5A07ED02 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::365DBC61-20E2-5508-67B1-BAB19BE51C50 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/prop-base -size 53 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::57A3CDEE-6A82-6CF0-EC60-5B81438C2568 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D92D4733-B62B-6C0D-4C63-8C04880C1AB6 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F95E52C7-7D6C-1F6C-0618-F2CCA23EBE82 -name chronojump.mo.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/text-base -size 1612 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0F793756-26BA-0CA3-3E85-B1DBFC0C5FB7 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::6C7F3FA4-789C-A5D4-AA10-3FB2DB355103 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D9898D8F-C7B2-EF54-DB96-1692F27BBAD9 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1CAFD5EB-3758-20EA-9580-A0290C3339A6 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/locale/zh_CN/LC_MESSAGES/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::4E31C34A-3E77-E370-7F98-98A5392CE62E -name utils -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::210BE53A-E376-AA90-9C57-E2B9132C1851 -name linux -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::EFA46913-B186-5ECB-15CD-934E5D6D3720 -name convert_database.sh -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux -size 308 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::09284814-6A54-0D55-349C-7D72EA0DFBD1 -name db_path.txt -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux -size 25 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::05009419-1DE6-D2DB-FD09-85D74FD4A186 -name sqlite-2.8.17.bin -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux -size 312364 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::2980BBE5-750D-9A7C-188D-29A9D32A63E6 -name sqlite3-3.5.0.bin -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux -size 278820 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::DCD4E6F4-8629-29BB-DAB4-F0AAE0A2C764 -name tmp.db -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux -size 18432 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::3D67CF18-4266-104D-E84D-E41850FFD2FE -name tmp.txt -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux -size 4604 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::360EE5E0-DCFB-EF63-AE90-1038F2D33BA6 -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::124307AC-A307-5AF2-1F52-F1A574C46008 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn -size 650 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::FBBC88CB-B1CB-660C-AF1F-0FE8B9E0A1F0 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::8B774F3B-2DDE-7669-F183-7494964520CB -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1A59683B-ADC5-2869-3B93-1E87F326C58F -name convert_database.sh.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/prop-base -size 30 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::E2AE815F-73AE-4F44-7217-123E9D5EE16D -name sqlite-2.8.17.bin.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/prop-base -size 53 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::DADFB37F-04D4-F911-E7F6-2C0CB799C25B -name sqlite3-3.5.0.bin.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/prop-base -size 53 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::C874CEDD-D41C-A40E-6100-1C7E1308E332 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::51BD7DB4-2E0F-3B0D-2A67-4F5B8E6A6CB7 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::1309F080-5CD0-9876-F828-D0A588A2A9EF -name convert_database.sh.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/text-base -size 308 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::DD0163CC-263D-4B7E-7F96-E8749F22E74B -name sqlite-2.8.17.bin.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/text-base -size 312364 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::755FBB37-A79C-0FF8-E860-5802E264682E -name sqlite3-3.5.0.bin.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/text-base -size 278820 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::F2517ADC-F470-4FD6-61AA-6AD438A61565 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::9D14F827-607E-B27A-7697-223483D54C88 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::E7CD44D2-AF92-5F9E-3C5B-3B5773F0218D -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::ED06EB2E-9DF2-9FC1-7059-7C02F8AC535B -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/linux/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A433B471-BEC5-2F97-C937-BC60F27EF16E -name windows -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::AA262142-1EE2-ABB1-D73D-716340FC47F5 -name convert_database.bat -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows -size 299 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::C4404467-B8E8-35AA-2862-0EAAD5264253 -name sqlite.exe -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows -size 277098 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::4280A367-D01B-ADD3-4FEE-EBBF3FD672E4 -name sqlite3.exe -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows -size 391500 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::139E78D3-E54C-A0D3-D346-FF3896A0DCBC -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::53CDC7DB-DC3F-A0A7-10CB-13B5BDD6B43F -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn -size 640 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::81688EE8-E9B2-77AC-96F3-DB1C3BE148DB -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn -size 2 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::825C760F-BC01-0DB9-91C2-7B58304DA89C -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::8356BBE8-EAB2-4695-3EB0-EDD972D2A8F0 -name convert_database.bat.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/prop-base -size 30 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::F6EE3ACA-EDEE-1D75-2360-97A7B8376BA3 -name sqlite.exe.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/prop-base -size 79 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::CA48959F-2E1B-C63C-93CF-123E00157D76 -name sqlite3.exe.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/prop-base -size 79 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A39A954F-1A10-D667-8C52-6B83E9267A6D -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::518D27F4-B765-B3EB-E32A-EAEA3160D071 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::5A1C72FE-0E8F-197C-C130-0FD3457E0AF3 -name convert_database.bat.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/text-base -size 299 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::6C7AF5D3-0964-EA96-52F5-A31D21BA76AD -name sqlite.exe.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/text-base -size 277098 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::B9234719-5155-B208-BC69-6D420857BF4D -name sqlite3.exe.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/text-base -size 391500 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::F7428858-9E60-B94E-4169-AF9885D3C781 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/tmp -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::EFE7BFC5-D293-B087-E820-0F8790B7E209 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/tmp/prop-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::E06F9ABB-FE9E-CC3F-6631-961F109A7AE6 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/tmp/props -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::0D448704-10A1-4DE8-2809-12D2F11C0CBA -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/utils/windows/.svn/tmp/text-base -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::A6352532-C9AD-97E1-323F-6CA42D2BEFAE -name windows_dlls -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/data/windows_dlls -size 4096 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::E0293B42-4780-3269-17AD-B039E8913099 -name NPlot.dll -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/windows_dlls -size 128512 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::BAC38E8D-5A07-BBE1-C7A4-9B32C6B5D855 -name NPlot.dll.config -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/windows_dlls -size 317 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::FCABE1AD-F18B-10A6-C1DA-BA9A440FA5B9 -name NPlot.Gtk.dll -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/windows_dlls -size 8704 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::D81EBD7B-1EBE-EC17-8F55-B1A867CC6268 -name NPlot.Gtk.dll.config -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/data/windows_dlls -size 313 -mtime 1207237518 -filemethod "Update files with more recent dates"
File ::B74B20ED-33CB-05E1-C335-52D395005B80 -name docs -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/docs -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7E690672-32B0-837B-089B-B21BF2B69B2B -name AUTHORS -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/docs -size 123 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::008FA06B-C057-E0CD-50D4-3F3F2724EC3A -name changelog.txt -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/docs -size 72427 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::4BFE8A96-D949-5EC4-84B4-3AB5C49A859D -name chronojump_glossary_for_translators.html -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/docs -size 16010 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F53057AC-BD65-06F0-7944-553DDC81849C -name chronojump_manual_es.pdf -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/docs -size 480837 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::85AC4398-331B-8375-E4CE-EF1D6158BB24 -name COPYING -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/docs -size 17992 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::5971DDFD-4299-BB49-5635-82E8C940958B -name INSTALL -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/docs -size 112 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::C5BA1B99-62CC-67B6-08EC-C736D2133517 -name linux -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::6B410F78-8372-CDDA-73B4-8DC3E9A7B80F -name chronojump.sh -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux -size 1628 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D7A5E44C-6E95-A2A5-A101-A5D4C60CABE2 -name chronojump_mini.sh -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux -size 1633 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0EAFDEEB-6FF6-2F24-4AD3-A0108939845C -name chronopic-tests -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::AD63AD51-92BD-42CE-4AC9-4DB3BE052922 -name Changelog -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 2227 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7F149B48-25FA-5597-68FC-CB8DA76934B4 -name chronopic-serial-conf -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 11134 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DD84B718-9F3D-41BA-6E05-77A6705200E2 -name chronopic-serial-conf.c -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 4592 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::62B96B89-28DC-5295-DDC3-DDD9C6D256A7 -name chronopic-serial-conf.o -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 2520 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B79D736A-0262-1581-BD14-634BF40BCE50 -name chronopic.c -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 9914 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::489B4E1E-B337-06E4-5D84-5B46372532C4 -name chronopic.cs -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 5160 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::6B68F9A3-F255-4544-8D13-30F00664DA90 -name chronopic.dll -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 4608 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7AAEDCC4-56DB-01D1-7591-F11C29B9C2BC -name chronopic.h -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 4508 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::FED3C955-0E94-B8F2-3895-9E41687299B9 -name chronopic.o -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 3168 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::49062B62-7560-56E3-EA9D-2855272D47C3 -name libchronopic.so -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 8444 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::41118A6B-2A09-D52D-7E3D-C7020C699DDC -name Makefile -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 2790 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DD4B91E3-9965-5483-D463-AE235D356ECF -name README.txt -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 689 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3CC4A378-1DE7-12B2-01AC-A5EBC25781DA -name termansi.c -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 3003 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::F2C4B168-3C15-EE88-FB7E-ACCAE1EC7011 -name termansi.h -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 375 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::6B53ECC7-DAE8-17E3-EFCF-51F453934C2E -name termansi.o -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 2164 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::E1BEC409-1A12-6040-F718-35330B176400 -name test-precision -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 12184 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::87BA08BD-AFBC-1192-4D34-489BC6B44F47 -name test-precision.c -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 5030 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::74F8EE7B-940C-5787-C894-D205A954E58E -name test-precision.o -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 3548 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::06EB448B-DD99-A81F-0D79-621AD04FF336 -name test-saltos -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 11847 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::FA8BFDDE-6623-0A03-7577-3DDF66635B27 -name test-saltos.c -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 5600 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::4516656A-A684-1E0A-06C5-6A31101173D7 -name test-saltos.mono.cs -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 3547 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0F13C9E7-9285-6246-42A2-2E4747053502 -name test-saltos.mono.exe -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1D545FA0-13B2-AF0B-58F2-D7A2FFB4E86A -name test-saltos.o -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 3448 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::17FFC1D9-2CD9-18E5-D01A-15740DBF27B9 -name test-tramas -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 13475 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::61B4CAD9-B0F4-A956-2BAD-F5FAA3CFBC72 -name test-tramas.c -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 5507 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::806C23B3-B751-C15E-6F1A-A4718BE7A4FE -name test-tramas.o -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 4076 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::13FE4D99-50C9-4101-7645-8A01296319BE -name test.cs -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 3155 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::47D3A354-0224-5219-619B-5304CBD7F0F1 -name test.exe -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 5120 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1283500F-73C8-9427-FA73-3F6F5E5937AD -name test.prj -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests -size 2770 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::8D877670-1356-50D2-4FAD-D707F8AC97FA -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::54EFDBB7-2BC6-5AB8-6D71-89ADA0BED2D6 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn -size 2129 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::13B05C53-62A8-5D30-B7D1-773A11873DB4 -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DD9D247D-D000-A3FC-67D2-879988ECE28A -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9635AE80-05AB-CBB7-FBF1-DC16F1A543F8 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::68514CBC-D8F7-11B8-EE2B-CD8C25DF619B -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::A8FB8FA8-8B3D-3095-2E13-3AF1FF053FF0 -name Changelog.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 2227 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9AF9EFD8-68B9-D5EE-38C5-903720C23E1F -name chronopic-serial-conf.c.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 4592 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::7C62B00F-48CF-7C36-A17C-4E5042756022 -name chronopic.c.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 9914 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3F8AF311-E4B8-78FF-976F-0FE04F2E7BEB -name chronopic.cs.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 5160 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::170B498B-F88C-77D0-F2A2-10AC6D36F386 -name chronopic.h.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 4508 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9EB09004-02A5-F7C0-24D9-98A1349927A5 -name Makefile.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 2790 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::A1DAC5C8-A571-49F7-5E2F-0798F16261D9 -name README.txt.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 689 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::13626217-537E-4D0D-691A-40CBE81FF36F -name termansi.c.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 3003 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::13AD831C-89ED-B808-1091-17596F769BED -name termansi.h.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 375 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::A951A4A8-9C48-A272-C72E-E7BFC38614D9 -name test-precision.c.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 5030 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::9DDA0FAE-9ECD-6C3E-B56F-0DE471B15865 -name test-saltos.c.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 5600 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DC300F1C-9410-8ADA-906B-9B4D41B07856 -name test-saltos.mono.cs.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 3547 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3DF4C8A3-2697-1511-E635-144093AA7C0D -name test-tramas.c.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 5507 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::3A552329-CDC3-0484-9F5B-61CB6EDB3A39 -name test.cs.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 3155 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D5C72AD6-3299-0A7B-DEE1-AC9C86CB7533 -name test.prj.svn-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/text-base -size 2770 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::C93AF4FC-4CE5-25CB-E5A3-BB76B98CE8AA -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::EE832603-C2F4-D446-DD8D-A6BB688A1D56 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::58A3C2E2-95E0-FD15-96A8-B0A347AAA7F8 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::A7F4B395-A022-2AF9-E9CD-12060F4BB24B -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/linux/chronopic-tests/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::B6DBE000-C6D7-E5DC-8F29-77054ED501A2 -name windows -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D039B703-ABF9-A8DE-FB94-9A589ED7C95E -name chronojump.bat -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/windows -size 936 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1D256F4D-03E0-F822-3C21-5AB1B48DE5AB -name chronojump_mini.bat -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/windows -size 941 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0775EB49-1350-DA26-FE9C-CB3FA08E4967 -name driver -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::DD63F9E9-2A1A-5E3B-863B-B3F5510A4D96 -name {CDM 2.02.04.exe} -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver -size 2119568 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::89EF7917-530C-1AD8-DC62-B839E1A3A00C -name .svn -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0C83DADE-7C72-A4CE-D03E-DAEA6D5AD7C1 -name entries -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn -size 362 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::4FA1000B-1B4E-CAE4-5122-ACC052B3C92D -name format -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn -size 2 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::98F424FF-D7C7-A738-C147-6E0F9FB1C217 -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::1D531331-1499-84D8-200F-06F406F668F9 -name {CDM 2.02.04.exe.svn-base} -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/prop-base -size 53 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::376EFFA6-F5E6-2372-993B-09CCE13C3C20 -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::960076E2-8E1E-A4AF-5145-B1DB9EDDD83E -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0D421A48-A5C8-4C80-0595-61BE58E00588 -name {CDM 2.02.04.exe.svn-base} -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/text-base -size 2119568 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::C46704DA-8D45-5EB5-C97F-3311022862F8 -name tmp -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/tmp -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::0F221113-1034-B544-9E80-B57446805CEA -name prop-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/tmp/prop-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::D2568082-4799-C921-A907-8AA1DC2000ED -name props -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/tmp/props -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"
File ::4D4C7ABC-FAF4-4D9E-602E-D4F9DBD2D232 -name text-base -parent B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -type dir -directory <%InstallDir%>/chronojump-0.6.2.6/windows/driver/.svn/tmp/text-base -size 4096 -mtime 1207237519 -filemethod "Update files with more recent dates"

}
} gui.tcl {proc ::InitGui {} {
if {[info exists ::conf(initGui)]} { return }
set ::conf(initGui) 1

set ::conf(x11)  0
set ::conf(aqua) 0

if {[catch { package require Tk } error]} {
if {!$::info(FallBackToConsole)} {
puts "This program must be run in a graphical environment,"
puts "or you must specify a silent or console install."
::InstallJammer::ShowUsageAndExit
}

set ::info(GuiMode)       0
set ::info(SilentMode)    0
set ::info(DefaultMode)   0
set ::info(ConsoleMode)   1
set ::info($::conf(mode)) "Console"

if {![catch { exec stty size } result]
&& [scan $result "%d %d" height width] == 2} {
set conf(ConsoleWidth)  $width
set conf(ConsoleHeight) $height
}

return
}

set ::info(GuiMode) 1

set ::conf(wm)   [tk windowingsystem]
set ::conf(x11)  [string equal $::conf(wm) "x11"]
set ::conf(aqua) [string equal $::conf(wm) "aqua"]

wm withdraw .

package require tile

package require tkpng

if {$::conf(x11)} {
tile::setTheme jammer
}
array set ::images {70364F59-3542-E36E-FC43-18B295772C15,Image /home/xavier/informatica/installJammer/Images/Modern/SetupModern01.gif 073E3F8C-ADC8-8230-15C8-2F8108592782,Icon /home/xavier/informatica/installJammer/Images/Modern/Small/SetupModernSmall01.gif E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Icon /home/xavier/informatica/installJammer/Images/Modern/Small/SetupModernSmall01.gif B74F7D6B-E488-489F-9A42-BEB18C73F13F,Icon /home/xavier/informatica/installJammer/Images/Modern/Small/SetupModernSmall01.gif C9CE9239-3C5E-97E6-0F98-4619F52759BB,Image /home/xavier/informatica/installJammer/Images/Modern/SetupModern01.gif EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF,Image /home/xavier/informatica/installJammer/Images/Modern/SetupModern01.gif E55EF3C7-ED39-DCC2-538F-81A46E080F8A,Icon /home/xavier/informatica/installJammer/Images/Modern/Small/SetupModernSmall01.gif 8CD31907-2778-AC4C-A178-FB58C43712DF,Icon /home/xavier/informatica/installJammer/Images/Modern/Small/SetupModernSmall01.gif}
image create photo /home/xavier/informatica/installJammer/Images/Modern/Small/SetupModernSmall01.gif -data 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
image create photo /home/xavier/informatica/installJammer/Images/Modern/SetupModern01.gif -data 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


proc ::ThemeSetup {} {
option add *font  TkTextFont

if {$::tcl_platform(platform) ne "windows"} {
option add *background          [style default . -background]
option add *selectForeground    [style default . -selectforeground]
option add *selectBackground    [style default . -selectbackground]

option add *Listbox.background  white

option add *Entry.background    white
option add *Entry.borderWidth   1

option add *Text.background     white
}
}

ThemeSetup


package require Tcl 8.1.1

namespace eval Widget {
variable _class
variable _tk_widget

variable _theme 0

variable  _optiontype
array set _optiontype {
TkResource Widget::_test_tkresource
BwResource Widget::_test_bwresource
Enum       Widget::_test_enum
Int        Widget::_test_int
Boolean    Widget::_test_boolean
Boolean2   Widget::_test_boolean2
String     Widget::_test_string
Flag       Widget::_test_flag
Synonym    Widget::_test_synonym
Color      Widget::_test_color
Color2     Widget::_test_color2
Padding    Widget::_test_padding
}

proc use {} {}
}


proc Widget::CreateTempWidget { class {command frame} } {
set class [string map [list :: ""] $class]
set path  ".#BWidget.#Class#$class"
if {![winfo exists .#BWidget]} { frame .#BWidget }
if {![winfo exists $path]} {
if {[string equal $command "frame"]
|| [string equal $command "toplevel"]} {
$command $path -class $class
if {[string equal $command "toplevel"]} { wm withdraw $path }
} else {
$command $path
}
}
return $path
}


proc Widget::tkinclude { class tkwidget subpath args } {
foreach {cmd lopt} $args {
switch -- $cmd {
remove {
foreach option $lopt {
set remove($option) 1
}
}

include {
foreach option $lopt {
set include($option) 1
}
}

prefix {
set prefix [lindex $lopt 0]
foreach option [lrange $lopt 1 end] {
set rename($option) "-$prefix[string range $option 1 end]"
}
}

rename - readonly - initialize {
array set $cmd $lopt
}

default {
return -code error "invalid argument \"$cmd\""
}
}
}

namespace eval $class {}
upvar 0 ${class}::opt classopt
upvar 0 ${class}::map classmap
upvar 0 ${class}::map$subpath submap
upvar 0 ${class}::optionExports exports
upvar 0 ${class}::subpaths subpaths

if {![info exists subpaths($subpath)]} { set subpaths($subpath) [list] }
eval [list lappend subpaths($subpath)] [array get initialize]

set widg [Widget::CreateTempWidget $tkwidget $tkwidget]
foreach optdesc [_get_tkwidget_options $tkwidget] {
set option [lindex $optdesc 0]

if {[info exists remove($option)]} { continue }
if {[info exists include] && ![info exists include($option)]} {continue}

if {[llength $optdesc] == 3} {
set syn [lindex $optdesc 1]
if {![info exists remove($syn)]} {
if {[info exists rename($syn)]} {
set classopt($option) [list Synonym $rename($syn)]
} else {
set classopt($option) [list Synonym $syn]
}
}

continue
}

set ro      0
set value   [lindex $optdesc 1]
set realopt $option

if {[info exists rename($option)]} {
set realopt $option
set option  $rename($option)
}

if {[info exists readonly($option)]} {
set ro $readonly($option)
}

set optionval [list $tkwidget $realopt]
set classopt($option) [list TkResource $value $ro $optionval]

if {![info exists initialize($option)]} {
set conf    [_configure_option $option ""]
set dbName  [lindex $conf 0]
set dbClass [lindex $conf 1]

set def [option get $widg $dbName $dbClass]
if {[string length $def]} {
set value $def
lappend subpaths($subpath) $option $value
}
}


lappend classmap($option) $subpath "" $realopt
set submap($realopt) $option
}
}


proc Widget::bwinclude { class subclass subpath args } {
upvar 0 ${subclass}::opt subclassopt

foreach {cmd lopt} $args {
switch -- $cmd {
remove {
foreach option $lopt {
set remove($option) 1
}
}

include {
foreach option $lopt {
set include($option) 1
}
}

prefix {
set prefix   [lindex $lopt 0]
set options  [lrange $lopt 1 end]
set doremove [string equal [lindex $options 0] "remove"]
if {![llength $options] || $doremove} {
set options  [list]
set toremove [lrange $options 1 end]
foreach option [array names subclassopt] {
if {[lsearch -exact $toremove $option] < 0} {
lappend options $option
}
}
}

foreach option $options {
set rename($option) "-$prefix[string range $option 1 end]"
}
}

rename - readonly - initialize {
array set $cmd $lopt
}

default {
return -code error "invalid argument \"$cmd\""
}
}
}

namespace eval $class {}
upvar 0 ${class}::opt classopt
upvar 0 ${class}::map classmap
upvar 0 ${class}::map$subpath submap
upvar 0 ${class}::optionExports exports
upvar 0 ${subclass}::optionExports subexports
upvar 0 ${class}::subpaths subpaths

if {![info exists subpaths($subpath)]} { set subpaths($subpath) [list] }
eval [list lappend subpaths($subpath)] [array get initialize]

set path [Widget::CreateTempWidget $class]
foreach {option optdesc} [array get subclassopt] {
set subOption $option

if {[info exists remove($option)]} { continue }
if {[info exists include] && ![info exists include($option)]} {continue}

set type [lindex $optdesc 0]
if {[string equal $type "Synonym"]} {
set syn [lindex $optdesc 1]
if {![info exists remove($syn)]} {
if {[info exists rename($syn)]} {
set classopt($option) [list Synonym $rename($syn)]
} else {
set classopt($option) [list Synonym $syn]
}
}
continue
}

set ro      [lindex $optdesc 2]
set value   [lindex $optdesc 1]
set realopt $option

if {[info exists rename($option)]} {
set realopt $option
set option  $rename($option)
}

if {[info exists initialize($option)]} {
set value $initialize($option)
}

if {[info exists readonly($option)]} {
set ro $readonly($option)
}

if {![info exists initialize($option)]} {
set conf    [_configure_option $option ""]
set dbName  [lindex $conf 0]
set dbClass [lindex $conf 1]

set def [option get $path $dbName $dbClass]
if {[string length $def]} {
set value $def
lappend subpaths($subpath) $option $value
}
}

set classopt($option) [list $type $value $ro [lindex $optdesc 3]]


lappend classmap($option) $subpath $subclass $realopt
set submap($realopt) $option
}
}


proc Widget::declare { class optlist } {
variable _optiontype

namespace eval $class {}
upvar 0 ${class}::opt classopt
upvar 0 ${class}::optionExports exports
upvar 0 ${class}::optionClass optionClass

set path [Widget::CreateTempWidget $class]
foreach optdesc $optlist {
set option  [lindex $optdesc 0]
set optdesc [lrange $optdesc 1 end]
set type    [lindex $optdesc 0]

if {![info exists _optiontype($type)]} {
return -code error "invalid option type \"$type\""
}

if {[string equal $type "Synonym"]} {
set syn [lindex $optdesc 1]
if {![info exists classopt($syn)]} {
return -code error  "unknow option \"$syn\" for Synonym \"$option\""
}
set classopt($option) [list Synonym $syn]
continue
}

set value [lindex $optdesc 1]
set ro    [lindex $optdesc 2]
set arg   [lindex $optdesc 3]

set conf    [_configure_option $option ""]
set dbName  [lindex $conf 0]
set dbClass [lindex $conf 1]
set default [option get $path $dbName $dbClass]

if {[string equal $type "BwResource"]} {
set subclass    [lindex $arg 0]
set realopt     [lindex $arg 1]
if {![string length $realopt]} { set realopt $option }

upvar 0 ${subclass}::opt subclassopt
if {![info exists subclassopt($realopt)]} {
return -code error "unknow option \"$realopt\""
}

set suboptdesc $subclassopt($realopt)
if {![string length $value]} {
set value [lindex $suboptdesc 1]
}

set type [lindex $suboptdesc 0]
set ro   [lindex $suboptdesc 2]
set arg  [lindex $suboptdesc 3]
set classopt($option) [list $type $value $ro $arg]
continue
}

if {[string equal $type "TkResource"]} {
set tkwidget [lindex $arg 0]
set widg [Widget::CreateTempWidget $tkwidget $tkwidget]
set realopt  [lindex $arg 1]
if { ![string length $realopt] } {
set realopt $option
}
set tkoptions [_get_tkwidget_options $tkwidget]
if {![string length $value]} {
set ind [lsearch $tkoptions [list $realopt *]]
set value [lindex [lindex $tkoptions $ind] end]
}
set classopt($option) [list TkResource $value $ro  [list $tkwidget $realopt]]
set optionClass($option) [lindex [$widg configure $realopt] 1]
continue
}

if {[string equal $type "Color"]} {
if {[info exists ::BWidget::colors($value)]} {
set value $::BWidget::colors($value)
}
}


set classopt($option) [list $type $value $ro $arg]
}
}


proc Widget::define { class filename args } {
variable _inuse
variable ::BWidget::use

proc ::${class}::use {} {}

if {[set x [lsearch -exact $args "-classonly"]] > -1} {
set args [lreplace $args $x $x]
} else {
interp alias {} ::${class} {} ${class}::create

proc ::${class}::cget { path option } {
return [Widget::cget $path $option]
}

proc ::${class}::configure { path args } {
return [Widget::configure $path $args]
}

bind $class <Destroy> [list Widget::destroy %W]
}

set _inuse($class) 0

set use($class)      $args
set use($class,file) $filename
lappend use(classes) $class

foreach class $args { ${class}::use }
}


proc Widget::create { class path {rename 1} } {
if {$rename} { rename $path ::$path:cmd }
set cmd "${class}::\$cmd"
proc ::$path { cmd args }  [subst {return \[eval \[linsert \$args 0 $cmd [list $path]\]\]}]
return $path
}


proc Widget::addmap { class subclass subpath options } {
upvar 0 ${class}::opt classopt
upvar 0 ${class}::optionExports exports
upvar 0 ${class}::optionClass optionClass
upvar 0 ${class}::map classmap
upvar 0 ${class}::map$subpath submap
upvar 0 ${class}::subpaths subpaths

if {![info exists subpaths($subpath)]} { set subpaths($subpath) [list] }

foreach {option realopt} $options {
if {![string length $realopt]} { set realopt $option }


lappend classmap($option) $subpath $subclass $realopt
set submap($realopt) $option

lappend subpaths($subpath) $realopt [lindex $classopt($option) 1]
}
}


proc Widget::syncoptions { class subclass subpath options } {
upvar 0 ${class}::sync classync
upvar 0 ${class}::subpaths subpaths

if {![info exists subpaths($subpath)]} { set subpaths($subpath) [list] }

foreach {option realopt} $options {
if {![string length $realopt]} { set realopt $option }
set classync($option) [list $subpath $subclass $realopt]
}
}


proc Widget::init { class path options {initFromODB 0} } {
variable _inuse

upvar 0 Widget::_optiontype opttype
upvar 0 ${class}::opt classopt
upvar 0 ${class}::map classmap
upvar 0 ${class}::$path:opt  pathopt
upvar 0 ${class}::$path:mod  pathmod
upvar 0 ${class}::$path:init pathinit

if {[info exists pathopt]} { unset pathopt }
if {[info exists pathmod]} { unset pathmod }

set fpath    $path
set rdbclass [string map [list :: ""] $class]
if {![winfo exists $path]} { set fpath [Widget::CreateTempWidget $class] }

foreach {option optdesc} [array get classopt] {
set pathmod($option) 0
if {[info exists classmap($option)]} { continue }

set type [lindex $optdesc 0]
if {[string equal $type "Synonym"]} { continue }

set alt ""
if {[string equal $type "TkResource"]} {
set alt [lindex [lindex $optdesc 3] 1]
}

set optdb [lindex [_configure_option $option $alt] 0]
set def   [option get $fpath $optdb $rdbclass]
if {[string length $def]} {
set pathopt($option) $def
} else {
set pathopt($option) [lindex $optdesc 1]
}
}

if {![info exists _inuse($class)]} { set _inuse($class) 0 }
incr _inuse($class)

set Widget::_class($path) $class

if {$initFromODB} {
array set pathopt $options
} else {
foreach {option value} $options {
if {![info exists classopt($option)]} {
unset pathopt
unset pathmod
return -code error "unknown option \"$option\""
}

set optdesc $classopt($option)
set type    [lindex $optdesc 0]
if {[string equal $type "Synonym"]} {
set option  [lindex $optdesc 1]
set optdesc $classopt($option)
set type    [lindex $optdesc 0]
}

set arg [lindex $optdesc 3]
set pathopt($option)  [$opttype($type) $option $value $arg]
set pathinit($option) $pathopt($option)
}
}
}



proc Widget::initFromODB { class path options } {
Widget::init $class $path $options 1
}




proc Widget::copyinit { class templatepath path options } {
upvar 0 ${class}::opt classopt  ${class}::$path:opt	 pathopt  ${class}::$path:mod	 pathmod  ${class}::$path:init pathinit  ${class}::$templatepath:opt	 templatepathopt  ${class}::$templatepath:mod	 templatepathmod  ${class}::$templatepath:init templatepathinit

if {[info exists pathopt]} { unset pathopt }
if {[info exists pathmod]} { unset pathmod }

array set pathmod  [array get templatepathmod]
array set pathopt  [array get templatepathopt]
array set pathinit [array get templatepathinit]

set Widget::_class($path) $class
foreach {option value} $options {
if {![info exists classopt($option)]} {
unset pathopt
unset pathmod
return -code error "unknown option \"$option\""
}

set optdesc $classopt($option)
set type    [lindex $optdesc 0]
if {[string equal $type "Synonym"]} {
set option	[lindex $optdesc 1]
set optdesc $classopt($option)
set type	[lindex $optdesc 0]
}

set arg [lindex $optdesc 3]
set pathopt($option)  [$Widget::_optiontype($type) $option $value $arg]
set pathinit($option) $pathopt($option)
}
}


proc Widget::parseArgs { class options {errorOut 1} } {
upvar 0 ${class}::opt classopt
upvar 0 ${class}::map classmap

foreach {option val} $options {
if {![info exists classopt($option)]} {
if {$errorOut} { return -code error "unknown option \"$option\"" }
continue
}

set optdesc $classopt($option)
set type    [lindex $optdesc 0]
if {[string equal $type "Synonym"]} {
set option  [lindex $optdesc 1]
set optdesc $classopt($option)
set type    [lindex $optdesc 0]
}

if {[string equal $type "TkResource"]} {
Widget::_get_tkwidget_options [lindex [lindex $optdesc 3] 0]
}

set val [$Widget::_optiontype($type) $option $val [lindex $optdesc 3]]

if {[info exists classmap($option)]} {
foreach {subpath subclass realopt} $classmap($option) {
lappend maps($subpath) $realopt $val
}
} else {
lappend maps($class) $option $val
}
}

return [array get maps]
}



proc Widget::initArgs { class options arrayName } {
upvar 1 $arrayName maps
upvar 0 ${class}::subpaths subpaths

array set maps [list $class {} :cmd {}]
foreach subpath [array names subpaths] {
set maps($subpath) [list]
}

array set maps [array get subpaths]

foreach {var val} [Widget::parseArgs $class $options] {
eval lappend maps($var) $val
}
}



proc Widget::splitArgs { options args } {
array set maps [list :cmd {}]
foreach class $args {
if {![info exists maps($class)]} { set maps($class) [list] }
array set maps [Widget::parseArgs $class $options 0]
}

return [array get maps]
}


proc Widget::optionExists { class option } {
return [info exists ${class}::opt($option)]
}


proc Widget::class { path } {
if {[info exists Widget::_class($path)]} { return $Widget::_class($path) }
return -code error "unknown widget $path"
}


proc Widget::destroy { path {unsetVariables 1} } {
variable _class
variable _inuse

if {[info exists _class($path)]} {
set class $_class($path)

if {[info exists _inuse($class)]} { incr _inuse($class) -1 }

if {![string equal [info commands $path] ""]} { rename $path "" }

foreach x {opt mod init} {
if {[info exists ${class}::$path:$x]} {
unset ${class}::$path:$x
}
}

if {$unsetVariables} { eval unset [info vars ${class}::$path:*] }

unset _class($path)
}
}


proc Widget::configure { path options } {
set len [llength $options]
if {$len < 2} { return [_get_configure $path $options] }
if {$len % 2} { return -code error "incorrect number of arguments" }

variable _class
variable _optiontype

set class $_class($path)
upvar 0 ${class}::opt  classopt
upvar 0 ${class}::map  classmap
upvar 0 ${class}::$path:opt pathopt
upvar 0 ${class}::$path:mod pathmod

set window [_get_window $class $path]
foreach {option value} $options {
if {![info exists classopt($option)]} {
return -code error "unknown option \"$option\""
}

set optdesc $classopt($option)
set type    [lindex $optdesc 0]
if {[string equal $type "Synonym"]} {
set option  [lindex $optdesc 1]
set optdesc $classopt($option)
set type    [lindex $optdesc 0]
}

if {[lindex $optdesc 2]} { continue }

set newval [$_optiontype($type) $option $value [lindex $optdesc 3]]

if {[info exists classmap($option)]} {
set window [_get_window $class $window]
foreach {subpath subclass realopt} $classmap($option) {
if {[string length $subclass]} {
set curval [${subclass}::cget $window$subpath $realopt]
${subclass}::configure $window$subpath $realopt $newval
} else {
set curval [$window$subpath cget $realopt]
$window$subpath configure $realopt $newval
}
}
} else {
set curval $pathopt($option)
set pathopt($option) $newval
}

set pathmod($option) [expr {![string equal $newval $curval]}]
}

return
}


proc Widget::cget { path option } {
if {![info exists ::Widget::_class($path)]} {
return -code error "unknown widget \"$path\""
}

set class $::Widget::_class($path)
if {![info exists ${class}::opt($option)]} {
return -code error "unknown option \"$option\""
}

set optdesc [set ${class}::opt($option)]
set type    [lindex $optdesc 0]
if {[string equal $type "Synonym"]} {
set option [lindex $optdesc 1]
}

if {[info exists ${class}::map($option)]} {
foreach {subpath subclass realopt} [set ${class}::map($option)] {break}
set path "[_get_window $class $path]$subpath"
return [$path cget $realopt]
}
upvar 0 ${class}::$path:opt pathopt
set pathopt($option)
}


proc Widget::subcget { path subwidget } {
set class $::Widget::_class($path)
upvar 0 ${class}::$path:opt pathopt
upvar 0 ${class}::map$subwidget submap
upvar 0 ${class}::$path:init pathinit

set result [list]
foreach realopt [array names submap] {
if {[info exists pathinit($submap($realopt))]} {
lappend result $realopt $pathopt($submap($realopt))
}
}
return $result
}


proc Widget::hasChanged { path option varName } {
upvar 1 $varName value
Widget::getVariable $path mod pathmod

set value   [Widget::cget $path $option]
set result  $pathmod($option)
set pathmod($option) 0

return $result
}

proc Widget::hasChangedX { path option args } {
set class $::Widget::_class($path)
upvar 0 ${class}::$path:mod pathmod

set result  $pathmod($option)
set pathmod($option) 0
foreach option $args {
lappend result $pathmod($option)
set pathmod($option) 0
}

set result
}


proc Widget::anyChangedX { path args } {
set class $::Widget::_class($path)
upvar 0 ${class}::$path:mod pathmod

set result 0
foreach option $args {
incr result $pathmod($option)
set pathmod($option) 0
}
return $result
}


proc Widget::getoption { path option } {
set class $::Widget::_class($path)
upvar 0 ${class}::${path}:opt pathopt
set pathopt($option)
}


proc Widget::setoption { path args } {
set class $::Widget::_class($path)
upvar 0 ${class}::${path}:opt pathopt
foreach [list option value] $args {
set pathopt($option) $value
}
}


proc Widget::getMegawidgetOption { path option } {
set class $::Widget::_class($path)
upvar 0 ${class}::${path}:opt pathopt
set pathopt($option)
}


proc Widget::setMegawidgetOption { path option value } {
set class $::Widget::_class($path)
upvar 0 ${class}::${path}:opt pathopt
set pathopt($option) $value
}


proc Widget::_get_window { class path } {
set idx [expr {[string last "#" $path] + 1}]
if {$idx && [string equal [string range $path $idx end] $class]} {
return [string range $path 0 [expr {$idx - 2}]]
}
return $path
}


proc Widget::_get_configure { path options } {
variable _class

set class $_class($path)
upvar 0 ${class}::opt classopt
upvar 0 ${class}::$path:opt pathopt

if {[llength $options] == 1} {
set option  [lindex $options 0]
if { ![info exists classopt($option)] } {
return -code error "unknown option \"$option\""
}
set optdesc $classopt($option)
set type    [lindex $optdesc 0]
if { [string equal $type "Synonym"] } {
set option  [lindex $optdesc 1]
set optdesc $classopt($option)
set type    [lindex $optdesc 0]
}
if { [string equal $type "TkResource"] } {
set alt [lindex [lindex $optdesc 3] 1]
} else {
set alt ""
}

set res [list $option]
eval lappend res [_configure_option $option $alt]
lappend res [lindex $optdesc 1] [${class}::cget $path $option]

return $res
}


set result [list]
foreach option [lsort [array names classopt]] {
set alt     ""
set syn     ""
set optdesc $classopt($option)
set type    [lindex $optdesc 0]

if {[string equal $type "Synonym"]} {
set syn     $option
set option  [lindex $optdesc 1]
set optdesc $classopt($option)
set type    [lindex $optdesc 0]
}

if {[string equal $type "TkResource"]} {
set alt [lindex [lindex $optdesc 3] 1]
}

set res [_configure_option $option $alt]
if {![string length $syn]} {
lappend result [concat $option $res  [list [lindex $optdesc 1]] [list [cget $path $option]]]
} else {
lappend result [list $syn [lindex $res 0]]
}
}

return $result
}


proc Widget::_configure_option { option altopt } {
variable _optiondb
variable _optionclass

if {[info exists _optiondb($option)]} {
set optdb $_optiondb($option)
} else {
set optdb [string range $option 1 end]
}

if {[info exists _optionclass($option)]} {
set optclass $_optionclass($option)
} elseif {[string length $altopt]} {
if {[info exists _optionclass($altopt)]} {
set optclass $_optionclass($altopt)
} else {
set optclass [string range $altopt 1 end]
}
} else {
set optclass [string range $option 1 end]
}

return [list $optdb $optclass]
}


proc Widget::_get_tkwidget_options { tkwidget } {
variable _tk_widget
variable _optiondb
variable _optionclass

if {![info exists _tk_widget($tkwidget)]} {
set widget [Widget::CreateTempWidget $tkwidget $tkwidget]

set config [$widget configure]
foreach optlist $config {
set opt [lindex $optlist 0]
if {[llength $optlist] == 2} {
set refsyn [lindex $optlist 1]

set idx [lsearch $config [list * $refsyn *]]
if {$idx == -1} {
if {[string index $refsyn 0] == "-"} {
set idx [lsearch $config [list $refsyn * *]]
} else {
set refsyn [string tolower $refsyn]
set idx [lsearch $config [list -$refsyn * *]]
}

if {$idx == -1} {
return -code error "can't find option of synonym $opt"
}
}

set syn [lindex [lindex $config $idx] 0]
set def [lindex [lindex $config $idx] 4]
lappend _tk_widget($tkwidget) [list $opt $syn $def]
} else {
set def [lindex $optlist 4]
lappend _tk_widget($tkwidget) [list $opt $def]
set _optiondb($opt)    [lindex $optlist 1]
set _optionclass($opt) [lindex $optlist 2]
}
}
}

return $_tk_widget($tkwidget)
}


proc Widget::_test_tkresource { option value arg } {
set tkwidget [lindex $arg 0]
set realopt  [lindex $arg 1]
set path     [Widget::CreateTempWidget $tkwidget $tkwidget]
set old      [$path cget $realopt]
$path configure $realopt $value
set res      [$path cget $realopt]
$path configure $realopt $old
return $res
}


proc Widget::_test_bwresource { option value arg } {
return -code error "bad option type BwResource in widget"
}


proc Widget::_test_synonym { option value arg } {
return -code error "bad option type Synonym in widget"
}

proc Widget::_test_color { option value arg } {
if {[info exists ::BWidget::colors($value)]} {
set value $::BWidget::colors($value)
}

if {[catch {winfo rgb . $value} color]} {
return -code error  "bad $option value \"$value\": must be a colorname or #RRGGBB"
}

return $value
}


proc Widget::_test_color2 { option value arg } {
if {![string length $value]} { return }

if {[info exists ::BWidget::colors($value)]} {
set value $::BWidget::colors($value)
}

if {[catch {winfo rgb . $value} color]} {
return -code error  "bad $option value \"$value\": must be a colorname or #RRGGBB"
}

return $value
}


proc Widget::_test_string { option value arg } {
return $value
}


proc Widget::_test_flag { option value arg } {
set len [string length $value]
set res ""
for {set i 0} {$i < $len} {incr i} {
set c [string index $value $i]
if {[string first $c $arg] == -1} {
set name [string range $option 1 end]
return -code error [BWidget::badOptionString $name $value $arg]
}
if {[string first $c $res] == -1} { append res $c }
}
return $res
}


proc Widget::_test_enum { option value arg } {
if {[lsearch -exact $arg $value] == -1} {
set name [string range $option 1 end]
return -code error [BWidget::badOptionString $name $value $arg]
}
return $value
}


proc Widget::_test_int { option value arg } {
set map [list %d $value]
if {![string is int -strict $value]
|| ([string length $arg] && ![expr [string map $map $arg]])} {
return -code error  "bad $option value \"$value\": must be integer ($arg)"
}
return $value
}


proc Widget::_test_boolean { option value arg } {
if {![string is boolean -strict $value]} {
set name [string range $option 1 end]
return -code error [BWidget::badOptionString $name $value boolean]
}

return [string is true $value]
}


proc Widget::_test_boolean2 { option value arg } {
if {![string is boolean $value]} {
set name [string range $option 1 end]
set opts [list empty boolean]
return -code error [BWidget::badOptionString $name $value $opts]
}

if {[string length $value]} { return [string is true $value] }
}


proc Widget::_test_padding { option values arg } {
set len [llength $values]
if {$len < 1 || $len > 2} {
return -code error  "bad pad value \"$values\": must be positive screen distance"
}

foreach value $values {
set map [list %d $value]
if {![string is int -strict $value]
|| ([string length $arg] && ![expr [string map $map $arg]])} {
return -code error  "bad pad value \"$value\": must be positive screen distance"
}
}
return $values
}


proc Widget::_get_padding { args } {
if {[llength $args] == 2} {
set padding [lindex $args 0]
set index   [lindex $args 1]
} elseif {[llength $args] == 3} {
set path    [lindex $args 0]
set option  [lindex $args 1]
set index   [lindex $args 2]
set padding [Widget::cget $path $option]
}
set val [lindex $padding $index]
if {![string length $val]} { set val [lindex $padding 0] }
return $val
}


proc Widget::focusNext { w } {
set cur $w
while 1 {


set parent $cur
set children [winfo children $cur]
set i -1


while 1 {
incr i
if {$i < [llength $children]} {
set cur [lindex $children $i]
if {[winfo toplevel $cur] == $cur} {
continue
} else {
break
}
}


set cur $parent
if {[winfo toplevel $cur] == $cur} {
break
}
set parent [winfo parent $parent]
set children [winfo children $parent]
set i [lsearch -exact $children $cur]
}
if {($cur == $w) || [focusOK $cur]} {
return $cur
}
}
}


proc Widget::focusPrev { w } {
set cur $w
while 1 {


if {[winfo toplevel $cur] == $cur}  {
set parent $cur
set children [winfo children $cur]
set i [llength $children]
} else {
set parent [winfo parent $cur]
set children [winfo children $parent]
set i [lsearch -exact $children $cur]
}


while {$i > 0} {
incr i -1
set cur [lindex $children $i]
if {[winfo toplevel $cur] == $cur} {
continue
}
set parent $cur
set children [winfo children $parent]
set i [llength $children]
}
set cur $parent
if {($cur == $w) || [focusOK $cur]} {
return $cur
}
}
}


proc Widget::focusOK { w } {
set code [catch {$w cget -takefocus} value]
if {$code == 1} { return 0 }

if {!$code && [string length $value]} {
if {$value == 0} {
return 0
} elseif {$value == 1} {
return [winfo viewable $w]
} else {
set value [uplevel \#0 $value $w]
if {[string length $value]} { return $value }
}
}

if {![winfo viewable $w]} { return 0 }

set code [catch {$w cget -state} value]
if {!$code && [string equal $value "disabled"]} { return 0 }

set code [catch {$w cget -editable} value]
if {!$code && $value == 0} { return 0 }

set top [winfo toplevel $w]
foreach tag [bindtags $w] {
if {![string equal $tag $top]
&& ![string equal $tag "all"]
&& [string match *Key* [bind $tag]]} {
return 1
}
}
return 0
}


proc Widget::traverseTo { w } {
set focus [focus]
if {[string length $focus]} {
event generate $focus <<TraverseOut>>
}
focus $w

event generate $w <<TraverseIn>>
}



proc Widget::varForOption { path option } {
variable _class
variable _optiontype

set class $_class($path)
upvar 0 ${class}::$path:opt pathopt

if {![info exists pathopt($option)]} {
return -code error "unable to find variable for option \"$option\""
}

return ::Widget::${class}::$path:opt($option)
}


proc Widget::widgetVar { path varName } {
set class $Widget::_class($path)
return ::Widget::${class}::$path:$varName
}


proc Widget::getVariable { path varName {newVarName ""} } {
if {![string length $newVarName]} { set newVarName $varName }
uplevel 1 [list upvar \#0 [Widget::widgetVar $path $varName] $newVarName]
}


proc Widget::options { path args } {
if {[llength $args]} {
foreach option $args {
lappend options [_get_configure $path $option]
}
} else {
set options [_get_configure $path {}]
}

set result [list]
foreach list $options {
if {[llength $list] < 5} { continue }
lappend result [lindex $list 0] [lindex $list end]
}
return $result
}


proc Widget::getOption { option default args } {
foreach widget $args {
set value  [Widget::getoption $widget $option]
if {$value != $default} { break }
}
return $value
}


proc Widget::cgetOption { option default args } {
foreach widget $args {
set value  [Widget::cget $widget $option]
if {$value != $default} { break }
}
return $value
}


proc Widget::nextIndex { path node } {
Widget::getVariable $path autoIndex
if {![info exists autoIndex]} { set autoIndex -1 }
return [string map [list #auto [incr autoIndex]] $node]
}


proc Widget::exists { path } {
return [info exists ::Widget::_class($path)]
}


proc Widget::theme {{bool {}}} {
variable _theme
if {[llength [info level 0]] == 2} {
if {[catch {package require tile 0.6}]
&& [catch {package require tile 1}]} {
return -code error "BWidget's theming requires tile 0.6+"
} else {
catch {style default BWSlim.Toolbutton -padding 0}
}
set _theme [string is true -strict $bool]
}
return $_theme
}


namespace eval BWidget {
variable _gstack [list]
variable _fstack [list]
}


proc BWidget::use { args } {
variable includes

if {![llength $args]} {
BWidget::use aqua [expr {$::tcl_version >= 8.4
&& [string equal [tk windowingsystem] "aqua"]}]
return
}

set package [lindex $args 0]
set value   [lindex $args 1]
set force   [string equal [lindex $args 2] "-force"]
if {![string length $value]} { set value 1 }

if {$value && ($force || ![info exists includes($package)])} {
switch -- $package {
"aqua" {

}

"png" {
if {[catch { package require img::png } err]} {
if {[catch { package require tkpng } err]} {
return -code error "Could not find img::png or tkpng package to support PNG data"
} else {
set ::BWidget::imageFormat png
}
} else {
set ::BWidget::imageFormat PNG
}

if {![info exists ::BWidget::iconLibraryFile]} {
set ::BWidget::iconLibraryFile  [file join $::BWidget::imageDir BWidget.png.tkico]
}
}

"ttk" {
Widget::theme 1

variable ::BWidget::colors

foreach {opt val} [style configure .] {
switch -- $opt {
"-background" {
set colors(SystemButtonFace) $val
}

"-foreground" {
set colors(SystemWindowText) $val
}

"-selectbackground" {
set colors(SystemHighlight) $val
}

"-selectforeground" {
set colors(SystemHighlightText) $val
}

"-troughcolor" {
set colors(SystemScrollbar) $val
}
}
}
}
}
}

set includes($package) $value
return $value
}


proc BWidget::using { package } {
if {[info exists ::BWidget::includes($package)]} {
return $::BWidget::includes($package)
}
return 0
}


proc BWidget::globalexists { varName } {
return [uplevel \#0 [list info exists $varName]]
}


proc BWidget::setglobal { varName value } {
return [uplevel \#0 [list set $varName $value]]
}


proc BWidget::getglobal { varName } {
return [uplevel \#0 [list set $varName]]
}


proc BWidget::traceglobal { cmd varName args } {
return [uplevel \#0 [list trace $cmd $varName] $args]
}



proc BWidget::lreorder { list neworder } {
set pos     0
set newlist {}
foreach e $neworder {
if { [lsearch -exact $list $e] != -1 } {
lappend newlist $e
set tabelt($e)  1
}
}
set len [llength $newlist]
if { !$len } {
return $list
}
if { $len == [llength $list] } {
return $newlist
}
set pos 0
foreach e $list {
if { ![info exists tabelt($e)] } {
set newlist [linsert $newlist $pos $e]
}
incr pos
}
return $newlist
}


proc BWidget::lremove { list args } {
foreach elem $args {
set x [lsearch -exact $list $elem]
if {$x > -1} { set list [lreplace $list $x $x] }
}
return $list
}


proc BWidget::lassign { list args } {
foreach elem $list varName $args {
if {[string equal $varName ""]} { break }
uplevel 1 [list set $varName $elem]
}
}


proc BWidget::assert { exp {msg ""}} {
set res [uplevel 1 expr $exp]
if { !$res} {
if { $msg == "" } {
return -code error "Assertion failed: {$exp}"
} else {
return -code error $msg
}
}
}


proc BWidget::clonename { menu } {
set path     ""
set menupath ""
set found    0
foreach widget [lrange [split $menu "."] 1 end] {
if { $found || [winfo class "$path.$widget"] == "Menu" } {
set found 1
append menupath "#" $widget
append path "." $menupath
} else {
append menupath "#" $widget
append path "." $widget
}
}
return $path
}


proc BWidget::getname { name } {
if { [string length $name] } {
set text [option get . "${name}Name" ""]
if { [string length $text] } {
return [parsetext $text]
}
}
return {}
}


proc BWidget::parsetext { text } {
set result ""
set index  -1
set start  0
while { [string length $text] } {
set idx [string first "&" $text]
if { $idx == -1 } {
append result $text
set text ""
} else {
set char [string index $text [expr {$idx+1}]]
if { $char == "&" } {
append result [string range $text 0 $idx]
set    text   [string range $text [expr {$idx+2}] end]
set    start  [expr {$start+$idx+1}]
} else {
append result [string range $text 0 [expr {$idx-1}]]
set    text   [string range $text [expr {$idx+1}] end]
incr   start  $idx
set    index  $start
}
}
}
return [list $result $index]
}


proc BWidget::get3dcolor { path bgcolor {multiplier 0} {divideBy 100} } {
set fmt "#%04x%04x%04x"

if {$multiplier} {
foreach val [winfo rgb $path $bgcolor] {
lappend list [expr {$multiplier * $val / $divideBy}]
}
return [eval format $fmt $list]
}

if {[string equal $bgcolor "SystemButtonFace"]} {
lappend list System3dDarkShadow SystemButtonHighlight
lappend list SystemButtonShadow System3dLight
return $list
}

foreach val [winfo rgb $path $bgcolor] {
lappend dark  [expr {48 * $val / 100}]
lappend dark2 [expr {72 * $val / 100}]

set tmp1 [expr {14*$val/10}]
if { $tmp1 > 65535 } { set tmp1 65535 }

set tmp2 [expr {(65535+$val)/2}]
lappend light  [expr {($tmp1 > $tmp2) ? $tmp1:$tmp2}]

set tmp [expr {92 * $val / 90}]
lappend light2 [expr {($tmp > 65535) ? 65535 : $tmp}]
}

lappend list [eval format $fmt $dark]
lappend list [eval format $fmt $light]
lappend list [eval format $fmt $dark2]
lappend list [eval format $fmt $light2]

return $list
}


proc BWidget::color2hex { path color } {
if {[catch { winfo rgb $path $color } rgb]} {
return -code error "Invalid color '$color'"
}
foreach {r g b} $rgb { break }
return [format {#%4.4x%4.4x%4.4x} $r $g $b]
}


proc BWidget::getGradientColors { col1Str col2Str size {offset 0} } {
if {[catch { winfo rgb . $col1Str } color1]} {
return -code error "Invalid color '$col1Str'"
}

if {[catch { winfo rgb . $col2Str } color2]} {
return -code error "Invalid color '$col2Str'"
}

set max [expr {$size - $offset}]

foreach {r1 g1 b1} $color1 { break }
foreach {r2 g2 b2} $color2 { break }
set rRange [expr {double($r2) - $r1}]
set gRange [expr {double($g2) - $g1}]
set bRange [expr {double($b2) - $b1}]
set rRatio [expr {$rRange / $max}]
set gRatio [expr {$gRange / $max}]
set bRatio [expr {$bRange / $max}]

set colors [list]

for {set i 0} {$i < $offset} {incr i} {
lappend colors [format {#%4.4x%4.4x%4.4x} $r1 $g1 $b1]
}

for {set i 0} {$i < $max} {incr i} {
set nR [expr {int( $r1 + ($rRatio * $i) )}]
set nG [expr {int( $g1 + ($gRatio * $i) )}]
set nB [expr {int( $b1 + ($bRatio * $i) )}]
lappend colors [format {#%4.4x%4.4x%4.4x} $nR $nG $nB]
}

return $colors
}


proc BWidget::XLFDfont { cmd args } {
switch -- $cmd {
create {
set font "-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
}
configure {
set font [lindex $args 0]
set args [lrange $args 1 end]
}
default {
return -code error "XLFDfont: command incorrect: $cmd"
}
}
set lfont [split $font "-"]
if { [llength $lfont] != 15 } {
return -code error "XLFDfont: description XLFD incorrect: $font"
}

foreach {option value} $args {
switch -- $option {
-foundry { set index 1 }
-family  { set index 2 }
-weight  { set index 3 }
-slant   { set index 4 }
-size    { set index 7 }
default  { return -code error "XLFDfont: option incorrect: $option" }
}
set lfont [lreplace $lfont $index $index $value]
}
return [join $lfont "-"]
}



proc BWidget::place { path w h args } {
update idletasks
if {$w == 0} { set w [winfo reqwidth  $path] }
if {$h == 0} { set h [winfo reqheight $path] }

set arglen [llength $args]
if { $arglen > 3 } {
return -code error "BWidget::place: bad number of argument"
}

if { $arglen > 0 } {
set where [lindex $args 0]
set list  [list "at" "center" "left" "right" "above" "below"]
set idx   [lsearch -exact $list $where]
if { $idx == -1 } {
return -code error [BWidget::badOptionString position $where $list]
}
if { $idx == 0 } { ## at
set err [catch {
set x [expr int([lindex $args 1])]
set y [expr int([lindex $args 2])]
}]
if { $err } {
return -code error "BWidget::place: incorrect position"
}
if {[string equal $::tcl_platform(platform) "windows"]} {
if {[string index [lindex $args 1] 0] != "-"} {
set x "+$x"
}
if {[string index [lindex $args 2] 0] != "-"} {
set y "+$y"
}
} else {
if { $x >= 0 } {
set x "+$x"
}
if { $y >= 0 } {
set y "+$y"
}
}
} else {
if { $arglen == 2 } {
set widget [lindex $args 1]
if { ![winfo exists $widget] } {
set msg "BWidget::place: \"$widget\" does not exist"
return -code error $msg
}
} else {
set widget .
}

set sw    [winfo screenwidth  $path]
set sh    [winfo screenheight $path]
set rootx [winfo rootx $widget]
set rooty [winfo rooty $widget]

if { $idx == 1 } { ## center
if { $arglen == 2 } {
set x0 [expr {$rootx + ([winfo width  $widget] - $w)/2}]
set y0 [expr {$rooty + ([winfo height $widget] - $h)/2}]
} else {
set x0 [expr {($sw - $w)/2 - [winfo vrootx $path]}]
set y0 [expr {($sh - $h)/2 - [winfo vrooty $path]}]
}
set x "+$x0"
set y "+$y0"
if {$::tcl_platform(platform) != "windows"} {
if { $x0+$w > $sw } {set x "-0"; set x0 [expr {$sw-$w}]}
if { $x0 < 0 }      {set x "+0"}
if { $y0+$h > $sh } {set y "-0"; set y0 [expr {$sh-$h}]}
if { $y0 < 0 }      {set y "+0"}
}
} else {
set x0 $rootx
set y0 $rooty
set x1 [expr {$x0 + [winfo width  $widget]}]
set y1 [expr {$y0 + [winfo height $widget]}]
if { $idx == 2 || $idx == 3 } { ## left or right
set y "+$y0"
if {$::tcl_platform(platform) != "windows"} {
if { $y0+$h > $sh } {set y "-0"; set y0 [expr {$sh-$h}]}
if { $y0 < 0 }      {set y "+0"}
}
if { $idx == 2 } {
if { $x0 >= $w } {
set x [expr {$x0-$sw}]
} elseif { $x1+$w <= $sw } {
set x "+$x1"
} else {
set x "+0"
}
} else {
if { $x1+$w <= $sw } {
set x "+$x1"
} elseif { $x0 >= $w } {
set x [expr {$x0-$sw}]
} else {
set x "-0"
}
}
} else { ## above or below
set x "+$x0"
if {[string equal $::tcl_platform(platform) "windows"]} {
if { $x0+$w > $sw } {set x "-0"; set x0 [expr {$sw-$w}]}
if { $x0 < 0 }      {set x "+0"}
}
if { $idx == 4 } {
if { $h <= $y0 } {
set y [expr {$y0-$sh}]
} elseif { $y1+$h <= $sh } {
set y "+$y1"
} else {
set y "+0"
}
} else {
if { $y1+$h <= $sh } {
set y "+$y1"
} elseif { $h <= $y0 } {
set y [expr {$y0-$sh}]
} else {
set y "-0"
}
}
}
}
}

if {[string is integer [string index $x 0]]} { set x +$x }
if {[string is integer [string index $y 0]]} { set y +$y }

wm geometry $path "${w}x${h}${x}${y}"
} else {
wm geometry $path "${w}x${h}"
}
update idletasks
}


proc BWidget::grab { option path } {
variable _gstack

if { $option == "release" } {
catch {::grab release $path}
while { [llength $_gstack] } {
set grinfo  [lindex $_gstack end]
set _gstack [lreplace $_gstack end end]
foreach {oldg mode} $grinfo {
if { ![string equal $oldg $path] && [winfo exists $oldg] } {
if { $mode == "global" } {
catch {::grab -global $oldg}
} else {
catch {::grab $oldg}
}
return
}
}
}
} else {
set oldg [::grab current]
if { $oldg != "" } {
lappend _gstack [list $oldg [::grab status $oldg]]
}
if { $option == "global" } {
::grab -global $path
} else {
::grab $path
}
}
}


proc BWidget::focus { option path {refocus 1} } {
variable _fstack

if { $option == "release" } {
while { [llength $_fstack] } {
set oldf [lindex $_fstack end]
set _fstack [lreplace $_fstack end end]
if { ![string equal $oldf $path] && [winfo exists $oldf] } {
if {$refocus} {catch {::focus -force $oldf}}
return
}
}
} elseif { $option == "set" } {
lappend _fstack [::focus]
::focus -force $path
}
}


proc BWidget::refocus {container component} {
if { [string equal $container [::focus]] } {
::focus $component
}
return
}


proc BWidget::SetFocusGrab {grab {focus {}}} {
variable _focusGrab
set index "$grab,$focus"

lappend _focusGrab($index) [::focus]
set oldGrab [::grab current $grab]
lappend _focusGrab($index) $oldGrab
if {[winfo exists $oldGrab]} {
lappend _focusGrab($index) [::grab status $oldGrab]
}
catch {::grab $grab}
if {[winfo exists $focus]} {
::focus $focus
}
}

proc BWidget::RestoreFocusGrab {grab focus {destroy destroy}} {
variable _focusGrab
set index "$grab,$focus"
if {[info exists _focusGrab($index)]} {
foreach {oldFocus oldGrab oldStatus} $_focusGrab($index) break
unset _focusGrab($index)
} else {
set oldGrab ""
}

catch {::focus $oldFocus}
::grab release $grab
if {[string equal $destroy "withdraw"]} {
wm withdraw $grab
} else {
::destroy $grab
}
if {[winfo exists $oldGrab] && [winfo ismapped $oldGrab]} {
if {[string equal $oldStatus "global"]} {
::grab -global $oldGrab
} else {
::grab $oldGrab
}
}
}

proc BWidget::badOptionString { type value list } {
set list [lsort $list]

set x [lsearch -exact $list "--"]
if {$x > -1} {
set list [lreplace $list $x $x]
lappend list --
}

set last [lindex $list end]
set list [lreplace $list end end]
set msg  "bad $type \"$value\": must be "

if {![llength $list]} {
append msg "$last"
} elseif {[llength $list] == 1} {
append msg "$list or $last"
} else {
append msg "[join $list ", "], or $last"
}

return $msg
}


proc BWidget::wrongNumArgsString { string } {
return "wrong # args: should be \"$string\""
}


proc BWidget::read_file { file } {
set fp [open $file]
set x  [read $fp [file size $file]]
close $fp
return $x
}


proc BWidget::classes { class } {
variable use

${class}::use
set classes [list $class]
if {![info exists use($class)]} { return }
foreach class $use($class) {
eval lappend classes [classes $class]
}
return [lsort -unique $classes]
}


proc BWidget::library { args } {
variable use

set exclude [list]
if {[set x [lsearch -exact $args "-exclude"]] > -1} {
set exclude [lindex $args [expr {$x + 1}]]
set args    [lreplace $args $x [expr {$x + 1}]]
}

set libs    [list widget init utils]
set classes [list]
foreach class $args {
${class}::use
foreach c [classes $class] {
if {[lsearch -exact $exclude $c] > -1} { continue }
lappend classes $c
}
}

eval lappend libs [lsort -unique $classes]

set library ""
foreach lib $libs {
if {![info exists use($lib,file)]} {
set file [file join $::BWIDGET::LIBRARY $lib.tcl]
} else {
set file [file join $::BWIDGET::LIBRARY $use($lib,file).tcl]
}
append library [read_file $file]
}

return $library
}


proc BWidget::inuse { class } {
variable ::Widget::_inuse

if {![info exists _inuse($class)]} { return 0 }
return [expr $_inuse($class) > 0]
}


proc BWidget::write { filename {mode w} } {
variable use

if {![info exists use(classes)]} { return }

set classes [list]
foreach class $use(classes) {
if {![inuse $class]} { continue }
lappend classes $class
}

set fp [open $filename $mode]
puts $fp [eval library $classes]
close $fp

return
}


proc BWidget::bindMouseWheel { widgetOrClass } {
bind $widgetOrClass <MouseWheel>         {
if {![string equal [%W yview] "0 1"]} {
%W yview scroll [expr {-%D/24}]  units
}
}

bind $widgetOrClass <Shift-MouseWheel>   {
if {![string equal [%W yview] "0 1"]} {
%W yview scroll [expr {-%D/120}] pages
}
}

bind $widgetOrClass <Control-MouseWheel> {
if {![string equal [%W yview] "0 1"]} {
%W yview scroll [expr {-%D/120}] units
}
}

bind $widgetOrClass <Button-4> {event generate %W <MouseWheel> -delta  120}
bind $widgetOrClass <Button-5> {event generate %W <MouseWheel> -delta -120}
}


proc BWidget::Icon { name } {
if {![Widget::exists $::BWidget::iconLibrary]} {
BWidget::LoadBWidgetIconLibrary
}

return [$::BWidget::iconLibrary image $name]
}


proc BWidget::LoadBWidgetIconLibrary {} {
if {![Widget::exists $::BWidget::iconLibrary]} {
IconLibrary $::BWidget::iconLibrary -file $::BWidget::iconLibraryFile
}
}


proc BWidget::CreateImage { gifdata pngdata args } {
lappend args -format $::BWidget::imageFormat
if {[BWidget::using png]} {
lappend args -data $pngdata
} else {
lappend args -data $gifdata
}

return [eval image create photo $args]
}


proc BWidget::ParseArgs { _arrayName _arglist args } {
upvar 1 $_arrayName array

array set _args {
-strict     0
-options    {}
-switches   {}
-required   {}
-nocomplain 0
}
array set _args $args
if {[info exists _args(-errorvar)]} { upvar 1 $_args(-errorvar) error }

set switches $_args(-switches)
foreach switch $switches {
set array([string range $switch 1 end]) 0
}

set options [list]
foreach opt $_args(-options) {
set option $opt
if {[llength $opt] == 2} {
set option [lindex $opt 0]
set array([string range $option 1 end]) [lindex $opt 1]
}
lappend options $option
}

set array(OPTIONS)  [list]
set array(SWITCHES) [list]

set oplen   [llength $options]
set swlen   [llength $switches]
set index   0
set waiting 0
foreach arg $_arglist {
switch -glob -- $arg {
"--" {
incr index
break
}

"-*" {
if {$waiting} {
set waiting 0
set array($option) $arg
lappend array(OPTIONS) -$option $arg
continue
}

if {$swlen && [lsearch -exact $switches $arg] > -1} {
lappend array(SWITCHES) $arg
set array([string range $arg 1 end]) 1
} elseif {$oplen && [lsearch -exact $options $arg] < 0} {
if {$_args(-nocomplain)} { return 0 }
return -code error "unknown option \"$arg\""
} elseif {$_args(-strict)} {
set switches [concat -- $_args(-switches)]
set msg [BWidget::badOptionString option $arg $switches]
return -code error $msg
} else {
set waiting 1
set option [string range $arg 1 end]
}
}

default {
if {$waiting} {
set waiting 0
set array($option) $arg
lappend array(OPTIONS) -$option $arg
} else {
break
}
}
}

incr index
}

set array(_ARGS_) [lrange $_arglist $index end]

if {[llength $_args(-required)]} {
foreach arg [lsort -dict $_args(-required)] {
if {![info exists array([string range $arg 1 end])]} {
return -code error "missing required argument $arg"
}
}
}

return 1
}


proc BWidget::CopyBindings { from to } {
foreach event [bind $from] {
bind $to $event [bind $from $event]
}
}


proc BWidget::DrawCanvasBorder { canvas relief color coords args } {
lassign $coords x0 y0 x1 y1
lassign [BWidget::get3dcolor $canvas $color] dark light dark2 light2

switch -- $relief {
"raised" - "sunken" {
lappend lines [list $x0 $y1 $x0 $y0 $x1 $y0]
lappend lines [list $x1 $y0 $x1 $y1 $x0 $y1]
lappend lines [list  [expr {$x0 + 1}] [expr {$y1 - 2}]  [expr {$x0 + 1}] [expr {$y0 + 1}]  [expr {$x1 - 1}] [expr {$y0 + 1}]]
lappend lines [list  [expr {$x0 + 1}] [expr {$y1 - 1}]  [expr {$x1 - 1}] [expr {$y1 - 1}]  [expr {$x1 - 1}] $y0]

set colors [list $light $dark $light2 $dark2]
if {[string equal $relief "sunken"]} {
set colors [list $dark $light $dark2 $light2]
}
}

"groove" - "ridge" {
lappend lines [list  $x0 $y1  $x1 $y1  $x1 $y0  $x1 [expr {$y0 + 1}]  [expr {$x0 + 1}] [expr {$y0 + 1}]  [expr {$x0 + 1}] $y1  ]

lappend lines [list  $x0 $y0  [expr {$x1 - 1}] $y0  [expr {$x1 - 1}] [expr {$y1 - 1}]  $x0 [expr {$y1 - 1}]  $x0 $y0  ]

set colors [list $light $dark2]
if {[string equal $relief "ridge"]} {
set colors [list $dark2 $light]
}
}

"rounded" {
set coords [list  [expr {$x0 + 1}] $y0  [expr {$x1 - 1}] $y0  $x1 [expr {$y0 + 1}]  $x1 [expr {$y1 - 1}]  [expr {$x1 - 1}] $y1  [expr {$x0 + 1}] $y1  $x0 [expr {$y1 - 1}]  $x0 [expr {$y0 + 1}]  [expr {$x0 + 1}] $y0  ]

set opts [list -outline $dark2 -fill $color]
eval [list $canvas create poly $coords] $opts $args

return
}

"highlight" {
set opts [list -outline $dark -fill $light]
eval [list $canvas create rect $coords] $opts $args

set coords [list [incr x0] [incr y0] [incr x1 -1] [incr y1 -1]]
eval [list $canvas create rect $coords -outline $dark2] $args

return
}
}

foreach line $lines color $colors {
eval [list $canvas create line $line -fill $color] $args
}
}

proc ::BWidget::FadeWindowIn { top {increment 0.08} {current 0} } {
if {[tk windowingsystem] eq "x11"
|| ![package vsatisfies [info patchlevel] 8.4.8]} {
wm deiconify $top
return
}

if {$current == 0} {
wm attributes $top -alpha [set current 0.01]
wm deiconify $top
}

set current [expr {$current + $increment}]

if {$current < 1.0} {
wm attributes $top -alpha $current
update idletasks

after 10 [list BWidget::FadeWindowIn $increment $current]
} else {
wm attributes $top -alpha 0.99999
}
}

proc ::BWidget::FadeWindowOut { top {destroy 0} {increment 0.08} {current 0} } {
if {![winfo exists $top]} { return }

if {[tk windowingsystem] eq "x11"
|| ![package vsatisfies [info patchlevel] 8.4.8]} {
if {$destroy} {
destroy $top
} else {
wm withdraw $top
}
return
}

if {$current == 0} {
set current [wm attributes $top -alpha]
}

set current [expr {$current - $increment}]

if {$current >= .01} {
wm attributes $top -alpha $current
update idletasks

after 10 [list BWidget::FadeWindowOut $top $destroy $increment $current]
} else {
if {$destroy} {
destroy $top
} else {
wm withdraw   $top
wm attributes $top -alpha 0.99999
}
}
}


if {[info exists ::InstallJammer]} { return }

namespace eval ::BWIDGET {
variable LIBRARY [file join $::installkit::root lib InstallJammer]
}

proc BWidgetInit {} {
set ::BWidget::imageDir $::BWIDGET::LIBRARY
set ::BWidget::iconLibraryFile [file join $::BWIDGET::LIBRARY icons.tkico]

BWidget::use ttk
BWidget::use png
}

namespace eval DragSite    { proc use {} {} }
namespace eval DropSite    { proc use {} {} }
namespace eval DynamicHelp { proc use {} {} }

proc DragSite::include { class type event } {
set dragoptions [list  [list	-dragenabled	Boolean	0	0]  [list	-draginitcmd	String	""	0]  [list	-dragendcmd	String	""	0]  [list	-dragtype	String	$type	0]  [list	-dragevent	Enum	$event	0	[list 1 2 3]]  ]
Widget::declare $class $dragoptions
}
proc DragSite::setdrag {args} { }

proc DropSite::include { class types } {
set dropoptions [list  [list	-dropenabled	Boolean	0	0]  [list	-dropovercmd	String	""	0]  [list	-dropcmd	String	""	0]  [list	-droptypes	String	$types	0]  ]
Widget::declare $class $dropoptions
}

proc DynamicHelp::include { class type } {
set helpoptions [list  [list -helptext String "" 0]  [list -helpvar  String "" 0]  [list -helptype Enum $type 0 [list balloon variable]]  ]
Widget::declare $class $helpoptions
}

proc DropSite::setdrop    { args } { }
proc DropSite::setcursor  { args } { }
proc DynamicHelp::sethelp { args } { }

package provide BWidget 1.8

BWidgetInit
if {[string equal $::tcl_platform(platform) "windows"]} {
option add *ListBox.background      SystemWindow            widgetDefault
option add *ButtonBox.padY          0                       widgetDefault
option add *Dialog.padY             0                       widgetDefault
} elseif {[tk windowingsystem] eq "aqua"} {

} else {
option add *Scrollbar.width         12                      widgetDefault
option add *Scrollbar.borderWidth   1                       widgetDefault
option add *Dialog.separator        1                       widgetDefault
option add *MainFrame.relief        raised                  widgetDefault
option add *MainFrame.separator     none                    widgetDefault
option add *MessageDlg.usenative    0                       widgetDefault
}

option read [file join $::BWIDGET::LIBRARY lang en.rc]

bind Entry   <<TraverseIn>> { %W selection range 0 end; %W icursor end }
bind Spinbox <<TraverseIn>> { %W selection range 0 end; %W icursor end }

bind all <Key-Tab>       { Widget::traverseTo [Widget::focusNext %W] }
bind all <<PrevWindow>>  { Widget::traverseTo [Widget::focusPrev %W] }

namespace eval ::BWidget {
variable library     $::BWIDGET::LIBRARY
variable langDir     [file join $library lang]
variable imageDir    [file join $library images]
variable imageFormat GIF

variable iconLibrary
if {![info exists iconLibrary]} {
set iconLibrary BWidgetIcons
}

variable iconLibraryFile
if {![info exists iconLibraryFile]} {
set iconLibraryFile [file join $imageDir BWidget.gif.tkico]
}

variable colors
if {[string equal $::tcl_platform(platform) "windows"]} {
array set colors {
SystemButtonFace    SystemButtonFace
SystemButtonText    SystemButtonText
SystemDisabledText  SystemDisabledText
SystemHighlight     SystemHighlight
SystemHighlightText SystemHighlightText
SystemMenu          SystemMenu
SystemMenuText      SystemMenuText
SystemScrollbar     SystemScrollbar
SystemWindow        SystemWindow
SystemWindowFrame   SystemWindowFrame
SystemWindowText    SystemWindowText
}
} else {
array set colors {
SystemButtonFace    #d9d9d9
SystemButtonText    black
SystemDisabledText  #a3a3a3
SystemHighlight     #c3c3c3
SystemHighlightText white
SystemMenu          #d9d9d9
SystemMenuText      white
SystemScrollbar     #d9d9d9
SystemWindow        white
SystemWindowFrame   #d9d9d9
SystemWindowText    black
}
}

if {[lsearch -exact [font names] "TkTextFont"] < 0} {
catch {font create TkTextFont}
catch {font create TkDefaultFont}
catch {font create TkHeadingFont}
catch {font create TkCaptionFont}
catch {font create TkTooltipFont}

switch -- [tk windowingsystem] {
win32 {
if {$::tcl_platform(osVersion) >= 5.0} {
variable family "Tahoma"
} else {
variable family "MS Sans Serif"
}
variable size 8

font configure TkDefaultFont -family $family -size $size
font configure TkTextFont    -family $family -size $size
font configure TkHeadingFont -family $family -size $size
font configure TkCaptionFont -family $family -size $size  -weight bold
font configure TkTooltipFont -family $family -size $size
}

classic - aqua {
variable family "Lucida Grande"
variable size 13
variable viewsize 12
variable smallsize 11

font configure TkDefaultFont -family $family -size $size
font configure TkTextFont    -family $family -size $size
font configure TkHeadingFont -family $family -size $smallsize
font configure TkCaptionFont -family $family -size $size  -weight bold
font configure TkTooltipFont -family $family -size $viewsize
}

x11 {
if {![catch {tk::pkgconfig get fontsystem} fs]
&& [string equal $fs "xft"]} {
variable family "sans-serif"
} else {
variable family "Helvetica"
}
variable size -12
variable ttsize -10
variable capsize -14

font configure TkDefaultFont -family $family -size $size
font configure TkTextFont    -family $family -size $size
font configure TkHeadingFont -family $family -size $size  -weight bold
font configure TkCaptionFont -family $family -size $capsize  -weight bold
font configure TkTooltipFont -family $family -size $ttsize
}
}
}
} ; ## namespace eval ::BWidget


namespace eval Label {
Widget::define Label label DragSite DropSite DynamicHelp

Widget::tkinclude Label label .l  remove { -foreground -state -text -textvariable -underline }

Widget::declare Label {
{-name               String     ""     0}
{-text               String     ""     0}
{-textvariable       String     ""     0}
{-underline          Int        -1     0 "%d >= -1"}
{-focus              String     ""     0}
{-foreground         Color      "SystemButtonText"       0}
{-disabledforeground Color      "SystemDisabledText"     0}
{-state              Enum       normal 0  {normal disabled}}

{-autowrap           Boolean    "0"    1}
{-wrappadx           Int        "10"   0}

{-elide              Boolean    "0"    1}
{-ellipsis           String     "..."  0}
{-elidepadx          Int        "5"    0}
{-elideside          Enum       "right" 0 {center left right}}

{-fg                 Synonym    -foreground}
}

DynamicHelp::include Label balloon
DragSite::include    Label "" 1
DropSite::include    Label {
TEXT    {move {}}
IMAGE   {move {}}
BITMAP  {move {}}
FGCOLOR {move {}}
BGCOLOR {move {}}
COLOR   {move {}}
}

Widget::syncoptions Label "" .l {-text {} -underline {}}

bind BwLabel <FocusIn>   [list Label::setfocus %W]
bind BwLabel <Destroy>   [list Label::_destroy %W]
}


proc Label::create { path args } {
Widget::initArgs Label $args maps

frame $path -class Label -borderwidth 0 -highlightthickness 0 -relief flat
Widget::initFromODB Label $path $maps(Label)

Widget::getVariable $path data

set data(width) 0

eval [list label $path.l] $maps(.l)

if {[string equal [Widget::cget $path -state] "normal"]} {
set fg [Widget::cget $path -foreground]
} else {
set fg [Widget::cget $path -disabledforeground]
}

set var [Widget::cget $path -textvariable]
if {$var == ""
&& [Widget::cget $path -image] == ""
&& [Widget::cget $path -bitmap] == ""} {
set desc [BWidget::getname [Widget::cget $path -name]]
if {[string length $desc]} {
set text  [lindex $desc 0]
set under [lindex $desc 1]
} else {
set text  [Widget::cget $path -text]
set under [Widget::cget $path -underline]
}
} else {
set under -1
set text  ""
}

$path.l configure -text $text -underline $under -foreground $fg

set accel [string tolower [string index $text $under]]
if {[string length $accel]} {
bind [winfo toplevel $path] <Alt-$accel> [list Label::setfocus $path]
}

bindtags $path   [list BwLabel [winfo toplevel $path] all]
bindtags $path.l [list $path.l $path Label [winfo toplevel $path] all]
pack $path.l -expand yes -fill both

set dragendcmd [Widget::cget $path -dragendcmd]
DragSite::setdrag $path $path.l Label::_init_drag_cmd $dragendcmd 1
DropSite::setdrop $path $path.l Label::_over_cmd Label::_drop_cmd 1
DynamicHelp::sethelp $path $path.l 1

if {[string length $var]} {
upvar #0 $var textvar
_trace_variable $path
if {![info exists textvar]} {
set textvar [Widget::getoption $path -text]
} else {
_update_textvariable $path "" "" write
}
}

if {[Widget::getoption $path -elide]
|| [Widget::getoption $path -autowrap]} {
bind $path.l <Configure> [list Label::_redraw $path %w]
}

return [Widget::create Label $path]
}


proc Label::configure { path args } {
set oldunder [$path.l cget -underline]
if {$oldunder != -1} {
set oldaccel [string index [$path.l cget -text] $oldunder]
set oldaccel [string tolower $oldaccel]
} else {
set oldaccel ""
}

set oldvar [$path.l cget -textvariable]

set res [Widget::configure $path $args]

set cfg  [Widget::hasChanged $path -foreground fg]
set cdfg [Widget::hasChanged $path -disabledforeground dfg]
set cst  [Widget::hasChanged $path -state state]

if { $cst || $cfg || $cdfg } {
if { $state == "normal" } {
$path.l configure -fg $fg
} else {
$path.l configure -fg $dfg
}
}

set cv [Widget::hasChanged $path -textvariable var]
set cb [Widget::hasChanged $path -image img]
set ci [Widget::hasChanged $path -bitmap bmp]
set cn [Widget::hasChanged $path -name name]
set ct [Widget::hasChanged $path -text text]
set cu [Widget::hasChanged $path -underline under]

if { $cv || $cb || $ci || $cn || $ct || $cu } {
if {  $var == "" && $img == "" && $bmp == "" } {
set desc [BWidget::getname $name]
if { $desc != "" } {
set text  [lindex $desc 0]
set under [lindex $desc 1]
}
} else {
set under -1
set text  ""
}
set top [winfo toplevel $path]
if { $oldaccel != "" } {
bind $top <Alt-$oldaccel> {}
}
set accel [string tolower [string index $text $under]]
if { $accel != "" } {
bind $top <Alt-$accel> [list Label::setfocus $path]
}
$path.l configure -text $text -underline $under -textvariable $var
}

if {$cv} {
if {[string length $oldvar]} {
trace remove variable $oldvar [list write unset]  [list Label::_update_textvariable $path]
}

_trace_variable $path
}

if {$ct && [Widget::getoption $path -elide]} {
_redraw $path [winfo width $path]
}

set force [Widget::hasChanged $path -dragendcmd dragend]
DragSite::setdrag $path $path.l Label::_init_drag_cmd $dragend $force
DropSite::setdrop $path $path.l Label::_over_cmd Label::_drop_cmd
DynamicHelp::sethelp $path $path.l

return $res
}


proc Label::cget { path option } {
return [Widget::cget $path $option]
}


proc Label::setfocus { path } {
if {[string equal [Widget::cget $path -state] "normal"]} {
set w [Widget::cget $path -focus]
if { [winfo exists $w] && [Widget::focusOK $w] } {
focus $w
}
}
}


proc Label::_init_drag_cmd { path X Y top } {
set path [winfo parent $path]
if {[set cmd [Widget::cget $path -draginitcmd]] != ""} {
return [uplevel \#0 $cmd [list $path $X $Y $top]]
}
if { [set data [$path.l cget -image]] != "" } {
set type "IMAGE"
pack [label $top.l -image $data]
} elseif { [set data [$path.l cget -bitmap]] != "" } {
set type "BITMAP"
pack [label $top.l -bitmap $data]
} else {
set data [$path.l cget -text]
set type "TEXT"
}
set usertype [Widget::getoption $path -dragtype]
if { $usertype != "" } {
set type $usertype
}
return [list $type {copy} $data]
}


proc Label::_drop_cmd { path source X Y op type data } {
set path [winfo parent $path]
if {[set cmd [Widget::cget $path -dropcmd]] != ""} {
return [uplevel \#0 $cmd [list $path $source $X $Y $op $type $data]]
}
if { $type == "COLOR" || $type == "FGCOLOR" } {
configure $path -foreground $data
} elseif { $type == "BGCOLOR" } {
configure $path -background $data
} else {
set text   ""
set image  ""
set bitmap ""
switch -- $type {
IMAGE   {set image $data}
BITMAP  {set bitmap $data}
default {
set text $data
if { [set var [$path.l cget -textvariable]] != "" } {
configure $path -image "" -bitmap ""
BWidget::setglobal $var $data
return
}
}
}
configure $path -text $text -image $image -bitmap $bitmap
}
return 1
}


proc Label::_over_cmd { path source event X Y op type data } {
set path [winfo parent $path]
if { [set cmd [Widget::cget $path -dropovercmd]] != "" } {
set opts [list $path $source $event $X $Y $op $type $data]
return [uplevel \#0 $cmd $opts]
}
if {[Widget::getoption $path -state] == "normal" ||
$type == "COLOR" || $type == "FGCOLOR" || $type == "BGCOLOR"} {
DropSite::setcursor based_arrow_down
return 1
}
DropSite::setcursor dot
return 0
}


proc Label::_redraw { path width } {
Widget::getVariable $path data

if {$width == $data(width)} { return }

if {[Widget::getoption $path -autowrap]} {
set padx [Widget::getoption $path -wrappadx]
$path.l configure -wraplength [expr {$width - $padx}]
} elseif {[Widget::getoption $path -elide]} {
set font     [$path.l cget -font]
set text     [Widget::getoption $path -text]
set side     [Widget::getoption $path -elideside]
set ellipsis [Widget::getoption $path -ellipsis]

set bd    [$path.l cget -bd]
set padx  [$path.l cget -padx]
set epadx [Widget::getoption $path -elidepadx]
set width [expr {($width - (($bd + $padx) * 2)) - $epadx}]

if {$width > 0} {
set string $text
while {[font measure $font $string] > $width} {
switch -- $side {
"left"   {
set text   [string range $text 1 end]
set string $ellipsis$text
}

"right"  {
set text   [string range $text 0 end-1]
set string $text$ellipsis
}

"center" {
set x [expr {[string length $text] / 2}]
set l [string range $text 0 $x]
set r [string range $text [incr x 2] end]
set text   $l$r
set string $l$ellipsis$r
}
}

if {![string length $text]} { break }
}

$path.l configure -text $string
}
}

set data(width) [winfo reqwidth $path.l]
}


proc Label::_trace_variable { path } {
set varName [Widget::getoption $path -textvariable]

if {[string length $varName]} {
set ops     [list write unset]
set command [list Label::_update_textvariable $path]

uplevel #0 [list trace add variable $varName $ops $command]
}
}


proc Label::_update_textvariable { path name1 name2 op } {
set varName [Widget::getoption $path -textvariable]
upvar #0 $varName var

switch -- $op {
"write" {
Widget::setoption $path -text $var

$path.l configure -text $var

_redraw $path [winfo width $path]
}

"unset" {
set var [Widget::getoption $path -text]
_trace_variable $path
}
}
}


proc Label::_destroy { path } {
set ops     [list write unset]
set cmd     [list Label::_update_textvariable $path]
set varName [Widget::getoption $path -textvariable]

uplevel #0 [list trace remove variable $varName $ops $cmd]

Widget::destroy $path
}


namespace eval Tree {
Widget::define Tree tree DragSite DropSite DynamicHelp

namespace eval Node {
Widget::declare Tree::Node {
{-text       String     ""      0}
{-font       String     ""      0}
{-image      String     ""      0}
{-window     String     ""      0}
{-fill       Color      "SystemButtonText"   0}
{-data       String     ""      0}
{-open       Boolean    0       0}
{-selectable Boolean    1       0}
{-drawcross  Enum       auto    0 {auto allways never}}
{-padx       Int        -1      0 "%d >= -1"}
{-deltax     Int        -1      0 "%d >= -1"}
{-anchor     String     "w"     0 ""}
}
}

DynamicHelp::include Tree::Node balloon

Widget::tkinclude Tree canvas .c  remove {
-insertwidth -insertbackground -insertborderwidth -insertofftime
-insertontime -selectborderwidth -closeenough -confine -scrollregion
-xscrollincrement -yscrollincrement -width -height
} initialize {
-background white -relief sunken -borderwidth 2
-takefocus 1 -highlightthickness 1 -width 200
}

DragSite::include Tree "TREE_NODE" 1
DropSite::include Tree {
TREE_NODE {copy {} move {}}
}

Widget::declare Tree {
{-deltax            Int        10       0 "%d >= 0"}
{-deltay            Int        15       0 "%d >= 0"}
{-padx              Int        20       0 "%d >= 0"}
{-font              String     "TkTextFont" 0}
{-background        Color      "SystemWindow"  0}
{-selectbackground  Color      "SystemHighlight"  0}
{-selectforeground  Color      "SystemHighlightText" 0}
{-selectcommand     String     ""       0}
{-selectmode        Enum       "single" 0 {extended none single}}
{-width             TkResource ""       0 listbox}
{-height            TkResource ""       0 listbox}
{-selectfill        Boolean    0        0}
{-showlines         Boolean    1        0}
{-linesfill         Color      "SystemButtonText"  0}
{-linestipple       TkResource ""       0 {label -bitmap}}
{-crossfill         Color      "SystemButtonText"  0}
{-redraw            Boolean    1        0}
{-opencmd           String     ""       0}
{-closecmd          String     ""       0}
{-dropovermode      Flag       "wpn"    0 "wpn"}
{-dropcmd           String     "Tree::_drag_and_drop" 0}

{-crossopenimage    String     ""       0}
{-crosscloseimage   String     ""       0}
{-crossopenbitmap   String     ""       0}
{-crossclosebitmap  String     ""       0}

{-bg                Synonym    -background}
}

Widget::addmap Tree "" .c { -deltay -yscrollincrement }

bind Tree <FocusIn>   [list after idle {BWidget::refocus %W %W.c}]
bind Tree <Destroy>   [list Tree::_destroy %W]
bind Tree <Configure> [list Tree::_update_scrollregion %W]

bind TreeSentinalStart <Button-1> {
if {$::Tree::sentinal(%W)} {
set ::Tree::sentinal(%W) 0
break
}
}

bind TreeSentinalEnd <Button-1> {
set ::Tree::sentinal(%W) 0
}

bind TreeFocus <Button-1> [list focus %W]

BWidget::bindMouseWheel TreeCanvas

variable _edit
set _edit(editing) 0
}


proc Tree::create { path args } {
Widget::initArgs Tree $args maps

eval [list frame $path -class Tree] $maps(:cmd)

if {[info tclversion] > 8.3} { $path configure -padx 0 -pady 0 }

Widget::initFromODB Tree $path $maps(Tree)

set ::Tree::sentinal($path.c) 0

Widget::getVariable $path data

set data(root)         [list [list]]
set data(selnodes)     [list]
set data(upd,level)    0
set data(upd,nodes)    [list]
set data(upd,afterid)  ""
set data(dnd,scroll)   ""
set data(dnd,afterid)  ""
set data(dnd,selnodes) [list]
set data(dnd,node)     ""

Widget::getVariable $path items

eval [list canvas $path.c] $maps(.c) -xscrollincrement 8
bindtags $path.c [list TreeSentinalStart TreeFocus $path.c Canvas  TreeCanvas [winfo toplevel $path] all TreeSentinalEnd]
pack $path.c -expand yes -fill both
$path.c bind cross <ButtonPress-1> [list Tree::_cross_event $path]

bind $path.c <KeyPress-Up>    [list Tree::_keynav up $path]
bind $path.c <KeyPress-Down>  [list Tree::_keynav down $path]
bind $path.c <KeyPress-Right> [list Tree::_keynav right $path]
bind $path.c <KeyPress-Left>  [list Tree::_keynav left $path]
bind $path.c <KeyPress-space> [list +Tree::_keynav space $path]

bind $path.c <Control-KeyPress-Up>    [list $path.c yview scroll -1 units]
bind $path.c <Control-KeyPress-Down>  [list $path.c yview scroll  1 units]
bind $path.c <Control-KeyPress-Left>  [list $path.c xview scroll -1 units]
bind $path.c <Control-KeyPress-Right> [list $path.c xview scroll  1 units]

DragSite::setdrag $path $path.c Tree::_init_drag_cmd  [Widget::cget $path -dragendcmd] 1
DropSite::setdrop $path $path.c Tree::_over_cmd Tree::_drop_cmd 1

Widget::create Tree $path

set w [Widget::cget $path -width]
set h [Widget::cget $path -height]
set dy [Widget::cget $path -deltay]
$path.c configure -width [expr {$w*8}] -height [expr {$h*$dy}]

set mode [Widget::getoption $path -selectmode]
if {$mode ne "none"} {
Tree::bindText  $path <Double-1> [list $path toggle]
Tree::bindImage $path <Double-1> [list $path toggle]
Tree::bindText  $path <Button-1> [list $path selection set]
Tree::bindImage $path <Button-1> [list $path selection set]
}

if {$mode eq "extended"} {
Tree::bindText  $path <Control-Button-1> [list $path selection toggle]
Tree::bindImage $path <Control-Button-1> [list $path selection toggle]
}

$path.c bind TreeItemSentinal <Double-Button-1>  [list set ::Tree::sentinal($path.c) 1]


set image  [Widget::getoption $path -crossopenimage]
set bitmap [Widget::getoption $path -crossopenbitmap]
if {![string length $image] && ![string length $bitmap]} {
Widget::setoption $path -crossopenimage [BWidget::Icon tree-minus]
}

set image  [Widget::getoption $path -crosscloseimage]
set bitmap [Widget::getoption $path -crossclosebitmap]
if {![string length $image] && ![string length $bitmap]} {
Widget::setoption $path -crosscloseimage [BWidget::Icon tree-plus]
}

return $path
}


proc Tree::configure { path args } {
Widget::getVariable $path data

set res [Widget::configure $path $args]

set ch1 [expr {[Widget::hasChanged $path -deltax val]
|| [Widget::hasChanged $path -deltay dy]
|| [Widget::hasChanged $path -padx val]
|| [Widget::hasChanged $path -showlines val]
|| [Widget::hasChanged $path -font font]}]

set ch2 [expr {[Widget::hasChanged $path -selectbackground val] |
[Widget::hasChanged $path -selectforeground val]}]

if {[Widget::hasChanged $path -linesfill fill]
|| [Widget::hasChanged $path -linestipple stipple] } {
$path.c itemconfigure line  -fill $fill -stipple $stipple
}

if {[Widget::hasChanged $path -crossfill fill]} {
$path.c itemconfigure cross -foreground $fill
}

if {[Widget::hasChanged $path -selectfill fill]} {
if {$fill} {
foreach event [$path.c bind "node"] {
$path.c bind "box" $event [$path.c bind "node" $event]
}
} else {
foreach event [$path.c bind "node"] {
$path.c bind "box" $event {}
}
}
}

if { $ch1 } {
_redraw_idle $path 3
} elseif { $ch2 } {
_redraw_idle $path 1
}

if { [Widget::hasChanged $path -height h] } {
$path.c configure -height [expr {$h*$dy}]
}
if { [Widget::hasChanged $path -width w] } {
$path.c configure -width [expr {$w*8}]
}

if { [Widget::hasChanged $path -redraw bool] && $bool } {
set upd $data(upd,level)
set data(upd,level) 0
_redraw_idle $path $upd
}

set force [Widget::hasChanged $path -dragendcmd dragend]
DragSite::setdrag $path $path.c Tree::_init_drag_cmd $dragend $force
DropSite::setdrop $path $path.c Tree::_over_cmd Tree::_drop_cmd

return $res
}


proc Tree::cget { path option } {
return [Widget::cget $path $option]
}


proc Tree::insert { path index parent node args } {
Widget::getVariable $path data

set node [_node_name $path $node]
set node [Widget::nextIndex $path $node]

if {[info exists data($node)]} {
return -code error "node \"$node\" already exists"
}

if {![info exists data($parent)]} {
return -code error "node \"$parent\" does not exist"
}

Widget::init Tree::Node $path.$node $args

if {[string equal $index "end"]} {
lappend data($parent) $node
} else {
set data($parent) [linsert $data($parent) [incr index] $node]
}
set data($node) [list $parent]

if {[string equal $parent "root"]} {
_redraw_idle $path 3
} elseif {[Tree::visible $path $parent]} {
if {[Widget::getoption $path.$parent -open]} {
_redraw_idle $path 3
} else {
lappend data(upd,nodes) $parent 8
_redraw_idle $path 2
}
}

return $node
}


proc Tree::itemconfigure { path node args } {
Widget::getVariable $path data

set node [_node_name $path $node]
if {[string equal $node "root"] || ![info exists data($node)]} {
return -code error "node \"$node\" does not exist"
}

set result [Widget::configure $path.$node $args]

_set_help $path $node

if { [visible $path $node] } {
set lopt   {}
set flag   0
foreach opt {-window -image -drawcross -font -text -fill} {
set flag [expr {$flag << 1}]
if {[Widget::hasChanged $path.$node $opt val]} {
set flag [expr {$flag | 1}]
}
}

if {[Widget::hasChanged $path.$node -open val]} {
if {[llength $data($node)] > 1} {
_redraw_idle $path 3
} else {
set flag [expr {$flag | 8}]
}
}

if {$data(upd,level) < 3 && [Widget::hasChanged $path.$node -padx x]} {
_redraw_idle $path 3
}

if { $data(upd,level) < 3 && $flag } {
if { [set idx [lsearch -exact $data(upd,nodes) $node]] == -1 } {
lappend data(upd,nodes) $node $flag
} else {
incr idx
set flag [expr {[lindex $data(upd,nodes) $idx] | $flag}]
set data(upd,nodes) [lreplace $data(upd,nodes) $idx $idx $flag]
}
_redraw_idle $path 2
}
}
return $result
}


proc Tree::itemcget { path node option } {
Widget::getVariable $path data
set node [_node_name $path $node]
if {[string equal $node "root"] || ![info exists data($node)]} {
return -code error "node \"$node\" does not exist"
}

return [Widget::cget $path.$node $option]
}


proc Tree::bindText { path event script } {
if {[string length $script]} {
append script " \[Tree::_get_node_name [list $path] current 2\]"
}
$path.c bind "node" $event $script
if {[Widget::getoption $path -selectfill]} {
$path.c bind "box" $event $script
} else {
$path.c bind "box" $event {}
}
}


proc Tree::bindImage { path event script } {
if {[string length $script]} {
append script " \[Tree::_get_node_name [list $path] current 2\]"
}
$path.c bind "img" $event $script
if {[Widget::getoption $path -selectfill]} {
$path.c bind "box" $event $script
} else {
$path.c bind "box" $event {}
}
}


proc Tree::bindTree { path args } {
return [eval [list bind $path.c] $args]
}


proc Tree::clear { path } {
eval [list Tree::delete $path] [Tree::nodes $path root]
}


proc Tree::delete { path args } {
Widget::getVariable $path data

foreach lnodes $args {
foreach node $lnodes {
set node [_node_name $path $node]
if { ![string equal $node "root"] && [info exists data($node)] } {
set parent [lindex $data($node) 0]
set idx	   [lsearch -exact $data($parent) $node]
set data($parent) [lreplace $data($parent) $idx $idx]
_subdelete $path [list $node]
}
}
}

_redraw_idle $path 3
}


proc Tree::move { path parent node index } {
Widget::getVariable $path data

set node [_node_name $path $node]
if { [string equal $node "root"] || ![info exists data($node)] } {
return -code error "node \"$node\" does not exist"
}
if { ![info exists data($parent)] } {
return -code error "node \"$parent\" does not exist"
}
set p $parent
while {![string equal $p "root"]} {
if {[string equal $p $node]} {
return -code error "node \"$parent\" is a descendant of \"$node\""
}
set p [Tree::parent $path $p]
}

set oldp        [lindex $data($node) 0]
set idx         [lsearch -exact $data($oldp) $node]
set data($oldp) [lreplace $data($oldp) $idx $idx]
set data($node) [concat [list $parent] [lrange $data($node) 1 end]]

if {[string equal $index "end"]} {
lappend data($parent) $node
} else {
set data($parent) [linsert $data($parent) [incr index] $node]
}

if {([string equal $oldp "root"] ||
([visible $path $oldp] && [Widget::getoption $path.$oldp -open]))
|| ([string equal $parent "root"] ||
([visible $path $parent]
&& [Widget::getoption $path.$parent -open]))} {
_redraw_idle $path 3
}
}


proc Tree::reorder { path node neworder } {
Widget::getVariable $path data

set node [_node_name $path $node]
if { ![info exists data($node)] } {
return -code error "node \"$node\" does not exist"
}
set children [lrange $data($node) 1 end]
if { [llength $children] } {
set children [BWidget::lreorder $children $neworder]
set data($node) [linsert $children 0 [lindex $data($node) 0]]
if { [visible $path $node] && [Widget::getoption $path.$node -open] } {
_redraw_idle $path 3
}
}
}


proc Tree::selection { path cmd args } {
Widget::getVariable $path data

switch -- $cmd {
toggle {
foreach node $args {
set node [_node_name $path $node]
if {![info exists data($node)]} {
return -code error "$path selection toggle:
Cannot toggle unknown node \"$node\"."
}
}

foreach node $args {
set node [_node_name $path $node]
if {[set idx [lsearch -exact $data(selnodes) $node]] != -1} {
set data(selnodes) [lreplace $data(selnodes) $idx $idx]
} else {
lappend data(selnodes) $node
}
}
}

set {
foreach node $args {
set node [_node_name $path $node]
if {![info exists data($node)]} {
return -code error "$path selection set:  Cannot select unknown node \"$node\"."
}
}
set data(selnodes) {}
foreach node $args {
set node [_node_name $path $node]
if { [Widget::getoption $path.$node -selectable] } {
if { [lsearch -exact $data(selnodes) $node] == -1 } {
lappend data(selnodes) $node
}
}
}
_call_selectcmd $path
}

add {
foreach node $args {
set node [_node_name $path $node]
if {![info exists data($node)]} {
return -code error "$path selection add:  Cannot select unknown node \"$node\"."
}
}

foreach node $args {
set node [_node_name $path $node]
if {[Widget::getoption $path.$node -selectable]} {
if {[lsearch -exact $data(selnodes) $node] == -1} {
lappend data(selnodes) $node
}
}
}
_call_selectcmd $path
}

range {

if {[llength $args] != 2} {
return -code error  [BWidget::wrongNumArgsString  "$path selection range node1 node2"]
}

foreach {node1 node2} $args break

set node1 [_node_name $path $node1]
set node2 [_node_name $path $node2]
if {![info exists data($node1)]} {
return -code error "$path selection range:  Cannot start range at unknown node \"$node1\"."
}
if {![info exists data($node2)]} {
return -code error "$path selection range:  Cannot end range at unknown node \"$node2\"."
}

set nodes {}
foreach nodeItem [$path.c find withtag node] {
set node [Tree::_get_node_name $path $nodeItem 2]
if { [Widget::getoption $path.$node -selectable] } {
lappend nodes $node
}
}

if {$node1 == "root"} {
set node1 [lindex $nodes 0]
}

if {$node2 == "root"} {
set node2 [lindex $nodes 0]
}

while {[set index1 [lsearch -exact $nodes $node1]] == -1} {
set node1 [lindex $data($node1) 0]
}

while {[set index2 [lsearch -exact $nodes $node2]] == -1} {
set node2 [lindex $data($node2) 0]
}

if {$index2 < $index1} {
incr index1 $index2
set index2 [expr {$index1 - $index2}]
set index1 [expr {$index1 - $index2}]
}

set data(selnodes) [lrange $nodes $index1 $index2]
_call_selectcmd $path
}

remove {
foreach node $args {
set node [_node_name $path $node]
if { [set idx [lsearch -exact $data(selnodes) $node]] != -1 } {
set data(selnodes) [lreplace $data(selnodes) $idx $idx]
}
}
_call_selectcmd $path
}

clear {
if {[llength $args] != 0} {
return -code error  [BWidget::wrongNumArgsString "$path selection clear"]
}
set data(selnodes) {}
_call_selectcmd $path
}

get {
if {[llength $args] != 0} {
return -code error  [BWidget::wrongNumArgsString "$path selection get"]
}
return $data(selnodes)
}

includes {
if {[llength $args] != 1} {
return -code error  [BWidget::wrongNumArgsString  "$path selection includes node"]
}
set node [lindex $args 0]
set node [_node_name $path $node]
return [expr {[lsearch -exact $data(selnodes) $node] != -1}]
}

default {
return
}
}

event generate $path <<TreeSelect>>

_redraw_idle $path 1
}


proc Tree::getcanvas { path } {
return $path.c
}


proc Tree::exists { path node } {
Widget::getVariable $path data
set node [_node_name $path $node]
return [info exists data($node)]
}


proc Tree::visible { path node } {
Widget::getVariable $path items
set node [_node_name $path $node]
return [info exists items($node)]
}


proc Tree::parent { path node } {
Widget::getVariable $path data

set node [_node_name $path $node]
if {![info exists data($node)]} {
return -code error "node \"$node\" does not exist"
}
return [lindex $data($node) 0]
}


proc Tree::index { path node } {
Widget::getVariable $path data

set node [_node_name $path $node]
if {[string equal $node "root"] || ![info exists data($node)]} {
return -code error "node \"$node\" does not exist"
}
set parent [lindex $data($node) 0]
return [expr {[lsearch -exact $data($parent) $node] - 1}]
}


proc Tree::find { path findInfo {confine ""} } {
if {[regexp -- {^@([0-9]+),([0-9]+)$} $findInfo match x y]} {
set x [$path.c canvasx $x]
set y [$path.c canvasy $y]
} elseif {[regexp -- {^[0-9]+$} $findInfo lineNumber]} {
set dy [Widget::cget $path -deltay]
set y  [expr {$dy*($lineNumber+0.5)}]
set confine ""
} else {
return -code error "invalid find spec \"$findInfo\""
}

set found  0
set region [$path.c bbox all]
if {[llength $region]} {
set xi [lindex $region 0]
set xs [lindex $region 2]
foreach id [$path.c find overlapping $xi $y $xs $y] {
set ltags [$path.c gettags $id]
set item  [lindex $ltags 1]
if { [string equal $item "node"] ||
[string equal $item "img"]  ||
[string equal $item "win"] } {
set node  [Tree::_get_node_name $path $id 2]
set found 1
break
}
}
}

if {$found} {
if {[string equal $confine "confine"]} {
set padx [_get_node_padx $path $node]
set xi [expr {[lindex [$path.c coords n:$node] 0] - $padx}]
set xs [lindex [$path.c bbox n:$node] 2]
if {$x >= $xi && $x <= $xs} {
return $node
}
} else {
return $node
}
}

return
}


proc Tree::line { path node } {
Widget::getVariable $path items
set node [_node_name $path $node]
set line [lindex $items($node) 0]
if {[string length $line]} { return $line }
return -1
}


proc Tree::nodes { path node {first ""} {last ""} } {
Widget::getVariable $path data

set node [_node_name $path $node]
if {![info exists data($node)]} {
return -code error "node \"$node\" does not exist"
}

if {![string length $first]} {
return [lrange $data($node) 1 end]
}

if {![string length $last]} {
return [lindex [lrange $data($node) 1 end] $first]
} else {
return [lrange [lrange $data($node) 1 end] $first $last]
}
}



proc Tree::visiblenodes { path {node root} } {
Widget::getVariable $path data

set nodes [list]
foreach node [lrange $data($node) 1 end] {
lappend nodes $node
if {[Widget::getoption $path.$node -open]} {
eval lappend nodes [Tree::visiblenodes $path $node]
}
}

return $nodes
}

proc Tree::see { path node } {
Widget::getVariable $path data
Widget::getVariable $path items

set node [_node_name $path $node]
if {[Widget::getoption $path -redraw] && $data(upd,afterid) != ""} {
after cancel $data(upd,afterid)
_redraw_tree $path
}

if {[info exists items($node)]} {
Tree::_see $path [lindex $items($node) 1]
}
}


proc Tree::opentree { path node {recursive 1} } {
Widget::getVariable $path data

set node [_node_name $path $node]
if {[string equal $node "root"] || ![info exists data($node)]} {
return -code error "node \"$node\" does not exist"
}

_recexpand $path $node 1 $recursive [Widget::getoption $path -opencmd]
_redraw_idle $path 3
}


proc Tree::closetree { path node {recursive 1} } {
Widget::getVariable $path data

set node [_node_name $path $node]
if {[string equal $node "root"] || ![info exists data($node)]} {
return -code error "node \"$node\" does not exist"
}

_recexpand $path $node 0 $recursive [Widget::getoption $path -closecmd]
_redraw_idle $path 3
}


proc Tree::toggle { path node } {
if {[Tree::itemcget $path $node -open]} {
$path closetree $node 0
} else {
$path opentree $node 0
}
}


proc Tree::edit { path node text {verifycmd ""} {clickres 0} {select 1}} {
variable _edit
Widget::getVariable $path data
Widget::getVariable $path items

set node [_node_name $path $node]
if { [Widget::getoption $path -redraw] && $data(upd,afterid) != "" } {
after cancel $data(upd,afterid)
_redraw_tree $path
}

if {[info exists items($node)]} {
set _edit(editing) 1

set idn [lindex $items($node) 1]

Tree::_see $path $idn

set oldfg  [$path.c itemcget $idn -fill]
set sbg    [Widget::cget $path -selectbackground]
set coords [$path.c coords $idn]
set x      [lindex $coords 0]
set y      [lindex $coords 1]
set ht     [$path.c cget -highlightthickness]
set bd     [expr {[$path.c cget -borderwidth] + $ht}]
set w      [expr {[winfo width $path] - 2 * $bd}]
set wmax   [expr {[$path.c canvasx $w] - $x}]

set _edit(wait) 0
set _edit(path) $path
set _edit(node) $node
set _edit(text) $text

$path.c itemconfigure $idn    -fill [Widget::cget $path -background]
$path.c itemconfigure s:$node -fill {} -outline {}

set frame  [frame $path.edit  -relief flat -borderwidth 0 -highlightthickness 0  -background [Widget::cget $path -background]]
set ent    [entry $frame.edit  -width              0      -relief             solid  -borderwidth        1      -highlightthickness 0      -foreground         [Widget::getoption $path.$node -fill]  -background         [Widget::cget $path -background]  -selectforeground   [Widget::cget $path -selectforeground]  -selectbackground   $sbg   -font               [_get_option $path $node -font]  -textvariable       Tree::_edit(text)]
pack $ent -ipadx 8 -anchor w

set _edit(frame) $frame
set _edit(entry) $ent

set idw [$path.c create window $x $y -window $frame -anchor w]
trace variable Tree::_edit(text) w  [list Tree::_update_edit_size $path $ent $idw $wmax]
tkwait visibility $ent
grab  $frame
BWidget::focus set $ent

_update_edit_size $path $ent $idw $wmax
update

if {$select} {
$ent selection range 0 end
$ent icursor end
$ent xview end
}

bindtags $ent [list $ent Entry]
bind $ent <Escape> {set Tree::_edit(wait) 0}
bind $ent <Return> {set Tree::_edit(wait) 1}
if {$clickres == 0 || $clickres == 1} {
bind $frame <Button>  [list set Tree::_edit(wait) $clickres]
}

set ok 0
while {!$ok} {
focus -force $ent
tkwait variable Tree::_edit(wait)
if {!$_edit(wait) || ![llength $verifycmd] ||
[uplevel \#0 $verifycmd [list $_edit(text)]]} {
set ok 1
}
}

trace vdelete Tree::_edit(text) w  [list Tree::_update_edit_size $path $ent $idw $wmax]
grab release $frame
BWidget::focus release $ent

set _edit(editing) 0

destroy $frame
$path.c delete $idw
$path.c itemconfigure $idn    -fill $oldfg
$path.c itemconfigure s:$node -fill $sbg -outline $sbg

if {$_edit(wait)} {
return $_edit(text)
}
}
}


proc Tree::editing { path } {
variable _edit
if {$_edit(editing) && $_edit(path) eq $path} { return 1 }
return 0
}


proc Tree::xview { path args } {
return [eval [linsert $args 0 $path.c xview]]
}


proc Tree::yview { path args } {
return [eval [linsert $args 0 $path.c yview]]
}


proc Tree::search { path args } {
Widget::getVariable $path data

array set _args {
-pattern  *
}
array set _args $args

return [array names data $_args(-pattern)]
}


proc Tree::level { path node } {
Widget::getVariable $path data

if {[string equal $node "root"]} { return 0 }

if {![info exists data($node)]} {
return -code error "node \"$node\" does not exists"
}

set level  1
set parent [lindex $data($node) 0]
while {![string equal $parent "root"]} {
incr level
set parent [lindex $data($parent) 0]
}

return $level
}


proc Tree::_call_selectcmd { path } {
Widget::getVariable $path data

set selectcmd [Widget::getoption $path -selectcommand]
if {[llength $selectcmd]} {
lappend selectcmd $path
lappend selectcmd $data(selnodes)
uplevel \#0 $selectcmd
}
return
}


proc Tree::_update_edit_size { path entry idw wmax args } {
set entw [winfo reqwidth $entry]
if {$entw + 8 >= $wmax} {
$path.c itemconfigure $idw -width $wmax
} else {
$path.c itemconfigure $idw -width 0
}
}


proc Tree::_see { path idn } {
set bbox [$path.c bbox $idn]
set scrl [$path.c cget -scrollregion]

set ymax [lindex $scrl 3]
set dy   [$path.c cget -yscrollincrement]
set yv   [$path yview]
set yv0  [expr {round([lindex $yv 0]*$ymax/$dy)}]
set yv1  [expr {round([lindex $yv 1]*$ymax/$dy)}]
set y    [expr {int([lindex [$path.c coords $idn] 1]/$dy)}]

if {$y < $yv0} {
$path.c yview scroll [expr {$y-$yv0}] units
} elseif { $y >= $yv1 } {
$path.c yview scroll [expr {$y-$yv1+1}] units
}

set xmax [lindex $scrl 2]
set dx   [$path.c cget -xscrollincrement]
set xv   [$path xview]
set x0   [expr {int([lindex $bbox 0]/$dx)}]
set xv0  [expr {round([lindex $xv 0]*$xmax/$dx)}]
set xv1  [expr {round([lindex $xv 1]*$xmax/$dx)}]

if {$x0 >= $xv1 || $x0 < $xv0} {
$path.c xview scroll [expr {$x0-$xv0}] units
}
}


proc Tree::_recexpand { path node expand recursive cmd } {
Widget::getVariable $path data

if {[Widget::getoption $path.$node -open] != $expand} {
Widget::setoption $path.$node -open $expand
if {[llength $cmd]} {
uplevel \#0 $cmd [list $node]
}
}

if {$recursive} {
foreach subnode [lrange $data($node) 1 end] {
_recexpand $path $subnode $expand $recursive $cmd
}
}
}


proc Tree::_subdelete { path lnodes } {
Widget::getVariable $path data

set sel $data(selnodes)

while {[llength $lnodes]} {
set lsubnodes [list]
foreach node $lnodes {
foreach subnode [lrange $data($node) 1 end] {
lappend lsubnodes $subnode
}
unset data($node)
set idx [lsearch -exact $sel $node]
if {$idx >= 0} {
set sel [lreplace $sel $idx $idx]
}
if {[set win [Widget::getoption $path.$node -window]] != ""} {
destroy $win
}
Widget::destroy $path.$node 0
}
set lnodes $lsubnodes
}

set data(selnodes) $sel
}


proc Tree::_update_scrollregion { path } {
set bd   [$path.c cget -borderwidth]
set ht   [$path.c cget -highlightthickness]
set bd   [expr {2 * ($bd + $ht)}]
set w    [expr {[winfo width  $path] - $bd}]
set h    [expr {[winfo height $path] - $bd}]
set xinc [$path.c cget -xscrollincrement]
set yinc [$path.c cget -yscrollincrement]
set bbox [$path.c bbox node]
if {[llength $bbox]} {
set xs [lindex $bbox 2]
set ys [lindex $bbox 3]

if {$w < $xs} {
set w [expr {int($xs)}]
if {[set r [expr {$w % $xinc}]]} {
set w [expr {$w+$xinc-$r}]
}
}
if {$h < $ys} {
set h [expr {int($ys)}]
if {[set r [expr {$h % $yinc}]]} {
set h [expr {$h+$yinc-$r}]
}
}
}

$path.c configure -scrollregion [list 0 0 $w $h]

if {[Widget::getoption $path -selectfill]} {
_redraw_selection $path
}
}


proc Tree::_cross_event { path } {
Widget::getVariable $path data

set node [Tree::_get_node_name $path current 1]
if {[Widget::getoption $path.$node -open]} {
Tree::itemconfigure $path $node -open 0
if {[llength [set cmd [Widget::getoption $path -closecmd]]]} {
uplevel \#0 $cmd [list $node]
}
} else {
Tree::itemconfigure $path $node -open 1
if {[llength [set cmd [Widget::getoption $path -opencmd]]]} {
uplevel \#0 $cmd [list $node]
}
}
}


proc Tree::_draw_cross { path node open x y } {
Widget::getVariable $path items
set idc [lindex $items($node) 2]

if {$open} {
set img [Widget::cget $path -crossopenimage]
set bmp [Widget::cget $path -crossopenbitmap]
} else {
set img [Widget::cget $path -crosscloseimage]
set bmp [Widget::cget $path -crossclosebitmap]
}

if {[string length $idc]} {
if {![string length $img]} {
$path.c itemconfigure $idc -bitmap $bmp
} else {
$path.c itemconfigure $idc -image $img
}
return $idc
}

if {![Widget::getoption $path -showlines]} { set x [expr {$x + 6}] }

if {![string length $img]} {
set idc [$path.c create bitmap $x $y  -bitmap     $bmp  -background [$path.c cget -background]  -foreground [Widget::getoption $path -crossfill]  -tags       [list cross c:$node] -anchor c]
} else {
set idc [$path.c create image $x $y  -image      $img  -tags       [list cross c:$node] -anchor c]
}

return $idc
}


proc Tree::_draw_node { path node x0 y0 deltax deltay padx showlines } {
Widget::getVariable $path data
Widget::getVariable $path items

set x1 [expr {$x0+$deltax+5}]
set y1 $y0
if {$showlines} {
set i [$path.c create line $x0 $y0 $x1 $y0  -fill    [Widget::getoption $path -linesfill]    -stipple [Widget::getoption $path -linestipple]  -tags    line]

lappend items($node) $i
} else {
lappend items($node) ""
}

set i [$path.c create text [expr {$x1+$padx}] $y0  -anchor w  -text   [Widget::getoption $path.$node -text]  -fill   [Widget::getoption $path.$node -fill]  -font   [_get_option $path $node -font]  -tags   [Tree::_get_node_tags $path $node [list node n:$node]]]
lappend items($node) $i

set len [expr {[llength $data($node)] > 1}]
set dc  [Widget::getoption $path.$node -drawcross]
set exp [Widget::getoption $path.$node -open]

if {$len && $exp} {
set y1 [_draw_subnodes $path [lrange $data($node) 1 end]  [expr {$x0+$deltax}] $y0 $deltax $deltay $padx $showlines]
}

if {![string equal $dc "never"] && ($len || [string equal $dc "allways"])} {
lappend items($node) [_draw_cross $path $node $exp $x0 $y0]
} else {
lappend items($node) ""
}

if {[set win [Widget::getoption $path.$node -window]] != ""} {
set a [Widget::cget $path.$node -anchor]
set i [$path.c create window $x1 $y0 -window $win -anchor $a  -tags [Tree::_get_node_tags $path $node [list win i:$node]]]
lappend items($node) $i
} elseif {[set img [Widget::getoption $path.$node -image]] != ""} {
set a [Widget::cget $path.$node -anchor]
set i [$path.c create image $x1 $y0 -image $img -anchor $a  -tags   [Tree::_get_node_tags $path $node [list img i:$node]]]
lappend items($node) $i
} else {
lappend items($node) ""
}

set nid [lindex $items($node) 1]
set iid [lindex $items($node) 3]
set box [$path.c bbox $nid $iid]
set id [$path.c create rect 0 [lindex $box 1]  [winfo screenwidth $path] [lindex $box 3]  -tags [Tree::_get_node_tags $path $node [list box b:$node]]  -fill {} -outline {}]
$path.c lower $id
lappend items($node) $id

_set_help $path $node

return $y1
}


proc Tree::_draw_subnodes { path nodes x0 y0 deltax deltay padx showlines } {
set y1 $y0
foreach node $nodes {
set padx   [_get_node_padx $path $node]
set deltax [_get_node_deltax $path $node]
set yp $y1
set y1 [_draw_node $path $node $x0 [expr {$y1+$deltay}]  $deltax $deltay $padx $showlines]
}
if {$showlines && [llength $nodes]} {
if {$y0 < 0} {
incr y0 $deltay
}
set id [$path.c create line $x0 $y0 $x0 [expr {$yp+$deltay}]  -fill    [Widget::getoption $path -linesfill]    -stipple [Widget::getoption $path -linestipple]  -tags    line]

$path.c lower $id
}
return $y1
}


proc Tree::_update_nodes { path } {
Widget::getVariable $path data
Widget::getVariable $path items

foreach {node flag} $data(upd,nodes) {
if {![info exists items($node)]} { continue }
set idn [lindex $items($node) 1]

set padx   [_get_node_padx $path $node]
set deltax [_get_node_deltax $path $node]
set c  [$path.c coords $idn]
set x1 [expr {[lindex $c 0]-$padx}]
set x0 [expr {$x1-$deltax-5}]
set y0 [lindex $c 1]
if {$flag & 48} {
set win  [Widget::getoption $path.$node -window]
set img  [Widget::getoption $path.$node -image]
set anc  [Widget::cget $path.$node -anchor]
set idi  [lindex $items($node) 3]
set type [lindex [$path.c gettags $idi] 1]
if {[string length $win]} {
if {[string equal $type "win"]} {
$path.c itemconfigure $idi -window $win
} else {
$path.c delete $idi
set tags [_get_node_tags $path $node [list win i:$node]]
set idi [$path.c create window $x1 $y0 -window $win  -anchor $anc -tags $tags]
set items($node) [lreplace $items($node) 3 3 $idi]
}
} elseif {[string length $img]} {
if {[string equal $type "img"]} {
$path.c itemconfigure $idi -image $img
} else {
$path.c delete $idi
set tags [_get_node_tags $path $node [list win i:$node]]
set idi [$path.c create image $x1 $y0 -image $img  -anchor $anc -tags $tags]
set items($node) [lreplace $items($node) 3 3 $idi]
}
} else {
$path.c delete $idi
set items($node) [lreplace $items($node) 3 3 ""]
}
}

if {$flag & 8} {
set len [expr {[llength $data($node)] > 1}]
set dc  [Widget::getoption $path.$node -drawcross]
set exp [Widget::getoption $path.$node -open]

if {![string equal $dc "never"]
&& ($len || [string equal $dc "allways"])} {
set idc [_draw_cross $path $node $exp $x0 $y0]
set items($node) [lreplace $items($node) 2 2 $idc]
} else {
set idc [lindex $items($node) 2]
$path.c delete $idc
set items($node) [lreplace $items($node) 2 2 ""]
}
}

if {$flag & 7} {
$path.c itemconfigure $idn  -text [Widget::getoption $path.$node -text]  -fill [Widget::getoption $path.$node -fill]  -font [_get_option $path $node -font]
}
}
}


proc Tree::_draw_tree { path } {
Widget::getVariable $path data
Widget::getVariable $path items

if {[info exists items]} { unset items }

$path.c delete all
set cursor [$path.c cget -cursor]
$path.c configure -cursor watch

set x0 8
if {![Widget::getoption $path -showlines]} { set x0 0 }

Tree::_draw_subnodes $path [lrange $data(root) 1 end] $x0  [expr {-[Widget::cget $path -deltay]/2}]  [Widget::getoption $path -deltax]  [Widget::cget $path -deltay]  [Widget::getoption $path -padx]    [Widget::getoption $path -showlines]
$path.c configure -cursor $cursor
}


proc Tree::_redraw_tree { path } {
Widget::getVariable $path data

if {[Widget::getoption $path -redraw]} {
if {$data(upd,level) == 2} {
_update_nodes $path
} elseif {$data(upd,level) == 3} {
_draw_tree $path
}
_redraw_selection $path
_update_scrollregion $path
set data(upd,nodes)   {}
set data(upd,level)   0
set data(upd,afterid) ""
}
}


proc Tree::_redraw_selection { path } {
Widget::getVariable $path data

set selbg [Widget::cget $path -selectbackground]
set selfg [Widget::cget $path -selectforeground]
set fill  [Widget::getoption $path -selectfill]
if {$fill} {
set scroll [$path.c cget -scrollregion]
if {[llength $scroll]} {
set xmax [expr {[lindex $scroll 2]-1}]
} else {
set xmax [winfo width $path]
}
}
foreach id [$path.c find withtag sel] {
set node [Tree::_get_node_name $path $id 1]
$path.c itemconfigure "n:$node"  -fill [Widget::getoption $path.$node -fill]
}
$path.c delete sel
foreach node $data(selnodes) {
set bbox [$path.c bbox "n:$node"]
if {[llength $bbox]} {
if {$fill} {
set bbox [$path.c bbox "n:$node" "i:$node"]
set bbox [list 0 [lindex $bbox 1] $xmax [lindex $bbox 3]]
}
set id [$path.c create rectangle $bbox -tags [list sel s:$node]  -fill $selbg -outline $selbg]
$path.c itemconfigure "n:$node" -fill $selfg
$path.c lower $id
}
}
}


proc Tree::_redraw_idle { path level } {
Widget::getVariable $path data

if {[Widget::getoption $path -redraw] && $data(upd,afterid) == ""} {
set data(upd,afterid) [after idle [list Tree::_redraw_tree $path]]
}
if {$level > $data(upd,level)} {
set data(upd,level) $level
}
return ""
}


proc Tree::_init_drag_cmd { path X Y top } {
set path [winfo parent $path]
set ltags [$path.c gettags current]
set item  [lindex $ltags 1]
if {[string equal $item "node"]
|| [string equal $item "img"]
|| [string equal $item "win"]} {
set node [Tree::_get_node_name $path current 2]
if {[llength [set cmd [Widget::getoption $path -draginitcmd]]]} {
return [uplevel \#0 $cmd [list $path $node $top]]
}
if {[set type [Widget::getoption $path -dragtype]] == ""} {
set type "TREE_NODE"
}
if {[set img [Widget::getoption $path.$node -image]] != ""} {
pack [label $top.l -image $img -padx 0 -pady 0]
}
return [list $type {copy move link} $node]
}
return {}
}


proc Tree::_drop_cmd { path source X Y op type dnddata } {
set path [winfo parent $path]
Widget::getVariable $path data

$path.c delete drop
if {[string length $data(dnd,afterid)]} {
after cancel $data(dnd,afterid)
set data(dnd,afterid) ""
}
set data(dnd,scroll) ""
if {[llength $data(dnd,node)]
&& [llength [set cmd [Widget::getoption $path -dropcmd]]]} {
return [uplevel \#0 $cmd  [list $path $source $data(dnd,node) $op $type $dnddata]]
}
return 0
}


proc Tree::_over_cmd { path source event X Y op type dnddata } {
set path [winfo parent $path]
Widget::getVariable $path data

if {[string equal $event "leave"]} {
$path.c delete drop
if {[string length $data(dnd,afterid)]} {
after cancel $data(dnd,afterid)
set data(dnd,afterid) ""
}
set data(dnd,scroll) ""
return 0
}

if {[string equal $event "enter"]} {
set mode [Widget::getoption $path -dropovermode]
set data(dnd,mode) 0
foreach c {w p n} {
set data(dnd,mode) [expr {($data(dnd,mode) << 1)
| ([string first $c $mode] != -1)}]
}
set bbox [$path.c bbox all]
if {[llength $bbox]} {
set data(dnd,xs) [lindex $bbox 2]
set data(dnd,empty) 0
} else {
set data(dnd,xs) 0
set data(dnd,empty) 1
}
set data(dnd,node) {}
}

set x [expr {$X-[winfo rootx $path]}]
set y [expr {$Y-[winfo rooty $path]}]

$path.c delete drop
set data(dnd,node) {}

if {$data(dnd,mode) != 4 && [_auto_scroll $path $x $y] != ""} { return 2 }

if {$data(dnd,mode) & 4} {
set target [list widget]
set vmode  4
} else {
set target [list ""]
set vmode  0
}

if {($data(dnd,mode) & 2) && $data(dnd,empty)} {
lappend target [list root 0]
set vmode  [expr {$vmode | 2}]
}

set xs $data(dnd,xs)
set xc [$path.c canvasx $x]
if {$xc <= $xs} {
set yc   [$path.c canvasy $y]
set dy   [$path.c cget -yscrollincrement]
set line [expr {int($yc/$dy)}]
set xi   0
set yi   [expr {$line*$dy}]
set ys   [expr {$yi+$dy}]
set found 0
foreach id [$path.c find overlapping $xi $yi $xs $ys] {
set ltags [$path.c gettags $id]
set item  [lindex $ltags 1]
if {[string equal $item "node"]
|| [string equal $item "img"]
|| [string equal $item "win"]} {
set node [Tree::_get_node_name $path $id 2]
set found 1
break
}
}

if {$found} {
set padx   [_get_node_padx $path $node]
set deltax [_get_node_deltax $path $node]
set xi [expr {[lindex [$path.c coords n:$node] 0] - $padx - 1}]
if {$data(dnd,mode) & 1} {
lappend target $node
set vmode [expr {$vmode | 1}]
} else {
lappend target ""
}

if {$data(dnd,mode) & 2} {
if {$yc >= $yi+$dy/2} {
if {[Widget::getoption $path.$node -open] &&
[llength $data($node)] > 1} {
set parent $node
set index  0
set xli    [expr {$xi-5}]
} elseif {[Widget::getoption $path.$node -open]} {
set parent $node
set index  0
set xli    [expr {$xi-5}]
} else {
set parent [lindex $data($node) 0]
set index  [lsearch -exact $data($parent) $node]
set xli    [expr {$xi - $deltax - 5}]
}
set yl $ys
} else {
set parent [lindex $data($node) 0]
set index  [expr {[lsearch -exact $data($parent) $node] - 1}]
set xli    [expr {$xi - $deltax - 5}]
set yl     $yi
}
lappend target [list $parent $index]
set vmode  [expr {$vmode | 2}]
} else {
lappend target {}
}

if {($vmode & 3) == 3} {
if {$yc-$yi <= 3 || $ys-$yc <= 3} {
lappend target "position"
} else {
lappend target "node"
}
}
}
}

if {$vmode && [llength [set cmd [Widget::getoption $path -dropovercmd]]]} {
set res     [uplevel \#0 $cmd  [list $path $source $target $op $type $dnddata]]
set code    [lindex $res 0]
set newmode 0
if {$code & 1} {
set mode [lindex $res 1]
if {($vmode & 1) && [string equal $mode "node"]} {
set newmode 1
} elseif {($vmode & 2) && [string equal $mode "position"]} {
set newmode 2
} elseif {($vmode & 4) && [string equal $mode "widget"]} {
set newmode 4
}
}
set vmode $newmode
} else {
if {($vmode & 3) == 3} {
if {[string equal [lindex $target 3] "position"]} {
set vmode [expr {$vmode & ~1}]
} else {
set vmode [expr {$vmode & ~2}]
}
}

if {$data(dnd,mode) == 4 || $data(dnd,mode) == 0} {
set code 1
} else {
set code 3
}
}

if {!$data(dnd,empty)} {
if {$vmode & 1} {
set data(dnd,node) [list "node" [lindex $target 1]]
$path.c create rectangle $xi $yi $xs $ys -tags drop
} elseif {$vmode & 2} {
set data(dnd,node) [concat "position" [lindex $target 2]]
$path.c create line  [list $xli [expr {$yl-$dy/2}] $xli $yl $xs $yl] -tags drop
} elseif {$vmode & 4} {
set data(dnd,node) [list "widget"]
} else {
set code [expr {$code & 2}]
}
}

if {$code & 1} {
DropSite::setcursor based_arrow_down
} else {
DropSite::setcursor dot
}
return $code
}


proc Tree::_drag_and_drop { path from endItem operation type startItem } {
if {[winfo parent $from] != $path} { return }

set place [lindex $endItem 0]

switch -- $place {
"node" {
set node   [lindex $endItem 1]
set parent [$path parent $node]
set index  [$path index $node]
}

"position" {
set parent [lindex $endItem 1]
set index  [lindex $endItem 2]
}

default {
return
}
}

if {[string equal $operation "copy"]} {
set options [Widget::options $path.$startItem]
eval $path insert $idx [list $startItem#auto] $options
} else {
$path move $parent $startItem $index
}
}


proc Tree::_auto_scroll { path x y } {
Widget::getVariable $path data

set xmax   [winfo width  $path]
set ymax   [winfo height $path]
set scroll {}
if {$y <= 6} {
if {[lindex [$path.c yview] 0] > 0} {
set scroll [list yview -1]
DropSite::setcursor sb_up_arrow
}
} elseif {$y >= $ymax-6} {
if {[lindex [$path.c yview] 1] < 1} {
set scroll [list yview 1]
DropSite::setcursor sb_down_arrow
}
} elseif {$x <= 6} {
if {[lindex [$path.c xview] 0] > 0} {
set scroll [list xview -1]
DropSite::setcursor sb_left_arrow
}
} elseif {$x >= $xmax-6} {
if {[lindex [$path.c xview] 1] < 1} {
set scroll [list xview 1]
DropSite::setcursor sb_right_arrow
}
}

if {[string length $data(dnd,afterid)]
&& ![string equal $data(dnd,scroll) $scroll]} {
after cancel $data(dnd,afterid)
set data(dnd,afterid) ""
}

set data(dnd,scroll) $scroll
if {[string length $scroll] && ![string length $data(dnd,afterid)]} {
set data(dnd,afterid) [after 200 [list Tree::_scroll $path $scroll]]
}
return $data(dnd,afterid)
}


proc Tree::_scroll { path cmd dir } {
Widget::getVariable $path data

if {($dir == -1 && [lindex [$path.c $cmd] 0] > 0)
|| ($dir == 1  && [lindex [$path.c $cmd] 1] < 1)} {
$path.c $cmd scroll $dir units
set data(dnd,afterid) [after 100 [list Tree::_scroll $path $cmd $dir]]
} else {
set data(dnd,afterid) ""
DropSite::setcursor dot
}
}


proc Tree::_keynav {which path} {

set nodes {}
foreach nodeItem [$path.c find withtag node] {
set node [Tree::_get_node_name $path $nodeItem 2]
if {[Widget::cget $path.$node -selectable]} {
lappend nodes $node
}
}

set node [_get_current_node $path]

switch -exact -- $which {
"up" {
if {![string length $node]} { return }

set index [lsearch -exact $nodes $node]
incr index -1
if {$index >= 0} {
$path selection set [lindex $nodes $index]
_set_current_node $path [lindex $nodes $index]
$path see [lindex $nodes $index]
return
}
}

"down" {
if {![string length $node]} {
$path selection set [lindex $nodes 0]
_set_current_node $path [lindex $nodes 0]
$path see [lindex $nodes 0]
return
}

set index [lsearch -exact $nodes $node]
incr index
if {$index < [llength $nodes]} {
$path selection set [lindex $nodes $index]
_set_current_node $path [lindex $nodes $index]
$path see [lindex $nodes $index]
return
}
}

"right" {
if {![string length $node]} { return }

if {[Widget::getoption $path.$node -open]} {
if { [llength [$path nodes $node]] } {
set index [lsearch -exact $nodes $node]
incr index
if {$index < [llength $nodes]} {
$path selection set [lindex $nodes $index]
_set_current_node $path [lindex $nodes $index]
$path see [lindex $nodes $index]
return
}
}
} else {
$path itemconfigure $node -open 1
if {[llength [set cmd [Widget::getoption $path -opencmd]]]} {
uplevel \#0 $cmd [list $node]
}
return
}
}

"left" {
if {![string length $node]} { return }

if {[Widget::getoption $path.$node -open]} {
$path itemconfigure $node -open 0
if {[llength [set cmd [Widget::getoption $path -closecmd]]]} {
uplevel \#0 $cmd [list $node]
}
return
} else {
set parent [$path parent $node]
if {[string equal $parent "root"]} {
set parent $node
} else {
while {![$path itemcget $parent -selectable]} {
set parent [$path parent $parent]
if {[string equal $parent "root"]} {
set parent $node
break
}
}
}
$path selection set $parent
_set_current_node $path $parent
$path see $parent
return
}
}

"space" {
if {[string length $node]} {
Tree::toggle $path $node
}
}
}
}


proc Tree::_get_current_node {win} {
if {[info exists selectTree::selectCursor($win)]} {
set result $selectTree::selectCursor($win)
} elseif {[llength [set selList [$win selection get]]]} {
set result [lindex $selList 0]
} else {
set result ""
}
return $result
}


proc Tree::_set_current_node {win node} {
if {[info exists selectTree::selectCursor($win)]} {
set selectTree::selectCursor($win) $node
}
return
}


proc Tree::_get_node_name {path {item current} {tagindex end-1}} {
return [string range [lindex [$path.c gettags $item] $tagindex] 2 end]
}

proc Tree::_get_node_padx {path node} {
set padx [Widget::getoption $path.$node -padx]
if {$padx < 0} { set padx [Widget::getoption $path -padx] }
return $padx
}

proc Tree::_get_node_deltax {path node} {
set deltax [Widget::getoption $path.$node -deltax]
if {$deltax < 0} { set deltax [Widget::getoption $path -deltax] }
return $deltax
}


proc Tree::_get_node_tags {path node {tags ""}} {
eval [linsert $tags 0 lappend list TreeItemSentinal]
if {[Widget::getoption $path.$node -helptext] == ""} { return $list }

switch -- [Widget::getoption $path.$node -helptype] {
balloon {
lappend list BwHelpBalloon
}
variable {
lappend list BwHelpVariable
}
}
return $list
}

proc Tree::_set_help { path node } {
Widget::getVariable $path help

set item $path.$node
set opts [list -helptype -helptext -helpvar]
foreach {cty ctx cv} [eval [linsert $opts 0 Widget::hasChangedX $item]] break
set text [Widget::getoption $item -helptext]

if { (![info exists help($node)] && $text != "") || $cty || $ctx || $cv } {
set help($node) 1
set type [Widget::getoption $item -helptype]
switch $type {
balloon {
DynamicHelp::register $path.c balloon n:$node $text
DynamicHelp::register $path.c balloon i:$node $text
DynamicHelp::register $path.c balloon b:$node $text
}
variable {
set var [Widget::getoption $item -helpvar]
DynamicHelp::register $path.c variable n:$node $var $text
DynamicHelp::register $path.c variable i:$node $var $text
DynamicHelp::register $path.c variable b:$node $var $text
}
}
}
}

proc Tree::_mouse_select { path cmd args } {
eval [linsert $args 0 selection $path $cmd]
switch -- $cmd {
"add" - "clear" - "remove" - "set" - "toggle" {
event generate $path <<TreeSelect>>
}
}
}


proc Tree::_node_name { path node } {
set map [list & _ | _ ^ _ ! _]
return  [string map $map $node]
}


proc Tree::_get_option { path node option {default ""} } {
return [Widget::getOption $option $default $path.$node $path]
}


proc Tree::_destroy { path } {
Widget::getVariable $path data

if {[string length $data(upd,afterid)]} {
after cancel $data(upd,afterid)
}

if {[string length $data(dnd,afterid)]} {
after cancel $data(dnd,afterid)
}

_subdelete $path [lrange $data(root) 1 end]
Widget::destroy $path
}


namespace eval OptionTree {
Widget::define OptionTree optiontree Tree

namespace eval Node {
Widget::declare OptionTree::Node {
{-type              Enum      "none"  1
{checkbutton none radiobutton}}
{-command            String    ""      0}
{-variable           String    ""      0}

{-on                 Boolean   "0"     0}
{-value              String    ""      0}
{-onvalue            String    ""      0}
{-offvalue           String    ""      0}

{-state              Enum      "normal" 0 {disabled normal}}
{-disabledforeground Color     "SystemDisabledText" 0}
}
}

Widget::declare OptionTree {
{-command             String       ""   0}
{-toggleselect        Boolean      1    1}

{-radioimage          String       ""   1}
{-radioselectimage    String       ""   1}

{-checkimage          String       ""   1}
{-checkselectimage    String       ""   1}
}

bind OptionTree <Destroy> [list OptionTree::_destroy %W]
}


proc OptionTree::create { path args } {
set opath $path#opttree

array set maps [list Tree {} .c {} OptionTree {}]
array set maps [Widget::splitArgs $args Tree OptionTree]

eval [list Tree::create $path -bg white -showlines 0] $maps(Tree)
eval [list $path.c configure] $maps(.c)

Widget::initFromODB OptionTree $opath $maps(OptionTree)

if {![string length [Widget::getoption $opath -radioimage]]} {
Widget::setoption $opath -radioimage [BWidget::Icon radio-off]
}

if {![string length [Widget::getoption $opath -radioselectimage]]} {
Widget::setoption $opath -radioselectimage [BWidget::Icon radio-on]
}

if {![string length [Widget::getoption $opath -checkimage]]} {
Widget::setoption $opath -checkimage [BWidget::Icon check-off]
}

if {![string length [Widget::getoption $opath -checkselectimage]]} {
Widget::setoption $opath -checkselectimage [BWidget::Icon check-on]
}

set opts [list]

set image  [Widget::getoption $opath -checkimage]
set width  [image width $image]
set height [image height $image]
lappend opts -padx [expr {$width + 4}]
lappend opts -deltax $width -deltay [expr {$height + 4}]

eval [list Tree::configure $path] $opts $maps(Tree)

bindtags $path [list $path OptionTree Tree [winfo toplevel $path] all]

set toggle [Widget::getoption $opath -toggleselect]

$path bindText  <Button-1> [list OptionTree::_select $path $toggle]
$path bindText  <Double-1> [list OptionTree::_select $path 1]
$path bindImage <Button-1> [list OptionTree::_select $path 1]

proc ::$path { cmd args }  "return \[OptionTree::_path_command [list $path] \$cmd \$args\]"

return $path
}


proc OptionTree::cget { path option } {
if {[string match "*#opttree" $path]} {
set opath $path
} else {
set opath $path#opttree
}

if {[Widget::optionExists Tree $option]} {
return [Tree::cget $path $option]
} else {
return [Widget::cget $opath $option]
}
}


proc OptionTree::clear { path } {
eval [list OptionTree::delete $path] [Tree::nodes $path root]
}


proc OptionTree::configure { path args } {
set opath $path#opttree

if {![llength $args]} {
set res [Tree::configure $path]
eval lappend res [Widget::configure $opath $args]
return [lsort $res]
}

if {[llength $args] == 1} {
if {[Widget::optionExists Tree $args]} {
return [Tree::configure $path $args]
} else {
return [Widget::configure $opath $args]
}
}

array set maps [list Tree {} .c {} OptionTree {}]
array set maps [Widget::splitArgs $args Tree OptionTree]

if {[llength $maps(Tree)] || [llength $maps(.c)]} {
eval [list Tree::configure $path] $maps(Tree) $maps(.c)
}

if {[llength $maps(OptionTree)]} {
Widget::configure $opath $maps(OptionTree)
}
}


proc OptionTree::delete { path args } {
Widget::getVariable $path traces
Widget::getVariable $path variables

foreach node $args {
eval [list OptionTree::delete $path] [$path nodes $node]

Widget::destroy $path.$node#opttree 0

if {![info exists variables($node)]} { continue }

set varName $variables($node)
set command [list OptionTree::_redraw_node $path $node 0]
uplevel #0 [list trace remove variable $varName write $command]

if {[set idx [lsearch -exact $traces($varName) $node]] > -1} {
set traces($varName) [lreplace $traces($varName) $idx $idx]
}
}

eval [list Tree::delete $path] $args
}


proc OptionTree::insert { path index parent node args } {
array set maps [Widget::splitArgs $args OptionTree::Node Tree::Node]

set deltax [Widget::getoption $path -deltax]
if {[string equal $parent "root"]} {
set deltax 0
} else {
set dx [Widget::getoption $path.$parent -deltax]
set dc [Widget::getoption $path.$parent -drawcross]
if {$dx == 0 && $dc ne "never"} {
Tree::itemconfigure $path $parent -deltax 10
}
}

set args [concat -deltax $deltax $maps(Tree::Node)]
set node [eval [list Tree::insert $path $index $parent $node] $args]

set onode $path.$node#opttree
Widget::init OptionTree::Node $onode $maps(OptionTree::Node)

set type [Widget::getoption $onode -type]
array set tmp $maps(Tree::Node)
if {[string equal $type "none"] && ![info exists tmp(-padx)]
&& ![string length [Tree::itemcget $path $node -image]]} {
Tree::itemconfigure $path $node -padx 4
}

OptionTree::_set_variable $path $node
OptionTree::_redraw_node  $path $node 0

return $node
}


proc OptionTree::itemcget { path node option } {
set onode $path.$node#opttree

if {[Widget::optionExists OptionTree::Node $option]} {
return [Widget::getoption $onode $option]
} else {
return [Tree::itemcget $path $node $option]
}
}


proc OptionTree::itemconfigure { path node args } {
set onode $path.$node#opttree

if {![llength $args]} {
set res [Tree::itemconfigure $path $node]
eval lappend res [Widget::configure $onode $args]
return [lsort $res]
}

if {[llength $args] == 1} {
if {[Widget::optionExists Tree::Node $args]} {
return [Tree::itemconfigure $path $node $args]
} else {
return [Widget::configure $onode $args]
}
}

array set maps [Widget::splitArgs $args OptionTree::Node Tree::Node]

if {[info exists maps(Tree::Node)]} {
eval [list Tree::itemconfigure $path $node] $maps(Tree::Node)
}

set oldVarName [Widget::getoption $onode -variable]

if {[info exists maps(OptionTree::Node)]} {
Widget::configure $onode $maps(OptionTree::Node)
}

set redraw 0

if {[Widget::hasChanged $onode -variable varName]} {
Widget::getVariable $path traces
if {[string length $oldVarName]} {
set idx [lsearch -exact $traces($oldVarName) $node]
set traces($oldVarName) [lreplace $traces($oldVarName) $idx $idx]

set command [list OptionTree::_redraw_node $path $node 0]
uplevel #0 [list trace remove variable $oldVarName write $command]
}

OptionTree::_set_variable $path $node

set redraw 1
}

if {[Widget::anyChangedX $onode -on -value -onvalue -offvalue -state]} {
set redraw 1
}

if {$redraw} { _redraw_node $path $node 1 }
}


proc OptionTree::toggle { path node {force 0} } {
set onode $path.$node#opttree

if {$force || [Widget::getoption $onode -state] ne "disabled"} {
if {[Widget::getoption $onode -on]} {
OptionTree::itemconfigure $path $node -on 0
} else {
OptionTree::itemconfigure $path $node -on 1
}

event generate $path <<TreeModify>>
}
}


proc OptionTree::_path_command { path cmd larg } {
if {[string length [info commands ::OptionTree::$cmd]]} {
return [eval [linsert $larg 0 OptionTree::$cmd $path]]
} else {
return [eval [linsert $larg 0 Tree::$cmd $path]]
}
}


proc OptionTree::_select { path toggle node } {
set opath $path#opttree
set onode $path.$node#opttree

$path selection set $node

if {[Widget::getoption $onode -state] ne "disabled" && $toggle} {
OptionTree::toggle $path $node
set cmd [Widget::cgetOption -command "" $onode $opath]
OptionTree::_eval_command $path $node $cmd
}

event generate $path <<TreeSelect>>
}


proc OptionTree::_eval_command { path node command } {
if {[string length $command]} {
set onode   $path.$node#opttree
set parent  [Tree::parent $path $node]
set varName [Widget::getoption $onode -variable]
set map     [list %W $path %p $parent %n $node %v $varName]

uplevel #0 [string map $map $command]
}
}


proc OptionTree::_set_variable { path node } {
Widget::getVariable $path traces
Widget::getVariable $path variables

set onode $path.$node#opttree

set varName [Widget::getoption $onode -variable]
if {![string length $varName]} { return }

set variables($node) $varName
lappend traces($varName) $node

set command [list OptionTree::_redraw_node $path $node 0]
uplevel #0 [list trace add variable $varName write $command]
}


proc OptionTree::_redraw_node { path node force args } {
set opath $path#opttree
set onode $path.$node#opttree

set varName [Widget::getoption $onode -variable]

set opts [list]

if {[Widget::getoption $onode -state] eq "disabled"} {
lappend opts -fill [Widget::getoption $onode -disabledforeground]
}

switch -- [Widget::getoption $onode -type] {
"checkbutton" {
set on [Widget::getoption $onode -on]

if {[string length $varName]} {
upvar #0 $varName var

set onvalue  [Widget::getoption $onode -onvalue]
set offvalue [Widget::getoption $onode -offvalue]

if {$force || ![info exists var]} {
if {$onvalue  eq ""} { set onvalue  1 }
if {$offvalue eq ""} { set offvalue 0 }
if {$on} {
set var $onvalue
} else {
set var $offvalue
}
} else {
if {$offvalue eq "" && [string is false -strict $var]} {
set on 0
} elseif {$onvalue eq "" && [string is true -strict $var]} {
set on 1
} elseif {$var == $onvalue} {
set on 1
} else {
set on 0
}
}
}

if {$on} {
set image [Widget::getoption $opath -checkselectimage]
} else {
set image [Widget::getoption $opath -checkimage]
}

Widget::setoption $onode -on $on
lappend opts -image $image
}

"radiobutton" {
set on 1
set image [Widget::getoption $opath -radioselectimage]

if {[string length $varName]} {
upvar #0 $varName var

set value [Widget::getoption $onode -value]

if {$force} { set var $value }

if {[info exists var] && $var != $value} {
set on 0
set image [Widget::getoption $opath -radioimage]
}
}

Widget::setoption $onode -on $on
lappend opts -image $image
}
}

eval [list Tree::itemconfigure $path $node] $opts
}


proc OptionTree::_destroy { path } {
Widget::getVariable $path traces

OptionTree::delete $path root

foreach varName [array names traces] {
foreach node $traces($varName) {
set command [list OptionTree::_redraw_node $path $node 0]
uplevel #0 [list trace remove variable $varName write $command]
}
}

Widget::destroy $path#opttree
}


namespace eval ListBox {
Widget::define ListBox listbox DragSite DropSite DynamicHelp

namespace eval Item {
Widget::declare ListBox::Item {
{-indent     Int        0   0 "%d >= 0"}
{-text       String     ""  0}
{-font       String     ""  0}
{-foreground Color2     ""  0}
{-image      String     ""  0}
{-window     String     ""  0}
{-data       String     ""  0}

{-fg         Synonym    -foreground}
{-fill       Synonym    -foreground}
}
}

DynamicHelp::include ListBox::Item balloon

Widget::tkinclude ListBox canvas .c  remove {
-insertwidth -insertbackground -insertborderwidth -insertofftime
-insertontime -selectborderwidth -closeenough -confine -scrollregion
-xscrollincrement -yscrollincrement -width -height -bg -background
-fg -foreground -selectbackground -selectforeground
} initialize {
-relief sunken -borderwidth 2 -takefocus 1
-highlightthickness 0 -width 200
}

DragSite::include ListBox "LISTBOX_ITEM" 1
DropSite::include ListBox {
LISTBOX_ITEM {copy {} move {}}
}

Widget::declare ListBox {
{-deltax           Int        10                        0 "%d >= 0"}
{-deltay           Int        15                        0 "%d >= 0"}
{-padx             Int        20                        0 "%d >= 0"}
{-foreground       Color      "SystemButtonText"        0 listbox}
{-background       Color      "SystemWindow"            0 listbox}
{-selectbackground Color      "SystemHighlight"         0 listbox}
{-selectforeground Color      "SystemHighlightText"     0 listbox}
{-font             String     "TkTextFont"              0 listbox}
{-width            TkResource ""                        0 listbox}
{-height           TkResource ""                        0 listbox}
{-redraw           Boolean    1                         0}
{-multicolumn      Boolean    0                         0}
{-dropovermode     Flag       "wpi"                     0 "wpi"}
{-selectmode       Enum       none                      1
{none single multiple}}
{-dropcmd          String     "ListBox::_drag_and_drop" 0}
{-autofocus        Boolean    1                         1}
{-selectfill       Boolean    0                         1}

{-sortargs         String     ""                        0}
{-sortinsert       Boolean    0                         0}

{-fg               Synonym    -foreground}
{-bg               Synonym    -background}
}

bind ListBox <FocusIn>   [list after idle {BWidget::refocus %W %W.c}]
bind ListBox <Destroy>   [list ListBox::_destroy %W]
bind ListBox <Configure> [list ListBox::_resize  %W]
bind ListBoxFocus <1>    [list focus %W]
bind ListBox <Key-Up>    [list ListBox::_keyboard_navigation %W -1]
bind ListBox <Key-Down>  [list ListBox::_keyboard_navigation %W  1]

BWidget::bindMouseWheel ListBoxCanvas

variable _edit
}


proc ListBox::create { path args } {
Widget::initArgs ListBox $args maps

frame $path -class ListBox -bd 0 -highlightthickness 0 -relief flat  -takefocus 0

if {[package vsatisfies $::tk_version 8.4]} {
$path configure -padx 0 -pady 0
}

Widget::initFromODB ListBox $path $maps(ListBox)

Widget::getVariable $path data

set data(nrows) -1

set data(items)    {}
set data(anchor)   ""
set data(selitems) {}

set data(upd,level)   0
set data(upd,afterid) ""
set data(upd,level)   0
set data(upd,delete)  {}

set data(dnd,scroll)   ""
set data(dnd,afterid)  ""
set data(dnd,item)     ""

eval [list canvas $path.c] $maps(.c) -xscrollincrement 8  -background [Widget::getoption $path -background]
pack $path.c -expand yes -fill both

DragSite::setdrag $path $path.c ListBox::_init_drag_cmd  [Widget::cget $path -dragendcmd] 1
DropSite::setdrop $path $path.c ListBox::_over_cmd ListBox::_drop_cmd 1

Widget::create ListBox $path

set w  [Widget::cget $path -width]
set h  [Widget::cget $path -height]
set dy [Widget::cget $path -deltay]
$path.c configure -width [expr {$w*8}] -height [expr {$h*$dy}]  -yscrollincrement $dy

set bindtags [bindtags $path.c]
set bindtags [linsert $bindtags 1 $path ListBoxCanvas]

if {[Widget::cget $path -autofocus]} {
lappend bindtags ListBoxFocus
}
bindtags $path.c $bindtags

bind $path.c <Key-Up>   {ListBox::_keyboard_navigation [winfo parent %W] -1}
bind $path.c <Key-Down> {ListBox::_keyboard_navigation [winfo parent %W] 1}

if {![string equal [Widget::getoption $path -selectmode] "none"]} {
set cmd ListBox::_multiple_select
$path bindText <Button-1>          [list $cmd $path none]
$path bindText <Shift-Button-1>    [list $cmd $path shift]
$path bindText <Control-Button-1>  [list $cmd $path control]

$path bindImage <Button-1>         [list $cmd $path none]
$path bindImage <Shift-Button-1>   [list $cmd $path shift]
$path bindImage <Control-Button-1> [list $cmd $path control]
}

return $path
}


proc ListBox::cget { path option } {
return [Widget::cget $path $option]
}


proc ListBox::configure { path args } {
set res [Widget::configure $path $args]

set chdy [Widget::hasChanged $path -deltay dy]

set ch1 [expr {$chdy
|| [Widget::hasChanged $path -padx val]
|| [Widget::hasChanged $path -font font]
|| [Widget::hasChanged $path -multicolumn val]
|| [Widget::hasChanged $path -foreground fg]}]

set ch2 [expr {[Widget::hasChanged $path -selectbackground val] |
[Widget::hasChanged $path -selectforeground val]}]

if {[Widget::hasChanged $path -height h]} {
$path.c configure -height [expr {$h*$dy}]
}

if {[Widget::hasChanged $path -width w]} {
$path.c configure -width [expr {$w*8}]
}

if {[Widget::hasChanged $path -background bg]} {
$path.c configure -background $bg
$path.c itemconfigure box -fill $bg
}

if {$chdy} {
$path.c configure -yscrollincrement $dy
}

if {$ch1} {
_redraw_idle $path 2
} elseif {$ch2} {
_redraw_idle $path 1
}

if {[Widget::hasChanged $path -redraw bool] && $bool} {
Widget::getVariable $path data
set lvl $data(upd,level)
set data(upd,level) 0
_redraw_idle $path $lvl
}

set force [Widget::hasChanged $path -dragendcmd dragend]
DragSite::setdrag $path $path.c ListBox::_init_drag_cmd $dragend $force
DropSite::setdrop $path $path.c ListBox::_over_cmd ListBox::_drop_cmd

return $res
}


proc ListBox::activate { path index } {

}


proc ListBox::insert { path index item args } {
Widget::getVariable $path data

set item [Widget::nextIndex $path $item]

if {[info exists data(item,$item)]} {
return -code error "item \"$item\" already exists"
}

Widget::init ListBox::Item $path.$item $args

if {[string equal $index "end"]} {
lappend data(items) $item
} else {
set data(items) [linsert $data(items) $index $item]
}

set data(item,$item) 0
set data(upd,create,$item) $item

if {[Widget::getoption $path -sortinsert]} {
ListBox::_sort_idle $path
} else {
ListBox::_redraw_idle $path 2
}

return $item
}

proc ListBox::multipleinsert { path index args } {
Widget::getVariable $path data


if {[llength $args] == 1} {
set args [lindex $args 0]
}

set count 0
foreach {item iargs} $args {
if { [lsearch -exact $data(items) $item] != -1 } {
return -code error "item \"$item\" already exists"
}

if {$count==0} {
Widget::init ListBox::Item $path.$item $iargs
set firstpath $path.$item
} else {
Widget::copyinit ListBox::Item $firstpath $path.$item $iargs
}

set data(items) [linsert $data(items) $index $item]
set data(upd,create,$item) $item

incr count
}

_redraw_idle $path 2
return $item
}


proc ListBox::itemcget { path item option } {
return [Widget::cget $path.$item $option]
}


proc ListBox::itemconfigure { path item args } {
Widget::getVariable $path data

if {![info exists data(item,$item)]} {
return -code error "item \"$item\" does not exist"
}

set oldind [Widget::getoption $path.$item -indent]

set res   [Widget::configure $path.$item $args]
set chind [Widget::hasChanged $path.$item -indent indent]
set chw   [Widget::hasChanged $path.$item -window win]
set chi   [Widget::hasChanged $path.$item -image  img]
set cht   [Widget::hasChanged $path.$item -text txt]
set chf   [Widget::hasChanged $path.$item -font fnt]
set chfg  [Widget::hasChanged $path.$item -foreground fg]
set idn   [lindex $data(item,$item) 0]

_set_help $path $item

if {![string length $idn]} {
_redraw_idle $path 2
return $res
}

set oldb   [$path.c bbox $idn]
set coords [$path.c coords $idn]
set padx   [Widget::getoption $path -padx]
set x0     [expr {[lindex $coords 0]-$padx-$oldind+$indent}]
set y0     [lindex $coords 1]

if {$chw || $chi} {
set idi  [$path.c find withtag i:$item]
set type [lindex [$path.c gettags $idi] 0]
if { [string length $win] } {
if { [string equal $type "win"] } {
$path.c itemconfigure $idi -window $win
} else {
$path.c delete $idi
$path.c create window $x0 $y0 -window $win -anchor w  -tags [list win i:$item]
}
} elseif { [string length $img] } {
if { [string equal $type "img"] } {
$path.c itemconfigure $idi -image $img
} else {
$path.c delete $idi
$path.c create image $x0 $y0 -image $img -anchor w  -tags [list img i:$item]
}
} else {
$path.c delete $idi
}
}

if {$cht || $chf || $chfg} {
set fnt [_getoption $path $item -font]
set fg  [_getoption $path $item -foreground]
$path.c itemconfigure $idn -text $txt -font $fnt -fill $fg
_redraw_idle $path 1
}

if {$chind} {
$path.c coords $idn [expr {$x0+$padx}] $y0
$path.c coords i:$item $x0 $y0
_redraw_idle $path 1
}

if {[Widget::getoption $path -multicolumn] && ($cht || $chf || $chind)} {
set bbox [$path.c bbox $idn]
if {[lindex $bbox 2] > [lindex $oldb 2]} {
_redraw_idle $path 2
}
}

return $res
}


proc ListBox::bindText { path event script } {
if {[string length $script]} {
set map    [list %W $path]
set script [string map $map $script]
append script " \[ListBox::_get_current [list $path]\]"
}
$path.c bind "click" $event $script
}


proc ListBox::bindImage { path event script } {
if {[string length $script]} {
set map    [list %W $path]
set script [string map $map $script]
append script " \[ListBox::_get_current [list $path]\]"
}
$path.c bind "img" $event $script
}


proc ListBox::delete { path args } {
Widget::getVariable $path data

foreach litems $args {
foreach item $litems {
if {[set idx [lsearch -exact $data(items) $item]] != -1} {
set data(items) [lreplace $data(items) $idx $idx]
Widget::destroy $path.$item 0
unset data(item,$item)
if {[info exists data(upd,create,$item)]} {
unset data(upd,create,$item)
} else {
lappend data(upd,delete) $item
}
}
}
}

set sel $data(selitems)
set data(selitems) {}
eval [list ListBox::selection $path set] $sel
_redraw_idle $path 2

return
}


proc ListBox::clear { path } {
eval [list ListBox::delete $path] [ListBox::items $path]
}


proc ListBox::move { path item index } {
Widget::getVariable $path data

if {![info exists data(item,$item)]} {
return -code error "item \"$item\" does not exist"
}

set idx [lsearch -exact $data(items) $item]
set data(items) [linsert [lreplace $data(items) $idx $idx] $index $item]

_redraw_idle $path 2
}


proc ListBox::reorder { path neworder } {
Widget::getVariable $path data

set data(items) [BWidget::lreorder $data(items) $neworder]
_redraw_idle $path 2
}


proc ListBox::selection { path cmd args } {
Widget::getVariable $path data

switch -- $cmd {
"add" {
foreach item $args {
if { [lsearch -exact $data(selitems) $item] == -1 } {
if { [lsearch -exact $data(items) $item] != -1 } {
lappend data(selitems) $item
}
}
}
}

"clear" {
set data(selitems) {}
}

"get" {
return $data(selitems)
}

"includes" {
return [expr {[lsearch -exact $data(selitems) $args] != -1}]
}

"range" {
foreach {item1 item2} $args {break}

if {![info exists data(item,$item1)]} {
return -code error "item \"$item1\" does not exist"
}

if {![info exists data(item,$item2)]} {
return -code error "item \"$item2\" does not exist"
}

set index1  [ListBox::index $path $item1]
set index2  [ListBox::index $path $item2]
set indexes [list $index1 $index2]
if {$index1 > $index2} {
set indexes [list $index2 $index1]
}

set data(selitems) [eval [list ListBox::items $path] $indexes]
}

"remove" {
foreach item $args {
if {[set idx [lsearch -exact $data(selitems) $item]] != -1} {
set data(selitems) [lreplace $data(selitems) $idx $idx]
}
}
}

"set" {
set data(selitems) {}
foreach item $args {
if { [lsearch -exact $data(selitems) $item] == -1 } {
if { [lsearch -exact $data(items) $item] != -1 } {
lappend data(selitems) $item
}
}
}
}

"toggle" {
foreach item $args {
if {[set idx [lsearch -exact $data(selitems) $item]] != -1} {
set data(selitems) [lreplace $data(selitems) $idx $idx]
} else {
lappend data(selitems) $item
}
}
}

default {
return
}
}

_redraw_idle $path 1
}


proc ListBox::exists { path item } {
Widget::getVariable $path data
return [info exists data(item,$item)]
}


proc ListBox::index { path item } {
Widget::getVariable $path data

switch -glob -- $item {
"active" {
return [ListBox::selection $path get]
}

"end" {
return [llength $data(items)]
}

"@*" {
return [ListBox::find $path $item]
}

default {
return [lsearch -exact $data(items) $item]
}
}
}


proc ListBox::find { path findInfo {confine ""} } {
Widget::getVariable $path data

if {[regexp -- {^@([0-9]+),([0-9]+)$} $findInfo match x y]} {
set x [$path.c canvasx $x]
set y [$path.c canvasy $y]
} elseif {[regexp -- {^[0-9]+$} $findInfo lineNumber]} {
set dy [Widget::cget $path -deltay]
set y  [expr {$dy*($lineNumber+0.5)}]
set confine ""
} else {
return -code error "invalid find spec \"$findInfo\""
}

set found 0
set xi    0
foreach xs $data(xlist) {
if {$x <= $xs} {
foreach id [$path.c find overlapping $xi $y $xs $y] {
set ltags [$path.c gettags $id]
set item  [lindex $ltags 0]
if { [string equal $item "item"] ||
[string equal $item "img"]  ||
[string equal $item "win"] } {
set item [string range [lindex $ltags 1] 2 end]
set found 1
break
}
}
break
}
set  xi  $xs
}

if {$found} {
if {[string equal $confine "confine"]} {
set xi [expr {[lindex [$path.c coords n:$item] 0]-[Widget::getoption $path -padx]}]
set xs [lindex [$path.c bbox n:$item] 2]
if {$x >= $xi && $x <= $xs} {
return $item
}
} else {
return $item
}
}
return ""
}


proc ListBox::item { path first {last ""} } {
Widget::getVariable $path data

if { ![string length $last] } {
return [lindex $data(items) $first]
} else {
return [lrange $data(items) $first $last]
}
}


proc ListBox::items { path {first ""} {last ""}} {
Widget::getVariable $path data
if {![string length $first]} { return $data(items) }
if {![string length $last]}  { return [lindex $data(items) $first] }
return [lrange $data(items) $first $last]
}


proc ListBox::see { path item } {
Widget::getVariable $path data

if {[Widget::getoption $path -redraw] && $data(upd,afterid) != ""} {
after cancel $data(upd,afterid)
_redraw_listbox $path
}
set idn [$path.c find withtag n:$item]
if {[string length $idn]} {
ListBox::_see $path $idn right
ListBox::_see $path $idn left
}
}


proc ListBox::edit { path item text {verifycmd ""} {clickres 0} {select 1}} {
variable _edit
Widget::getVariable $path data

if { [Widget::getoption $path -redraw] && $data(upd,afterid) != "" } {
after cancel $data(upd,afterid)
_redraw_listbox $path
}
set idn [$path.c find withtag n:$item]
if { $idn != "" } {
ListBox::_see $path $idn right
ListBox::_see $path $idn left

set oldfg  [$path.c itemcget $idn -fill]
set sbg    [Widget::cget $path -selectbackground]
set coords [$path.c coords $idn]
set x      [lindex $coords 0]
set y      [lindex $coords 1]
set ht     [$path.c cget -highlightthickness]
set bd     [expr {[$path.c cget -borderwidth] + $ht}]
set w      [expr {[winfo width $path] - 2 * $bd}]
set wmax   [expr {[$path.c canvasx $w] - $x}]

$path.c itemconfigure $idn    -fill [Widget::cget $path -background]
$path.c itemconfigure s:$item -fill {} -outline {}

set _edit(text) $text
set _edit(wait) 0

set frame  [frame $path.edit  -relief flat -borderwidth 0 -highlightthickness 0  -background [Widget::cget $path -background]]

set ent    [entry $frame.edit  -width              0      -relief             solid  -borderwidth        1      -highlightthickness 0      -foreground         [_getoption $path $item -foreground]  -background         [Widget::cget $path -background]  -selectforeground   [Widget::cget $path -selectforeground]  -selectbackground   $sbg   -font               [_getoption $path $item -font]  -textvariable       ListBox::_edit(text)]
pack $ent -ipadx 8 -anchor w

set idw [$path.c create window $x $y -window $frame -anchor w]
trace variable ListBox::_edit(text) w  [list ListBox::_update_edit_size $path $ent $idw $wmax]
tkwait visibility $ent
grab  $frame
BWidget::focus set $ent
_update_edit_size $path $ent $idw $wmax
update

if {$select} {
$ent selection range 0 end
$ent icursor end
$ent xview end
}

bindtags $ent [list $ent Entry]
bind $ent <Escape> {set ListBox::_edit(wait) 0}
bind $ent <Return> {set ListBox::_edit(wait) 1}

if {$clickres == 0 || $clickres == 1} {
bind $frame <Button>  [list set ListBox::_edit(wait) $clickres]
}

set ok 0
while {!$ok} {
tkwait variable ListBox::_edit(wait)
if { !$_edit(wait) || [llength $verifycmd]==0 ||
[uplevel \#0 $verifycmd [list $_edit(text)]] } {
set ok 1
}
}

trace vdelete ListBox::_edit(text) w  [list ListBox::_update_edit_size $path $ent $idw $wmax]
grab release $frame
BWidget::focus release $ent
destroy $frame
$path.c delete $idw
$path.c itemconfigure $idn    -fill $oldfg
$path.c itemconfigure s:$item -fill $sbg -outline $sbg

if {$_edit(wait)} {
return $_edit(text)
}
}
}


proc ListBox::xview { path args } {
return [eval [linsert $args 0 $path.c xview]]
}


proc ListBox::yview { path args } {
return [eval [linsert $args 0 $path.c yview]]
}


proc ListBox::getcanvas { path } {
return $path.c
}


proc ListBox::curselection { path } {
return [$path selection get]
}


proc ListBox::sort { path } {
Widget::getVariable $path data

foreach item $data(items) {
lappend list [list [Widget::getoption $path.$item -text] $item]
}

set data(items) [list]
foreach pair [eval lsort [Widget::getoption $path -sortargs] [list $list]] {
lappend data(items) [lindex $pair 1]
}

if {[info exists data(sort,afterid)]} {
unset data(sort,afterid)
}

_redraw_idle $path 2
}


proc ListBox::_sort_idle { path } {
Widget::getVariable $path data

if {![info exists data(sort,afterid)]} {
set data(sort,afterid) [after idle [list ListBox::sort $path]]
}
}


proc ListBox::_update_edit_size { path entry idw wmax args } {
set entw [winfo reqwidth $entry]
if { $entw >= $wmax } {
$path.c itemconfigure $idw -width $wmax
} else {
$path.c itemconfigure $idw -width 0
}
}


proc ListBox::_getoption { path item option } {
set value [Widget::getoption $path.$item $option]
if {![string length $value]} {
set value [Widget::getoption $path $option]
}
return $value
}


proc ListBox::_destroy { path } {
Widget::getVariable $path data

if {$data(upd,afterid) != ""} {
after cancel $data(upd,afterid)
}

if {$data(dnd,afterid) != ""} {
after cancel $data(dnd,afterid)
}

foreach item $data(items) {
Widget::destroy $path.$item 0
}

Widget::destroy $path
}


proc ListBox::_see { path idn side } {
set bbox [$path.c bbox $idn]
set scrl [$path.c cget -scrollregion]

set ymax [lindex $scrl 3]
set dy   [$path.c cget -yscrollincrement]
set yv   [$path.c yview]
set yv0  [expr {round([lindex $yv 0]*$ymax/$dy)}]
set yv1  [expr {round([lindex $yv 1]*$ymax/$dy)}]
set y    [expr {int([lindex [$path.c coords $idn] 1]/$dy)}]
if { $y < $yv0 } {
$path.c yview scroll [expr {$y-$yv0}] units
} elseif { $y >= $yv1 } {
$path.c yview scroll [expr {$y-$yv1+1}] units
}

set xmax [lindex $scrl 2]
set dx   [$path.c cget -xscrollincrement]
set xv   [$path.c xview]
if { [string equal $side "right"] } {
set xv1 [expr {round([lindex $xv 1]*$xmax/$dx)}]
set x1  [expr {int([lindex $bbox 2]/$dx)}]
if { $x1 >= $xv1 } {
$path.c xview scroll [expr {$x1-$xv1+1}] units
}
} else {
set xv0 [expr {round([lindex $xv 0]*$xmax/$dx)}]
set x0  [expr {int([lindex $bbox 0]/$dx)}]
if { $x0 < $xv0 } {
$path.c xview scroll [expr {$x0-$xv0}] units
}
}
}


proc ListBox::_update_scrollregion { path } {
set bd   [$path.c cget -borderwidth]
set ht   [$path.c cget -highlightthickness]
set bd   [expr {2*($bd + $ht)}]
set w    [expr {[winfo width  $path] - $bd}]
set h    [expr {[winfo height $path] - $bd}]
set xinc [$path.c cget -xscrollincrement]
set yinc [$path.c cget -yscrollincrement]
set bbox [$path.c bbox item win img]
if { [llength $bbox] } {
set xs [lindex $bbox 2]
set ys [lindex $bbox 3]

if { $w < $xs } {
set w [expr {int($xs)}]
if { [set r [expr {$w % $xinc}]] } {
set w [expr {$w+$xinc-$r}]
}
}
if { $h < $ys } {
set h [expr {int($ys)}]
if { [set r [expr {$h % $yinc}]] } {
set h [expr {$h+$yinc-$r}]
}
}
}

$path.c configure -scrollregion [list 0 0 $w $h]
}


proc ListBox::_update_select_fill { path } {
Widget::getVariable $path data

set width [winfo width $path]

foreach item $data(items) {
set bbox [$path.c bbox [lindex $data(item,$item) 0]]
set bbox [list 0 [lindex $bbox 1] $width [lindex $bbox 3]]
$path.c coords [lindex $data(item,$item) 2] $bbox
}

_redraw_selection $path
}


proc ListBox::_draw_item {path item x0 x1 y bg selfill multi ww} {
set indent  [Widget::getoption $path.$item -indent]
set i [$path.c create text [expr {$x1+$indent}] $y  -text   [Widget::getoption $path.$item -text]  -fill   [_getoption        $path $item -foreground]  -font   [_getoption        $path $item -font]  -anchor w  -tags   [list item n:$item click]]

lappend citems $i

if { [set win [Widget::getoption $path.$item -window]] != "" } {
set i [$path.c create window [expr {$x0+$indent}] $y  -window $win -anchor w -tags [list win i:$item]]
lappend citems $i
} elseif { [set img [Widget::getoption $path.$item -image]] != "" } {
set i [$path.c create image [expr {$x0+$indent}] $y  -image $img -anchor w -tags [list img i:$item]]
lappend citems $i
} else {
lappend citems ""
}


if {$selfill && !$multi} {
set bbox  [$path.c bbox n:$item]
set bbox  [list 0 [lindex $bbox 1] $ww [lindex $bbox 3]]
set tags  [list box b:$item click]
set i [$path.c create rect $bbox -fill $bg -width 0 -tags $tags]
$path.c lower $i
lappend citems $i
} else {
lappend citems ""
}

Widget::getVariable $path data
set data(item,$item) $citems

_set_help $path $item
}


proc ListBox::_redraw_items { path } {
Widget::getVariable $path data

set cursor [$path.c cget -cursor]
$path.c configure -cursor watch
update idletasks ; # make sure watch cursor is reflected

set dx    [Widget::getoption $path -deltax]
set dy    [Widget::cget $path -deltay]
set padx  [Widget::getoption $path -padx]
set y0    [expr {$dy/2}]
set x0    4
set x1    [expr {$x0+$padx}]
set drawn [list]
set nitems 0
set data(xlist) [list]

if {[Widget::getoption $path -multicolumn]} {
set nrows $data(nrows)
} else {
set nrows [llength $data(items)]
}

foreach item $data(upd,delete) {
$path.c delete i:$item n:$item s:$item b:$item
}

set bg      [Widget::cget $path -background]
set selfill [Widget::cget $path -selectfill]
set multi   [Widget::cget $path -multicolumn]
set ww      [winfo width $path]
foreach item $data(items) {
if {[info exists data(upd,create,$item)]} {
_draw_item $path $item $x0 $x1 $y0 $bg $selfill $multi $ww
set nitem  [lindex $data(item,$item) 0]
set iitem  [lindex $data(item,$item) 1]
set bitem  [lindex $data(item,$item) 2]
unset data(upd,create,$item)
} else {
set nitem  [lindex $data(item,$item) 0]
set iitem  [lindex $data(item,$item) 1]
set bitem  [lindex $data(item,$item) 2]
set indent [Widget::getoption $path.$item -indent]
$path.c coords $nitem [list [expr {$x1+$indent}] $y0]
if {[string length $iitem]} {
$path.c coords $iitem [list [expr {$x0+$indent}] $y0]
}

$path.c itemconfigure $nitem  -font [ListBox::_getoption $path $item -font]  -fill [ListBox::_getoption $path $item -foreground]
}

incr y0 $dy
incr nitems
if {$selfill} {
lappend drawn $bitem
} else {
lappend drawn $nitem
}

if {$nitems == $nrows} {
set y0     [expr {$dy/2}]
set bbox   [eval [linsert $drawn 0 $path.c bbox]]
set drawn  [list]
set x0     [expr {[lindex $bbox 2]+$dx}]
set x1     [expr {$x0+$padx}]
set nitems 0
lappend data(xlist) [lindex $bbox 2]
}
}

if {$nitems && $nitems < $nrows} {
set bbox  [eval [linsert $drawn 0 $path.c bbox]]
lappend data(xlist) [lindex $bbox 2]
}

set data(upd,delete) {}
$path.c configure -cursor $cursor
}


proc ListBox::_redraw_selection { path } {
Widget::getVariable $path data

set selbg   [Widget::cget $path -selectbackground]
set selfg   [Widget::cget $path -selectforeground]
set selfill [Widget::getoption $path -selectfill]
set multi   [Widget::getoption $path -multicolumn]
foreach id [$path.c find withtag sel] {
set item [string range [lindex [$path.c gettags $id] 1] 2 end]
$path.c itemconfigure [lindex $data(item,$item) 0]  -fill [_getoption $path $item -foreground]
}
$path.c delete sel
if {$selfill && !$multi} {
set width [winfo width $path]
}
foreach item $data(selitems) {
set nitem [lindex $data(item,$item) 0]
set bbox [$path.c bbox $nitem]

if {[llength $bbox]} {
if {$selfill && !$multi} {
set bbox [list 0 [lindex $bbox 1] $width [lindex $bbox 3]]
}
set tags [list sel s:$item click]
set id [$path.c create rectangle $bbox  -fill $selbg -outline $selbg -tags $tags]
$path.c itemconfigure $nitem -fill $selfg
$path.c lower $id
$path.c lower b:$item
}
}
}


proc ListBox::_redraw_listbox { path } {
Widget::getVariable $path data

if {[Widget::getoption $path -redraw]} {
if {$data(upd,level) == 2} {
_redraw_items $path
}

_redraw_selection $path
_update_scrollregion $path

if {[Widget::cget $path -selectfill]} {
_update_select_fill $path
}

set data(upd,level)   0
set data(upd,afterid) ""
}
}


proc ListBox::_redraw_idle { path level } {
Widget::getVariable $path data

if {$data(nrows) != -1} {
if {[Widget::getoption $path -redraw] && $data(upd,afterid) == ""} {
set data(upd,afterid)  [after idle [list ListBox::_redraw_listbox $path]]
}
}
if {$level > $data(upd,level)} {
set data(upd,level) $level
}
}


proc ListBox::_resize { path } {
Widget::getVariable $path data

if {[Widget::getoption $path -multicolumn]} {
set bd    [$path.c cget -borderwidth]
set ht    [$path.c cget -highlightthickness]
set bd    [expr {$bd + $ht}]
set h     [expr {[winfo height $path] - 2*$bd}]
set nrows [expr {$h/[$path.c cget -yscrollincrement]}]
if {$nrows == 0} {
set nrows 1
}

if {$nrows != $data(nrows)} {
set data(nrows) $nrows
_redraw_idle $path 2
} else {
_update_scrollregion $path
}
} elseif {$data(nrows) == -1} {
set data(nrows) 0
ListBox::_redraw_listbox $path
if {[Widget::cget $path -selectfill]} {
_update_select_fill $path
}
} else {
if {[Widget::cget $path -selectfill]} {
_update_select_fill $path
}

_update_scrollregion $path
}
}


proc ListBox::_init_drag_cmd { path X Y top } {
set path [winfo parent $path]
set ltags [$path.c gettags current]
set item  [lindex $ltags 0]
if {[string equal $item "item"]
|| [string equal $item "img"]
|| [string equal $item "win"]} {
set item [string range [lindex $ltags 1] 2 end]
if {[llength [set cmd [Widget::getoption $path -draginitcmd]]]} {
return [uplevel \#0 $cmd [list $path $item $top]]
}
if { [set type [Widget::getoption $path -dragtype]] == "" } {
set type "LISTBOX_ITEM"
}
if { [set img [Widget::getoption $path.$item -image]] != "" } {
pack [label $top.l -image $img -padx 0 -pady 0]
}
return [list $type {copy move link} $item]
}
return {}
}


proc ListBox::_drop_cmd { path source X Y op type dnddata } {
set path [winfo parent $path]
Widget::getVariable $path data

if { [string length $data(dnd,afterid)] } {
after cancel $data(dnd,afterid)
set data(dnd,afterid) ""
}
$path.c delete drop
set data(dnd,scroll) ""
if { [llength $data(dnd,item)] || ![llength $data(items)] } {
if {[llength [set cmd [Widget::getoption $path -dropcmd]]]} {
return [uplevel \#0 $cmd [list $path $source $data(dnd,item) $op $type $dnddata]]
}
}
return 0
}


proc ListBox::_over_cmd { path source event X Y op type dnddata } {
set path [winfo parent $path]
Widget::getVariable $path data

if { [string equal $event "leave"] } {
$path.c delete drop
if { [string length $data(dnd,afterid)] } {
after cancel $data(dnd,afterid)
set data(dnd,afterid) ""
}
set data(dnd,scroll) ""
return 0
}

if { [string equal $event "enter"] } {
set mode [Widget::getoption $path -dropovermode]
set data(dnd,mode) 0
foreach c {w p i} {
set data(dnd,mode) [expr {($data(dnd,mode) << 1) | ([string first $c $mode] != -1)}]
}
}

set x [expr {$X-[winfo rootx $path]}]
set y [expr {$Y-[winfo rooty $path]}]
$path.c delete drop
set data(dnd,item) ""

if { $data(dnd,mode) != 4 && [_auto_scroll $path $x $y] != "" } {
return 2
}

if { $data(dnd,mode) & 4 } {
set target [list widget]
set vmode  4
} else {
set target [list ""]
set vmode  0
}
if { ($data(dnd,mode) & 2) && ![llength $data(items)] } {
lappend target "" 0
set vmode [expr {$vmode | 2}]
}

if { ($data(dnd,mode) & 3) && [llength $data(items)]} {
set len  [llength $data(items)]
set xc   [$path.c canvasx $x]
set yc   [$path.c canvasy $y]
set dy   [$path.c cget -yscrollincrement]
set line [expr {int($yc/$dy)}]
set yi   [expr {$line*$dy}]
set ys   [expr {$yi+$dy}]
set xi   0
set pos  $line
if { [Widget::getoption $path -multicolumn] } {
set nrows $data(nrows)
} else {
set nrows $len
}
if { $line < $nrows } {
foreach xs $data(xlist) {
if { $xc <= $xs } {
break
}
set  xi  $xs
incr pos $nrows
}
if { $pos < $len } {
set item [lindex $data(items) $pos]
set xi   [expr {[lindex [$path.c coords n:$item] 0]-[Widget::getoption $path -padx]-1}]
if { $data(dnd,mode) & 1 } {
lappend target $item
set vmode [expr {$vmode | 1}]
} else {
lappend target ""
}

if { $data(dnd,mode) & 2 } {
if { $yc >= $yi+$dy/2 } {
incr pos
set yl $ys
} else {
set yl $yi
}
lappend target $pos
set vmode [expr {$vmode | 2}]
} else {
lappend target ""
}
} else {
lappend target "" ""
}
} else {
lappend target "" ""
}

if { ($vmode & 3) == 3 } {
if { $yc-$yi <= 3 || $ys-$yc <= 3 } {
lappend target "position"
} else {
lappend target "item"
}
}
}

if {$vmode && [llength [set cmd [Widget::getoption $path -dropovercmd]]]} {
set res   [uplevel \#0 $cmd [list $source $target $op $type $dnddata]]
set code  [lindex $res 0]
set vmode 0
if {$code & 1} {
switch -exact -- [lindex $res 1] {
item     {set vmode 1}
position {set vmode 2}
widget   {set vmode 4}
}
}
} else {
if { ($vmode & 3) == 3 } {
if { [string equal [lindex $target 3] "position"] } {
set vmode [expr {$vmode & ~1}]
} else {
set vmode [expr {$vmode & ~2}]
}
}

if { $data(dnd,mode) == 4 || $data(dnd,mode) == 0 } {
set code 1
} else {
set code 3
}
}

if {[llength $data(items)]} {
if { $vmode & 1 } {
set data(dnd,item) [list "item" [lindex $target 1]]
if {[Widget::getoption $path -selectfill]} { incr xs -8 }
$path.c create rectangle $xi $yi $xs $ys -tags drop
} elseif { $vmode & 2 } {
set data(dnd,item) [concat "position" [lindex $target 2]]
$path.c create line $xi $yl $xs $yl -tags drop
} elseif { $vmode & 4 } {
set data(dnd,item) [list "widget"]
} else {
set code [expr {$code & 2}]
}
}

if { $code & 1 } {
DropSite::setcursor based_arrow_down
} else {
DropSite::setcursor dot
}
return $code
}


proc ListBox::_auto_scroll { path x y } {
Widget::getVariable $path data

set xmax   [winfo width  $path]
set ymax   [winfo height $path]
set scroll {}
if { $y <= 6 } {
if { [lindex [$path.c yview] 0] > 0 } {
set scroll [list yview -1]
DropSite::setcursor sb_up_arrow
}
} elseif { $y >= $ymax-6 } {
if { [lindex [$path.c yview] 1] < 1 } {
set scroll [list yview 1]
DropSite::setcursor sb_down_arrow
}
} elseif { $x <= 6 } {
if { [lindex [$path.c xview] 0] > 0 } {
set scroll [list xview -1]
DropSite::setcursor sb_left_arrow
}
} elseif { $x >= $xmax-6 } {
if { [lindex [$path.c xview] 1] < 1 } {
set scroll [list xview 1]
DropSite::setcursor sb_right_arrow
}
}

if { [string length $data(dnd,afterid)] && ![string equal $data(dnd,scroll) $scroll] } {
after cancel $data(dnd,afterid)
set data(dnd,afterid) ""
}

set data(dnd,scroll) $scroll
if { [llength $scroll] && ![string length $data(dnd,afterid)] } {
set data(dnd,afterid) [after 200 [list ListBox::_scroll $path $scroll]]
}
return $data(dnd,afterid)

}

proc ListBox::_multiple_select { path mode item } {
Widget::getVariable $path data

if {![info exists data(item,$data(anchor))]} { set data(anchor) $item }

if {[string equal [Widget::getoption $path -selectmode] "single"]} {
set mode none
}

switch -exact -- $mode {
"none" {
_mouse_select $path set $item
set data(anchor) $item
}

"control" {
_mouse_select $path toggle $item
set data(anchor) $item
}

"shift" {
_mouse_select $path range $data(anchor) $item
}
}
}


proc ListBox::_scroll { path cmd dir } {
Widget::getVariable $path data

if { ($dir == -1 && [lindex [$path.c $cmd] 0] > 0) ||
($dir == 1  && [lindex [$path.c $cmd] 1] < 1) } {
$path $cmd scroll $dir units
set data(dnd,afterid)  [after 100 [list ListBox::_scroll $path $cmd $dir]]
} else {
set data(dnd,afterid) ""
DropSite::setcursor dot
}
}

proc ListBox::_set_help { path node } {
Widget::getVariable $path help

set item $path.$node
set opts [list -helptype -helptext -helpvar]
foreach {cty ctx cv} [eval [linsert $opts 0 Widget::hasChangedX $item]] break
set text [Widget::getoption $item -helptext]

if { (![info exists help($node)] && $text != "") || $cty || $ctx || $cv } {
set help($node) 1
set type [Widget::getoption $item -helptype]
switch $type {
balloon {
DynamicHelp::register $path.c balloon n:$node $text
DynamicHelp::register $path.c balloon i:$node $text
DynamicHelp::register $path.c balloon b:$node $text
}
variable {
set var [Widget::getoption $item -helpvar]
DynamicHelp::register $path.c variable n:$node $var $text
DynamicHelp::register $path.c variable i:$node $var $text
DynamicHelp::register $path.c variable b:$node $var $text
}
}
}
}

proc ListBox::_mouse_select { path cmd args } {
eval [linsert $args 0 selection $path $cmd]
switch -- $cmd {
"add" - "clear" - "remove" - "set" - "toggle" - "range" {
event generate $path <<ListboxSelect>>
}
}
}


proc ListBox::_get_current { path } {
set t [$path.c gettags current]
return [string range [lindex $t 1] 2 end]
}


proc ListBox::_drag_and_drop { path from endItem operation type startItem } {
if {[winfo parent $from] != $path} { return }

set place [lindex $endItem 0]
set i     [lindex $endItem 1]

switch -- $place {
"position" {
set idx $i
}

"item" {
set idx [$path index $i]
}

default {
return
}
}

if {$idx > [$path index $startItem]} { incr idx -1 }

if {[string equal $operation "copy"]} {
set options [Widget::options $path.$startItem]
eval [linsert $options 0 $path insert $idx $startItem\#auto]
} else {
$path move $startItem $idx
}
}


proc ListBox::_keyboard_navigation { path dir } {
Widget::getVariable $path data

set sel [$path index [lindex [$path selection get] end]]
if {$dir > 0} {
incr sel
if {$sel >= [llength $data(items)]} { return }
} else {
incr sel -1
if {$sel < 0} { return }
}
set item [lindex $data(items) $sel]
ListBox::see $path $item
_mouse_select $path set $item
}


namespace eval Separator {
Widget::define Separator separator

Widget::declare Separator {
{-background Color      "SystemButtonFace" 0}
{-cursor     String     ""         0}
{-relief     Enum       groove     0 {ridge groove}}
{-orient     Enum       horizontal 1 {horizontal vertical}}
{-bg         Synonym    -background}
}
Widget::addmap Separator "" :cmd { -background {} -cursor {} }

bind Separator <Destroy> [list Widget::destroy %W]
}


proc Separator::create { path args } {
Widget::initArgs Separator $args maps

eval [list frame $path -class Separator] $maps(:cmd)

Widget::initFromODB Separator $path $maps(Separator)

if {[string equal [Widget::cget $path -orient] "horizontal"]} {
$path configure -borderwidth 1 -height 2
} else {
$path configure -borderwidth 1 -width 2
}

if {[string equal [Widget::cget $path -relief] "groove"]} {
$path configure -relief sunken
} else {
$path configure -relief raised
}

return [Widget::create Separator $path]
}


proc Separator::configure { path args } {
set res [Widget::configure $path $args]

if { [Widget::hasChanged $path -relief relief] } {
if { $relief == "groove" } {
$path:cmd configure -relief sunken
} else {
$path:cmd configure -relief raised
}
}

return $res
}


proc Separator::cget { path option } {
return [Widget::cget $path $option]
}


namespace eval TTKButton {
Widget::define TTKButton button DynamicHelp

Widget::tkinclude TTKButton ttk::button :cmd  remove { -class }

Widget::declare TTKButton {
{-name                 String     ""      0 }
{-repeatdelay          Int        0       0 "%d >= 0" }
{-repeatinterval       Int        0       0 "%d >= 0" }
}

if 0 {
Widget::declare Button {
{-name                 String     ""      0 }
{-text                 String     ""      0 }
{-textvariable         String     ""      0 }
{-underline            Int        -1      0 "%d >= -1" }
{-armcommand           String     ""      0 }
{-disarmcommand        String     ""      0 }
{-command              String     ""      0 }
{-state                TkResource ""      0 button }
{-repeatdelay          Int        0       0 "%d >= 0" }
{-repeatinterval       Int        0       0 "%d >= 0" }
{-relief               Enum       raised  0
{raised sunken flat ridge solid groove link}}
{-image                String     ""      0 }
{-activeimage          String     ""      0 }
{-pressedimage         String     ""      0 }
{-disabledimage        String     ""      0 }
}

Widget::syncoptions Button "" :cmd { -text {} -underline {} }
}

DynamicHelp::include TTKButton balloon

variable _current ""
variable _pressed ""

}


proc TTKButton::create { path args } {
foreach {opt val} $args {
if {[Widget::optionExists TTKButton $opt]} {
lappend opts $opt $val
}
}

Widget::initArgs TTKButton $opts maps

eval [list ttk::button $path] $maps(:cmd)

Widget::initFromODB TTKButton $path $maps(TTKButton)

set var [$path cget -textvariable]
if {![string length $var]} {
set desc [BWidget::getname [Widget::getoption $path -name]]
if {[llength $desc]} {
set text  [lindex $desc 0]
set under [lindex $desc 1]
$path configure -text $text -underline $under
} else {
set text  [$path cget -text]
set under [$path cget -underline]
}
} else {
set text  ""
set under -1
$path configure -underline $under
}

set top [winfo toplevel $path]
bindtags $path [list $path TButton TTKButton $top all]

DynamicHelp::sethelp $path $path 1

return [Widget::create TTKButton $path]
}


proc TTKButton::configure { path args } {
set oldunder [$path:cmd cget -underline]
if {$oldunder != -1} {
set text      [$path:cmd cget -text]
set oldaccel1 [string tolower [string index $text $oldunder]]
set oldaccel2 [string toupper $oldaccel1]
} else {
set oldaccel1 ""
set oldaccel2 ""
}
set res [Widget::configure $path $args]

if {[Widget::anyChangedX $path -textvariable -name -text -underline]} {
set var   [Widget::cget $path -textvariable]
set text  [Widget::cget $path -text]
set under [Widget::cget $path -underline]

if {![string length $var]} {
set desc [BWidget::getname [Widget::cget $path -name]]
if {[llength $desc]} {
set text  [lindex $desc 0]
set under [lindex $desc 1]
}
} else {
set under -1
set text  ""
}
set top [winfo toplevel $path]
if {![string equal $oldaccel1 ""]} {
bind $top <Alt-$oldaccel1> {}
bind $top <Alt-$oldaccel2> {}
}
set accel1 [string tolower [string index $text $under]]
set accel2 [string toupper $accel1]
if {![string equal $accel1 ""]} {
bind $top <Alt-$accel1> [list TTKButton::invoke $path]
bind $top <Alt-$accel2> [list TTKButton::invoke $path]
}
$path:cmd configure -text $text -underline $under -textvariable $var
}

DynamicHelp::sethelp $path $path

return $res
}


proc TTKButton::cget { path option } {
Widget::cget $path $option
}


proc TTKButton::state { path args } {
return [uplevel #0 [list $path:cmd state] $args]
}


proc TTKButton::instate { path args } {
return [uplevel #0 [list $path:cmd instate] $args]
}


proc TTKButton::invoke { path } {
return [uplevel #0 [list $path:cmd invoke]]
}


proc TTKButton::_enter { path } {
variable _current
variable _pressed

set _current $path
if {![string equal [Widget::cget $path -state] "disabled"]} {
$path:cmd configure -state active
if {[string equal $_pressed $path]} {
$path:cmd configure -relief sunken
} elseif {[string equal [Widget::cget $path -relief] "link"]} {
$path:cmd configure -relief raised
}

set image [Widget::cget $path -activeimage]
if {[string equal $_pressed $path]} {
set pressedimage [Widget::cget $path -pressedimage]
if {![string equal $pressedimage ""]} { set image $pressedimage }
}
if {![string equal $image ""]} { $path:cmd configure -image $image }
}
}


proc TTKButton::_leave { path } {
variable _current
variable _pressed

set _current ""
if {[string equal [Widget::cget $path -state] "disabled"]} {
set dimg [Widget::cget $path -disabledimage]
if {![string equal $dimg ""]} { $path:cmd configure -state normal }
} else {
set relief [Widget::cget $path -relief]
if {[string equal $_pressed $path]} {
if {[string equal $relief "link"]} {
set relief raised
}
} elseif {[string equal $relief "link"]} {
set relief flat
}

$path:cmd configure  -relief $relief  -state  [Widget::cget $path -state]  -image  [Widget::cget $path -image]
}
}


proc TTKButton::_press { path } {
variable _pressed

if {![string equal [Widget::cget $path -state] "disabled"]} {
set _pressed $path
$path:cmd configure -relief sunken

set img [Widget::cget $path -pressedimage]
if {![string equal $img ""]} { $path:cmd configure -image $img }

set cmd [Widget::getoption $path -armcommand]
if {![string equal $cmd ""]} {
uplevel \#0 $cmd
set repeatdelay [Widget::getoption $path -repeatdelay]
set repeatint [Widget::getoption $path -repeatinterval]
if {$repeatdelay > 0} {
after $repeatdelay [list TTKButton::_repeat $path]
} elseif {$repeatint > 0} {
after $repeatint [list TTKButton::_repeat $path]
}
}
}
}


proc TTKButton::_release { path } {
variable _current
variable _pressed

if {[string equal $_pressed $path]} {
set pressed $_pressed
set _pressed ""
set relief [Widget::getoption $path -relief]
after cancel [list TTKButton::_repeat $path]

if {[string equal $relief "link"]} {
set relief raised
}

set image [Widget::cget $path -image]
if {[string equal $pressed $path]} {
set activeimage [Widget::cget $path -activeimage]
if {![string equal $activeimage ""]} { set image $activeimage }
}

$path:cmd configure -relief $relief -image $image

set cmd [Widget::getoption $path -disarmcommand]
if {![string equal $cmd ""]} {
uplevel \#0 $cmd
}

if {[string equal $_current $path] &&
![string equal [Widget::cget $path -state] "disabled"] &&  [set cmd [Widget::getoption $path -command]] != ""} {
uplevel \#0 $cmd
}
}
}


proc TTKButton::_repeat { path } {
variable _current
variable _pressed

if {$_current == $path && $_pressed == $path &&
![string equal [Widget::cget $path -state] "disabled"] &&
[set cmd [Widget::getoption $path -armcommand]] != ""} {
uplevel \#0 $cmd
}
if { $_pressed == $path &&
([set delay [Widget::getoption $path -repeatinterval]] >0 ||
[set delay [Widget::getoption $path -repeatdelay]] > 0) } {
after $delay [list TTKButton::_repeat $path]
}
}


namespace eval Button {
if {[BWidget::using ttk]} {
Widget::define Button button TTKButton DynamicHelp
} else {
Widget::define Button button DynamicHelp
}

set remove [list -command -relief -text -textvariable  -underline -image -state]
if {[info tclversion] > 8.3} {
lappend remove -repeatdelay -repeatinterval
}

Widget::tkinclude Button button :cmd remove $remove

Widget::declare Button {
{-name                 String     ""      0 }
{-text                 String     ""      0 }
{-textvariable         String     ""      0 }
{-underline            Int        -1      0 "%d >= -1" }
{-armcommand           String     ""      0 }
{-disarmcommand        String     ""      0 }
{-command              String     ""      0 }
{-state                TkResource ""      0 button }
{-repeatdelay          Int        0       0 "%d >= 0" }
{-repeatinterval       Int        0       0 "%d >= 0" }
{-relief               Enum       raised  0
{raised sunken flat ridge solid groove link}}
{-image                String     ""      0 }
{-activeimage          String     ""      0 }
{-pressedimage         String     ""      0 }
{-disabledimage        String     ""      0 }
}

Widget::addmap Button "" :cmd { -text {} -underline {} }

DynamicHelp::include Button balloon

variable _current ""
variable _pressed ""

bind BwButton <Enter>           {Button::_enter %W}
bind BwButton <Leave>           {Button::_leave %W}
bind BwButton <ButtonPress-1>   {Button::_press %W}
bind BwButton <ButtonRelease-1> {Button::_release %W}
bind BwButton <Key-space>       {Button::invoke %W; break}
bind BwButton <Return>          {Button::invoke %W; break}
bind BwButton <Destroy>         {Widget::destroy %W}
}


proc Button::create { path args } {
if {[BWidget::using ttk]} {
return [eval [list TTKButton::create $path] $args]
}

Widget::initArgs Button $args maps

eval [list button $path] $maps(:cmd)

Widget::initFromODB Button $path $maps(Button)

set var [$path cget -textvariable]
if {![string length $var]} {
set desc [BWidget::getname [Widget::getoption $path -name]]
if {[llength $desc]} {
set text  [lindex $desc 0]
set under [lindex $desc 1]
$path configure -text $text -underline $under
} else {
set text  [$path cget -text]
set under [$path cget -underline]
}
} else {
set text  ""
set under -1
$path configure -underline $under
}

set relief [Widget::getoption $path -relief]
if {[string equal $relief "link"]} { set relief flat }

set opts [list]
lappend opts -text $text -underline $under -textvariable $var
lappend opts -relief $relief -state [Widget::cget $path -state]
lappend opts -image [Widget::cget $path -image]

eval [list $path configure] $opts

set top [winfo toplevel $path]
bindtags $path [list $path BwButton $top all]

set accel1 [string tolower [string index $text $under]]
set accel2 [string toupper $accel1]
if {[string length $accel1]} {
bind $top <Alt-$accel1> [list Button::invoke $path]
bind $top <Alt-$accel2> [list Button::invoke $path]
}

DynamicHelp::sethelp $path $path 1

return [Widget::create Button $path]
}


proc Button::configure { path args } {
set oldunder [$path:cmd cget -underline]
if {$oldunder != -1} {
set text      [$path:cmd cget -text]
set oldaccel1 [string tolower [string index $text $oldunder]]
set oldaccel2 [string toupper $oldaccel1]
} else {
set oldaccel1 ""
set oldaccel2 ""
}
set res [Widget::configure $path $args]

if {[Widget::anyChangedX $path -relief -state]} {
set state  [Widget::cget $path -state]
set relief [Widget::cget $path -relief]
if {[string equal $relief "link"]} {
if {[string equal $state "active"]} {
set relief "raised"
} else {
set relief "flat"
}
}

$path:cmd configure -relief $relief

set dimg [Widget::cget $path -disabledimage]
if {[string equal $state "disabled"] && ![string equal $dimg ""]} {
$path:cmd configure -image $dimg
} else {
$path:cmd configure  -state      $state  -image      [Widget::cget $path -image]  -background [Widget::cget $path -background]  -foreground [Widget::cget $path -foreground]
}
}

if {[Widget::hasChanged $path -image image]} {
$path:cmd configure -image $image
}

if {[Widget::anyChangedX $path -textvariable -name -text -underline]} {
set var   [Widget::cget $path -textvariable]
set text  [Widget::cget $path -text]
set under [Widget::cget $path -underline]

if {![string length $var]} {
set desc [BWidget::getname [Widget::cget $path -name]]
if {[llength $desc]} {
set text  [lindex $desc 0]
set under [lindex $desc 1]
}
} else {
set under -1
set text  ""
}
set top [winfo toplevel $path]
if {![string equal $oldaccel1 ""]} {
bind $top <Alt-$oldaccel1> {}
bind $top <Alt-$oldaccel2> {}
}
set accel1 [string tolower [string index $text $under]]
set accel2 [string toupper $accel1]
if {![string equal $accel1 ""]} {
bind $top <Alt-$accel1> [list Button::invoke $path]
bind $top <Alt-$accel2> [list Button::invoke $path]
}
$path:cmd configure -text $text -underline $under -textvariable $var
}

DynamicHelp::sethelp $path $path

return $res
}


proc Button::cget { path option } {
Widget::cget $path $option
}


proc Button::invoke { path } {
if {[string equal [Widget::cget $path -state] "disabled"]} { return }

$path:cmd configure -state active -relief sunken
update idletasks

set cmd [Widget::getoption $path -armcommand]
if {![string equal $cmd ""]} {
uplevel \#0 $cmd
}
after 100
set relief [Widget::getoption $path -relief]
if {[string equal $relief "link"]} {
set relief flat
}
$path:cmd configure  -state  [Widget::getoption $path -state]  -relief $relief
set cmd [Widget::getoption $path -disarmcommand]
if {![string equal $cmd ""]} {
uplevel \#0 $cmd
}
set cmd [Widget::getoption $path -command]
if {![string equal $cmd ""]} {
uplevel \#0 $cmd
}
}


proc Button::_enter { path } {
variable _current
variable _pressed

set _current $path
if {![string equal [Widget::cget $path -state] "disabled"]} {
$path:cmd configure -state active
if {[string equal $_pressed $path]} {
$path:cmd configure -relief sunken
} elseif {[string equal [Widget::cget $path -relief] "link"]} {
$path:cmd configure -relief raised
}

set image [Widget::cget $path -activeimage]
if {[string equal $_pressed $path]} {
set pressedimage [Widget::cget $path -pressedimage]
if {![string equal $pressedimage ""]} { set image $pressedimage }
}
if {![string equal $image ""]} { $path:cmd configure -image $image }
}
}


proc Button::_leave { path } {
variable _current
variable _pressed

set _current ""
if {[string equal [Widget::cget $path -state] "disabled"]} {
set dimg [Widget::cget $path -disabledimage]
if {![string equal $dimg ""]} { $path:cmd configure -state normal }
} else {
set relief [Widget::cget $path -relief]
if {[string equal $_pressed $path]} {
if {[string equal $relief "link"]} {
set relief raised
}
} elseif {[string equal $relief "link"]} {
set relief flat
}

$path:cmd configure  -relief $relief  -state  [Widget::cget $path -state]  -image  [Widget::cget $path -image]
}
}


proc Button::_press { path } {
variable _pressed

if {![string equal [Widget::cget $path -state] "disabled"]} {
set _pressed $path
$path:cmd configure -relief sunken

set img [Widget::cget $path -pressedimage]
if {![string equal $img ""]} { $path:cmd configure -image $img }

set cmd [Widget::getoption $path -armcommand]
if {![string equal $cmd ""]} {
uplevel \#0 $cmd
set repeatdelay [Widget::getoption $path -repeatdelay]
set repeatint [Widget::getoption $path -repeatinterval]
if {$repeatdelay > 0} {
after $repeatdelay "Button::_repeat $path"
} elseif {$repeatint > 0} {
after $repeatint "Button::_repeat $path"
}
}
}
}


proc Button::_release { path } {
variable _current
variable _pressed

if {[string equal $_pressed $path]} {
set pressed $_pressed
set _pressed ""
set relief [Widget::getoption $path -relief]
after cancel "Button::_repeat $path"

if {[string equal $relief "link"]} {
set relief raised
}

set image [Widget::cget $path -image]
if {[string equal $pressed $path]} {
set activeimage [Widget::cget $path -activeimage]
if {![string equal $activeimage ""]} { set image $activeimage }
}

$path:cmd configure -relief $relief -image $image

set cmd [Widget::getoption $path -disarmcommand]
if {![string equal $cmd ""]} {
uplevel \#0 $cmd
}

if {[string equal $_current $path] &&
![string equal [Widget::cget $path -state] "disabled"] &&  [set cmd [Widget::getoption $path -command]] != ""} {
uplevel \#0 $cmd
}
}
}


proc Button::_repeat { path } {
variable _current
variable _pressed

if {$_current == $path && $_pressed == $path &&
![string equal [Widget::cget $path -state] "disabled"] &&
[set cmd [Widget::getoption $path -armcommand]] != ""} {
uplevel \#0 $cmd
}
if { $_pressed == $path &&
([set delay [Widget::getoption $path -repeatinterval]] >0 ||
[set delay [Widget::getoption $path -repeatdelay]] > 0) } {
after $delay "Button::_repeat $path"
}
}


namespace eval ButtonBox {
Widget::define ButtonBox buttonbox Button

namespace eval Button {
Widget::declare ButtonBox::Button {
{-tags              String    ""            0}
{-hide              Boolean   0             0}
{-value             String    ""            0}
{-spacing           Int       -1            0 "%d >= -1"}
}
}

if {[BWidget::using ttk]} {
Widget::tkinclude ButtonBox ttk::frame :cmd  remove { -class -colormap -container -padx -pady -visual }
} else {
Widget::tkinclude ButtonBox frame :cmd  remove { -class -colormap -container -padx -pady -visual }
}

Widget::declare ButtonBox {
{-orient      Enum       horizontal 0 {horizontal vertical}}
{-state       Enum       "normal"   0 {disabled normal}}
{-homogeneous Boolean    1          0}
{-spacing     Int        10         0 "%d >= 0"}
{-padx        Int        1          0}
{-pady        Int        1          0}
{-default     String     -1         0}
{-rows        Int        "0"        0}
{-columns     Int        "0"        0}
}

bind ButtonBox <Map>     [list ButtonBox::_realize %W]
bind ButtonBox <Destroy> [list ButtonBox::_destroy %W]
}


proc ButtonBox::create { path args } {
Widget::initArgs ButtonBox $args maps

if {[BWidget::using ttk]} {
eval [list ttk::frame $path -class ButtonBox] $maps(:cmd)
} else {
eval [list frame $path -class ButtonBox] $maps(:cmd)
}

Widget::initFromODB ButtonBox $path $maps(ButtonBox)

if {![BWidget::using ttk]
&& [info tclversion] >= 8.4} { $path configure -padx 0 -pady 0 }

Widget::getVariable $path data

set data(max)      0
set data(nbuttons) 0
set data(realized) 0
set data(buttons)  [list]
set data(widgets)  [list]
set data(default)  [Widget::getoption $path -default]

return [Widget::create ButtonBox $path]
}


proc ButtonBox::configure { path args } {
Widget::getVariable $path data

set res [Widget::configure $path $args]

if {[Widget::hasChanged $path -default val]} {
_select_default $path
}

if {[Widget::hasChanged $path -state val]} {
foreach i $data(buttons) {
$path.b$i configure -state $val
}
}

set opts [list -rows -columns -orient -homogeneous]
if {[eval [list Widget::anyChangedX $path] $opts]} { _redraw $path }

return $res
}


proc ButtonBox::cget { path option } {
return [Widget::cget $path $option]
}


proc ButtonBox::add { path args } {
return [eval insert $path end $args]
}


proc ButtonBox::insert { path idx args } {
Widget::getVariable $path data
Widget::getVariable $path tags

set but $path.b$data(nbuttons)

set class Button
if {[BWidget::using ttk]} { set class TTKButton }
array set maps [Widget::splitArgs $args $class ButtonBox::Button]

Widget::init ButtonBox::Button $but#bbox $maps(ButtonBox::Button)

set spacing [Widget::getOption -spacing -1 $but#bbox $path]

if {[string equal $idx "end"] && $data(nbuttons)} {
set data(spacing,$data(nbuttons)) [list left $spacing]
lappend data(widgets) $but
lappend data(buttons) $data(nbuttons)
} else {
set data(spacing,$data(nbuttons)) [list right $spacing]
set data(widgets) [linsert $data(widgets) $idx $but]
set data(buttons) [linsert $data(buttons) $idx $data(nbuttons)]
}

set opts [list]
if {![BWidget::using ttk]} {
lappend opts -padx [Widget::getoption $path -padx]
lappend opts -pady [Widget::getoption $path -pady]
}

eval [list Button::create $but] $opts $maps(:cmd) $maps($class)

foreach tag [Widget::getoption $but#bbox -tags] {
lappend tags($tag) $but
if {![info exists tags($tag,state)]} { set tags($tag,state) 1 }
}

_redraw_idle $path

_select_default $path

incr data(nbuttons)

return $but
}


proc ButtonBox::delete { path index } {
Widget::getVariable $path data
Widget::getVariable $path tags

set button $path.b$i
set widget $button#bbox

set i [lindex $data(buttons) $index]
set data(buttons) [lreplace $data(buttons) $index $index]
set data(widgets) [lreplace $data(widgets) $index $index]

foreach tag [Widget::getoption $widget -tags] {
set tags($tag) [BWidget::lremove $tags($tag) $button]
if {![llength $tags($tag)]} {
unset tags($tag) tags($tag,state)
}
}

Widget::destroy $widget 0

destroy $button

_redraw_idle $path
}


proc ButtonBox::buttons { path {first ""} {last ""} } {
Widget::getVariable $path data
if {![string length $first]} { return $data(widgets) }
if {![string length $last]}  { return [lindex $data(widgets) $first] }
return [lrange $data(widgets) $first $last]
}


proc ButtonBox::itemconfigure { path index args } {
Widget::getVariable $path data

set idx    [index $path $index]
set button $path.b$idx

set class Button
if {[BWidget::using ttk]} { set class TTKButton }

if {![llength $args]} {
set res [${class}::configure $button]
eval lappend res [Widget::configure $button#bbox [list]]
return [lsort $res]
}

if {[llength $args] == 1} {
if {[Widget::optionExists Button $args]} {
return [${class}::configure $button $args]
} else {
return [Widget::configure $button#bbox $args]
}
}

array set maps [Widget::splitArgs $args $class ButtonBox::Button]

if {[info exists maps(ButtonBox::Button)]} {
set oldtags [Widget::getoption $button#bbox -tags]

Widget::configure $button#bbox $maps(ButtonBox::Button)

if {[Widget::hasChanged $button#bbox -tags newtags]} {
Widget::getVariable $path tags

foreach tag $oldtags {
set tags($tag) [BWidget::lremove $tags($tag) $button]
if {![llength $tags($tag)]} {
unset tags($tag) tags($tag,state)
}
}

foreach tag $newtags {
lappend tags($tag) $button
if {![info exists tags($tag,state)]} { set tags($tag,state) 1 }
}
}

set redraw 0

if {[Widget::hasChanged $button#bbox -spacing spacing]} {
set redraw 1
set data(spacing,$idx) [lreplace $data(spacing,$idx) 1 1 $spacing]
}

if {[Widget::hasChanged $button#bbox -hide hide]} {
set redraw 1
}

if {$redraw} { _redraw_idle $path }
}

if {[llength $maps(:cmd)] || [llength $maps($class)]} {
eval [list ${class}::configure $button] $maps(:cmd) $maps($class)
}
}


proc ButtonBox::itemcget { path index option } {
set button $path.b[index $path $index]
if {[Widget::optionExists Button $option]} {
return [Button::cget $button $option]
} else {
return [Widget::cget $button#bbox $option]
}
}


proc ButtonBox::setfocus { path index } {
set but $path.b[index $path $index]
if {[winfo exists $but]} { focus $but }
}


proc ButtonBox::invoke { path index } {
set but $path.b[index $path $index]
if {[winfo exists $but]} { $but invoke }
}


proc ButtonBox::index { path index } {
Widget::getVariable $path data

set n [expr {$data(nbuttons) - 1}]

if {[string is integer -strict $index]} {
set res $index
if {$index > $n} { set res $n }
return $res
}

if {[string equal $index "default"]} {
set res [Widget::getoption $path -default]
} elseif {[string equal $index "end"] || [string equal $index "last"]} {
set res $n
} elseif {[set res [lsearch -exact $data(widgets) $index]] > -1} {
} else {
foreach i $data(buttons) {
set w $path.b$i
lappend text  [$w cget -text]
lappend names [$w cget -name]
}
set len [llength $data(buttons)]
set res [lsearch -exact [concat $names $text] $index]
if {$res >= $len} { set res [expr {$res - $len}] }
}
return $res
}



proc ButtonBox::gettags { path } {
Widget::getVariable $path tags

set tags [list]

foreach tag [array names tags] {
if {![string match "*,state" $tag]} { lappend tags $tag }
}
return $tags
}



proc ButtonBox::setbuttonstate { path tag state } {
Widget::getVariable $path tags

if {![info exists tags($tag)]} { return }

set tags($tag,state) $state
foreach button $tags($tag) {
set expression 1
foreach buttontag [Widget::getoption $button#bbox -tags] {
lappend expression && $tags($buttontag,state)
}

if {[expr $expression]} {
set state normal
} else {
set state disabled
}

$button configure -state $state
}
}


proc ButtonBox::getbuttonstate { path tag } {
Widget::getVariable $path tags

if {![info exists tags($tag)]} {
return -code error "unknown tag \"$tag\""
}

return $tags($tag,state)
}


proc ButtonBox::_select_default { path } {
Widget::getVariable $path data

set default [Widget::getoption $path -default]
set data(default) [ButtonBox::index $path $default]

foreach i $data(buttons) {
set button $path.b$i
if {$i == $data(default)} {
if {[BWidget::using ttk]} {
$button state focus
} else {
$button configure -default active
}
} else {
if {[BWidget::using ttk]} {
$button state !focus
} else {
$button configure -default normal
}
}
incr i
}
}


proc ButtonBox::_redraw_idle { path } {
Widget::getVariable $path data

if {![info exists data(redraw)]} {
set data(redraw) 1
after idle [list ButtonBox::_redraw $path]
}
}


proc ButtonBox::_redraw { path } {
Widget::getVariable $path data
Widget::getVariable $path buttons

set data(redraw) 1


set rows [Widget::getoption $path -rows]
set cols [Widget::getoption $path -columns]

set idx     0
set rowidx  0
set colidx  0
set idxs [list]
foreach i $data(buttons) {
set dir     [lindex $data(spacing,$i) 0]
set spacing [lindex $data(spacing,$i) 1]
set but $path.b$i
if {[string equal [Widget::getoption $path -orient] "horizontal"]} {
if {![Widget::getoption $but#bbox -hide]} {
grid $but -column $idx -row $rowidx -sticky nsew
} else {
grid remove $but
}

if {[Widget::getoption $path -homogeneous]} {
set req [winfo reqwidth $but]
if { $req > $data(max) } {
grid columnconfigure $path [expr {2*$i}] -minsize $req
set data(max) $req
}
grid columnconfigure $path $idx -minsize $data(max) -weight 1
} else {
grid columnconfigure $path $idx -weight 0
}

set col [expr {$idx - 1}]
if {[string equal $dir "right"]} { set col [expr {$idx + 1}] }
if {$col > 0 && [lsearch -exact $idxs $col] < 0} {
lappend idxs $col
grid columnconfigure $path $col -minsize $spacing
}

incr colidx

if {$cols > 0 && $colidx >= $cols} {
set idx -2
incr rowidx
set colidx 0
}
} else {
if {![Widget::getoption $but#bbox -hide]} {
grid $but -column $colidx -row $idx -sticky nsew
} else {
grid remove $but
}

grid rowconfigure $path $idx -weight 0

set row [expr {$idx - 1}]
if {[string equal $dir "right"]} { set row [expr {$idx + 1}] }
if {$row > 0 && [lsearch -exact $idxs $row] < 0} {
lappend idxs $row
grid rowconfigure $path $row -minsize $spacing
}

incr rowidx

if {$rows > 0 && $rowidx >= $rows} {
set idx -2
incr colidx
set rowidx 0
}
}
incr idx 2
}

unset data(redraw)
}


proc ButtonBox::_realize { path } {
Widget::getVariable $path data

if {!$data(realized)} {
set data(realized) 1
ButtonBox::_redraw $path
}
}


proc ButtonBox::_destroy { path } {
Widget::getVariable $path data

foreach i $data(buttons) {
set button $path.b$i
Widget::destroy $button#bbox 0
}

Widget::destroy $path
}


namespace eval Dialog {
Widget::define Dialog dialog ButtonBox

Widget::bwinclude Dialog ButtonBox .bbox  remove {
-orient -background
} initialize {
-spacing 10 -padx 10
}

Widget::declare Dialog {
{-background    Color    "SystemButtonFace" 0}
{-title         String   ""      0}
{-geometry      String   ""      0}
{-modal         Enum     local   0 {none local global}}
{-bitmap        String   ""      1}
{-image         String   ""      1}
{-separator     Boolean  0       1}
{-cancel        Int      -1      0 "%d >= -1"}
{-parent        String   ""      0}
{-side          Enum     bottom  1 {bottom left top right}}
{-anchor        Enum     c       1 {n e w s c}}
{-class         String   Dialog  1}
{-transient     Boolean  1       1}
{-place         Enum     center  1 {none center left right above below}}
{-placerelative Boolean  1       1}

{-bg            Synonym  -background}
}

if {![BWidget::using ttk]} {
Widget::addmap Dialog "" :cmd   {-background {}}
Widget::addmap Dialog "" .frame {-background {}}
}

bind Dialog <Destroy> [list Dialog::_destroy %W]
}


proc Dialog::create { path args } {
Widget::initArgs Dialog $args maps

array set _args $maps(Dialog)
set class "Dialog"
if {[info exists _args(-class)]} { set class $_args(-class) }

if {[string equal $::tcl_platform(platform) "unix"]} {
set re raised
set bd 1
} else {
set re flat
set bd 0
}
toplevel $path -relief $re -borderwidth $bd -class $class  -background $::BWidget::colors(SystemButtonFace)
wm protocol $path WM_DELETE_WINDOW [list Dialog::enddialog $path -1 1]

Widget::initFromODB Dialog $path $maps(Dialog)

bindtags $path [list $path $class all]
wm overrideredirect $path 1
wm title $path [Widget::cget $path -title]

set parent [Widget::getoption $path -parent]
if {![winfo exists $parent]} {
set parent [winfo parent $path]
if {$parent ne "."} { Widget::setoption $path -parent $parent }
}

if {[Widget::getoption $path -transient]} {
wm transient $path [winfo toplevel $parent]
}
wm withdraw $path

set side [Widget::cget $path -side]
if {[string equal $side "left"] || [string equal $side "right"]} {
set orient vertical
} else {
set orient horizontal
}

eval [list ButtonBox::create $path.bbox] $maps(.bbox) -orient $orient
set frame [frame $path.frame -relief flat -borderwidth 0]

set opts [list]

if {![BWidget::using ttk]} {
set bg [$path cget -background]
lappend opts -background $bg
$path configure -background $bg
$frame configure -background $bg
}

if {[set bitmap [Widget::getoption $path -image]] != ""} {
eval [list label $path.label -image $bitmap] $opts
} elseif {[set bitmap [Widget::getoption $path -bitmap]] != ""} {
eval [list label $path.label -bitmap $bitmap] $opts
}
if {[Widget::getoption $path -separator]} {
eval [list Separator::create $path.sep -orient $orient] $opts
}

Widget::getVariable $path data
set data(nbut)     0
set data(realized) 0

bind $path <Return> [list Dialog::ok $path]
bind $path <Escape> [list Dialog::cancel $path]

return [Widget::create Dialog $path]
}


proc Dialog::configure { path args } {
set res [Widget::configure $path $args]

if { [Widget::hasChanged $path -title title] } {
wm title $path $title
}
if { [Widget::hasChanged $path -background bg] } {
if { [winfo exists $path.label] } {
$path.label configure -background $bg
}
if { [winfo exists $path.sep] } {
Separator::configure $path.sep -background $bg
}
}
return $res
}


proc Dialog::cget { path option } {
return [Widget::cget $path $option]
}


proc Dialog::getframe { path } {
return $path.frame
}


proc Dialog::add { path args } {
Widget::getVariable $path data

set idx $data(nbut)
set cmd [list ButtonBox::add $path.bbox  -command [list Dialog::enddialog $path $idx]]
set res [eval $cmd -value $idx $args]
incr data(nbut)
return $res
}


proc Dialog::itemconfigure { path index args } {
return [eval [list ButtonBox::itemconfigure $path.bbox $index] $args]
}


proc Dialog::itemcget { path index option } {
return [ButtonBox::itemcget $path.bbox $index $option]
}


proc Dialog::invoke { path index } {
ButtonBox::invoke $path.bbox $index
}


proc Dialog::setfocus { path index } {
ButtonBox::setfocus $path.bbox $index
}


proc Dialog::enddialog { path result {destroy 0} } {
Widget::getVariable $path data

if {$result ne -1} {
if {[ButtonBox::index $path.bbox $result] > -1} {
set result [ButtonBox::itemcget $path.bbox $result -value]
}
}

set data(result) $result

event generate $path <<DialogEnd>>

if {$destroy} {
destroy $path
}

return $result
}


proc Dialog::draw { path {focus ""} {overrideredirect 0} {geometry ""} } {
Widget::getVariable $path data

set parent [Widget::getoption $path -parent]
if {!$data(realized)} {
set data(realized) 1
if {[llength [winfo children $path.bbox]]} {
set side [Widget::getoption $path -side]
if {[string equal $side "left"] || [string equal $side "right"]} {
set pad  -padx
set fill y
} else {
set pad  -pady
set fill x
}

pack $path.bbox -side $side  -anchor [Widget::getoption $path -anchor] -padx 1m -pady {5 10}

if {[winfo exists $path.sep]} {
pack $path.sep -side $side -fill $fill $pad 2m
}
}

if {[winfo exists $path.label]} {
pack $path.label -side left -anchor n -padx {10 5} -pady 3m
}

pack $path.frame -padx 1m -pady 1m -fill both -expand yes
}

if {![string length $geometry]} {
set geometry [Widget::getoption $path -geometry]
}

set width    0
set height   0
set place    [Widget::getoption $path -place]
set usePlace [expr ![string equal $place "none"]]
if {[string length $geometry]} {
set split [split $geometry x+-]

if {[llength $split] > 2} {
set usePlace 0
} else {
BWidget::lassign $split width height
}
}

wm geometry $path $geometry

if {$usePlace} {
set relative [Widget::getoption $path -placerelative]
if {$relative && [winfo exists $parent]} {
BWidget::place $path $width $height $place $parent
} else {
BWidget::place $path $width $height $place
}
}

update idletasks
wm overrideredirect $path $overrideredirect
wm deiconify $path

if {![winfo exists $parent] ||  ([wm state [winfo toplevel $parent]] != "withdrawn")} {
tkwait visibility $path
}

BWidget::focus set $path
if {[winfo exists $focus]} {
focus -force $focus
} else {
ButtonBox::setfocus $path.bbox default
}

if {[set grab [Widget::cget $path -modal]] != "none"} {
BWidget::grab $grab $path
set res [Dialog::wait $path]
withdraw $path
return $res
}

return
}


proc Dialog::wait { path } {
Widget::getVariable $path data

if {[info exists data(result)]} { unset data($result) }

tkwait variable [Widget::widgetVar $path data(result)]
if {[info exists data(result)]} {
set res $data(result)
unset data(result)
} else {
set res -1
}

return $res
}


proc Dialog::withdraw { path } {
BWidget::grab release $path
BWidget::focus release $path
if {[winfo exists $path]} {
wm withdraw $path
}
}


proc Dialog::ok { path } {
ButtonBox::invoke $path.bbox default
}


proc Dialog::cancel { path } {
ButtonBox::invoke $path.bbox [Widget::getoption $path -cancel]
}


proc Dialog::_destroy { path } {
BWidget::grab  release $path
BWidget::focus release $path
Widget::destroy $path
}


namespace eval ScrolledWindow {
Widget::define ScrolledWindow scrollw

Widget::tkinclude ScrolledWindow frame :cmd  remove { -class -colormap -visual }

Widget::declare ScrolledWindow {
{-class       String     "ScrolledWindow" 1}
{-scrollbar   Enum	 both 0 {none both vertical horizontal}}
{-auto	      Enum	 both 0 {none both vertical horizontal}}
{-sides	      Enum	 se   0 {ne en nw wn se es sw ws}}
{-size	      Int	 0    1 "%d >= 0"}
{-ipad	      Int	 1    1 "%d >= 0"}
{-managed     Boolean	 1    1}
}

bind ScrolledWindow <Map>     [list ScrolledWindow::_realize %W]
bind ScrolledWindow <Destroy> [list ScrolledWindow::_destroy %W]
}


proc ScrolledWindow::create { path args } {
Widget::initArgs ScrolledWindow $args maps

array set _args $args
set class ScrolledWindow
if {[info exists _args(-class)]} { set class $_args(-class) }

eval [list frame $path -class $class] $maps(:cmd)

Widget::initFromODB ScrolledWindow $path $args

Widget::getVariable $path data

if {![string equal $class "ScrolledWindow"]} {
set top [winfo toplevel $path]
bindtags $path [list $path $class ScrolledWindow $top all]
}

set bg [$path cget -background]

set useTtk 0
if {[BWidget::using ttk] && ![BWidget::using aqua]} {
set useTtk 1
ttk::scrollbar $path.vscroll
ttk::scrollbar $path.hscroll -orient horizontal
} else {
scrollbar $path.hscroll  -highlightthickness 0 -takefocus 0  -orient	 horiz	 -relief	 sunken	 -bg	 $bg
scrollbar $path.vscroll  -highlightthickness 0 -takefocus 0  -orient	 vert	 -relief	 sunken	 -bg	 $bg
}

set data(vmin)     -1
set data(vmax)     -1
set data(hmin)     -1
set data(hmax)     -1

set data(afterId)  ""
set data(realized) 0

_setData $path  [Widget::cget $path -scrollbar]  [Widget::cget $path -auto]  [Widget::cget $path -sides]

if {[Widget::cget $path -managed]} {
set data(hsb,packed) $data(hsb,present)
set data(vsb,packed) $data(vsb,present)
} else {
set data(hsb,packed) 0
set data(vsb,packed) 0
}

if {!$useTtk} {
set sbsize [Widget::cget $path -size]

if {$sbsize} {
$path.vscroll configure -width $sbsize
$path.hscroll configure -width $sbsize
}
}

set data(ipad) [Widget::cget $path -ipad]

if {$data(hsb,packed)} {
grid $path.hscroll -column 1 -row $data(hsb,row)  -sticky ew -ipady $data(ipad)
}
if {$data(vsb,packed)} {
grid $path.vscroll -column $data(vsb,column) -row 1  -sticky ns -ipadx $data(ipad)
}

grid columnconfigure $path 1 -weight 1
grid rowconfigure	 $path 1 -weight 1

return [Widget::create ScrolledWindow $path]
}


proc ScrolledWindow::getframe { path } {
return $path
}


proc ScrolledWindow::setwidget { path widget } {
Widget::getVariable $path data

if {[info exists data(widget)] && [winfo exists $data(widget)]
&& ![string equal $data(widget) $widget]} {
grid remove $data(widget)
$data(widget) configure -xscrollcommand "" -yscrollcommand ""
}

set data(widget) $widget
grid $widget -in $path -row 1 -column 1 -sticky news

$path.hscroll configure -command [list $widget xview]
$path.vscroll configure -command [list $widget yview]
$widget configure  -xscrollcommand [list ScrolledWindow::_set_hscroll $path]  -yscrollcommand [list ScrolledWindow::_set_vscroll $path]
}


proc ScrolledWindow::getwidget { path } {
Widget::getVariable $path data
if {[info exists data(widget)]} { return $data(widget) }
}


proc ScrolledWindow::configure { path args } {
Widget::getVariable $path data

set res [Widget::configure $path $args]

if {[Widget::hasChanged $path -background bg]} {
catch { $path.hscroll configure -background $bg }
catch { $path.vscroll configure -background $bg }
}

if {[Widget::hasChanged $path -scrollbar scrollbar]
|| [Widget::hasChanged $path -auto  auto]
|| [Widget::hasChanged $path -sides sides]} {
_setData $path $scrollbar $auto $sides

BWidget::lassign [$path.hscroll get] vmin vmax
set data(hsb,packed) [expr {$data(hsb,present) &&  (!$data(hsb,auto) || ($vmin != 0 || $vmax != 1))}]

BWidget::lassign [$path.vscroll get] vmin vmax
set data(vsb,packed) [expr {$data(vsb,present) &&  (!$data(vsb,auto) || ($vmin != 0 || $vmax != 1))}]

set data(ipad) [Widget::cget $path -ipad]

if {$data(hsb,packed)} {
grid $path.hscroll -column 1 -row $data(hsb,row)  -sticky ew -ipady $data(ipad)
}
if {$data(vsb,packed)} {
grid $path.vscroll -column $data(vsb,column) -row 1  -sticky ns -ipadx $data(ipad)
}
}
return $res
}


proc ScrolledWindow::cget { path option } {
return [Widget::cget $path $option]
}


proc ScrolledWindow::_set_hscroll { path vmin vmax } {
Widget::getVariable $path data

$path.hscroll set $vmin $vmax

set data(hmin) $vmin
set data(hmax) $vmax

_redraw_after $path
}


proc ScrolledWindow::_set_vscroll { path vmin vmax } {
Widget::getVariable $path data

$path.vscroll set $vmin $vmax

set data(vmin) $vmin
set data(vmax) $vmax

_redraw_after $path
}


proc ScrolledWindow::_setData {path scrollbar auto sides} {
Widget::getVariable $path data

set sb    [lsearch -exact {none horizontal vertical both} $scrollbar]
set auto  [lsearch -exact {none horizontal vertical both} $auto]

set data(hsb,present)  [expr {($sb & 1) != 0}]
set data(hsb,auto)	   [expr {($auto & 1) != 0}]
set data(hsb,row)	   [expr {[string match *n* $sides] ? 0 : 2}]

set data(vsb,present)  [expr {($sb & 2) != 0}]
set data(vsb,auto)	   [expr {($auto & 2) != 0}]
set data(vsb,column)   [expr {[string match *w* $sides] ? 0 : 2}]
}


proc ScrolledWindow::_redraw_after { path } {
Widget::getVariable $path data
after cancel $data(afterId)
set data(afterId) [after 5 [list ScrolledWindow::_redraw $path]]
}


proc ScrolledWindow::_redraw { path } {
if {![Widget::exists $path]} { return }

Widget::getVariable $path data

if {!$data(realized)} { return }

if {$data(hsb,present) && $data(hsb,auto)} {
if {$data(hsb,packed) && $data(hmin) == 0 && $data(hmax) == 1} {
set data(hsb,packed) 0
grid remove $path.hscroll
} elseif {!$data(hsb,packed) && ($data(hmin)!=0 || $data(hmax)!=1)} {
set data(hsb,packed) 1
grid $path.hscroll -column 1 -row $data(hsb,row)  -sticky ew -ipady $data(ipad)
}
}

if {$data(vsb,present) && $data(vsb,auto)} {
if {$data(vsb,packed) && $data(vmin) == 0 && $data(vmax) == 1} {
set data(vsb,packed) 0
grid remove $path.vscroll
} elseif {!$data(vsb,packed) && ($data(vmin)!=0 || $data(vmax)!=1) } {
set data(vsb,packed) 1
grid $path.vscroll -column $data(vsb,column) -row 1  -sticky ns -ipadx $data(ipad)
}
}
}


proc ScrolledWindow::_realize { path } {
Widget::getVariable $path data
set data(realized) 1
}


proc ScrolledWindow::_destroy { path } {
Widget::getVariable $path data
after cancel $data(afterId)
Widget::destroy $path
}


if {0} {

IconLibrary icons

icons load -find 1 -directory $kdedir -extension png -findgroups  [list {actions act} {apps app} {devices dev}
{filesystems file} {mimetypes mime}]
}


package require Tcl 8.4

namespace eval IconLibrary {
Widget::define IconLibrary icons

Widget::declare IconLibrary {
{-file          String    "tkIcons"                 0}
{-icons         String    ""                        0}
{-sizes         String    ""                        0}
{-groups        String    ""                        0}
{-create        Boolean   0                         0}
{-directory     String    ""                        0}

{-find          Boolean   0                         0}
{-extension     String    "gif"                     0}
{-findsizes     String    "16 22"                   0}
{-findgroups    String    "act app dev file mime"   0}
}

namespace eval Icon {
Widget::declare IconLibrary::Icon {
{-size      String    ""                        1}
{-type      String    ""                        1}
{-file      String    ""                        1}
{-data      String    ""                        1}
{-image     String    ""                        1}
{-imageargs String    ""                        1}
{-filegroup String    ""                        1}
{-workgroup String    ""                        1}
}
}

namespace eval NamesArgs {
Widget::declare IconLibrary::NamesArgs {
{-icons         String    ""                        0}
{-sizes         String    ""                        0}
{-groups        String    ""                        0}
}
}

variable  sizeMap
array set sizeMap {
16x16   16
22x22   22
32x32   32
48x48   48
64x64   64
128x128 128
}

variable  groupMapArray
array set groupMapArray {
apps            app
actions         act
devices         dev
mimetypes       mime
filesystems     file
}

variable groupMap

foreach name [array names groupMapArray] {
lappend groupMap [list $name $groupMapArray($name)]
}
}


proc IconLibrary::create { library args } {
Widget::init IconLibrary $library $args

Widget::getVariable $library data

set data(icons) [list]

if {[llength $args]} { eval [list IconLibrary::load $library] $args }

return [Widget::create IconLibrary $library 0]
}


proc IconLibrary::load { library args } {
Widget::getVariable $library data

Widget::init IconLibrary $library $args

set file      [Widget::getoption $library -file]
set create    [Widget::getoption $library -create]
set iconlist  [Widget::getoption $library -icons]
set sizelist  [Widget::getoption $library -sizes]
set grouplist [Widget::getoption $library -groups]
set directory [Widget::getoption $library -directory]

set filename $file
if {![string length $directory]} {
set directory [file dirname $file]
} elseif {[string length $file]} {
set filename [file join $directory $file]
}

if {[Widget::getoption $library -find]} {
if {![string length $directory]} {
return -code error "cannot find images without -directory"
}

set ext        [Widget::getoption $library -extension]
set findsizes  [Widget::getoption $library -findsizes]
set findgroups [Widget::getoption $library -findgroups]

foreach size $findsizes {
set size  [IconLibrary::_get_size $size]

set sizedir [file join $directory $size]
if {![file exists $sizedir]} { continue }

foreach group $findgroups {
set filegroup [lindex $group 0]
set workgroup [lindex $group 1]
if {[llength $group] == 1} { set workgroup $filegroup }

set groupdir [file join $sizedir $filegroup]
if {![file exists $groupdir]} { continue }

foreach imagefile [glob -nocomplain -dir $groupdir *.$ext] {
set image [file root [file tail $imagefile]]
set image $workgroup$image$size
lappend data(icons) $image

set icon $library#$image
set exists [expr {[Widget::exists $icon]
&& [string length [Widget::getoption $icon -image]]}]

Widget::init IconLibrary::Icon $icon  [list -size $size -type file -file $imagefile  -filegroup $filegroup -workgroup $workgroup  -data "" -image ""]

if {$exists && !$create} {
IconLibrary::image $library $image
}
}
}
}

if {![file exists $filename]} {
if {$create} { _create_icons $library $data(icons) }
set data(icons) [lsort -unique $data(icons)]
return $data(icons)
}
}

if {![file isfile $filename] || ![file readable $filename]} {
return -code error "couldn't open \"$filename\": no such file"
}

set iLen [llength $iconlist]
set sLen [llength $sizelist]
set gLen [llength $grouplist]

set fp [open $filename]

while {[gets $fp line] != -1} {
if {[string equal [string index $line 0] "#"]} { continue }

set list [split $line :]
if {[llength $list] < 5} { continue }

BWidget::lassign $list image workgroup filegroup size type imagedata
set size [IconLibrary::_get_size_int $size]

if {($gLen && [lsearch -exact $grouplist $workgroup] < 0)
|| ($sLen && [lsearch -exact $sizelist $size] < 0)
|| ($iLen && [lsearch -exact $iconlist $image] < 0)} { continue }

set file ""
if {[string equal $type "file"]} {
if {![string length $imagedata]} { continue }

if {[string is integer $size]} { set size ${size}x${size} }
set file [file join $directory $size $filegroup $imagedata]
set images($image,file) $file
}

lappend data(icons) $image

set icon $library#$image
set exists [expr {[Widget::exists $icon]
&& [string length [Widget::getoption $icon -image]]}]

Widget::init IconLibrary::Icon $icon  [list -size $size -type $type -file $file -data $imagedata  -filegroup $filegroup -workgroup $workgroup -image ""]

if {$exists && !$create} {
IconLibrary::image $library $image
}
}

close $fp

if {$create} { _create_icons $library $icons }

set data(icons) [lsort -unique $data(icons)]
}


proc IconLibrary::cget { library option } {
return [Widget::cget $library $option]
}


proc IconLibrary::configure { library args } {
return [Widget::configure $library $args]
}


proc IconLibrary::itemcget { library image option } {
if {![IconLibrary::exists $library $image]} {
return -code error "no such icon '$image'"
}

set path    $library#$image
set image   [Widget::getoption $path -image]
set created [string length $image]
if {$created && ($option eq "-file" || $option eq "-data")} {
return [$image cget $option]
}
return [Widget::cget $path $option]
}


proc IconLibrary::itemconfigure { library image args } {
if {![IconLibrary::exists $library $image]} {
return -code error "no such icon '$image'"
}

set path    $library#$image
set image   [Widget::getoption $path -image]
set created [string length $image]

if {![llength $args]} {
set return [list]
foreach list [Widget::configure $path $args] {
set option [lindex $list 0]
if {$created && ($option eq "-file" || $option eq "-data")} {
lappend return [$image configure $option]
} else {
lappend return $list
}
}
return $return
} elseif {[llength $args] == 1} {
set option [lindex $args 0]
if {$created && ($option eq "-file" || $option eq "-data")} {
return [$image configure $option]
} else {
return [Widget::configure $path $option]
}
}

set imageOpts  [list]
set widgetOpts [list]
foreach [list option value] $args {
if {$created && ($option eq "-file" || $option eq "-data")} {
lappend imageOpts $option $value
} else {
lappend widgetOpts $option $value
}
}

if {[llength $imageOpts]} {
eval [list $image configure] $imageOpts
}

if {[llength $widgetOpts]} {
Widget::configure $path $widgetOpts
}
}


proc IconLibrary::exists { library image } {
return [Widget::exists $library#$image]
}


proc IconLibrary::icons { library {pattern ""} } {
Widget::getVariable $library data
if {![string length $pattern]} { return $data(icons) }
return [lsearch -glob -all -inline $data(icons) $pattern]
}


proc IconLibrary::add { library image args } {
Widget::getVariable $library data

if {[IconLibrary::exists $library $image]} {
return -code error "icon \"$image\" already exists"
}

array set _args $args

set create 0
if {[info exists _args(-create)]} {
if {$_args(-create)} { set create 1 }
unset _args(-create)
}

Widget::init IconLibrary::Icon $library#$image [array get _args]
lappend data(icons) $image

if {$create} { IconLibrary::image $library $image }

return $image
}


proc IconLibrary::image { library image } {
Widget::getVariable $library images

if {![IconLibrary::exists $library $image]} {
return -code error "no such icon '$image'"
}

set path $library#$image

if {[string equal [Widget::getoption $path -type] "icon"]} {
set icon  $image
set image [Widget::getoption $path -data]
set path  $library#$image
if {![IconLibrary::exists $library $image]} {
return -code error "no such icon '$image' while loading '$icon'"
}
}

if {![string length [Widget::getoption $path -image]]} {
set img ::Icons::${library}::$image

set data [Widget::getoption $path -data]
set file [Widget::getoption $path -file]
set args [Widget::getoption $path -imageargs]

if {[string length $data]} {
lappend args -data $data
} elseif {[string length $file]} {
lappend args -file $file
}

eval [list ::image create photo $img] $args

Widget::setoption $path -image $img -file "" -data ""
}

return [Widget::getoption $path -image]
}


proc IconLibrary::delete { library args } {
Widget::getVariable $library data

set images [list]
foreach icon $args {
set image [Widget::getoption $library#$icon -image]
if {[string length $image]} { lappend images $image }
Widget::destroy $library#$icon 0
}

if {[llength $images]} { eval ::image delete $images }

set data(icons) [eval [list BWidget::lremove $data(icons)] $args]

return
}


proc IconLibrary::clear { library } {
Widget::getVariable $library data
eval [list IconLibrary::delete $library] $data(icons)
}


proc IconLibrary::destroy { library } {
IconLibrary::clear $library
Widget::destroy $library
}


proc IconLibrary::_get_size { size } {
if {[string is integer -strict $size]} { return ${size}x${size} }
return $size
}


proc IconLibrary::_get_size_int { size } {
variable sizeMap
if {[info exists sizeMap($size)]} { return $sizeMap($size) }
if {[scan $size "%dx%d" w h] == 2 && $w == $h} { return $w }
return $size
}


proc IconLibrary::_create_icons { library icons } {
foreach icon $icons {
IconLibrary::image $library $icon
}
}

namespace eval ChooseDirectory {
Widget::define ChooseDirectory choosedir Dialog ScrolledWindow  Tree IconLibrary

Widget::bwinclude ChooseDirectory Dialog :cmd

Widget::declare ChooseDirectory {
{-name       String   ""        1}
{-message    String   "Please choose a directory, then select OK." 0}
{-folders    String   ""        0}
{-initialdir String   ""        0}
}

bind ChooseDirectory <Destroy> [list ChooseDirectory::_destroy %W]
}


proc ChooseDirectory::create { path args } {
variable dialogs

BWidget::LoadBWidgetIconLibrary

set dialog $path#choosedir

array set maps [Widget::splitArgs $args Dialog ChooseDirectory]

Widget::initFromODB ChooseDirectory $dialog $maps(ChooseDirectory)

Widget::getVariable $dialog nodes
set nodes(count) 0

eval [list Dialog::create $path -class ChooseDirectory  -anchor e -default 1 -cancel 2 -modal local -spacing 5 -homogeneous 0  -title "Browse for Folder" -geometry 340x300] $maps(:cmd) $maps(Dialog)
wm protocol $path WM_DELETE_WINDOW [list $path cancel]

set frame [Dialog::getframe $path]

grid rowconfigure    $frame 3 -weight 1
grid columnconfigure $frame 0 -weight 1

Label $frame.message -anchor w -autowrap 1 -justify left  -text [Widget::getoption $dialog -message]
grid  $frame.message -row 0 -column 0 -sticky new -pady 5

Label $frame.dirlabel -anchor w -elide 1 -elideside center  -textvariable [Widget::widgetVar $path root]
grid  $frame.dirlabel -row 1 -column 0 -sticky new -pady 5

if {[BWidget::using ttk]} {
ttk::entry $frame.e -textvariable [Widget::widgetVar $path tail]
} else {
entry $frame.e -textvariable [Widget::widgetVar $path tail]
}
grid  $frame.e -row 2 -column 0 -sticky ew -pady 2 -padx 1
bind $frame.e <Key> [list ChooseDirectory::_update_ok_button $path]

ScrolledWindow $frame.sw
grid $frame.sw -row 3 -column 0 -sticky news

set tree $frame.tree
Tree $tree -width 35  -opencmd  [list ChooseDirectory::_open_directory $path $tree]  -closecmd [list ChooseDirectory::_close_directory $path $tree]

$frame.sw setwidget $tree

bind $tree <<TreeSelect>>  [list ChooseDirectory::_selection_change $path $tree]

Dialog::add $path -text " Make New Folder " -spacing 20  -command [list ChooseDirectory::_create_directory $path $tree]
Dialog::add $path -name ok     -width 12
Dialog::add $path -name cancel -width 12

set folders [Widget::getoption $dialog -folders]
if {![llength $folders]} {
set desktop   [file normalize [file join ~ Desktop]]
set documents [file normalize [file join ~ Documents]]
if {[info exists ::env(HOME)]} {
set desktopText Desktop

if {$::tcl_platform(platform) eq "windows"} {
set documentsText "My Documents"
} else {
set documentsText "Documents"
}

set desktop   [file join $::env(HOME) $desktopText]
set documents [file join $::env(HOME) $documentsText]

if {$::tcl_platform(platform) ne "windows"} {
lappend folders [list [file normalize ~] "Home"]
}
}

if {[file exists $desktop]} {
lappend folders [list [file normalize $desktop] $desktopText]
}

if {[file exists $documents]} {
lappend folders [list [file normalize $documents] $documentsText]
}

if {$::tcl_platform(platform) eq "windows"} {
foreach volume [file volumes] {
set volume [string toupper $volume]
if {[string match "?:/" $volume]} {
lappend folders [list $volume $volume]
}
}
} else {
lappend folders [list / /]
}
}

foreach list $folders {
set dir   [lindex $list 0]
set text  [lindex $list 1]
set image [lindex $list 2]

if {![string length $image]} { set image [BWidget::Icon folder16] }

set nodes(root,$dir) [incr nodes(count)]
$tree insert end root $nodes(root,$dir) -text $text -image $image  -data $dir -drawcross allways
}

set dir [Widget::getoption $dialog -initialdir]
if {![string length $dir]} { set dir [pwd] }
set dir [file normalize $dir]

set name [Widget::getoption $dialog -name]
if {[info exists dialogs($name)]} { set dir $dialogs($name) }

set dirpath [list]
foreach sub [file split $dir] {
if {![llength $dirpath]} {
set node $nodes(root,$sub)
set rootNode $node

lappend dirpath $sub
$tree itemconfigure $node -open 1
} else {
set parent $node
lappend dirpath $sub
set subpath [eval file join $dirpath]

if {![info exists nodes($rootNode,$subpath)]} {
set nodes($rootNode,$subpath) [incr nodes(count)]
$tree insert end $parent $nodes($rootNode,$subpath) -open 1  -image [BWidget::Icon folder16] -text $sub -data $subpath
}
set node $nodes($rootNode,$subpath)
}

ChooseDirectory::_open_directory $path $tree $node
}

_select_directory $path $tree $node

$frame.e selection range 0 end

set result [Dialog::draw $path $frame.e]

Widget::getVariable $path root
Widget::getVariable $path tail
set dirroot $root
set dirtail $tail

destroy $path

if {$result == 2} { return }

if {$dirtail ne [file tail $dirroot]} {
set dirroot [file join $dirroot $dirtail]
}

if {[string length $name]} { set dialogs($name) $dirroot }

return $dirroot
}


proc ChooseDirectory::_select_directory { path tree node } {
Widget::getVariable $path root
Widget::getVariable $path tail

$tree see $node
$tree selection set $node

set dir  [$tree itemcget $node -data]
set root $dir
set tail [file tail $dir]
}


proc ChooseDirectory::_selection_change { path tree } {
Widget::getVariable $path root
Widget::getVariable $path tail

set node [$tree selection get]

set dir  [$tree itemcget $node -data]
set root $dir
set tail [file tail $dir]
}


proc ChooseDirectory::_open_directory { path tree node } {
Widget::getVariable $path#choosedir nodes

set parent   [$tree parent $node]
set rootNode $node
while {$parent ne "root"} {
set rootNode $parent
set parent   [$tree parent $parent]
}

set sort -ascii
if {$::tcl_platform(platform) eq "windows"} { set sort -dict }

set rootdir [$tree itemcget $node -data]

set dirs [glob -nocomplain -type d -dir $rootdir *]
eval lappend dirs [glob -nocomplain -type {d hidden} -dir $rootdir *]

set found 0
foreach dir [lsort $sort $dirs] {
set tail [file tail $dir]
if {$tail eq "." || $tail eq ".."} { continue }

set found 1
if {![info exists nodes($rootNode,$dir)]} {
set nodes($rootNode,$dir) [incr nodes(count)]
$tree insert end $node $nodes($rootNode,$dir)  -drawcross allways -image [BWidget::Icon folder16]  -text [file tail $dir] -data $dir
}
}

set opts [list -open 1 -image [BWidget::Icon folderopen16]]

if {!$found} { lappend opts -drawcross never }
eval [list $tree itemconfigure $node] $opts
}


proc ChooseDirectory::_close_directory { path tree node } {
$tree itemconfigure $node -image [BWidget::Icon folder16]
}


proc ChooseDirectory::_next_directory { root text } {
set i 1
set dir [file join $root $text]
while {[file exists $dir]} {
set dir [file join $root "$text ([incr i])"]
}
return $dir
}


proc ChooseDirectory::_create_directory { path tree } {
Widget::getVariable $path root
Widget::getVariable $path#choosedir nodes

set sel [lindex [$tree selection get] 0]
$tree itemconfigure $sel -open 1

set text [_next_directory $root "New Folder"]
set i [$tree insert end $sel new#auto -text [file tail $text]  -image [BWidget::Icon folder16]]

$tree edit $i [file tail $text]  [list ChooseDirectory::_verify_directory $path $tree $i] 1

set dir [file join $root [$tree itemcget $i -text]]

set parent   [$tree parent $sel]
set rootNode $sel
while {$parent ne "root"} {
set rootNode $parent
set parent   [$tree parent $parent]
}

set nodes($rootNode,$dir) [incr nodes(count)]
set node $nodes($rootNode,$dir)

$tree delete $i
$tree insert end $sel $node -text [file tail $dir] -data $dir  -image [BWidget::Icon folder16]

_select_directory $path $tree $node

file mkdir $dir
}


proc ChooseDirectory::_verify_directory { path tree node newtext } {
Widget::getVariable $path root

set txt [$tree itemcget $node -text]
if {![string length $newtext]} { set newtext $txt }

set dir [file join $root $newtext]

if {[file exists $dir]} {
set title  "Error Renaming File or Folder"
set    msg "Cannot rename $txt: A file with the name you specified "
append msg "already exists. Specify a different file name."
tk_messageBox -parent $path -icon error -title $title -message $msg
return 0
}

if {[regexp {[/\\:\*\?\"<>|]} $newtext]} {
set title  "Error Renaming File or Folder"
set msg "A directory name cannot contain any of the following characters:\n\t\\ / : * ? \" < > |"
tk_messageBox -parent $path -icon error -title $title -message $msg
return 0
}

$tree itemconfigure $node -text $newtext
return 1
}


proc ChooseDirectory::_update_ok_button { path {really 0} } {
if {[Widget::exists $path]} {
if {!$really} {
after idle [concat [info level 0] 1]
} else {
Widget::getVariable $path root
Widget::getVariable $path tail
set len [llength [file split $root]]
if {[string trim $tail] eq "" && $len > 1} {
ButtonBox::itemconfigure $path.bbox 1 -state disabled
} else {
ButtonBox::itemconfigure $path.bbox 1 -state normal
}
}
}
}


proc ChooseDirectory::_destroy { path } {
Widget::destroy $path#choosedir
Widget::destroy $path
}


namespace eval ChooseFile {
if {[BWidget::using ttk]} {
Widget::define ChooseFile choosefile Dialog ScrolledWindow  ListBox IconLibrary
} else {
Widget::define ChooseFile choosefile Dialog ScrolledWindow  ComboBox ListBox IconLibrary
}

Widget::bwinclude ChooseFile Dialog :cmd

Widget::declare ChooseFile {
{-name             String   ""         1}
{-type             Enum     "open"     0 {open save}}
{-folders          String   ""         0}
{-restrictdir      Boolean  0          0}
{-defaultextension String   ""         0}
{-filetypes        String   ""         0}
{-initialdir       String   ""         0}
{-initialfile      String   ""         0}
{-multiple         Boolean  0          0}
{-message          String   ""         0}
{-title            String   ""         0}
}

bind ChooseFile <Map>     [list ChooseFile::_map %W]
bind ChooseFile <Destroy> [list ChooseFile::_destroy %W]
}


proc ChooseFile::create { path args } {
variable dialogs

BWidget::LoadBWidgetIconLibrary

set dialog $path#choosefile

array set maps [Widget::splitArgs $args Dialog ChooseFile]

Widget::initFromODB ChooseFile $dialog $maps(ChooseFile)

Widget::getVariable $dialog data

set data(histidx)  0
set data(history)  [list]
set data(realized) 0

set n [expr {20 / [set x [font measure TkTextFont " "]]}]
if {$x * $n < 20} { incr n }
set data(comboSpaces) $n
set data(listboxPadx) [expr {$n * $x}]

set type [Widget::getoption $dialog -type]

array set _args $args
if {![info exists _args(-title)]} {
if {$type eq "open"} {
set title "Open"
} elseif {$type eq "save"} {
set title "Save As"
}
} else {
set title $_args(-title)
}

Widget::setoption $dialog -title $title

eval [list Dialog::create $path -class ChooseFile -geometry 400x250  -modal local -title $title] $maps(:cmd) $maps(Dialog)
wm minsize  $path 400 250
wm protocol $path WM_DELETE_WINDOW [list ChooseFile::enddialog $path 0]
bind $path <Escape> [list ChooseFile::enddialog $path 0]

set frame [Dialog::getframe $path]

grid rowconfigure    $frame 2 -weight 1
grid columnconfigure $frame 1 -weight 1

set pady 2
set message [Widget::getoption $dialog -message]

if {[string length $message]} {
set pady 0
Label $frame.message -anchor w -autowrap 1 -justify left -text $message
grid  $frame.message -row 0 -column 1 -sticky new -pady {0 5}
}

set f [frame $frame.top -height 26]
grid $f -row 1 -column 1 -sticky ew -padx 5 -pady $pady

label $f.l -text "Look in:"
pack  $f.l -side left

set data(FolderCombo) $f.cb

if {[BWidget::using ttk]} {
set comboBoxCmd   ttk::combobox
set comboBoxEvent <<ComboboxSelected>>
set opts [list -style Toolbutton]
set bwidth ""

$comboBoxCmd $data(FolderCombo) -state readonly  -textvariable [Widget::widgetVar $dialog data(dirtail)]

set popdown ::tile::combobox::PopdownShell
if {![string length [info commands $popdown]]} {
set popdown ::ttk::combobox::PopdownShell
}
set shell [$popdown $data(FolderCombo)]
set listbox $shell.l
destroy $listbox $shell.sb

bind $shell <Unmap> [list after idle [list focus $frame.listbox]]

ScrolledWindow $shell.sw
grid $shell.sw -row 0 -column 0 -sticky news

ListBox $listbox -borderwidth 2 -relief flat -deltay 18  -highlightthickness 0 -selectmode single -selectfill 1  -yscrollcommand [list $shell.sb set] -padx $data(listboxPadx)
$shell.sw setwidget $listbox

$listbox bindText  <1>  [list ChooseFile::_select_folder $path $data(FolderCombo)]
$listbox bindImage <1>  [list ChooseFile::_select_folder $path $data(FolderCombo)]

$listbox bindText  <Enter> [list $listbox selection set]
$listbox bindImage <Enter> [list $listbox selection set]

set data(FolderListBox) $listbox
} else {
set comboBoxCmd   ComboBox
set comboBoxEvent <<ComboBoxSelected>>
set opts [list -relief link]
set bwidth 12

$comboBoxCmd $data(FolderCombo) -editable 0 -usebwlistbox 1  -hottrack 1 -textvariable [Widget::widgetVar $dialog data(dirtail)]

set data(FolderListBox) [$data(FolderCombo) getlistbox]
$data(FolderListBox) configure -deltay 18 -padx $data(listboxPadx)

bind $data(FolderCombo) <<ComboBoxSelected>>  [list ChooseFile::_select_folder $path $data(FolderCombo)]
}
pack $data(FolderCombo) -side left -padx 5 -expand 1 -fill both

set data(FolderIconLabel) [label $path.icon -bg white]

ButtonBox $f.bbox -spacing 1
pack $f.bbox -side left

eval [list $f.bbox add -image [BWidget::Icon actback16]  -command [list ChooseFile::_back $path]  -helptext "Go To Last Folder Visited"] $opts

eval [list $f.bbox add -image [BWidget::Icon actup16]  -command [list ChooseFile::_up $path]  -helptext "Up One Level"] $opts

eval [list $f.bbox add -image [BWidget::Icon foldernew16]  -command [list ChooseFile::_create_directory $path]  -helptext "Create New Folder"] $opts

if 0 {
menu $path.viewPopup -tearoff 0
$path.viewPopup add radiobutton -label "List"
$path.viewPopup add radiobutton -label "Details"

if {[BWidget::using ttk]} {
ttk::menubutton $f.view -menu $path.viewPopup
} else {
menubutton $f.view -menu $path.viewPopup
}
$f.view configure -image [BWidget::Icon viewmulticolumn16]
pack $f.view -side left
} ; # if 0

ScrolledWindow $frame.sw
grid $frame.sw -row 2 -column 1 -sticky news -padx 5 -pady {2 5}

set selectmode single
if {[Widget::getoption $dialog -type] eq "open"
&& [Widget::getoption $dialog -multiple]} { set selectmode multiple }

ListBox $frame.listbox -deltay 18 -multicolumn 1 -selectmode $selectmode
$frame.sw setwidget $frame.listbox

bind $frame.listbox <<ListboxSelect>>  [list ChooseFile::_update_selection $path]

$frame.listbox bindText  <Double-1> [list ChooseFile::_double_click $path]
$frame.listbox bindImage <Double-1> [list ChooseFile::_double_click $path]

set f [frame $frame.bottom]
grid $f -row 3 -column 1 -sticky ew -padx 5

grid columnconfigure $f 1 -weight 1

label $f.fileNameL -text "File name:"
grid  $f.fileNameL -row 0 -column 0 -pady 2

set data(FileEntry) $f.fileNameCB

if {[BWidget::using ttk]} {
ttk::entry $data(FileEntry)  -textvariable [Widget::widgetVar $dialog data(filetail)]
} else {
entry $data(FileEntry)  -textvariable [Widget::widgetVar $dialog data(filetail)]
}
grid $data(FileEntry) -row 0 -column 1 -padx 20 -pady 2 -sticky ew

bind $data(FileEntry) <Return> [list ChooseFile::enddialog $path 1]

focus $data(FileEntry)

Button $f.ok -text [string totitle $type] -width $bwidth  -command [list ChooseFile::enddialog $path 1]
grid $f.ok -row 0 -column 2 -pady 2 -sticky ew

label $f.fileTypeL -text "Files of type:"
grid  $f.fileTypeL -row 1 -column 0 -pady 2

$comboBoxCmd $f.fileTypeCB -state readonly  -textvariable [Widget::widgetVar $dialog data(filetype)]
grid $f.fileTypeCB -row 1 -column 1 -pady 2 -padx 20 -sticky ew

bind $f.fileTypeCB $comboBoxEvent [list ChooseFile::_select_filetype $path]

Button $f.cancel -text "Cancel" -width $bwidth  -command [list ChooseFile::enddialog $path 0]
grid $f.cancel -row 1 -column 2 -pady 2 -sticky ew

set name       [Widget::getoption $dialog -name]
set initialdir [Widget::getoption $dialog -initialdir]

if {![string length $initialdir]} {
if {[info exists dialogs($name)]} {
set initialdir [lindex $dialogs($name) 0]
} else {
set initialdir [pwd]
}
}

set initialfile [Widget::getoption $dialog -initialfile]
if {![string length $initialfile]} {
if {[info exists dialogs($name)]} {
set initialfile [lindex $dialogs($name) 1]
}
}

if {[string length $initialfile]} {
set initialdir [file dirname $initialfile]
}

Widget::setoption $dialog -initialdir  [file normalize $initialdir]
Widget::setoption $dialog -initialfile [file normalize $initialfile]

set filetypes [Widget::getoption $dialog -filetypes]
if {![llength $filetypes]} {
set filetypes {{"All Files" *}}
}

foreach typelist $filetypes {
set txt [lindex $typelist 0]
foreach ext [lindex $typelist 1] {
if {[string index $ext 0] ne "."} { set ext .$ext }
set ext [file extension $ext]
if {![info exists exts($txt)]} { lappend exts(list) $txt }
lappend exts($txt) *$ext
}
}

set first   1
set default [Widget::getoption $dialog -defaultextension]
foreach txt $exts(list) {
set text "$txt ([join [lsort $exts($txt)] ,])"
lappend values $text

foreach ext $exts($txt) {
set ext [file extension $ext]
lappend data(filetype,$text) [string tolower $ext]
if {$::tcl_platform(platform) ne "windows" && $ext ne ".*"} {
lappend data(filetype,$text) [string toupper $ext]
}
}

if {![info exists data(filetype)]} {
if {[string length $default]} {
foreach ext $exts($txt) {
if {$ext eq "*$default"} {
set data(filetype) $text
}
}
} else {
if {$first} {
set first 0
set data(filetype) $text
}
}
}
}
$f.fileTypeCB configure -values $values

set result [Dialog::draw $path]

set file ""
if {$result} { set file $data(file) }

destroy $path

return $file
}


proc ChooseFile::enddialog { path result } {
set dialog $path#choosefile
Widget::getVariable $dialog data

if {$result} {
if {![info exists data(filetail)]} { return }

set type [Widget::getoption $dialog -type]
if {$type eq "save"} {
set file [file join $data(directory) $data(filetail)]

set ext [Widget::getoption $dialog -defaultextension]
if {![string length [file extension $file]]} {
set filetype [lindex $data(filetype,$data(filetype)) 0]
if {$filetype ne ".*"} {
set ext [string range $filetype 1 end]
}
append file .$ext
}

if {[file exists $file]} {
set title   [Widget::getoption $dialog -title]
set message "$file already exists.\nDo you want to replace it?"
set res [MessageDlg $path.__replaceFile -type yesno  -icon warning -title $title -message $message]
if {$res eq "no"} {
focus $data(FileEntry)
return
}
}

set data(file) $file
} elseif {$type eq "open"} {
if {![string match {"*"} $data(filetail)]} {
set file [file join $data(directory) $data(filetail)]

if {![file exists $file]} {
set tail    [file tail $file]
set title   [Widget::getoption $dialog -title]
set message "$tail\nFile not found.\nPlease verify the correct file name was given."
set res [MessageDlg $path.__replaceFile -type ok  -icon warning -title $title -message $message]
focus $data(FileEntry)
return
}

set data(file) $file
} else {
foreach tail $data(filetail) {
set file [file join $data(directory) $tail]

if {![file exists $file]} {
set title   [Widget::getoption $dialog -title]
set message "$tail\nFile not found.\nPlease verify the correct file name was given."
set res [MessageDlg $path.__replaceFile -type ok  -icon warning -title $title -message $message]
focus $data(FileEntry)
return
}

lappend files $file
}

set data(file) $files
}
}
}

set [Widget::widgetVar $path data(result)] $result
}


proc ChooseFile::getlistbox { path } {
return [Dialog::getframe $path].listbox
}


proc ChooseFile::_update_folders { path } {
set dialog $path#choosefile

Widget::getVariable $dialog data

$data(FolderListBox) clear

set folders  [Widget::getoption $dialog -folders]
set restrict [Widget::getoption $dialog -restrictdir]
if {!$restrict && ![llength $folders]} {
set desktop     [file normalize [file join ~ Desktop]]
set myDocuments [file normalize [file join ~ Documents]]
if {[info exists ::env(HOME)]} {
set desktopText Desktop

if {$::tcl_platform(platform) eq "windows"} {
set myDocumentsText "My Documents"
} else {
set myDocumentsText "Documents"
}

set desktop     [file join $::env(HOME) $desktopText]
set myDocuments [file join $::env(HOME) $myDocumentsText]
}

if {$::tcl_platform(platform) ne "windows" && [file exists ~]} {
lappend folders [list [file normalize ~] "Home"]
}

if {[file exists $desktop]} {
lappend folders [list $desktop "Desktop"]
}

if {[file exists $myDocuments]} {
lappend folders [list $myDocuments $myDocumentsText]
}

foreach volume [file volumes] {
if {![string match "*vfs" [lindex [file system $volume] 0]]} {
lappend folders [list $volume $volume]
}
}
}

if {!$restrict} {
set i 0
foreach list $folders {
set dir   [file normalize [lindex $list 0]]
set text  [lindex $list 1]
set image [lindex $list 2]

if {![string length $image]} { set image [BWidget::Icon folder16] }

$data(FolderListBox) insert end #auto -text $text  -data $dir -image $image
lappend values $text

set folderdirs($dir) $i
incr i
}
}

set i       0
set idx     end
set dirlist [list]
foreach x [file split $data(directory)] {
lappend dirlist $x
if {[info exists folderdirs($x)]} {
set idx $folderdirs($x)
} else {
set dir [file normalize [eval file join $dirlist]]
$data(FolderListBox) insert $idx #auto -text $x  -data $dir -indent [expr {$i * 20}]  -image [BWidget::Icon folder16]
lappend values $x
}

incr i

if {[string is integer $idx]} { incr idx }
}

if {[BWidget::using ttk]} {
$data(FolderCombo) configure -values $values
}
}


proc ChooseFile::_update_selection { path {item ""} } {
Widget::getVariable $path#choosefile data

set listbox [ChooseFile::getlistbox $path]
if {[string length $item]} {
set sel [list $item]
$listbox selection set $item
} else {
set sel [$listbox selection get]
}

set files [list]
foreach item $sel {
if {![$listbox exists $item]} { continue }

set file [$listbox itemcget $item -data]

if {[file isfile $file]} {
if {[llength $sel] == 1} {
set files [file tail $file]
} else {
lappend files \"[file tail $file]\"
}
}
}

set data(filetail) [join $files " "]
}


proc ChooseFile::_double_click { path item } {
Widget::getVariable $path#choosefile data

set listbox [ChooseFile::getlistbox $path]

set file [$listbox itemcget $item -data]

if {[file isfile $file]} {
set data(file)     [file normalize $file]
set data(filetail) [file tail $data(file)]
ChooseFile::enddialog $path 1
} else {
ChooseFile::_select_directory $path $file
}
}


proc ChooseFile::_select_directory { path directory {appendHistory 1} } {
set dialog $path#choosefile

Widget::getVariable $dialog data

set directory  [file normalize $directory]
set initialdir [Widget::getoption $dialog -initialdir]

[Dialog::getframe $path].top.bbox.b1 configure -state normal
if {[Widget::getoption $dialog -restrictdir]} {
if {$directory eq $initialdir} {
[Dialog::getframe $path].top.bbox.b1 configure -state disabled
}

if {![string match $initialdir* $directory]} {
set directory $initialdir
}
}

if {[file dirname $directory] eq $directory} {
[Dialog::getframe $path].top.bbox.b1 configure -state disabled
}

set data(directory) $directory
set data(dirtail)   [file tail $data(directory)]
if {![string length $data(dirtail)]} { set data(dirtail) $directory }

if {$appendHistory} {
lappend data(history) $data(directory)
set data(histidx) [expr {[llength $data(history)] - 1}]
}

if {$data(histidx) == 0} {
[Dialog::getframe $path].top.bbox.b0 configure -state disabled
} else {
[Dialog::getframe $path].top.bbox.b0 configure -state normal
}

set n $data(comboSpaces)
set data(dirtail) [string repeat " " $n]$data(dirtail)
if {![BWidget::using ttk]} {
$data(FolderCombo).e selection clear
}

ChooseFile::_update_folders $path

place forget $data(FolderIconLabel)
foreach item [$data(FolderListBox) items] {
if {$directory eq [$data(FolderListBox) itemcget $item -data]} {
$data(FolderIconLabel) configure  -image [$data(FolderListBox) itemcget $item -image]
set y [expr {[winfo height $data(FolderCombo)] / 2}]
place $data(FolderIconLabel) -x 4 -y $y -anchor w  -in $data(FolderCombo)
break
}
}

set listbox [ChooseFile::getlistbox $path]

$listbox clear

set sort -ascii
if {$::tcl_platform(platform) eq "windows"} { set sort -dict }

set dirs [glob -nocomplain -dir $directory -type d *]
eval lappend dirs [glob -nocomplain -dir $directory -type {d hidden} *]

foreach dir [lsort $sort $dirs] {
set tail [file tail $dir]
if {$tail eq "." || $tail eq ".."} { continue }
$listbox insert end #auto -text [file tail $dir] -data $dir  -image [BWidget::Icon folder16]
}

set windows [expr {$::tcl_platform(platform) eq "windows"}]
set files [list]

if {$data(filetype,$data(filetype)) eq ".*"} {
set patt *
} else {
set patt "*\{[join $data(filetype,$data(filetype)) ,]\}"
}

eval lappend files [glob -nocomplain -dir $directory -type f $patt]
eval lappend files [glob -nocomplain -dir $directory -type {f hidden} $patt]

set initialfile [Widget::getoption $dialog -initialfile]
foreach file [lsort $sort $files] {
set tail [file tail $file]
if {$windows && [file extension $tail] eq ".lnk"} {
set tail [file root $tail]
}
set i [$listbox insert end #auto -text $tail  -data $file -image [BWidget::Icon mimeunknown16]]
if {!$data(realized) && $file eq $initialfile} {
$listbox selection set $i
}
}
}


proc ChooseFile::_select_folder { path combo {item ""} } {
Widget::getVariable $path#choosefile data

set listbox $data(FolderListBox)
if {![string length $item]} { set item [$listbox selection get] }
ChooseFile::_select_directory $path [$listbox itemcget $item -data]

if {[BWidget::using ttk]} {
set unpost ::tile::combobox::Unpost
if {![string length [info commands $unpost]]} {
set unpost ::ttk::combobox::Unpost
}
$unpost $data(FolderCombo)
}

focus [ChooseFile::getlistbox $path]
}


proc ChooseFile::_select_filetype { path } {
Widget::getVariable $path#choosefile data
ChooseFile::_select_directory $path $data(directory)
}


proc ChooseFile::_back { path } {
Widget::getVariable $path#choosefile data
incr data(histidx) -1
ChooseFile::_select_directory $path [lindex $data(history) $data(histidx)] 0
}


proc ChooseFile::_up { path } {
Widget::getVariable $path#choosefile data
ChooseFile::_select_directory $path [file dirname $data(directory)]
}


proc ChooseFile::_next_directory { root text } {
set i 1
set dir [file join $root $text]
while {[file exists $dir]} {
set dir [file join $root "$text ([incr i])"]
}
return $dir
}


proc ChooseFile::_create_directory { path } {
Widget::getVariable $path#choosefile data

set listbox [ChooseFile::getlistbox $path]

set i    [$listbox insert end #auto -image [BWidget::Icon folder16]]
set text [_next_directory $data(directory) "New Folder"]

while {1} {
set result [$listbox edit $i [file tail $text]  [list ChooseFile::_verify_directory $path $listbox $i]]

if {![string length $result]} {
set dir $text
break
}

set txt [$listbox itemcget $i -text]
set dir [file join $data(directory) [$listbox itemcget $i -text]]

if {[file exists $dir]} {
set title  "Error Renaming File or Folder"
set    msg "Cannot rename [file tail $text]: A file with the name "
append msg "you specified already exists. Specify a different "
append msg "file name."
MessageDlg $path.__error -type ok -icon error  -title $title -message $msg
continue
}

break
}

ChooseFile::_update_selection $path $i

file mkdir $dir
}


proc ChooseFile::_verify_directory { path listbox node newtext } {
$listbox itemconfigure $node -text $newtext
return 1
}


proc ChooseFile::_map { path } {
Widget::getVariable $path#choosefile data

update idletasks
ChooseFile::_select_directory $path  [Widget::getoption $path#choosefile -initialdir]

set data(realized) 1
}


proc ChooseFile::_destroy { path } {
Widget::destroy $path#choosefile
Widget::destroy $path
}


namespace eval MessageDlg {
Widget::define MessageDlg messagedlg Dialog

if {[BWidget::using ttk]} {
Widget::tkinclude MessageDlg ttk::label .frame.msg  rename {
-text -message
} initialize {
-anchor w -justify left
}
} else {
Widget::tkinclude MessageDlg label .frame.msg  remove {
-cursor -highlightthickness -relief -borderwidth -bd
-takefocus -textvariable
} rename {
-text -message
} initialize {
-anchor w -justify left
}
}

Widget::bwinclude MessageDlg Dialog :cmd  remove {
-modal -image -bitmap -side -anchor -separator
-homogeneous -padx -pady -spacing
}

Widget::declare MessageDlg {
{-name       String     ""     0}
{-icon       Enum       "info" 0 {none error info question warning}}
{-type       Enum       "user" 0
{abortretryignore ok okcancel retrycancel yesno yesnocancel user}}
{-buttons     String    ""     0}
{-buttonwidth String    0      0}
{-usenative   Boolean   1      0}
}

Widget::addmap MessageDlg "" tkMBox {
-parent {} -message {} -default {} -title {}
}
}


proc MessageDlg::create { path args } {
variable dialogs

array set _args $args

if {[info exists _args(-name)] && [info exists dialogs($_args(-name))]} {
return $dialogs($_args(-name))
}

BWidget::LoadBWidgetIconLibrary

set dialog "$path#Message"

Widget::initArgs MessageDlg $args maps
Widget::initFromODB MessageDlg $dialog $maps(MessageDlg)

set type   [Widget::getoption $dialog -type]
set icon   [Widget::getoption $dialog -icon]
set width  [Widget::getoption $dialog -buttonwidth]
set native [Widget::getoption $dialog -usenative]

set user  0
set defb  -1
set canb  -1
switch -- $type {
abortretryignore {set lbut {abort retry ignore}; set defb 0}
ok               {set lbut {ok}; set defb 0 }
okcancel         {set lbut {ok cancel}; set defb 0; set canb 1}
retrycancel      {set lbut {retry cancel}; set defb 0; set canb 1}
yesno            {set lbut {yes no}; set defb 0; set canb 1}
yesnocancel      {set lbut {yes no cancel}; set defb 0; set canb 2}
user             {
set user   1
set native 0
set lbut [Widget::cget $dialog -buttons]
}
}

array set dialogArgs $maps(:cmd)

if {!$user && ![info exists dialogArgs(-default)]} {
lappend maps(:cmd)   -default [lindex $lbut $defb]
lappend maps(tkMBox) -default [lindex $lbut $defb]
}

if {![info exists dialogArgs(-cancel)]} {
lappend maps(:cmd) -cancel $canb
}

if {![info exists dialogArgs(-title)]} {
set frame [frame $path -class MessageDlg]
set title [option get $frame "${icon}Title" MessageDlg]
destroy $frame
if {![string length $title]} {
set title "Message"
}
lappend maps(:cmd) -title $title
lappend maps(tkMBox) -title $title
}

set name [Widget::getoption $dialog -name]
if {[string length $name]} { set native 0 }

if {!$native} {
if {!$user && !$width} { set width 12 }

set image ""
if {![string equal $icon "none"]} {
set image [BWidget::Icon dialog$icon]
}

eval [list Dialog::create $path] $maps(:cmd)  [list -image $image -modal local -side bottom -anchor c]
wm resizable $path 0 0

bind $path <Key-Left>  [list MessageDlg::_key_traversal $path left]
bind $path <Key-Right> [list MessageDlg::_key_traversal $path right]

foreach but $lbut {
Dialog::add $path -text $but -name $but -width $width
}

set frame [Dialog::getframe $path]

if {[BWidget::using ttk]} {
eval [list ttk::label $frame.msg] $maps(.frame.msg) -wraplength 800
} else {
eval [list label $frame.msg] $maps(.frame.msg)  -relief flat -bd 0 -highlightthickness 0 -wraplength 800
}

pack $frame.msg -fill both -expand 1 -padx {5 10} -pady {5 0}

if {[string length $name]} {
set msg "Don't ask me again"
set varName [Widget::widgetVar $dialog dontAskAgain]
if {[BWidget::using ttk]} {
ttk::checkbutton $path.check -text $msg -variable $varName
} else {
checkbutton $path.check -text $msg -variable $varName
}

pack $path.check -anchor w -side bottom -pady {0 2}

bind $path.bbox <Map> [list pack configure $path.bbox -pady 5]
}

set res [Dialog::draw $path]
if {!$user} { set res [lindex $lbut $res] }

destroy $path
} else {
array set tkMBoxArgs $maps(tkMBox)

if {![string equal $icon "none"]} {
set tkMBoxArgs(-icon) $icon
}

if {[info exists tkMBoxArgs(-parent)]
&& ![winfo exists $tkMBoxArgs(-parent)]} {
unset tkMBoxArgs(-parent)
}

set tkMBoxArgs(-type) $type
set res [eval tk_messageBox [array get tkMBoxArgs]]
}

if {[string length $name]} {
upvar #0 $varName var
if {$var} { set dialogs($name) $res }
}

Widget::destroy $dialog

return $res
}


proc MessageDlg::_key_traversal { path dir } {
set but [focus -lastfor $path]
if {$but eq $path} {
set def [ButtonBox::index $path.bbox default]
set but [ButtonBox::index $path.bbox $def]
ButtonBox::configure $path.bbox -default -1
}

set idx [ButtonBox::index $path.bbox $but]
set max [ButtonBox::index $path.bbox end]

if {$dir eq "left"} { incr idx -1 }
if {$dir eq "right"} { incr idx 1 }

if {$idx < 0} { set idx $max }
if {$idx > $max} { set idx 0 }

focus [ButtonBox::buttons $path.bbox $idx]
}


namespace eval Text {
Widget::define Text text

Widget::tkinclude Text text :cmd  remove { -state -foreground -background }

Widget::declare Text {
{-state               Enum    "normal" 0 {disabled normal readonly}}
{-textvariable        String  "" 0}
{-background          Color   "SystemWindow" 0}
{-foreground          Color   "SystemWindowText" 0}
{-disabledbackground  Color   "SystemButtonFace" 0}
{-disabledforeground  Color   "SystemDisabledText" 0}
}
}


proc Text::create { path args } {
Widget::initArgs Text $args maps

eval [list text $path] $maps(:cmd)
Widget::initFromODB Text $path $maps(Text)

bind $path <Destroy> [list Text::_destroy $path]

Widget::getVariable $path data

set data(varName) ""

set state [Widget::getoption $path -state]

if {$state eq "disabled" || $state eq "readonly"} {
$path configure -insertwidth 0
}

if {$state eq "disabled"} {
$path configure  -foreground [Widget::getoption $path -disabledforeground]  -background [Widget::getoption $path -disabledbackground]
}

Widget::create Text $path

Text::_trace_variable $path

proc ::$path { cmd args }  "return \[Text::_path_command [list $path] \$cmd \$args\]"

return $path
}


proc Text::configure { path args } {
set oldstate [Widget::getoption $path -state]

set res [Widget::configure $path $args]

if {[Widget::anyChangedX $path -state -background -foreground]} {
set state [Widget::getoption $path -state]

if {$state ne "normal"} {
$path:cmd configure -insertwidth 0
} else {
$path:cmd configure -insertwidth 2
}

if {$state eq "disabled"} {
$path:cmd configure  -foreground [Widget::getoption $path -disabledforeground]  -background [Widget::getoption $path -disabledbackground]
} else {
$path:cmd configure  -foreground [Widget::cget $path -foreground]  -background [Widget::cget $path -background]
}
}

if {[Widget::hasChanged $path -textvariable textvar]} {
Text::_trace_variable $path
}

return $res
}


proc Text::cget { path option } {
if { [string equal "-text" $option] } {
return [$path:cmd get]
}
Widget::cget $path $option
}


proc Text::clear { path } {
$path:cmd delete 1.0 end
}


proc Text::insert { path args } {
if {[Widget::getoption $path -state] eq "normal"} {
eval [list $path:cmd insert] $args
Text::_trace_variable $path 1
}
}


proc Text::delete { path args } {
if {[Widget::getoption $path -state] eq "normal"} {
eval [list $path:cmd delete] $args
Text::_trace_variable $path 1
}
}


proc Text::Insert { path args } {
eval [list $path:cmd insert] $args
}


proc Text::Delete { path args } {
eval [list $path:cmd delete] $args
}


proc Text::_path_command { path cmd larg } {
if {[info commands ::Text::$cmd] ne ""} {
return [eval [linsert $larg 0 Text::$cmd $path]]
} else {
return [eval [linsert $larg 0 $path:cmd $cmd]]
}
}


proc Text::_trace_variable { path {doSet 0} } {
Widget::getVariable $path data

set varName [Widget::getoption $path -textvariable]

if {$data(varName) eq "" && $varName eq ""} { return }

set ops [list unset write]
set cmd [list Text::_handle_variable_trace $path]

uplevel #0 [list trace remove variable $data(varName) $ops $cmd]

set data(varName) $varName

if {$varName ne ""} {
upvar #0 $varName var

if {$doSet} {
set var [$path:cmd get 1.0 end-1c]
} else {
if {![info exists var]} { set var "" }

$path:cmd delete 1.0 end
$path:cmd insert end $var
}

uplevel #0 [list trace add variable $varName $ops $cmd]
}
}


proc Text::_handle_variable_trace { path name1 name2 op } {
if {$name2 ne ""} {
upvar #0 ${name1}($name2) var
} else {
upvar #0 $name1 var
}

if {$op eq "write"} {
$path:cmd delete 1.0 end
$path:cmd insert end $var
} else {
set var [$path:cmd get 1.0 end-1c]
}
}


proc Text::_destroy { path } {
Widget::getVariable $path data

set ops [list unset write]
set cmd [list Text::_handle_variable_trace $path]

uplevel #0 [list trace remove variable $data(varName) $ops $cmd]

Widget::destroy $path
}


namespace eval Wizard {
Widget::define Wizard wizard ButtonBox Separator

namespace eval Step {
Widget::declare Wizard::Step {
{-background      Color2     ""       0  }
{-type            String     "step"   1  }
{-data            String     ""       0  }
{-title           String     ""       0  }
{-default         String     "next"   0  }

{-text1           String     ""       0  }
{-text2           String     ""       0  }
{-text3           String     ""       0  }
{-text4           String     ""       0  }
{-text5           String     ""       0  }

{-icon            String     ""       0  }
{-image           String     ""       0  }

{-bitmap          String     ""       0  }
{-iconbitmap      String     ""       0  }

{-createstep      Boolean2    ""      1  }
{-appendorder     Boolean    "1"      0  }

{-nexttext        String     ""       0  }
{-backtext        String     ""       0  }
{-helptext        String     ""       0  }
{-canceltext      String     ""       0  }
{-finishtext      String     ""       0  }
{-separatortext   String     ""       0  }

{-separator       Boolean2   ""       0  }

{-command         String     ""       0  }

{-createcommand   String     ""       0  }
{-raisecommand    String     ""       0  }
{-nextcommand     String     ""       0  }
{-backcommand     String     ""       0  }
{-helpcommand     String     ""       0  }
{-cancelcommand   String     ""       0  }
{-finishcommand   String     ""       0  }

{-compoundraise   Boolean    "1"      0  }
{-compoundcreate  Boolean    "1"      0  }

{-bg              Synonym    -background }
}
}

namespace eval Branch {
Widget::declare Wizard::Branch {
{-type            String     "branch" 1  }
{-command         String     ""       0  }
{-action          Enum       "merge"  0  {merge terminate} }
}
}

namespace eval Widget {
Widget::declare Wizard::Widget {
{-type            String     "widget" 1  }
{-step            String     ""       1  }
{-widget          String     ""       1  }
}
}

namespace eval layout {}

Widget::tkinclude Wizard frame :cmd  include    { -background -foreground -cursor }

Widget::declare Wizard {
{-type            Enum       "dialog" 1 {dialog frame} }
{-width           TkResource "0"      0 frame}
{-height          TkResource "0"      0 frame}
{-minwidth        Int        "475"    0 "%d >= 0"}
{-minheight       Int        "350"    0 "%d >= 0"}
{-relief          TkResource "flat"   0 frame}
{-borderwidth     TkResource "0"      0 frame}
{-background      Color      "SystemButtonFace" 0}
{-foreground      String     "black"  0      }
{-title           String     "Wizard" 0      }
{-createstep      Boolean    "0"      0      }

{-autobuttons     Boolean    "1"      0      }
{-helpbutton      Boolean    "0"      1      }
{-finishbutton    Boolean    "0"      1      }
{-resizable       String     "0 0"    0      }
{-separator       Boolean    "1"      1      }
{-parent          String     "."      1      }
{-transient       Boolean    "1"      1      }
{-place           Enum       "center" 1
{none center left right above below} }

{-icon            String     ""       0      }
{-image           String     ""       0      }

{-bitmap          String     ""       0      }
{-iconbitmap      String     ""       0      }

{-raisecommand    String     ""       0      }
{-createcommand   String     ""       0      }

{-buttonwidth     Int        "12"     0      }
{-nexttext        String     "Next >" 0      }
{-backtext        String     "< Back" 0      }
{-helptext        String     "Help"   0      }
{-canceltext      String     "Cancel" 0      }
{-finishtext      String     "Finish" 0      }
{-separatortext   String     ""       0      }

{-fg              Synonym    -foreground     }
{-bg              Synonym    -background     }
{-bd              Synonym    -borderwidth    }
}

image create photo Wizard::none

Widget::addmap Wizard "" :cmd { -background {} -relief {} -borderwidth {} }

bind Wizard <Destroy> [list Wizard::_destroy %W]
}


proc Wizard::create { path args } {
Widget::initArgs Wizard $args maps

Widget::initFromODB Wizard $path $maps(Wizard)

Widget::getVariable $path data
Widget::getVariable $path branches

array set data {
steps   ""
buttons ""
order   ""
current ""
}

array set branches {
root    ""
}

set frame $path

set type [Widget::getoption $path -type]

if {[string equal $type "dialog"]} {
set top $path
eval [list toplevel $path -bg $::BWidget::colors(SystemButtonFace)]  $maps(:cmd) -class Wizard
wm withdraw   $path
update idletasks
wm protocol   $path WM_DELETE_WINDOW [list $path cancel 1]
if {[Widget::getoption $path -transient]} {
wm transient  $path [Widget::getoption $path -parent]
}
eval wm resizable $path [Widget::getoption $path -resizable]

set minwidth  [Widget::getoption $path -minwidth]
set minheight [Widget::getoption $path -minheight]
wm minsize $path $minwidth $minheight

set width  [Widget::cget $path -width]
set height [Widget::cget $path -height]
if {$width > 0 && $height > 0} {
wm geometry $top ${width}x${height}
}

bind $path <Escape>         [list $path cancel]
bind $path <<WizardFinish>> [list destroy $path]
bind $path <<WizardCancel>> [list destroy $path]
} else {
set top [winfo toplevel $path]
eval [list frame $path] $maps(:cmd) -class Wizard
}

wm title $top [Widget::getoption $path -title]

grid rowconfigure    $top 0 -weight 1
grid columnconfigure $top 0 -weight 1

frame $path.steps
grid  $path.steps -row 0 -column 0 -sticky news

grid rowconfigure    $path.steps 0 -weight 1
grid columnconfigure $path.steps 0 -weight 1

widget $path set steps -widget $path.steps

if {[Widget::getoption $path -separator]} {
frame $path.separator
grid  $path.separator -row 1 -column 0 -sticky ew -pady [list 5 0]

grid columnconfigure $path.separator 1 -weight 1

set text [Widget::getoption $path -separatortext]

if {[BWidget::using ttk]} {
ttk::label $path.separator.l -state disabled -text $text
} else {
label $path.separator.l -bd 0 -pady 0 -state disabled -text $text
}

grid  $path.separator.l -row 0 -column 0 -sticky w -padx 2

Separator $path.separator.s -orient horizontal
grid $path.separator.s -row 0 -column 1 -sticky ew  -padx [list 0 5] -pady 4

widget $path set separator      -widget $path.separator.s
widget $path set separatortext  -widget $path.separator.l
widget $path set separatorframe -widget $path.separator
}

ButtonBox $path.buttons -spacing 2 -homogeneous 1
grid $path.buttons -row 2 -column 0 -sticky e -padx 5 -pady {10 5}

widget $path set buttons -widget $path.buttons

Wizard::insert $path button end back -text "< Back"  -command [list $path back 1]  -width [Widget::getoption $path -buttonwidth]
Wizard::insert $path button end next -text "Next >"  -command [list $path next 1]
if {[Widget::getoption $path -finishbutton]} {
Wizard::insert $path button end finish -text "Finish"  -command [list $path finish 1]
}
Wizard::insert $path button end cancel -text "Cancel"  -command [list $path cancel 1] -spacing 10

if {[Widget::getoption $path -helpbutton]} {
Wizard::insert $path button 0 help -text "Help"  -command [list $path help 1] -spacing 10
}

return [Widget::create Wizard $path]
}


proc Wizard::configure { path args } {
set res [Widget::configure $path $args]

if {[Widget::hasChanged $path -title title]} {
wm title [winfo toplevel $path] $title
}

if {[Widget::hasChanged $path -resizable resize]} {
eval wm resizable [winfo toplevel $path] $resize
}

if {[Widget::getoption $path -separator]
&& [Widget::hasChanged $path -separatortext text]} {
set text [Wizard::getoption $path [Wizard::raise $path] -separatortext]
Wizard::itemconfigure $path separatortext -text $text
}


if {[Widget::anyChangedX $path -width -height -minwidth -minheight]} {
set type    [Widget::getoption $path -type]
set width   [Widget::cget $path -width]
set height  [Widget::cget $path -height]
set mwidth  [Widget::getoption $path -minwidth]
set mheight [Widget::getoption $path -minheight]

if {[string equal $type "dialog"]} {
wm minsize $path $mwidth $mheight

if {$width > 0 && $height > 0} {
wm geometry $top ${width}x${height}
}

} else {
$path:cmd configure -width $width -height $height
}
}

return $res
}


proc Wizard::cget { path option } {
return [Widget::cget $path $option]
}


proc Wizard::itemcget { path item option } {
Widget::getVariable $path items
Widget::getVariable $path steps
Widget::getVariable $path buttons
Widget::getVariable $path widgets

if {[Wizard::_is_step $path $item]} {
return [Widget::cget $items($item) $option]
}

if {[Wizard::_is_branch $path $item]} {
return [Widget::cget $items($item) $option]
}

if {[Wizard::_is_button $path $item]} {
return [$path.buttons itemcget $items($item) $option]
}

if {[Wizard::_is_widget $path $item]} {
return [eval [$path widget get $item] cget $option]
}

return -code error "item \"$item\" does not exist"
}


proc Wizard::itemconfigure { path item args } {
Widget::getVariable $path items
Widget::getVariable $path steps
Widget::getVariable $path buttons

if {[Wizard::_is_step $path $item]} {
set res [Widget::configure $items($item) $args]

if {$item eq [Wizard::step $path current]} {
if {[Widget::hasChanged $items($item) -title title]} {
set title [Wizard::getoption $path $item -title]
wm title [winfo toplevel $path] $title
}

if {[Widget::getoption $path -separator]
&& [Widget::hasChanged $items($item) -separator separator]} {
if {[Wizard::getoption $path $item -separator]} {
grid $path.separator.s
} else {
grid remove $path.separator.s
}
}

if {[Widget::getoption $path -separator]
&& [Widget::hasChanged $items($item) -separatortext text]} {
set text [Wizard::getoption $path $item -separatortext]
Wizard::itemconfigure $path separatortext -text $text
}

set x [list -nexttext -backtext -canceltext -helptext -finishtext]
if {[eval [list Widget::anyChangedX $path] $x]} {
Wizard::adjustbuttons $path
}
}

return $res
}

if {[Wizard::_is_branch $path $item]} {
return [Widget::configure $items($item) $args]
}

if {[Wizard::_is_button $path $item]} {
return [eval $path.buttons itemconfigure [list $items($item)] $args]
}

if {[Wizard::_is_widget $path $item]} {
return [eval [Wizard::widget $path get $item] configure $args]
}

return -code error "item \"$item\" does not exist"
}


proc Wizard::show { path } {
wm deiconify [winfo toplevel $path]
}


proc Wizard::hide { path } {
wm withdraw [winfo toplevel $path]
}


proc Wizard::invoke { path button } {
Widget::getVariable $path buttons
if {![info exists buttons($button)]} {
return -code error "button \"$button\" does not exist"
}
[Wizard::widget $path get $button] invoke
}


proc Wizard::insert { path type idx args } {
switch -- $type {
"button" {
set node [lindex $args 0]
set node [Widget::nextIndex $path $node]
set args [lreplace $args 0 0 $node]
}

"step" - "branch" {
set node   [lindex $args 1]
set branch [lindex $args 0]
set node   [Widget::nextIndex $path $node]
set args   [lreplace $args 1 1 $node]

if {![Wizard::_is_branch $path $branch]} {
return -code error "branch \"$branch\" does not exist"
}
}

default {
set types [list button branch step]
set err [BWidget::badOptionString option $type $types]
return -code error $err
}
}

if {[Wizard::exists $path $node]} {
return -code error "item \"$node\" already exists"
}

eval _insert_$type $path $idx $args

return $node
}


proc Wizard::delete { path args } {
Widget::getVariable $path data
Widget::getVariable $path items
Widget::getVariable $path steps
Widget::getVariable $path buttons
Widget::getVariable $path widgets
Widget::getVariable $path branches

set step [Wizard::step $path current]
foreach item $args {
set item [Wizard::step $path $item]
if {![string length $item]} { continue }

if {[Wizard::_is_step $path $item]} {

set branch [Wizard::branch $path $item]
set x [lsearch -exact $branches($branch) $item]
set branches($branch) [lreplace $branches($branch) $x $x]

destroy $widgets($item)

Widget::destroy $items($item) 0

unset steps($item)
unset data($item,branch)
unset items($item)
unset widgets($item)

if {[info exists data($item,realized)]} {
unset data($item,realized)
}

if {$item eq $step} { set data(current) "" }
}

if {[Wizard::_is_branch $path $item]} {

set branch [Wizard::branch $path $item]
set x [lsearch -exact $branches($branch) $item]
set branches($branch) [lreplace $branches($branch) $x $x]

Widget::destroy $items($item) 0

unset branches($item)
unset data($item,branch)
unset items($item)
}

if {[info exists buttons($item)]} {

set x [$path.buttons index $widgets($item)]
$path.buttons delete $x

unset items($item)
unset buttons($item)
unset widgets($item)
}
}
}


proc Wizard::back { path {generateEvent 0} {executeCommand 1} } {
Widget::getVariable $path data
Widget::getVariable $path items

set step [Wizard::raise $path]

if {$executeCommand && [string length $step]} {
set cmd [Widget::getoption $items($step) -backcommand]
if {![_eval_command $path $cmd]} { return }
}

if {$step ne [Wizard::raise $path]} { return }

set idx [lsearch -exact $data(order) $step]
if {$idx < 0} {
set item [lindex $data(order) end]
} else {
set item [lindex $data(order) [expr {$idx - 1}]]
set data(order) [lreplace $data(order) $idx end]
}

Wizard::raise $path $item $generateEvent

if {$generateEvent} { event generate $path <<WizardBack>> }

return $item
}


proc Wizard::next { path {generateEvent 0} {executeCommand 1} } {
Widget::getVariable $path data
Widget::getVariable $path items

set step [Wizard::raise $path]

if {$executeCommand && [string length $step]} {
set cmd [Widget::getoption $items($step) -nextcommand]
if {![_eval_command $path $cmd]} { return }
}

if {$step ne [Wizard::raise $path]} { return }

set item [Wizard::step $path next]
if {![string length $item]} { return }

if {[Widget::getoption $items($item) -appendorder]} {
lappend data(order) $item
}

Wizard::raise $path $item $generateEvent

if {$generateEvent} { event generate $path <<WizardNext>> }

return $item
}


proc Wizard::cancel { path {generateEvent 0} {executeCommand 1} } {
Widget::getVariable $path items

set step [Wizard::raise $path]

if {$executeCommand && [string length $step]} {
set cmd [Widget::getoption $items($step) -cancelcommand]
if {![_eval_command $path $cmd]} { return }
}

if {$generateEvent} { event generate $path <<WizardCancel>> }
}


proc Wizard::finish { path {generateEvent 0} {executeCommand 1} } {
Widget::getVariable $path items

set step [Wizard::raise $path]

if {$executeCommand && [string length $step]} {
set cmd [Widget::getoption $items($step) -finishcommand]
if {![_eval_command $path $cmd]} { return }
}

if {$generateEvent} { event generate $path <<WizardFinish>> }
}


proc Wizard::help { path {generateEvent 0} {executeCommand 1} } {
Widget::getVariable $path items

set step [Wizard::raise $path]

if {$executeCommand && [string length $step]} {
set cmd [Widget::getoption $items($step) -helpcommand]
if {![_eval_command $path $cmd]} { return }
}

if {$generateEvent} { event generate $path <<WizardHelp>> }
}


proc Wizard::order { path args } {
Widget::getVariable $path data
if {[llength $args] > 1} {
set err [BWidget::wrongNumArgsString "$path order ?neworder?"]
return -code error $err
}
if {[llength $args]} { set data(order) [lindex $args 0] }
return $data(order)
}


proc Wizard::step { path node {start ""} {traverse 1} } {
Widget::getVariable $path data
Widget::getVariable $path items
Widget::getVariable $path branches

if {[string length $start] && ![info exists items($start)]} {
return -code error "item \"$start\" does not exist"
}

switch -- $node {
"current" {
set item [Wizard::raise $path]
}

"end" - "last" {
set item [Wizard::step $path next]
while {[string length $item]} {
set last $item
set item [Wizard::step $path next $item]
}
set item $last
}

"back" - "previous" {
if {![string length $start]} { set start [Wizard::raise $path] }

set idx [lsearch -exact $data(order) $start]
if {$idx < 0} {
set item [lindex $data(order) end]
} else {
incr idx -1
if {$idx < 0} { return }
set item [lindex $data(order) $idx]
}
}

"next" {
if {[string length $start]} {
set step $start
} else {
set step [Wizard::raise $path]
}

set branch [Wizard::branch $path $step]
if {$traverse && [Wizard::_is_branch $path $step]} {
if {[Wizard::traverse $path $step]} {
set branch $step
}
}

set idx [expr {[lsearch -exact $branches($branch) $step] + 1}]

if {$idx >= [llength $branches($branch)]} {
if {$branch eq "root"
|| [Widget::getoption $items($branch) -action]
eq "terminate"} {
return
}

set item [Wizard::step $path next $branch 0]
} else {
set item [lindex $branches($branch) $idx]

if {[Wizard::_is_branch $path $item]} {
if {$traverse} {
set item [Wizard::step $path next $item]
}
} else {
if {![Wizard::traverse $path $item]} {
set item [Wizard::step $path next $item]
}
}
}
}

default {
set item ""

if {[Wizard::_is_branch $path $node]} {
return [Wizard::step $path next $node]
}

if {[Wizard::_is_step $path $node]} { set item $node }
}
}

return $item
}


proc Wizard::nodes { path branch {first ""} {last ""} } {
Widget::getVariable $path data
Widget::getVariable $path branches
if {![string length $first]} { return $branches($branch) }
if {![string length $last]}  { return [lindex $branches($branch) $first] }
return [lrange $branches($branch) $first $last]
}


proc Wizard::index { path item } {
Widget::getVariable $path branches
set item   [$path step $item]
set branch [$path branch $item]
return [lsearch -exact $branches($branch) $item]
}


proc Wizard::raise { path {item ""} {generateEvent 0} } {
Widget::getVariable $path data
Widget::getVariable $path items

set steps   $path.steps
set buttons $path.buttons

if {[string equal $item ""]} { return $data(current) }

set x $item
set curr $data(current)
set item [Wizard::step $path $item]

if {![string length $item]} {
return -code error "step \"$x\" does not exist"
}

if {[string equal $item $data(current)]} { return }

Wizard::createstep $path $item

if {[Widget::getoption $items($item) -compoundraise]} {
set cmd [Widget::getoption $path -raisecommand]
Wizard::_eval_command $path $cmd $item
}

if {$data(current) ne $curr} { return $data(current) }

set cmd [Widget::getoption $items($item) -raisecommand]
Wizard::_eval_command $path $cmd $item

if {$data(current) ne $curr} { return $data(current) }

wm title [winfo toplevel $path] [Wizard::getoption $path $item -title]

if {[Wizard::getoption $path $item -separator]} {
grid $path.separator.s
set text [Wizard::getoption $path $item -separatortext]
$path itemconfigure separatortext -text $text
} else {
grid remove $path.separator.s
$path itemconfigure separatortext -text ""
}

set default [Widget::getoption $items($item) -default]
set button  [lsearch -exact $data(buttons) $default]
$buttons setfocus $button

if {[string length $data(current)]} {
grid remove $steps.f$data(current)
}

set data(current) $item

grid $steps.f$data(current) -row 0 -column 0 -sticky news

set back [Wizard::step $path back]
set next [Wizard::step $path next]

if {[Widget::getoption $path -autobuttons]} { Wizard::adjustbuttons $path }

if {$generateEvent} {
if {$back eq ""} { event generate $path <<WizardFirstStep>> }
if {$next eq ""} { event generate $path <<WizardLastStep>> }
event generate $path <<WizardStep>>
}

return $item
}


proc Wizard::adjustbuttons { path } {
Widget::getVariable $path items

set item [Wizard::step $path current]
if {[string equal $item ""]} { return }

set back [Wizard::step $path back]
set next [Wizard::step $path next]

foreach x [list back next cancel] {
set text [Wizard::getoption $path $item -${x}text]
$path itemconfigure $x -text $text -state normal
}

if {[Widget::getoption $path -helpbutton]} {
set text [Wizard::getoption $path $item -helptext]
$path itemconfigure help -text $text
}

if {[Widget::getoption $path -finishbutton]} {
set text [Wizard::getoption $path $item -finishtext]
$path itemconfigure finish -text $text -state disabled
}

if {[string equal $back ""]} {
$path itemconfigure back -state disabled
}

if {[string equal $next ""]} {
if {[Widget::getoption $path -finishbutton]} {
$path itemconfigure next   -state disabled
$path itemconfigure finish -state normal
} else {
set text [Wizard::getoption $path $item -finishtext]
$path itemconfigure next -text $text -command [list $path finish 1]
}
$path itemconfigure back   -state disabled
$path itemconfigure cancel -state disabled
} else {
set text [Wizard::getoption $path $item -nexttext]
$path itemconfigure next -text $text -command [list $path next 1]
}
}


proc Wizard::widget { path command args } {
return [eval [list Wizard::widgets $path $command] $args]
}


proc Wizard::widgets { path command args } {
Widget::getVariable $path items
Widget::getVariable $path widgets
Widget::getVariable $path stepWidgets

switch -- $command {
"set" {
set node [lindex $args 0]
if {[string equal $node ""]} {
set str "$path widget set <name> ?option ..?"
set err [BWidget::wrongNumArgsString $str]
return -code error $err
}
set args [lreplace $args 0 0]
set item $path.#widget#$node

Widget::init Wizard::Widget $item $args
set step   [Widget::getoption $item -step]
set widget [Widget::getoption $item -widget]
set items($node) $item
if {[string equal $step ""]} {
set widgets($node) $widget
} else {
set stepWidgets($step,$node) $widget
}
return $widget
}

"get" {
set widget [lindex $args 0]
if {[string equal [string index $widget 0] "-"]} {
set widget ""
} else {
set args [lreplace $args 0 0]
}

array set map  [list Wizard::Widget {}]
array set map  [Widget::parseArgs Wizard::Widget $args]
array set data $map(Wizard::Widget)

if {[info exists data(-step)]} {
set step $data(-step)

if {[string equal $widget ""]} {
set list [list]
foreach name [array names stepWidgets $step,*] {
set x [lrange [split $name ,] 1 end]
lappend list [eval join $x ,]
}
return $list
}
} else {
if {[string equal $widget ""]} {
return [array names widgets]
}

set step [$path step current]
}

if {[info exists stepWidgets($step,$widget)]} {
return $stepWidgets($step,$widget)
}

if {![info exists widgets($widget)]} {
return -code error "item \"$widget\" does not exist"
}

return $widgets($widget)
}

default {
set err [BWidget::badOptionString option $command [list get set]]
return -code error $err
}
}
}


proc Wizard::variable { path step option } {
set item [step $path $step]
if {[string equal $item ""]} {
return -code error "item \"$step\" does not exist"
}
set item $path.$item
return [Widget::varForOption $item $option]
}


proc Wizard::branch { path {node "current"} } {
Widget::getVariable $path data

if {[_is_branch $path $node]} { return $data($node,branch) }

set node [$path step $node]
if {[string equal $node ""]} { return "root" }
if {[info exists data($node,branch)]} { return $data($node,branch) }
return -code error "item \"$node\" does not exist"
}


proc Wizard::traverse { path node } {
Widget::getVariable $path items

if {$node eq "root"} { return 1 }

if {![info exists items($node)]} {
return -code error "node \"$node\" does not exist"
}

set cmd [Widget::getoption $items($node) -command]
return [_eval_command $path $cmd]
}


proc Wizard::exists { path item } {
Widget::getVariable $path items
return [info exists items($item)]
}


proc Wizard::createstep { path item {delete 0} } {
Widget::getVariable $path data
Widget::getVariable $path items

set item [Wizard::step $path $item]

if {![Wizard::_is_step $path $item]} { return }

if {$delete} {
if {[winfo exists $path.f$item]} {
destroy $path.f$item
}
if {[info exists data($item,realized)]} {
unset data($item,realized)
}
}

if {![info exists data($item,realized)]} {
set data($item,realized) 1

if {[Widget::getoption $items($item) -compoundcreate]} {
set cmd [Widget::getoption $path -createcommand]
_eval_command $path $cmd $item
}

set cmd [Widget::getoption $items($item) -createcommand]
_eval_command $path $cmd $item
}

return $item
}


proc Wizard::getoption { path item option } {
Widget::getVariable $path items
set step [Wizard::step $path $item]
if {![string length $step]} {
return -code error "item \"$item\" does not exist"
}
return [Widget::cgetOption $option "" $items($step) $path]
}


proc Wizard::reorder { path parent nodes } {
Widget::getVariable $path branches
set branches($parent) $nodes
if {[Widget::getoption $path -autobuttons]} { Wizard::adjustbuttons $path }
}


proc Wizard::_insert_button { path idx node args } {
Widget::getVariable $path data
Widget::getVariable $path items
Widget::getVariable $path buttons
Widget::getVariable $path widgets

set buttons($node) 1
set widgets($node) [eval $path.buttons insert $idx $args]
set item   [string map [list $path.buttons.b {}] $widgets($node)]
set items($node) $item
return $widgets($node)
}


proc Wizard::_insert_step { path idx branch node args } {
Widget::getVariable $path data
Widget::getVariable $path steps
Widget::getVariable $path items
Widget::getVariable $path widgets
Widget::getVariable $path branches

set steps($node) 1
set data($node,branch) $branch
if {$idx eq "end"} {
lappend branches($branch) $node
} else {
set branches($branch) [linsert $branches($branch) $idx $node]
}

Widget::init Wizard::Step $path.$node $args

set items($node) $path.$node
set bg [Wizard::getoption $path $node -background]

set widgets($node) [frame $path.steps.f$node -bg $bg]

if {[getoption $path $node -createstep]} { Wizard::createstep $path $node }

if {[Widget::getoption $path -autobuttons]} { Wizard::adjustbuttons $path }

return $widgets($node)
}


proc Wizard::_insert_branch { path idx branch node args } {
Widget::getVariable $path data
Widget::getVariable $path items
Widget::getVariable $path branches

set branches($node)    [list]
set data($node,branch) $branch
if {$idx eq "end"} {
lappend branches($branch) $node
} else {
set branches($branch) [linsert $branches($branch) $idx $node]
}

Widget::init Wizard::Branch $path.$node $args

if {[Widget::getoption $path -autobuttons]} { Wizard::adjustbuttons $path }

set items($node) $path.$node

return $items($node)
}


proc Wizard::_is_step { path node } {
Widget::getVariable $path steps
return [info exists steps($node)]
}


proc Wizard::_is_branch { path node } {
Widget::getVariable $path branches
return [info exists branches($node)]
}


proc Wizard::_is_button { path node } {
Widget::getVariable $path buttons
return [info exists buttons($node)]
}


proc Wizard::_is_widget { path node } {
Widget::getVariable $path widgets
return [info exists widgets($node)]
}


proc Wizard::_eval_command { path command {step ""} } {
if {![string length $command]} { return 1 }

if {![string length $step]} { set step [Wizard::raise $path] }

set map [list %W $path %S $step]

if {![Wizard::_is_branch $path $step]} {
if {[string match "*%B*" $command]} {
lappend map %B [Wizard::branch $path $step]
}

if {[string match "*%n*" $command]} {
lappend map %n [Wizard::step $path next $step]
}

if {[string match "*%b*" $command]} {
lappend map %b [Wizard::step $path back $step]
}
}

return [uplevel #0 [string map $map $command]]
}


proc Wizard::_destroy { path } {
Widget::getVariable $path items

foreach item [array names items] {
Widget::destroy $items($item) 0
}

Widget::destroy $path
}


proc SimpleWizard { path args } {
option add *WizLayoutSimple*Label.padX                5    interactive
option add *WizLayoutSimple*Label.anchor              nw   interactive
option add *WizLayoutSimple*Label.justify             left interactive
option add *WizLayoutSimple*Label.borderWidth         0    interactive
option add *WizLayoutSimple*Label.highlightThickness  0    interactive

set args [linsert $args 0 -createstep 1]
lappend args -createcommand [list Wizard::layout::simple %W %S]

return [eval [list Wizard $path] $args]
}


proc ClassicWizard { path args } {
option add *WizLayoutClassic*Label.padX                5    interactive
option add *WizLayoutClassic*Label.anchor              nw   interactive
option add *WizLayoutClassic*Label.justify             left interactive
option add *WizLayoutClassic*Label.borderWidth         0    interactive
option add *WizLayoutClassic*Label.highlightThickness  0    interactive

set args [linsert $args 0 -createstep 1]
lappend args -createcommand [list Wizard::layout::classic %W %S]

return [eval [list Wizard $path] $args]
}


proc Wizard::layout::simple { wizard step } {
set frame [$wizard widget get $step]

set layout [$wizard widget set layout -widget $frame.layout -step $step]

foreach w [list titleframe pretext posttext clientArea] {
set $w [$wizard widget set $w -widget $layout.$w -step $step]
}

foreach w [list title subtitle icon] {
set $w [$wizard widget set $w -widget $titleframe.$w -step $step]
}

frame $layout -class WizLayoutSimple

pack $layout -expand 1 -fill both

frame $clientArea -bd 8 -relief flat

Separator $layout.sep1 -relief groove -orient horizontal

frame $titleframe -bd 4 -relief flat -background white

label $title -background white  -textvariable [$wizard variable $step -text1]

label $subtitle -height 2 -background white -padx 15 -width 40  -textvariable [$wizard variable $step -text2]

label $icon -borderwidth 0 -background white -anchor c
set iconImage [$wizard getoption $step -icon]
if {$iconImage ne ""} { $icon configure -image $iconImage }

set labelfont [font actual [$title cget -font]]
$title configure -font [concat $labelfont -weight bold]

grid $title    -in $titleframe -row 0 -column 0 -sticky nsew
grid $subtitle -in $titleframe -row 1 -column 0 -sticky nsew
grid $icon     -in $titleframe -row 0 -column 1 -rowspan 2 -padx 8
grid columnconfigure $titleframe 0 -weight 1
grid columnconfigure $titleframe 1 -weight 0

set label label
if {[BWidget::using ttk]} { set label ttk::label }

$label $pretext  -anchor w -justify left  -textvariable [$wizard variable $step -text3]
$label $posttext -anchor w -justify left  -textvariable [$wizard variable $step -text4]

foreach widget [list title subtitle pretext posttext] {
bind [set $widget] <Configure> {
after idle {after idle {%W configure -wraplength [expr {%w -10}]}}
}
}

grid $titleframe  -row 0 -column 0 -sticky nsew -padx 0
grid $layout.sep1 -row 1 -sticky ew
grid $pretext     -row 2 -sticky nsew -padx 8 -pady 8
grid $clientArea  -row 3 -sticky nsew -padx 8 -pady 8
grid $posttext    -row 4 -sticky nsew -padx 8 -pady 8

grid columnconfigure $layout 0 -weight 1
grid rowconfigure    $layout 0 -weight 0
grid rowconfigure    $layout 1 -weight 0
grid rowconfigure    $layout 2 -weight 0
grid rowconfigure    $layout 3 -weight 1
grid rowconfigure    $layout 4 -weight 0
}

proc Wizard::layout::classic { wizard step } {
set frame [$wizard widget get $step]

set layout [$wizard widget set layout -widget $frame.layout -step $step]
foreach w [list title subtitle icon pretext posttext clientArea] {
set $w [$wizard widget set $w -widget $layout.$w -step $step]
}

frame $layout -class WizLayoutClassic

pack $layout -expand 1 -fill both

frame $clientArea -bd 8 -relief flat

Separator $layout.sep1 -relief groove -orient vertical

label $title    -textvariable [$wizard variable $step -text1]
label $subtitle -textvariable [$wizard variable $step -text2] -height 2

array set labelfont [font actual [$title cget -font]]
incr labelfont(-size) 6
set  labelfont(-weight) bold
$title configure -font [array get labelfont]

set label label
if {[BWidget::using ttk]} { set label ttk::label }

$label $pretext  -anchor w -justify left  -textvariable [$wizard variable $step -text3]
$label $posttext -anchor w -justify left  -textvariable [$wizard variable $step -text4]

foreach widget [list title subtitle pretext posttext] {
bind [set $widget] <Configure> {
after idle {after idle {%W configure -wraplength [expr {%w -10}]}}
}
}

label $icon -borderwidth 1 -relief sunken -background white  -anchor c -width 96 -image Wizard::none
set iconImage [$wizard getoption $step -icon]
if {[string length $iconImage]} { $icon configure -image $iconImage }

grid $icon       -row 0 -column 0 -sticky nsew -padx 8 -pady 8 -rowspan 5
grid $title      -row 0 -column 1 -sticky ew   -padx 8 -pady 8
grid $subtitle   -row 1 -column 1 -sticky ew   -padx 8 -pady 8
grid $pretext    -row 2 -column 1 -sticky ew   -padx 8
grid $clientArea -row 3 -column 1 -sticky nsew -padx 8
grid $posttext   -row 4 -column 1 -sticky ew   -padx 8 -pady 24

grid columnconfigure $layout 0 -weight 0
grid columnconfigure $layout 1 -weight 1

grid rowconfigure    $layout 0 -weight 0
grid rowconfigure    $layout 1 -weight 0
grid rowconfigure    $layout 2 -weight 0
grid rowconfigure    $layout 3 -weight 1
grid rowconfigure    $layout 4 -weight 0
}


ThemeInit
::InstallJammer::HideMainWindow
BWidget::use ttk 1 -force 1
}
} setup.tcl {proc ::InstallJammer::InitSetup {} {
FileGroup ::FileGroups
Component ::Components
SetupType ::SetupTypes
FileGroup ::B183954F-56CA-1FEB-17B0-63A0F9D2CA1C -setup Install -active Yes -platforms {AIX-ppc FreeBSD-4-x86 FreeBSD-x86 HPUX-hppa Linux-x86 MacOS-X Solaris-sparc Windows TarArchive ZipArchive} -name {Program Files} -parent FileGroups
Component ::CB2F63A8-BB7B-D37D-3B41-BEF87CD243A3 -setup Install -active Yes -platforms {AIX-ppc FreeBSD-4-x86 FreeBSD-x86 HPUX-hppa Linux-x86 MacOS-X Solaris-sparc Windows} -name {Default Component} -parent Components
SetupType ::C603314B-D0E6-64D1-4F05-0E8226B3B689 -setup Install -active Yes -platforms {AIX-ppc FreeBSD-4-x86 FreeBSD-x86 HPUX-hppa Linux-x86 MacOS-X Solaris-sparc Windows} -name Typical -parent SetupTypes
SetupType ::E99F83E5-0807-6800-4DA6-CF3A4A12E5BF -setup Install -active Yes -platforms {AIX-ppc FreeBSD-4-x86 FreeBSD-x86 HPUX-hppa Linux-x86 MacOS-X Solaris-sparc Windows} -name Custom -parent SetupTypes

}
} common.tcl {
namespace eval ::InstallAPI {}
namespace eval ::InstallJammer {}
namespace eval ::InstallJammer::subst {}

proc lempty { list } {
if {[catch {expr [llength $list] == 0} ret]} { return 0 }
return $ret
}

proc lassign { list args } {
foreach elem $list varName $args {
upvar 1 $varName var
set var $elem
}
}

proc lremove { list args } {
foreach arg $args {
set x [lsearch -exact $list $arg]
set list [lreplace $list $x $x]
}
return $list
}

proc lreverse { list } {
set new [list]
set len [llength $list]
for {set i [expr $len - 1]} {$i >= 0} {incr i -1} {
lappend new [lindex $list $i]
}
return $new
}

proc lassign_array {list arrayName args} {
upvar 1 $arrayName array
foreach elem $list var $args {
set array($var) $elem
}
}

proc incr0 { varName {n 1} } {
upvar 1 $varName var
if {![info exists var]} { set var 0 }
incr var $n
}

proc iincr { varName {n 1} } {
upvar 1 $varName var
if {![info exists var]} { set var 0 }
set var [expr {$var + $n}]
}

proc recursive_glob {dir pattern} {
set files [glob -nocomplain -type f -dir $dir $pattern]
foreach dir [glob -nocomplain -type d -dir $dir *] {
eval lappend files [recursive_glob $dir $pattern]
}
return $files
}

proc noop {args} {}

proc read_file { file args } {
set fp [open $file]
eval [list fconfigure $fp] $args
set x [read $fp]
close $fp
return $x
}

proc debugging { {value ""} } {
if {$value ne ""} {
if {[string is true $value]} {
set ::debug "on"
} elseif {[string is false $value]} {
set ::debug "off"
} else {
if {[info exists ::debugfp]} {
catch { close $::debugfp }
}
set ::debug "on"
set ::info(Debugging) 1
set ::debugfp [open $value w]
}
}
return $::debug
}

proc debug { message {id ""} } {
global info

if {[info exists ::InstallJammer]} { return }

if {![string is true -strict $::debug]
&& ![string is true -strict $info(Debugging)]} { return }

set time [clock format [clock seconds] -format "%m/%d/%Y %H:%M:%S%p"]
set string "$time - $message"

if {[set x [::InstallJammer::SubstText $message]] ne $message} {
append string "\n$time - ** $x"
}

if {$id ne "" && [$id get Comment comment] && $comment ne ""} {
append string "\n$time - # $comment"
if {[set x [::InstallJammer::SubstText $comment]] ne $comment} {
append string "\n$time - ** $x"
}
}

if {![info exists ::InstallJammer]} {
if {[string is true -strict $::debug]} {
puts  stderr $string
flush stderr
}

if {[string is true -strict $info(Debugging)]} {
if {![info exists ::debugfp]} {
set ::debugfp [open [::InstallJammer::TmpDir debug.log] w]
}

puts  $::debugfp $string
flush $::debugfp
}
}
}

proc ::echo { string {subst 0} } {
if {$subst} { set string [::InstallJammer::SubstText $string] }
puts  stdout $string
flush stdout
}

proc ::more { args } {
global conf

if {[expr {[llength $args] % 2}]} {
set text [lindex $args end]
set args [lrange $args 0 end-1]
}

array set _args {
-file      ""
-width     0
-height    0
-allowquit 1
}
array set _args $args

if {$_args(-file) ne ""} {
set text [read_file $_args(-file)]
}

set height $_args(-height)
if {$height == 0} {
set height 24
if {[info exists conf(ConsoleHeight)]} {
set height $conf(ConsoleHeight)
} else {
if {![catch { exec stty size } result]} {
set height [lindex $result 0]
}
}
}

incr height -1

if {$_args(-width) > 0} {
set text [::InstallJammer::WrapText $text $_args(-width)]
}

exec stty raw -echo <@stdin

if {!$_args(-allowquit)} {
set prompt [::InstallJammer::SubstText "<%ConsolePauseText%>"]
} else {
set prompt [::InstallJammer::SubstText "<%ConsolePauseQuitText%>"]
}

catch {
set i 0
foreach line [split $text \n] {
puts stdout $line

if {[incr i] >= $height} {
puts -nonewline stdout $prompt
flush stdout

while {1} {
set x [read stdin 1]
if {$_args(-allowquit) && $x eq "q" || $x eq "Q"} {
return
} elseif {$x eq " "} {
break
}
}

puts  stdout ""
flush stdout

set i 0
}
}
}

exec stty -raw echo <@stdin

return
}

if {$::tcl_platform(platform) eq "unix"} {
proc ::tk_getSaveFile { args } {
return [eval ChooseFile .__tk_getSaveFile $args -type save]
}
}

proc SafeSet { varName value } {
upvar 1 $varName var
if {![info exists var]} { set var $value }
return $value
}

proc SafeArraySet { arrayName list } {
upvar 1 $arrayName array
foreach {varName elem} $list {
if {![info exists array($varName)]} { set array($varName) $elem }
}
}

package require msgcat

proc ::msgcat::mc { src args } {
foreach loc [concat [::msgcat::mcpreferences] en] {
if {[info exists ::msgcat::Msgs_${loc}($src)]} { break }
}
return [eval [list ::msgcat::mcget $loc $src] $args]
}

proc ::msgcat::mcexists { src {locales {}} } {
if {![llength $locales]} {
set locales [concat [::msgcat::mcpreferences] en]
}
foreach locale $locales {
if {$locale eq "None"} {
upvar #0 ::info msgs
} else {
upvar #0 ::msgcat::Msgs_${locale} msgs
}

if {[info exists msgs($src)]} { return 1 }
}
return 0
}

proc ::msgcat::mcset { locale src {dest ""} } {
if {$locale eq "None"} {
upvar #0 ::info msgs
} else {
upvar #0 ::msgcat::Msgs_${locale} msgs
}

if {[llength [info level 0]] == 3} { set dest $src }
set msgs($src) $dest
}

proc ::msgcat::mcunset { locale src } {
if {$locale eq "None"} {
upvar #0 ::info msgs
} else {
upvar #0 ::msgcat::Msgs_${locale} msgs
}

unset -nocomplain msgs($src)
}

proc ::msgcat::mcmset { locale pairs } {
if {$locale eq "None"} {
upvar #0 ::info msgs
} else {
upvar #0 ::msgcat::Msgs_${locale} msgs
}

array set msgs $pairs
}

proc ::msgcat::mcgetall { locale } {
if {$locale eq "None"} {
upvar #0 ::info msgs
} else {
upvar #0 ::msgcat::Msgs_${locale} msgs
}

return [array get msgs]
}

proc ::msgcat::mcget { locale src args } {
if {$locale eq "None"} {
upvar #0 ::info msgs
} else {
upvar #0 ::msgcat::Msgs_${locale} msgs
}

if {![info exists ::msgcat::renderer($locale)]} {
set ::msgcat::renderer($locale)  [expr {[info commands ::${locale}::render] ne ""}]
}

if {[info exists msgs($src)]} {
set src $msgs($src)

if {$::msgcat::renderer($locale)} {
set src [::${locale}::render $src]
}
}

if {[llength $args]} {
return [uplevel 1 [linsert $args 0 ::format $src]]
} else {
return $src
}
}

proc ::msgcat::mcclear { locale } {
unset -nocomplain ::msgcat::Msgs_${locale}
}

namespace eval ::InstallJammer {}
namespace eval ::InstallJammer::actions {}
namespace eval ::InstallJammer::conditions {}

proc ::InstallJammer::CommonInit {} {
global info
global conf

if {[info exists conf(commonInit)]} { return }

set conf(windows) [string equal $::tcl_platform(platform) "windows"]

set conf(windows98) 0
if {$conf(windows) && $::tcl_platform(osVersion) < 5.0} {
set conf(windows98) 1
}

set conf(vista) 0
if {$conf(windows) && $::tcl_platform(osVersion) >= 6.0} {
set conf(vista) 1
}

array set conf {
commonInit   1

logInit      0

ObjectStack   {}
ParentWindow  {}
UpdateWidgets {}
ButtonWidgets {BackButton NextButton CancelButton}

UserRCFiles {~/.bashrc ~/.cshrc ~/.tcshrc ~/.zshrc ~/.kshrc ~/.profile}
SystemRCFiles {/etc/bashrc /etc/csh.cshrc /etc/zshrc /etc/profile}

UpdateWindowsRegistry 0

SubstDirVars {
CommonStartMenu
Desktop
FileBeingInstalled
GnomeCommonStartMenu
GnomeDesktop
GnomeStartMenu
Home
InstallDir
Installer
InstallLogDirectory
InstallSource
KDECommonStartMenu
KDEDesktop
KDEStartMenu
ProgramReadme
ProgramLicense
ProgramExecutable
ProgramFolder
Uninstaller
UninstallDirectory
}

VirtualTextMap            {}
VirtualTextRecursionLimit 10
}

lappend conf(VirtualTextMap) "\\" "\\\\" "\[" "\\\["
lappend conf(VirtualTextMap) "<%" {[::InstallJammer::SubstVar [list }
lappend conf(VirtualTextMap) "%>" {]]}

if {[info exists ::installkit::root]} {
set conf(vfs) $::installkit::root
}
set conf(exe)      [info nameofexecutable]
set conf(script)   [info script]
set conf(threaded) [info exists ::tcl_platform(threaded)]

if {$conf(windows)} {
set info(Ext)       ".exe"
set info(ScriptExt) ".bat"
} else {
set info(Ext)       ""
set info(ScriptExt) ".sh"
}

if {!$conf(windows)} {
append ::env(PATH) ":/bin:/sbin:/usr/bin:/usr/sbin"
append ::env(PATH) ":/usr/local/bin:/usr/local/sbin"
}

::InstallJammer::InitializeMessageCatalogs

if {![info exists ::InstallJammer]} {
set ::debug "off"

array set conf {
ConsoleWidth  80
ConsoleHeight 24
}

array set info {
Wizard             .wizard
WizardFirstStep    0
WizardLastStep     0
WizardStarted      0
WizardFinished     0
WizardCancelled    0

Errors             ""

SilentMode         0
DefaultMode        0

UserMovedBack      0
UserMovedNext      0

ShowConsole        0

Debugging          0
Testing            0
}

SafeArraySet info {
AllowLanguageSelection 1
PromptForRoot          1

Language               "en"

InstallMode            "Standard"
UninstallMode          "Standard"

FallBackToConsole      0

InstallRegistryInfo    1

RunningInstaller       0
RunningUninstaller     0

SpaceRequiredText      "<%DiskSpace <%SpaceRequired%>%>"
SpaceAvailableText     "<%DiskSpace <%SpaceAvailable%>%>"
}

set info(Home) [::InstallJammer::HomeDir]

if {[info exists info(DefaultLanguage)] && $info(RunningInstaller)} {
set info(Language) $info(DefaultLanguage)
}

variable languages
variable languagecodes
if {[info exists languages($info(Language))]} {
set info(Language) $languages($info(Language))
}

if {$conf(windows)} {
set info(Username)      $::tcl_platform(user)
set info(PathSeparator) \;

set info(Desktop) <%DESKTOP%>

::InstallJammer::SetWindowsPlatform
::InstallJammer::SetupRegVirtualText
} else {
set info(Username)        [id user]
set info(PathSeparator)   :
set info(HasKDEDesktop)   [::InstallJammer::HasKDEDesktop]
set info(HasGnomeDesktop) [::InstallJammer::HasGnomeDesktop]

switch -- [::InstallJammer::GetDesktopEnvironment] {
"KDE" {
set info(Desktop) <%KDEDesktop%>
}

"Gnome" {
set info(Desktop) <%GnomeDesktop%>
}
}

set info(HaveTerminal) [expr {[catch { exec tty }] == 0}]
}

set info(UserIsRoot)   [string equal $info(Username) "root"]
set info(RealUsername) $::tcl_platform(user)

if {[info exists conf(vfs)]} {
set bin    [file join $conf(vfs) lib bin]
set tmpbin [::InstallJammer::TmpDir bin]
if {[file exists $bin] && ![file exists $tmpbin]} {
append ::env(PATH) $info(PathSeparator)$tmpbin
file copy -force $bin $tmpbin
if {!$conf(windows)} {
foreach file [glob -dir $tmpbin *] {
file attributes $file -permissions 0755
}
}
}
}

::InstallAPI::SetVirtualText -virtualtext Status -value "" -autoupdate 1

::InstallAPI::SetVirtualText -virtualtext InstallDir  -command ::InstallJammer::ModifyInstallDir
}

SafeArraySet info {
Date            "<%Date <%DateFormat%>%>"
DateFormat      "%Y%m%d"
}

set conf(mclocale) [::msgcat::mcpreferences]

if {[info exists info(Language)]} {
::msgcat::mclocale $info(Language)
} else {
::msgcat::mclocale en
}
}

proc ::InstallJammer::InitializeMessageCatalogs {} {
global conf
global info

variable languages
variable languagecodes

if {![array exists languagecodes]} {
array set languagecodes {
de      "German"
en      "English"
es      "Spanish"
fr      "French"
pl      "Polish"
pt_br   "Brazilian Portuguese"
}
}

if {[info exists info(Languages)]} {
array set languagecodes $info(Languages)
}

foreach var [array names languagecodes] {
set languages($languagecodes($var)) $var
}
set languages(None) None

return [lsort [array names languagecodes]]
}

proc ::InstallJammer::GetLanguageCodes {} {
variable languagecodes
return [lsort [array names languagecodes]]
}

proc ::InstallJammer::GetLanguages { {includeNone 0} } {
variable languages
set list [lremove [lsort [array names languages]] None]
if {$includeNone} { set list [linsert $list 0 None] }
return $list
}

proc ::InstallJammer::ConfigureBidiFonts {} {
if {$::info(Language) eq "ar"} {
foreach font [font names] {
font configure $font -family Arial -size 10
}
}
}

proc ::InstallJammer::LoadTwapi {} {
global conf

if {$conf(windows)
&& $::tcl_platform(osVersion) >= 5.0
&& [info exists ::installkit::root]
&& [llength [package versions twapi]]} {
namespace eval ::starkit {
variable topdir $::installkit::root
}

package require twapi
}
}

proc ::InstallJammer::InitializeCommandLineOptions {} {
global conf
global info

if {[info exists conf(initializeCommandLine)]} { return }
set conf(initializeCommandLine) 1

variable ::InstallJammer::CommandLineOptions


set CommandLineOptions(help) {
{} Switch 0 0 {}
"display this information"
}

set CommandLineOptions(temp) {
TempRoot String 0 0 {}
"set the temporary directory used by this program"
}

set CommandLineOptions(version) {
{} Switch 0 0 {}
"display installer version information"
}


foreach opt [array names CommandLineOptions] {
set name [string tolower $opt]
set CommandLineOptions($name) [concat $opt $CommandLineOptions($opt)]
if {$opt ne $name} { unset CommandLineOptions($opt) }

lassign $CommandLineOptions($name) x var type debug hide values desc
if {$type eq "Prefix"} {
lappend CommandLineOptions(PREFIX) $name
}
}
}

proc ::InstallJammer::HideMainWindow {} {
global conf
global info

if {[info exists ::tk_patchLevel]} {
wm title    . "$info(AppName) Setup"
wm geometry . 0x0+-10000+-10000
if {!$conf(windows) || !$info(GuiMode)} { wm overrideredirect . 1 }

if {$info(GuiMode)} { wm deiconify . }
}
}

proc ::InstallJammer::NewStyle { newStyle oldStyle args } {
style layout $newStyle [style layout $oldStyle]
eval [list style configure $newStyle] [style configure $oldStyle] $args
return $newStyle
}

proc ::InstallJammer::CreateDir { dir {log 1} } {
variable CreateDir

if {![info exists CreateDir($dir)]} {
set list [file split $dir]

for {set i 0} {$i < [llength $list]} {incr i} {
lappend dirlist [lindex $list $i]
set dir [eval file join $dirlist]
if {![info exists CreateDir($dir)]} {
set CreateDir($dir) 1
if {![file exists $dir]} {
file mkdir $dir
if {$log} { ::InstallJammer::LogDir $dir }
}
}
}
}

return $dir
}

proc ::InstallJammer::DirIsEmpty { dir } {
set list1 [glob -nocomplain -directory $dir *]
set list2 [glob -nocomplain -directory $dir -types hidden *]
set list  [lremove [concat $list1 $list2] $dir/. $dir/..]
return    [lempty $list]
}

proc ::InstallJammer::PlaceWindow { id args } {
set id [::InstallJammer::ID $id]
set anchor center

if {[winfo exists $id]} {
set target $id
} else {
set target [$id window]
if {![$id get Anchor anchor]} { set anchor center }
}

array set data "
-anchor $anchor
-width  [winfo reqwidth  $target]
-height [winfo reqheight $target]
"

array set data $args

set w  $data(-width)
set h  $data(-height)
set sw [winfo screenwidth $target]
set sh [winfo screenheight $target]
lassign [wm maxsize .] maxw maxh
set anchor $data(-anchor)
switch -- $anchor {
"center" {
set x0 [expr ($sw - $w) / 2 - [winfo vrootx $target]]
set y0 [expr ($sh - $h) / 2 - [winfo vrooty $target]]
}

"n" {
set x0 [expr ($sw - $w)  / 2 - [winfo vrootx $target]]
set y0 20
}

"ne" {
set x0 [expr $maxw - $w - 40]
set y0 20
}

"e" {
set x0 [expr $maxw - $w - 40]
set y0 [expr ($sh - $h) / 2 - [winfo vrooty $target]]
}

"se" {
set x0 [expr $maxw - $w - 40]
set y0 [expr $maxh - $h - 80]
}

"s" {
set x0 [expr ($sw - $w)  / 2 - [winfo vrootx $target]]
set y0 [expr $maxh - $h - 80]
}

"sw" {
set x0 20
set y0 [expr $maxh - $h - 80]
}

"w" {
set x0 20
set y0 [expr ($sh - $h) / 2 - [winfo vrooty $target]]
}

"nw" {
set x0 20
set y0 20
}

default {
append msg "bad anchor \"$anchor\": must be"
append msg "n, ne, e, se, s, sw, w, nw or center"
return -code error $msg
}
}

set x "+$x0"
set y "+$y0"
if { $x0+$w > $sw } {set x "-0"; set x0 [expr {$sw-$w}]}
if { $x0 < 0 }      {set x "+0"}
if { $y0+$h > $sh } {set y "-0"; set y0 [expr {$sh-$h}]}
if { $y0 < 0 }      {set y "+0"}

wm geometry $target $x$y
update
}

proc ::InstallJammer::CenterWindow { target {w 473} {h 335} {lower 0} } {
set args [list -width $w -height $h]
if {$lower} { lappend args -anchor s }
eval [list PlaceWindow $target] $args
}

proc ::InstallJammer::ID { args } {
set alias [join $args]
if {[info exists ::InstallJammer::aliases($alias)]} {
return $::InstallJammer::aliases($alias)
}
return $alias
}

proc ::InstallJammer::FindCommonPane { pane } {
foreach id [Common children] {
if {[string equal [$id component] $pane]} { return $id }
}
}

proc ::InstallJammer::FindObjByName { name objects } {
foreach object $objects {
if {[string equal [$object name] $name]} { return $object }
}
}

proc ::InstallJammer::GetPaneProc { id prefix } {
set proc $prefix.$id
if {![::InstallJammer::CommandExists $proc]} {
set proc $prefix.[$id component]
}
if {[::InstallJammer::CommandExists $proc]}  { return $proc }
}

proc ::InstallJammer::CurrentObject { {command "get"} {id ""} } {
global conf
global info

if {$command eq "get"} {
set id [lindex $conf(ObjectStack) end]
} elseif {$command eq "pop"} {
set id [lindex $conf(ObjectStack) end]
set conf(ObjectStack) [lrange $conf(ObjectStack) 0 end-1]
} elseif {$command eq "push" && $id ne ""} {
lappend conf(ObjectStack) $id
}

set info(CurrentObject) [lindex $conf(ObjectStack) end]

return $id
}

proc ::InstallJammer::ExecuteActions { id args } {
global info

array set _args {
-when       ""
-type       ""
-parent     ""
-conditions 1
}
array set _args $args

set id [::InstallJammer::ID $id]

if {![::InstallJammer::ObjExists $id]} {
return 0
}

if {[$id is action]} {
set idlist [list $id]
} else {
set idlist [$id children]
}

if {![llength $idlist]} {
return 0
}

set msg "Executing actions $id"
if {![catch { $id title } title]} { append msg " - $title" }
if {$_args(-when) ne ""} { append msg " - $_args(-when)" }
debug $msg

set res 1
foreach id $idlist {
if {![$id active]} { continue }

set obj  $id
set type [$obj component]

if {$_args(-type) ne "" && $type ne $_args(-type)} { continue }


if {$_args(-parent) ne ""} {
set obj [::InstallJammer::CreateTempAction $_args(-parent) $id]
lappend tempObjects $obj
}

if {$_args(-when) ne ""
&& [$obj get ExecuteAction when]
&& ![string equal -nocase $_args(-when) $when]} { continue }

set info(CurrentAction) $id
::InstallJammer::CurrentObject push $id

set when "Before Action is Executed"
if {$_args(-conditions) && ![$obj checkConditions $when]} {
debug "Skipping action $id - [$id title] - conditions failed"
::InstallJammer::CurrentObject pop
continue
}

set when "Before Next Action is Executed"
while {1} {
set res [$obj execute]

if {!$_args(-conditions) || [$obj checkConditions $when]} { break }
}

::InstallJammer::CurrentObject pop
}

if {[info exists tempObjects]} {
eval itcl::delete object $tempObjects
}

return $res
}

proc ::InstallJammer::CreateTempAction { id child } {
set obj [InstallComponent ::#auto -temp 1 -parent [$id parent]  -setup [$id setup] -type action -id $child -name [$child name]  -component [$child component] -conditions [$child conditions]]

return $obj
}

proc ::InstallJammer::BackCommand { wizard id } {
global info

set when "Before Previous Pane is Displayed"

if {![$id checkConditions $when]} { return 0 }

::InstallJammer::ExecuteActions $id -when $when

set info(UserMovedBack) 1
set info(UserMovedNext) 0

return 1
}

proc ::InstallJammer::NextCommand { wizard id } {
global info

set when "Before Next Pane is Displayed"

if {![$id checkConditions $when]} { return 0 }

::InstallJammer::ExecuteActions $id -when $when

set info(UserMovedBack) 0
set info(UserMovedNext) 1

return 1
}

proc ::InstallJammer::CancelCommand { wizard id } {
set when "Before Pane is Cancelled"

if {![$id checkConditions $when]} { return 0 }

::InstallJammer::ExecuteActions $id -when $when

return 1
}

proc ::InstallJammer::CancelEventHandler { wizard } {


if {[$wizard itemcget cancel -state] eq "normal"} {
::InstallJammer::exit 1
}
}

proc ::InstallJammer::FinishCommand { wizard id } {
set when "Before Pane is Finished"

if {![$id checkConditions $when]} { return 0 }

::InstallJammer::ExecuteActions $id -when $when

return 1
}

proc ::InstallJammer::FinishEventHandler { wizard } {
set id [$wizard raise]

set when "After Pane is Finished"
::InstallJammer::ExecuteActions $id -when $when

::InstallJammer::exit
}

proc ::InstallJammer::RaiseCommand { wizard id } {
set when "Before Pane is Displayed"
::InstallJammer::ExecuteActions $id -when $when
}

proc ::InstallJammer::RaiseEventHandler { wizard } {
global conf
global info

set id [$wizard raise]

set info(CurrentPane) $id

if {![$id active] || ![$id checkConditions "Before Pane is Displayed"]} {

if {![$id active]} {
debug "Skipping pane $id - [$id title] - pane is inactive" $id
} else {
debug "Skipping pane $id - [$id title] - conditions failed" $id
}

$wizard order [lrange [$wizard order] 0 end-1]
::InstallJammer::Wizard next 1 0
return
}

debug "Displaying pane $id - [$id title]" $id

if {[info exists conf(LastStepId)] && [$conf(LastStepId) is window]} {
set window [$conf(LastStepId) window]
::InstallJammer::TransientParent $window 1
wm withdraw $window
} else {
::InstallJammer::TransientParent $wizard 1
}

if {[$id is window]} {
set base [$id window]
::InstallJammer::TransientParent $base

wm withdraw $wizard

::InstallJammer::UpdateWidgets

if {![$id get Modal  modal]}  { set modal  0 }
if {![$id get Dialog dialog]} { set dialog 0 }

if {[winfo exists $base]} {
wm deiconify $base
raise $base
if {$modal} { ::InstallJammer::Grab set $base }
}

update

set when "After Pane is Displayed"
::InstallJammer::ExecuteActions $id -when $when

if {[winfo exists $base]} {
if {$dialog} {
if {[$id get DialogVairiable varName]} {
tkwait variable $varName
} else {
tkwait window $base
}
}

if {$modal} { ::InstallJammer::Grab release $base }
}
} else {
::InstallJammer::TransientParent $wizard
::InstallJammer::UpdateWidgets -wizard $wizard -step $id -buttons 1

$wizard show
update

set when "After Pane is Displayed"
::InstallJammer::ExecuteActions $id -when $when
}

set info(WizardLastStep)  0
set info(WizardFirstStep) 0

set conf(LastStepId) $id
}

proc ::InstallJammer::UpdateWizardButtons { args } {
global info

if {[llength $args]} {
lassign $args wizard id
} else {
set wizard $info(Wizard)
set id [$wizard raise]
}

if {![$id get Buttons buttons]} { return }

foreach button [list back next cancel finish help] {
if {![$wizard exists $button]} { continue }

set text [string totitle $button]
if {[string match "*$text*" $buttons]} {
$wizard itemconfigure $button -hide 0

set w [$wizard widget get $button -step $id]
::InstallJammer::SetText $w $id [string toupper $button 0]Button
} else {
$wizard itemconfigure $button -hide 1
}
}
}

proc ::InstallJammer::Wizard { args } {
global info

set wizard $info(Wizard)

if {![llength $args]} { return $wizard }

set command [lindex $args 0]
set args    [lrange $args 1 end]

set id [::InstallJammer::ID [lindex $args 0]]

switch -- $command {
"back" {
if {![llength $args]} { set args 1 }
eval [list $info(Wizard) back] $args
}

"next" {
if {![llength $args]} { set args 1 }
eval [list $info(Wizard) next] $args
}

"create" {
::InstallJammer::CreateWindow $wizard $id
}

"raise" {
set args [lreplace $args 0 0 $id]
if {[llength $args] == 1} { lappend args 1 }
eval [list $info(Wizard) raise] $args
}

"show" {
$wizard show
}

"hide" {
if {$id eq ""} {
$wizard hide
} else {
wm withdraw [$id window]
}
}
}
}

proc ::InstallJammer::CreateWindow { wizard id {preview 0} } {
set id    [::InstallJammer::ID $id]
set pane  [$id component]
set istop [$id is window]

set base  .[$id name]

if {$istop} {
if {[winfo exists $base]} { return $base }
} else {
if {[$wizard exists $id] && ($preview || [$id created])} {
return [$wizard widget get $id]
}
}

set parent [$id parent]

if {$preview && ![$wizard exists $id]} {
set parent root
$id get WizardOptions opts
eval [list $wizard insert step end $parent $id] $opts
}

if {!$preview && [$wizard exists $id]} {
$wizard itemconfigure $id  -backcommand   [list ::InstallJammer::BackCommand  $wizard $id]   -nextcommand   [list ::InstallJammer::NextCommand  $wizard $id]   -raisecommand  [list ::InstallJammer::RaiseCommand $wizard $id]   -cancelcommand [list ::InstallJammer::CancelCommand $wizard $id]  -finishcommand [list ::InstallJammer::FinishCommand $wizard $id]

bind $wizard <<WizardStep>>   "::InstallJammer::RaiseEventHandler  %W"
bind $wizard <<WizardCancel>> "::InstallJammer::CancelEventHandler %W"
bind $wizard <<WizardFinish>> "::InstallJammer::FinishEventHandler %W"

bind $wizard <<WizardLastStep>>  "set ::info(WizardLastStep)  1"
bind $wizard <<WizardFirstStep>> "set ::info(WizardFirstStep) 1"

$id created 1
}

set proc [GetPaneProc $id CreateWindow]

if {[string length $proc]} {
if {!$istop} {
$wizard createstep $id

$proc $wizard $id
set base [$wizard widget get $id]
$id window $base
} else {
$id window $base
$proc $wizard $id
}
}

return $base
}

proc ::InstallJammer::TransientParent { {parent ""} {remove 0} } {
global conf

if {$parent ne ""} {
if {$remove} {
set conf(ParentWindow) [lremove $conf(ParentWindow) $parent]
} else {
lappend conf(ParentWindow) $parent
}
}

if {[info exists conf(ParentWindow)]} {
set windows $conf(ParentWindow)
set conf(ParentWindow) [list]

foreach window $windows {
if {[winfo exists $window]} {
lappend conf(ParentWindow) $window
}
}

set parent [lindex $conf(ParentWindow) end]
}

if {$parent eq "" && [wm state .] ne "withdrawn"} { set parent "." }

return $parent
}

proc ::InstallJammer::ParseArgs { arrayName arglist args } {
upvar 1 $arrayName a

array set _args $args

if {[info exists _args(-switches)]} {
foreach switch $_args(-switches) {
set a($switch) 0
set s($switch) 1
}
}

if {[info exists _args(-options)]} {
array set o $_args(-options)
foreach {option default} $_args(-options) {
set a($option) $default
}
}

set a(_ARGS_) [list]

set len [llength $arglist]
for {set i 0} {$i < $len} {incr i} {
set arg [lindex $arglist $i]

if {[info exists s($arg)]} {
set a($arg) 1
} elseif {[info exists o($arg)]} {
set a($arg) [lindex $arglist [incr i]]
} else {
set a(_ARGS_) [lrange $arglist $i end]
break
}
}
}

proc ::InstallJammer::SetObjectProperties { id args } {
variable ::InstallJammer::Properties

::InstallJammer::ParseArgs _args $args -switches {-safe -nocomplain}

set args $_args(_ARGS_)

if {[llength $args] == 1} {
set property [lindex $args 0]
if {[info exists Properties($id,$property)]} {
return $Properties($id,$property)
}

if {!$_args(-nocomplain)} {
return -code error "invalid property '$property'"
}

return
}

foreach {property value} $args {
if {!$_args(-safe) || ![info exists Properties($id,$property)]} {
if {$property eq "Alias"} {
catch { $id alias $value }

if {[info exists ::InstallJammer::aliasmap($id)]} {
$id CleanupAlias
}

if {$value ne ""} {
set ::InstallJammer::aliases($value) $id
set ::InstallJammer::aliasmap($id) $value
}
}

if {$property eq "Active"} { $id active $value }

set Properties($id,$property) $value
}
}

return $Properties($id,$property)
}

proc ::InstallJammer::GetObjectProperty { id property {varName ""} } {
variable ::InstallJammer::Properties

if {[string length $varName]} {
upvar 1 $varName var
set var ""
if {![info exists Properties($id,$property)]} { return 0 }
set var $Properties($id,$property)
return 1
}

if {[info exists Properties($id,$property)]} {
return $Properties($id,$property)
}
}

proc ::InstallJammer::ObjectProperties { id arrayName args } {
upvar 1 $arrayName array
variable ::InstallJammer::Properties

::InstallJammer::ParseArgs _args $args -options {-prefix "" -subst 0}

set slen 0
if {[info exists _args(-subst)]} {
set subst $_args(-subst)
set slen  [llength $subst]
}

if {![llength $_args(_ARGS_)]} {
foreach varName [array names Properties $id,*] {
set var [string map [list $id, ""] $varName]
set val $Properties($varName)
if {$slen && ($subst eq "1" || [lsearch -exact $subst $var] > -1)} {
set val [::InstallJammer::SubstText $val]
}
set var $_args(-prefix)$var
lappend vars $var
set array($var) $val
}
} else {
foreach var $_args(_ARGS_) {
if {![info exists Properties($id,$var)]} { continue }
set val $Properties($id,$var)
if {$slen && ($subst eq "1" || [lsearch -exact $subst $var] > -1)} {
set val [::InstallJammer::SubstText $val]
}
set var $_args(-prefix)$var
lappend vars $var
set array($var) $val
}
}

return $vars
}

proc ::InstallJammer::ObjectChildrenRecursive { object } {
set children [list]

foreach child [$object children] {
lappend children $child
eval lappend children [::InstallJammer::ObjectChildrenRecursive $child]
}

return $children
}

proc ::InstallJammer::SetTitle { w id } {
set id [::InstallJammer::ID $id]
set title [::InstallJammer::GetText $id Title]
wm title $w $title
}

proc ::InstallJammer::SetVirtualText { languages window args } {
if {[llength $args] == 1} { set args [lindex $args 0] }

if {$languages eq "all"} { set languages [GetLanguageCodes] }

foreach lang $languages {
if {$lang eq "None"} {
global info
foreach {name value} $args {
set info($name) $value
debug "Virtual Text $name is now set to $value"
}
} else {
foreach {name value} $args {
::msgcat::mcset $lang $window,$name $value
}
}
}
}

proc ::InstallJammer::GetText { id field args } {
global info

array set _args {
-subst      1
-language   ""
-forcelang  0
-forcesubst 0
}
array set _args $args

set id   [::InstallJammer::ID $id]
set item [$id component]

set languages {}
if {$_args(-language) ne ""} { eval lappend languages $_args(-language) }
if {!$_args(-forcelang)} {
eval lappend languages [::msgcat::mcpreferences] en
}

set found 0
foreach lang $languages {
set text [::msgcat::mcget $lang $id,$field]
if {$text eq "$id,$field"} {
set text [::msgcat::mcget $lang $item,$field]
}
if {$text ne "$item,$field"} {
set found 1
break
}
}

if {$found} {
if {$_args(-forcesubst)
|| ($_args(-subst) && [$id get $field,subst subst] && $subst)} {
set text [::InstallJammer::SubstText $text]
}

return $text
}
}

proc ::InstallJammer::SetText { args } {
if {[llength $args] == 3} {
lassign $args w id field
set id   [::InstallJammer::ID $id]
set text [::InstallJammer::GetText $id $field]
} elseif {[llength $args] == 2} {
lassign $args w text
}

if {![winfo exists $w]} { return }

set class [winfo class $w]

if {$class eq "Frame" || $class eq "TFrame"} {
foreach child [winfo children $w] {
set class [winfo class $child]
if {$class eq "Label" || $class eq "TLabel"} {
set w $child
break
}
}
}

if {$class eq "Text"} {
if {![$w cget -maxundo]} {
$w configure -state normal
$w delete 0.0 end
$w insert end $text
$w configure -state disabled
}
} elseif {($class eq "Label" || $class eq "TLabel")
&& [string length [$w cget -textvariable]]} {
set [$w cget -textvariable] $text
} else {
$w configure -text $text
}
}

proc ::InstallJammer::Image { id image } {
global images

set id    [::InstallJammer::ID $id]
set image $id,$image

if {![ImageExists $image]} { set image [$id component],$image }
if {[ImageExists $image]} { return $images($image) }
}

proc ::InstallJammer::SetImage { w id image } {
set image [::InstallJammer::Image $id $image]
if {[string length $image]} { $w configure -image $image }
}

proc ::InstallJammer::ImageExists {img} {
global images
return [info exists images($img)]
}

proc ::InstallJammer::GetWidget { widget {id ""} } {
global info

if {![info exists info(Wizard)] || ![winfo exists $info(Wizard)]} { return }

if {$id eq ""} { set id [$info(Wizard) raise] }
if {$id eq ""} { return }

while {![$id ispane]} {
if {$id eq ""} { return }
set id [$id parent]
}

set widget [join [string trim $widget] ""]

switch -- $widget {
"BackButton" - "NextButton" - "CancelButton" {
set widget [string tolower [string range $widget 0 end-6]]
set widget [$info(Wizard) widget get $widget]
}

default {
if {![winfo exists $widget]} {
set widget [$id widget get $widget]
}
}
}

return $widget
}

proc ::InstallJammer::FindUpdateWidgets { textList args } {
global conf
global info

if {![info exists ::tk_patchLevel]} { return }
if {![info exists info(Wizard)]} { return }

set _args(-wizard)  $info(Wizard)
array set _args $args

set wizard $_args(-wizard)
if {![winfo exists $wizard]} { return }

if {![info exists _args(-step)]} { set _args(-step) [$wizard raise] }
set step $_args(-step)

if {$step eq ""} { return }

set widgets [concat [$step widgets] $conf(ButtonWidgets)]

trace remove variable ::info write ::InstallJammer::VirtualTextTrace

set include {}
foreach virtualtext $textList {
unset -nocomplain orig
if {[info exists info($virtualtext)]} { set orig $info($virtualtext) }

foreach widget $widgets {
set info($virtualtext) TEST1
set text1 [::InstallJammer::GetText $step $widget]

set info($virtualtext) TEST2
set text2 [::InstallJammer::GetText $step $widget]

if {$text1 ne $text2} { lappend include $widget }
}

if {[info exists orig]} {
set info($virtualtext) $orig
} else {
unset info($virtualtext)
}
}

trace add variable ::info write ::InstallJammer::VirtualTextTrace

return $include
}

proc ::InstallJammer::UpdateSelectedWidgets { {widgets {}} args } {
if {![info exists ::tk_patchLevel]} { return }

if {![llength $widgets]} { set widgets $::conf(UpdateWidgets) }

if {[llength $args]} {
set wizard [lindex $args 0]
set step   [lindex $args 1]
if {![winfo exists $wizard]} { return }
} else {
set wizard $::info(Wizard)
if {![winfo exists $wizard]} { return }

set step   [$wizard raise]
}

foreach widget $widgets {
if {[lsearch -exact $::conf(ButtonWidgets) $widget] > -1} {
set name [string tolower [string map {Button ""} $widget]]
if {[$wizard exists $name]} {
set w [$wizard widget get $name -step $step]
::InstallJammer::SetText $w $step $widget
}
} else {
set w [$step widget get $widget]

if {![winfo exists $w]} { continue }

switch -- [$step widget type $widget] {
"progress" {
set value [::InstallJammer::GetText $step $widget]
if {[string is double -strict $value]} {
$w configure -value $value
}
}

"image" {
::InstallJammer::SetImage $w $step $widget
}

"text" {
::InstallJammer::SetText $w $step $widget
}

"usertext" {
set text [::InstallJammer::GetText $step $widget]
$w clear
$w insert end $text
}
}
}
}
}

proc ::InstallJammer::UpdateWidgets { args } {
global conf
global info

if {![info exists ::tk_patchLevel]} { return }
if {![info exists info(Wizard)]} { return }

array set _args {
-update          0
-buttons         0
-widgets         {}
-updateidletasks 0
}
set _args(-wizard)  $info(Wizard)
set _args(-widgets) $conf(UpdateWidgets)

array set _args $args

set wizard $_args(-wizard)
if {![winfo exists $wizard]} { return }

if {![info exists _args(-step)]} { set _args(-step) [$wizard raise] }
set step $_args(-step)

if {$step eq ""} { return }

if {![llength $_args(-widgets)]} { set _args(-widgets) [$step widgets] }

::InstallJammer::UpdateSelectedWidgets $_args(-widgets) $wizard $step

if {$_args(-buttons)} { ::InstallJammer::UpdateWizardButtons $wizard $step }

if {$_args(-update)} { set _args(-updateidletasks) 0; update }

if {$_args(-updateidletasks)} { update idletasks }
}

proc ::InstallJammer::DirIsWritable {dir} {
global conf

if {$conf(windows98)} {
if {[catch { file attributes $dir } error]} { return 0 }
return 1
}
return [file writable $dir]
}

proc ::InstallJammer::Normalize { file {style ""} } {
global conf

if {$file ne ""} {
set file [eval file join [file split $file]]

if {[string match "p*" $style]} {
set style $::tcl_platform(platform)
}

switch -glob -- $style {
"u*" {
set style forwardslash
if {[string index $file 1] == ":"} {
set file [string range $file 2 end]
}
}

"w*" {
set style backslash
if {[string index $file 1] == ":"} {
set file [string toupper $file 0]
}
}
}

switch -glob -- $style {
"f*" {
set file [string map [list \\ /] $file]
}

"b*" {
set file [string map [list / \\] $file]
}
}
}

return $file
}

proc ::InstallJammer::RelativeFile { file {relativeDir "<%InstallDir%>"} } {
if {[file pathtype $file] eq "relative"} {
set file [::InstallJammer::SubstText "$relativeDir/$file"]
}
return [::InstallJammer::Normalize $file]
}

proc ::InstallJammer::RollbackName { file } {
global info
return [file join [file dirname $file] .$info(InstallID).[file tail $file]]
}

proc ::InstallJammer::SaveForRollback {file} {
file rename -force $file [::InstallJammer::RollbackName $file]
}

proc ::InstallJammer::WindowsDir { dir } {
set dir [string toupper $dir]

if {$dir eq "WINDOWS"
|| [catch { ::installkit::Windows::::getFolder $dir } windir]} {
set windir ""
}

if {$windir ne ""} { return [::InstallJammer::Normalize $windir windows] }


if {[string match "COMMON_*" $dir]} {
set chk [string range $dir 7 end]
if {[catch { ::installkit::Windows::getFolder $chk } windir]} {
set windir ""
}
if {[string length $windir]} {
return [::InstallJammer::Normalize $windir windows]
}
}

set curr {Software\Microsoft\Windows\CurrentVersion}
set key  "HKEY_LOCAL_MACHINE\\$curr"

switch -- $dir {
"WINDOWS" {
if {[info exists ::env(windir)]} {
set windir $::env(windir)
} elseif {[info exists ::env(SYSTEMROOT)]} {
set windir $::env(SYSTEMROOT)
} elseif {![catch {registry get $key SystemRoot} result]} {
set windir $result
} else {
set windir "C:\\Windows"
}
}

"PROGRAM_FILES" {
if {[info exists ::env(ProgramFiles)]} {
set windir $::env(ProgramFiles)
} elseif {![catch {registry get $key ProgramFilesDir} result]} {
set windir $result
} else {
set windir "C:\\Program Files"
}
}

"SYSTEM" {
set windir [file join [WindowsDir WINDOWS] system]
}

"SYSTEM32" {
set windir [file join [WindowsDir WINDOWS] system32]
}

"QUICK_LAUNCH" {
set windir [WindowsDir APPDATA]
set windir [file join $windir  "Microsoft" "Internet Explorer" "Quick Launch"]
}

"COMMON_QUICK_LAUNCH" {
set windir [WindowsDir COMMON_APPDATA]
set windir [file join $windir  "Microsoft" "Internet Explorer" "Quick Launch"]
}

"WALLPAPER" {
set windir [registry get $key WallPaperDir]
}

default {

array set regkeys {
ADMINTOOLS        {USER "Administrative Tools"}
APPDATA           {USER AppData}
CACHE             {USER Cache}
CDBURN_AREA       {USER "CD Burning"}
COOKIES           {USER Cookies}
DESKTOP           {USER Desktop}
FAVORITES         {USER Favorites}
FONTS             {USER Fonts}
HISTORY           {USER History}
INTERNET_CACHE    {USER Cache}
LOCAL_APPDATA     {USER "Local AppData"}
LOCAL_SETTINGS    {USER "Local Settings"}
MYMUSIC           {USER "My Music"}
MYPICTURES        {USER "My Pictures"}
MYVIDEO           {USER "My Video"}
NETHOOD           {USER NetHood}
PERSONAL          {USER Personal}
PRINTHOOD         {USER PrintHood}
PROGRAMS          {USER Programs}
RECENT            {USER Recent}
SENDTO            {USER SendTo}
STARTMENU         {USER "Start Menu"}
STARTUP           {USER Startup}
TEMPLATES         {USER Templates}

COMMON_ADMINTOOLS {SYS "Common Administrative Tools"}
COMMON_APPDATA    {SYS "Common AppData"}
COMMON_DESKTOP    {SYS "Common Desktop"}
COMMON_DOCUMENTS  {SYS "Common Documents"}
COMMON_FAVORITES  {SYS "Common Favorites"}
COMMON_MUSIC      {SYS CommonMusic}
COMMON_PICTURES   {SYS CommonPictures}
COMMON_PROGRAMS   {SYS "Common Programs"}
COMMON_STARTMENU  {SYS "Common Start Menu"}
COMMON_STARTUP    {SYS "Common Startup"}
COMMON_TEMPLATES  {SYS "Common Templates"}
COMMON_VIDEO      {SYS CommonVideo}
}

set SYS  "HKEY_LOCAL_MACHINE\\$curr\\Explorer\\Shell Folders"
set USER "HKEY_CURRENT_USER\\$curr\\Explorer\\Shell Folders"

if {[info exists regkeys($dir)]} {
upvar 0 [lindex $regkeys($dir) 0] regkey
set val [lindex $regkeys($dir) 1]
set windir [::installkit::Windows::GetKey $regkey $val]
}

if {$windir eq ""} { return <%$dir%> }
}
}

return [::InstallJammer::Normalize $windir windows]
}

proc ::InstallJammer::SetupRegVirtualText {} {
global info

set env        {HKEY_LOCAL_MACHINE}
set user       {HKEY_CURRENT_USER}
set current    {HKEY_LOCAL_MACHINE}
append env     {\SYSTEM\CurrentControlSet\Control\Session Manager}
append current {\Software\Microsoft\Windows\CurrentVersion}

set info(REG_USER_ENV)        "$user\\Environment"
set info(REG_SYSTEM_ENV)      "$env\\Environment"
set info(REG_UNINSTALL)       "$current\\Uninstall"
set info(REG_CURRENT_VERSION) "$current"

return
}

proc ::InstallJammer::SetWindowsPlatform {} {
global conf
global info

set string Windows

if {$conf(windows)} {
switch -- $::tcl_platform(os) {
"Windows 95" { set string "Win95" }
"Windows 98" { set string "Win98" }
"Windows NT" {
switch -- $::tcl_platform(osVersion) {
"4.0" { set string "WinNT" }
"5.0" { set string "Win2k" }
"5.1" { set string "WinXP" }
"5.2" { set string "Win2003" }
"6.0" { set string "Vista" }
}
}

default {
set string "WinME"
}
}
}

set info(WindowsPlatform) $string
}

proc ::InstallJammer::SubstVar { var } {
global conf
global info

if {[info exists info($var)]} {
set string $info($var)
if {[lsearch -exact $conf(SubstDirVars) $var] > -1} {
set platform $::tcl_platform(platform)
set string [::InstallJammer::Normalize $string $platform]
}
return $string
}

if {[::msgcat::mcexists $var]} { return [::msgcat::mc $var] }

if {![info exists ::InstallJammer::subst]} {
foreach proc [info commands ::InstallJammer::subst::*] {
set ::InstallJammer::subst([namespace tail $proc]) $proc
}
}

set idx  [string wordend $var 0]
set word [string range $var 0 [expr {$idx - 1}]]
set args [string trim [string range $var $idx end]]

if {[info exists ::InstallJammer::subst($word)]} {
return [eval ::InstallJammer::subst::$word $args]
}

if {$var ne "" && $var eq [string toupper $var]} {
return [::InstallJammer::WindowsDir $var]
}

return "<%$var%>"
}

proc ::InstallJammer::subst::Date { args } {
set secs [lindex $args 0]
if {[string is integer -strict $secs]} {
set format [join [lrange $args 1 end]]
} else {
set secs   [clock seconds]
set format [join $args]
}

return [clock format $secs -format $format]
}

proc ::InstallJammer::subst::Dir { args } {
set dir      [lindex $args 0]
set platform [lindex $args 1]
if {$platform eq ""} { set platform $::tcl_platform(platform) }
return [::InstallJammer::Normalize $dir $platform]
}

proc ::InstallJammer::subst::Dirname { args } {
return [file dirname [join $args]]
}

proc ::InstallJammer::subst::DiskSpace { args } {
return [::InstallJammer::FormatDiskSpace [join $args]]
}

proc ::InstallJammer::subst::DOSName { args } {
global conf

set file [join $args]

if {$conf(windows) && [file exists $file]} {
set file [file attributes $file -shortname]
set file [::InstallJammer::Normalize $file windows]
}

return $file
}

proc ::InstallJammer::subst::Env { args } {
set var [lindex $args 0]
if {[info exists ::env($var)]} { return $::env($var) }
}

proc ::InstallJammer::subst::FileGroup { args } {
set group [join $args]
set obj [FindObjByName $group [FileGroups children]]
if {$obj ne ""} {
set string [$obj directory]
set string [Normalize $string $::tcl_platform(platform)]
}
}

proc ::InstallJammer::subst::FormatDescription { args } {
set lines  [join $args]
set string ""
foreach line [split [string trim $lines] \n] {
if {[string trim $line] eq ""} { set line "." }
append string " $line\n"
}
}

proc ::InstallJammer::subst::GUID { args } {
global info
set info(LastGUID) [::InstallJammer::guid]
return $info(LastGUID)
}

proc ::InstallJammer::subst::InstallInfoDir { args } {
return [::InstallJammer::InstallInfoDir]
}

proc ::InstallJammer::subst::Property { args } {
set property [lindex $args end]
if {[llength $args] == 1} {
set object [::InstallJammer::CurrentObject]
} else {
set object [::InstallJammer::ID [lindex $args 0]]
}

return [$object get $property]
}

proc ::InstallJammer::subst::RegValue { args } {
set key  [lindex $args 0]
set val  [lindex $args 1]
return [::installkit::Windows::GetKey $key $val]
}

proc ::InstallJammer::subst::SpaceAvailable { args } {
global info
set dir [join $args]
if {$dir eq ""} { set dir $info(InstallDir) }
return [::InstallJammer::GetFreeDiskSpace $dir]
}

proc ::InstallJammer::subst::Tail { args } {
return [file tail [join $args]]
}

proc ::InstallJammer::subst::Temp { args } {
return [::InstallJammer::TmpDir]
}

proc ::InstallJammer::subst::UUID { args } {
global info
set info(LastUUID) [::InstallJammer::uuid]
return $info(LastUUID)
}

proc ::InstallJammer::SubstForEval { string } {
set map [list "<%" "\[::InstallJammer::SubstText \{<%" "%>" "%>\}\]"]
return [string map $map $string]
}

proc ::InstallJammer::SubstForPipe { string } {
set list [list]
foreach arg $string {
lappend list [::InstallJammer::SubstText $arg]
}
return $list
}

proc ::InstallJammer::SubstText { str {num 0} } {
global conf

if {$num > $conf(VirtualTextRecursionLimit)} { return $str }

if {$str eq ""} { return }

set s $str
set s [string map $conf(VirtualTextMap) $s]
set s [subst -novariables $s]
if {$str ne $s} { set s [::InstallJammer::SubstText $s [incr num]] }

return $s
}

proc ::InstallJammer::HasVirtualText { string } {
return [string match "*<%*%>*" $string]
}

proc ::InstallJammer::TmpDir { {file ""} } {
global conf
global info

if {![info exists info(TempRoot)] || ![file exists $info(TempRoot)]} {
set dirs [list]
if {[info exists ::env(TEMP)]} { lappend dirs $::env(TEMP) }
if {[info exists ::env(TMP)]}  { lappend dirs $::env(TMP)  }
if {$conf(windows)} {
set local [::InstallJammer::WindowsDir LOCAL_APPDATA]
lappend dirs [file join [file dirname $local] Temp]

lappend dirs [::InstallJammer::WindowsDir INTERNET_CACHE]

lappend dirs C:/Windows/Temp
lappend dirs C:/WINNT/Temp
lappend dirs C:/Temp

} else {
lappend dirs /usr/tmp /tmp /var/tmp
}

foreach dir $dirs {
if {[DirIsWritable $dir]} {
set info(TempRoot) [::InstallJammer::Normalize $dir forward]
break
}
}
}

if {![info exists info(Temp)] || ![file exists $info(Temp)]} {
set subdir ijtmp_[::InstallJammer::uuid]
set info(Temp) [Normalize [file join $info(TempRoot) $subdir]]
file mkdir $info(Temp)
}

if {$file ne ""} {
return [Normalize [file join $info(Temp) $file]]
}

return $info(Temp)
}

proc ::InstallJammer::TmpMount {} {
variable tmpMountCount

if {![info exists tmpMountCount]} { set tmpMountCount 0 }

while {1} {
set mnt /installjammervfs[incr tmpMountCount]
if {![file exists $mnt]} { break }
}

return $mnt
}

proc ::InstallJammer::ModifyInstallDir {} {
global conf
global info

set dir [::InstallJammer::SubstText $info(InstallDir)]

if {[info exists info(InstallDirSuffix)]} {
set suffix [::InstallJammer::SubstText $info(InstallDirSuffix)]
if {[file tail $dir] ne $suffix} { set dir [file join $dir $suffix] }
}

set info(InstallDir) [::InstallJammer::Normalize $dir platform]

if {$conf(windows)} {
set info(InstallDrive) [string range $info(InstallDir) 0 1]
}
}

proc ::InstallJammer::GetInstallInfoDir { {create 0} } {
global conf
global info

if {![info exists info(InstallInfoDir)]} {
if {$conf(windows)} {
set root [::InstallJammer::WindowsDir PROGRAM_FILES]
if {![::InstallJammer::DirIsWritable $root]} {
set root [::InstallJammer::WindowsDir APPDATA]
}

set dir  [file join $root "InstallJammer Registry"]
} else {
if {[id user] eq "root"} {
set dir "/var/lib/installjammer"
} else {
set dir "[::InstallJammer::HomeDir]/.installjammerinfo"
}
}

set info(InstallJammerRegistryDir) [::InstallJammer::Normalize $dir]

set id $info(ApplicationID)
if {[info exists info(UpgradeInstall)] && $info(UpgradeInstall)} {
set id $info(UpgradeApplicationID)
}

set dir [file join $dir $id]

set info(InstallInfoDir) [::InstallJammer::Normalize $dir]
}

if {$create && ![file exists $info(InstallInfoDir)]} {
::InstallJammer::CreateDir $info(InstallInfoDir) 0
if {$conf(windows)} {
file attributes [file dirname $info(InstallInfoDir)] -hidden 1
}
}

if {[info exists ::InstallJammer]} {
set infodir $info(InstallInfoDir)
unset info(InstallInfoDir) info(InstallJammerRegistryDir)
return $infodir
} else {
return $info(InstallInfoDir)
}
}

proc ::InstallJammer::InstallInfoDir { {file ""} } {
set dir [::InstallJammer::GetInstallInfoDir 1]
if {[string length $file]} { append dir /$file }
return $dir
}

proc ::InstallJammer::SetPermissions { file perm } {
if {![string length $perm]} { return }

if {$::tcl_platform(platform) eq "windows"} {
if {[string length $perm] > 4} { return }
lassign [split $perm ""] a h r s
file attributes $file -archive $a -hidden $h -readonly $r -system $s
} else {
file attributes $file -permissions $perm
}
}

proc ::InstallJammer::WriteDoneFile { {dir ""} } {
if {$dir eq ""} { set dir [::InstallJammer::TmpDir] }
close [open [file join $dir .done] w]
}

proc ::InstallJammer::CleanupTmpDirs {} {
global info

if {[string is true -strict $info(Debugging)]} { return }

set tmp [file dirname [TmpDir]]
foreach dir [glob -nocomplain -type d -dir $tmp ijtmp_*] {
if {[DirIsEmpty $dir] || [file exists [file join $dir .done]]} {
catch { file delete -force $dir }
}
}
}

proc ::InstallJammer::EvalCondition { condition } {
if {[string is true  $condition]} { return 1 }
if {[string is false $condition]} { return 0 }

set test [::InstallJammer::SubstForEval $condition]

if {![string length $test]} { return 1 }
if {[catch {expr [subst $test]} result]} {
return -code error "Error in condition '$condition': $result"
}
return $result
}

proc ::InstallJammer::HomeDir {} {
return [file normalize ~]
}

proc ::InstallJammer::PauseInstall {} {
global conf
if {[info exists conf(pause)]} { close [open $conf(pause) w] }
}

proc ::InstallJammer::ContinueInstall {} {
global conf
if {[info exists conf(pause)]} { file delete $conf(pause) }
}

proc ::InstallJammer::StopInstall {} {
global conf
global info
if {[info exists conf(stop)]} {
close [open $conf(stop) w]
set info(InstallStopped) 1
}
}

proc ::InstallJammer::PauseCheck {} {
global conf
global info

while {[file exists $conf(pause)]} {
if {[file exists $conf(stop)]} {
set info(InstallStopped) 1
return 0
}
after 500
}

return 1
}

proc ::InstallJammer::UninstallFile {file} {
file delete -force $file
}

proc ::InstallJammer::UninstallDirectory { dir {force ""} } {
file delete $force $dir
}

proc ::InstallJammer::UninstallRegistryKey {key {value ""}} {
if {![lempty $value]} {
catch { registry delete $key $value }
if {[catch { registry keys $key } keys]} { return }
if {[catch { registry values $key } values]} { return }
if {[lempty $keys] && [lempty $values]} {
UninstallRegistryKey $key
}
} else {
catch { registry delete $key }
}
}

proc ::InstallJammer::LogDir { dir } {
global conf
global info

if {!$conf(logInit)} {
set conf(logInit) 1
::InstallJammer::TmpDir
::InstallJammer::GetInstallInfoDir
}

set dir [Normalize $dir forward]
if {![string match $info(InstallInfoDir)* $dir]
&& ![string match $info(Temp)* $dir]} {
::InstallJammer::InstallLog [list :DIR $dir]
}
}

proc ::InstallJammer::LogFile { file } {
global conf
global info

if {!$conf(logInit)} {
set conf(logInit) 1
::InstallJammer::TmpDir
::InstallJammer::GetInstallInfoDir
}

set file [Normalize $file forward]
if {![string match $info(InstallInfoDir)* $file]
&& ![string match $info(Temp)* $file]} {
::InstallJammer::InstallLog [list :FILE $file]
}
}

proc ::InstallJammer::SetVersionInfo { file {version ""} } {
global info
global versions
if {$version eq ""} { set version $info(InstallVersion) }
set versions($file) $version
}

proc ::InstallJammer::StoreLogsInUninstall {} {
global conf
global info

if {[info exists conf(uninstall)]} {
set tmp [::InstallJammer::TmpDir]

foreach file [glob -nocomplain -dir $tmp *.info] {
lappend files $file
lappend names [file tail $file]

set file [file root $file].log

if {[file exists $file]} {
lappend files $file
lappend names [file tail $file]
}
}

foreach file [glob -nocomplain -dir $tmp *.dead] {
lappend files $file
lappend names [file tail $file]
}

installkit::addfiles $conf(uninstall) $files $names
}
}

proc ::InstallJammer::MessageBox { args } {
global conf
global widg

set win  .__message_box
set args [linsert $args 0 -type ok -buttonwidth 12]
if {[info exists conf(cmdline)] && $conf(cmdline)} {
set usenative 1
set args [linsert $args 0 -title "InstallJammer"]
} elseif {[info exists widg(InstallJammer)]} {
set usenative 1
set win  [::InstallJammer::TopName $win]
set args [linsert $args 0 -title "InstallJammer"]
} else {
set usenative 0
set parent [::InstallJammer::TransientParent]
set args [linsert $args 0 -usenative $usenative -parent $parent]
if {$parent eq "."} { lappend args -placerelative 0 }
}

if {!$usenative && $parent eq ""} { set _args(-transient) 0 }

array set _args $args

set type $_args(-type)

if {!$usenative && $type ne "user"} {
set idx 0

if {$type eq "abortretryignore"} {
set buttonlist {Abort Retry Ignore}
} else {
set buttonlist {Retry OK Yes No Cancel}
}

foreach button $buttonlist {
set lbutton [string tolower $button]
if {[string first $lbutton $type] > -1} {
lappend buttons $lbutton
lappend _args(-buttons) [::InstallJammer::SubstText <%$button%>]

if {[info exists _args(-default)]
&& $_args(-default) eq $lbutton} {
set _args(-default) $idx
}

incr idx
}
}

if {[llength $buttons] == 1} { set _args(-default) 0 }

set _args(-type) user
}

set result [eval [list MessageDlg $win] [array get _args]]

if {!$usenative && $type ne "user"} { return [lindex $buttons $result] }
return $result
}

proc ::InstallJammer::Message { args } {
if {[info exists ::tk_patchLevel]} {
if {[catch {eval {tk_messageBox -title "InstallJammer"} $args}]} {
eval {::InstallJammer::MessageBox -title "InstallJammer"} $args
}
} else {
array set data $args
if {![info exists data(-message)]} { return }

if {[info exists data(-title)]} {
puts stdout "$data(-title): $data(-message)"
} else {
puts stdout "$data(-message)"
}

flush stdout
}
}

proc ::InstallJammer::HandleThreadError { tid errorMsg } {
set message "Error in thread $tid: $errorMsg"
::InstallJammer::MessageBox -message $message
}

proc ::InstallJammer::ChooseDirectory { args } {
global conf

array set _args $args

if {[info exists _args(-variable)]} {
upvar 1 $_args(-variable) dir
unset _args(-variable)

if {![info exists _args(-initialdir)] && [info exists dir]} {
set _args(-initialdir) $dir
}
}

if {0 && $conf(windows)} {
if {[info exists _args(-message)]} {
set _args(-title) $_args(-message)
unset _args(-message)
}
set dir [eval tk_chooseDirectory  [list -parent [lindex $conf(ParentWindow) 0]] [array get _args]]
} else {
if {[llength $conf(ParentWindow)] > 1} {
wm withdraw [lindex $conf(ParentWindow) end]
}

set dir [eval ::ChooseDirectory .__choose_directory  [list -parent [::InstallJammer::TransientParent]] [array get _args]]

if {[llength $conf(ParentWindow)] > 1} {
wm deiconify [lindex $conf(ParentWindow) end]
}
}

return $dir
}

proc ::InstallJammer::ChooseFile { args } {
global conf

array set _args $args

if {[info exists _args(-variable)]} {
upvar 1 $_args(-variable) file
unset _args(-variable)
}

if {$conf(windows)} {
set type open
if {[info exists _args(-type)]} {
set type $_args(-type)
unset _args(-type)
}
set type [string toupper $type 0]
set file [eval [list tk_get${type}File] [array get _args]]
} else {
if {[llength $conf(ParentWindow)] > 1} {
wm withdraw [lindex $conf(ParentWindow) end]
}

set file [eval ::ChooseFile .__choose_file  [list -parent [::InstallJammer::TransientParent]] [array get _args]]

if {[llength $conf(ParentWindow)] > 1} {
wm deiconify [lindex $conf(ParentWindow) end]
}
}

return $file
}

proc ::InstallJammer::CommandExists { proc } {
return [string length [info commands $proc]]
}

proc ::InstallJammer::uuid {} {
global conf

if {$conf(windows)} {
return [string range [::InstallJammer::guid] 1 end-1]
}

set sha [sha1 -string [info hostname][clock seconds][pid][info cmdcount]]

set i 0
foreach x {8 4 4 4 12} {
lappend list [string range $sha $i [expr {$i + $x - 1}]]
incr i $x
}

return [string toupper [join $list -]]
}

proc ::InstallJammer::guid {} {
global conf
if {$conf(windows)} {
return [string toupper [::installkit::Windows::guid]]
}
return \{[string toupper [::InstallJammer::uuid]]\}
}

proc ::InstallJammer::ObjExists { obj } {
return [info exists ::InstallJammer::ObjMap([namespace tail $obj])]
}

proc ::InstallJammer::ReadMessageCatalog { catalog } {
eval [read_file [file join $::installkit::root catalogs $catalog]]
}

proc ::InstallJammer::Wrap { args } {
global conf
global info

set include 1
if {[set x [lsearch -exact $args -noinstall]] > -1} {
set include 0
set args [lreplace $args $x $x]
}

if {$include} {
set pkgdir [file join $::installkit::root lib InstallJammer]
set args [linsert $args 0 -package $pkgdir]
}

eval ::installkit::wrap $args
}

proc ::InstallJammer::Grab { command args } {
variable GrabStack

if {![info exists GrabStack]} { set GrabStack [list] }

switch -- $command {
"current" {
return [lindex $GrabStack end]
}

"stack" {
return $GrabStack
}

"release" {
set window [lindex $args 0]
set search [lsearch -exact $GrabStack $window]
if {$search < 0} { return }
if {$search != [expr {[llength $GrabStack] - 1}]} {
return -code error "$window is not last in the grab stack."
}
grab release $window
set GrabStack [lreplace $GrabStack end end]
if {[llength $GrabStack]} { grab [lindex $GrabStack end] }
}

"set" {
set window [lindex $args 0]
grab $window
lappend GrabStack $window
}

default {
grab $command
lappend GrabStack $command
}
}

return
}

proc ::InstallJammer::HasKDEDesktop {} {
global info

set home [::InstallJammer::HomeDir]
set kde  [file join $home .kde]

if {![file exists $kde]} { return 0 }

if {![info exists info(KDEDesktop)] || [lempty $info(KDEDesktop)]} {
set globals [file join $kde share config kdeglobals]
set desktop [file join $home Desktop]
if {[catch {open $globals} fp]} { return 0 }
while {[gets $fp line] != -1} {
if {[regexp {^Desktop=([^\n].*)\n} $line\n trash desktop]} {
regsub -all {\$([A-Za-z0-9]+)} $desktop {$::env(\1)} desktop
break
}
}
close $fp
set info(KDEDesktop) $desktop
}

return [file exists $info(KDEDesktop)]
}

proc ::InstallJammer::HasGnomeDesktop {} {
global info

set home [::InstallJammer::HomeDir]

foreach dir [list .gnome-desktop Desktop] {
set desktop [file join $home $dir]
if {[file exists $desktop]} {
set info(GnomeDesktop) $desktop
break
}
}

if {[info exists info(GnomeDesktop)] && [file exists $info(GnomeDesktop)]} {
return 1
}
return 0
}

proc ::InstallJammer::GetDesktopEnvironment {} {
global env

if {[info exists env(DESKTOP)] && $env(DESKTOP) eq "kde"} { return KDE }
if {[info exists env(KDE_FULL_SESSION)]} { return KDE }

if {[info exists env(GNOME_DESKTOP_SESSION_ID)]} { return Gnome }

if {[info exists env(DESKTOP_SESSION)]} {
switch -glob -- $env(DESKTOP_SESSION) {
"*KDE*"   { return KDE }
"*GNOME*" { return Gnome }
}
}

return "Unknown"
}

proc ::InstallJammer::GetLinuxDistribution {} {
set lsb_release [auto_execok lsb_release]
if {[file executable $lsb_release]} {
if {![catch { exec $lsb_release -i -s } distrib]} { return $distrib }
}

foreach lsb_release [list /etc/lsb-release /etc/lsb_release] {
if {[file readable $lsb_release]} {

}
}

set check {
/etc/mandrake-release    Mandrake
/etc/fedora-release      Fedora
/etc/SuSE-release        SuSE
/etc/debian_version      Debian
/etc/gentoo-release      Gentoo
/etc/slackware-version   Slackware
/etc/turbolinux-release  TurboLinux
/etc/yellowdog-release   YellowDog
/etc/connectiva-release  Connectiva
/etc/redhat-release      Redhat
}
}

proc ::InstallJammer::GetFreeDiskSpace { dir } {
global conf

if {$conf(windows)} {
set drive [lindex [file split $dir] 0]
return [::installkit::Windows::drive freespace $drive]
}

set df [auto_execok df]
if {[file exists $df]} {
catch { exec $df -k $dir } output

set line [join [lrange [split $output \n] 1 end] " "]
if {![catch { expr {[lindex $line 3] * 1024.0} } avail]} {
return $avail
}
}

return -1
}

proc ::InstallJammer::FormatDiskSpace { space } {
if {$space < 1048576} {
return [format "%2.2f KB" [expr {$space / 1024.0}]]
}
if {$space < 1073741824} {
return [format "%2.2f MB" [expr {$space / 1048576.0}]]
}
return [format "%2.2f GB" [expr {$space / 1073741824.0}]]
}

proc ::InstallJammer::unpack { src dest {permissions ""} } {
if {![string length $permissions]} { set permissions "0666" }

set fin [open $src r]
if {[catch {open $dest w $permissions} fout]} {
close $fin
return -code error $fout
}

fconfigure $fin  -translation binary
fconfigure $fout -translation binary

fcopy $fin $fout

close $fin
close $fout
}

proc ::InstallJammer::ExecAsRoot { command args } {
global conf
global info

array set _args {
-title   ""
-message "Please enter your root password."
-failmessage ""
}
array set _args $args

set wait 0
if {[info exists _args(-wait)]} { set wait $_args(-wait) }

set cmd   [list]
set msg   $_args(-message)
set title $_args(-title)

set i 0
set x [llength $command]
foreach arg $command {
if {[string first " " $arg] > -1} {
append cmdline '$arg'
} else {
append cmdline $arg
}
if {[incr i] < $x} { append cmdline " " }
}

if {$info(GuiMode)} {
set desktop [::InstallJammer::GetDesktopEnvironment]

if {$desktop eq "KDE"} {
if {[string length [auto_execok kdesu]]} {
set cmd [list kdesu -d -c $cmdline]
}
} elseif {$desktop eq "Gnome"} {
if {[string length [auto_execok gksu]]} {
set cmd [list gksu $cmdline]
} elseif {[string length [auto_execok gnomesu]]} {
set cmd [list gnomesu $cmdline]
}

if {[llength $cmd] && [string length $title]} {
set cmd [linsert $cmd 1 --title $title]
}
}

if {![llength $cmd]} {
if {[string length [auto_execok kdesu]]} {
set cmd [list kdesu -d -c $cmdline]
} elseif {[string length [auto_execok gksu]]} {
set cmd [list gksu $cmdline]
if {[string length $title]} {
set cmd [linsert $cmd 1 --title $title]
}
} elseif {[string length [auto_execok gnomesu]]} {
set cmd [list gnomesu $cmdline]
if {[string length $title]} {
set cmd [linsert $cmd 1 --title $title]
}
} elseif {[string length [auto_execok xsu]]} {
set cmd [list xsu $cmdline]
if {[string length $title]} {
set cmd [linsert $cmd 1 --title $title]
}
} elseif {!$info(HaveTerminal)} {
set cmd [list xterm -e "echo '$msg' && su -c \"$cmdline\""]

if {$title eq ""} { set title "xterm" }
set cmd [linsert $cmd 1 -T $title]
}
}
}

if {![llength $cmd]} {

puts  stdout "$msg\n"
flush stdout

if {[info exists _args(-wait)] && !$wait} { append cmdline " &" }

set res [system su -c \"$cmdline\"]

if {$res && $_args(-failmessage) ne ""} {
echo $_args(-failmessage) 1
}
} else {
if {!$wait} { lappend cmd & }

catch { eval exec $cmd }
}
}

proc ::InstallJammer::GetFilesForPattern { patternString args } {
set relative    1
set patterns    [list]
set installdir  [::InstallJammer::SubstText <%InstallDir%>]
set patternlist [split [::InstallJammer::SubstText $patternString] \;]

foreach pattern $patternlist {
set pattern [string trim [::InstallJammer::SubstText $pattern]]
if {[file pathtype $pattern] ne "relative"} {
set relative 0
set pattern [::InstallJammer::Normalize $pattern]
}

lappend patterns $pattern
}

if {![llength $patterns]} { return }

if {$relative} {
set opts $args
lappend opts -dir $installdir

set files [eval glob -nocomplain $opts $patterns]
} else {
set files [list]
foreach pattern $patterns {
set opts $args
if {[file pathtype $pattern] eq "relative"} {
lappend opts -dir $installdir
}
eval lappend files [eval glob -nocomplain $opts [list $pattern]]
}
}

return $files
}

proc ::InstallJammer::StartProgress { varName total {current 0} } {
global conf
set conf(ProgressCurr)    0
set conf(ProgressLast)    0
set conf(ProgressTotal)   $total
set conf(ProgressVarName) $varName
}

proc ::InstallJammer::ResetProgress {} {
global conf
set conf(ProgressLast) 0
}

proc ::InstallJammer::UpdateProgress { args } {
set total   $::conf(ProgressTotal)
set varName $::conf(ProgressVarName)
set current [lindex $args end]

set bytes [expr {$current - $::conf(ProgressLast)}]
set ::conf(ProgressLast) $current

incr ::conf(ProgressCurr) $bytes

if {$varName ne ""} {
set $varName [expr {round( ($::conf(ProgressCurr) * 100.0) / $total )}]
}
}

proc ::InstallJammer::ReadProperties { data arrayName } {
upvar 1 $arrayName array

foreach line [split [string trim $data] \n] {
set line [string trim $line]
if {[set x [string first : $line]] >= 0} {
set var [string trim [string range $line 0 [expr {$x-1}]]]
set val [string trim [string range $line [expr {$x+1}] end]]
set array($var) $val
}
}
}

proc ::InstallJammer::ReadPropertyFile { file arrayName } {
upvar 1 $arrayName array
set fp [open $file]
::InstallJammer::ReadProperties [read $fp] array
close $fp
}

proc ::InstallJammer::ShowUsageAndExit { {message ""} } {
global conf
global info

variable ::InstallJammer::CommandLineOptions

::InstallJammer::InitializeCommandLineOptions

set head --
if {$conf(windows)} { set head / }

set usage ""

if {$message ne ""} { append usage "$message\n\n" }
append usage "Usage: [file tail [info nameofexecutable]] ?options ...?"
append usage "\n\nAvailable Options:"

set len 0
foreach option [array names CommandLineOptions] {
if {$option eq "PREFIX"} { continue }

lassign $CommandLineOptions($option) name var type x hide values desc

if {$type eq "Boolean"} {
set desc "$name Yes|No"
} elseif {$type eq "Prefix"} {
set desc "$name<OPTION> <VALUE>"
} elseif {$type eq "Switch"} {
set desc $name
} else {
set var  [string toupper [string trimleft $option -/]]
set desc "$name $var"
}

set options($option) $desc

if {[string length $desc] > $len} {
set len [string length $desc]
}
}

incr len 2

foreach option [lsort -dict [array names options]] {
lassign $CommandLineOptions($option) name var type x hide values desc

if {$hide} { continue }

set desc   [::InstallJammer::SubstText $desc]
set values [::InstallJammer::SubstText $values]

set line "  [format %-${len}s $head$options($option)] $desc"

append usage "\n[::InstallJammer::WrapText $line 0 [expr {$len + 3}]]"

if {$type eq "Choice"} {
set values  [lsort -dict $values]
set last    [lindex $values end]
set values  [lrange $values 0 end-1]
set choices [string tolower "[join $values ", "] or $last"]

set line "    Available values: $choices"
append usage "\n[::InstallJammer::WrapLine $line 0 22]"
}
}

append usage \n

if {$conf(windows) || !$info(HaveTerminal)} {
SourceCachedFile gui.tcl
InitGui

::InstallJammer::MessageBox -icon error -font "Courier 8"  -title "In-valid Arguments" -message $usage
} else {
puts $usage
}

::exit [expr {$message eq "" ? 0 : 1}]
}

proc ::InstallJammer::ParseCommandLineArguments { argv } {
global conf
global info

variable ::InstallJammer::CommandLineOptions
variable ::InstallJammer::PassedCommandLineOptions
variable ::InstallJammer::VirtualTextSetByCommandLine

::InstallJammer::ExecuteActions "Setup Actions"

::InstallJammer::InitializeCommandLineOptions

set len [llength $argv]
for {set i 0} {$i < $len} {incr i} {
set arg [lindex $argv $i]
set opt [string tolower [string trimleft $arg -/]]

if {$i == 0 && [file normalize $arg] eq [file normalize [info name]]} {
continue
}

if {$opt eq "help" || $opt eq "?"} {
::InstallJammer::ShowUsageAndExit
}

if {$opt eq "v" || $opt eq "version"} {
set    message "InstallJammer Installer version $conf(version)\n\n"
append message [::InstallJammer::SubstText "<%VersionHelpText%>"]

if {$conf(windows)} {
SourceCachedFile gui.tcl
InitGui
::InstallJammer::MessageBox -default ok  -title "InstallJammer Installer" -message $message
} else {
set version "<%Version%> (<%InstallVersion%>)\n"
puts [::InstallJammer::SubstText $version]
puts $message
}

::exit 0
}

if {![info exists CommandLineOptions($opt)]} {
set found 0

if {[info exists CommandLineOptions(PREFIX)]} {
foreach prefix $CommandLineOptions(PREFIX) {
if {[string match -nocase $prefix* $opt]} {
set found 1

set opt       [string trimleft $arg -/]
set xlen      [string length $prefix]
set prefixopt [string range $opt $xlen end]

set opt $prefix
break
}
}
}

if {!$found} {
::InstallJammer::ShowUsageAndExit "invalid option '$arg'"
return
}
}

lassign $CommandLineOptions($opt) name var type debug hide value desc
set choices [::InstallJammer::SubstText $value]

if {$type eq "Switch"} {
if {$value eq ""} {
set val 1
} else {
set val $value
}
} else {
if {[incr i] == $len} {
::InstallJammer::ShowUsageAndExit  "no argument given for option '$arg'"
}

set val [lindex $argv $i]

if {$type eq "Choice"} {
set val  [string tolower $val]
set vals [string tolower $choices]
if {[set x [lsearch -exact $vals $val]] < 0} {
::InstallJammer::ShowUsageAndExit  "invalid value given for option '$arg'"
}

set val [lindex $choices $x]
} elseif {$type eq "Boolean"} {
if {![string is boolean -strict $val]} {
::InstallJammer::ShowUsageAndExit  "invalid value given for option '$arg'"
}

if {$value ne ""} {
if {[string is true $val]} {
set val [lindex $value 0]
} else {
set val [lindex $value 1]
}
}
} elseif {$type eq "Prefix"} {
if {![info exists prefixopt]}  {
::InstallJammer::ShowUsageAndExit  "no option specified for '$arg'"
}

set suffix $prefixopt

if {$value ne ""} {
set opt     [string tolower $prefixopt]
set choices [string tolower $choices]
if {[set x [lsearch -exact $choices $opt]] < 0} {
::InstallJammer::ShowUsageAndExit  "invalid option '$prefixopt'"
}

set suffix [lindex $value $x]
}

append var $suffix
}
}

set info($var) $val
set PassedCommandLineOptions($opt) $val
set VirtualTextSetByCommandLine($var) $val
}

set info(GuiMode)     [expr {$info($conf(mode)) eq "Default"
|| $info($conf(mode)) eq "Standard"}]
set info(SilentMode)  [string equal $info($conf(mode)) "Silent"]
set info(DefaultMode) [string equal $info($conf(mode)) "Default"]
set info(ConsoleMode) [string equal $info($conf(mode)) "Console"]

if {$info(ShowConsole)} {
SourceCachedFile gui.tcl
InitGui

if {!$conf(windows)} { SourceCachedFile console.tcl }
console show
}

if {!$info(GuiMode) && !$conf(windows)} {
if {![catch { exec stty size } result]
&& [scan $result "%d %d" height width] == 2} {
set conf(ConsoleWidth)  $width
set conf(ConsoleHeight) $height
}
}
}

proc ::InstallJammer::CommonExit {} {
global conf

catch {
if {$conf(windows) && $conf(UpdateWindowsRegistry)} {
registry broadcast Environment -timeout 1
}

if {[info exists conf(RestartGnomePanel)]} {
set pid [::InstallAPI::FindProcesses -name gnome-panel]
if {$pid ne ""} {
catch { exec kill -HUP $pid }
}
}

::InstallJammer::WriteDoneFile

::InstallJammer::CleanupTmpDirs

if {[info exists ::debugfp]} {
catch { close $::debugfp }
}
}

::exit 0
}

proc ::InstallJammer::WrapText { string {width 0} {start 0} } {
global conf

if {$width == 0} { set width $conf(ConsoleWidth) }

set splitstring {}
foreach line [split $string "\n"] {
lappend splitstring [::InstallJammer::WrapLine $line $width $start]
}
return [join $splitstring "\n"]
}

proc ::InstallJammer::WrapLine { line {width 0} {start 0} } {
global conf

if {$width == 0} { set width $conf(ConsoleWidth) }

set slen  0
set words [split $line " "]
set line  [lindex $words 0]
set lines [list]
foreach word [lrange $words 1 end] {
if {[string length $line] + [string length " $word"] > $width} {
lappend lines $line

set slen $start
set line [string repeat " " $slen]$word
} else {
append line " $word"
}
}

if {$line ne ""} { lappend lines $line }

return [join $lines "\n"]
}

package require Itcl

proc ::InstallJammer::Class { name body } {
set matches [regexp -all -inline {\s+writable attribute\s+([^\s]+)} $body]
foreach {match varName} $matches {
append body "method $varName {args} { cfgvar $varName \$args }\n"
}

set matches [regexp -all -inline {\s+readable attribute\s+([^\s]+)} $body]
foreach {match varName} $matches {
append body "method $varName {args} { set $varName }\n"
}

set map [list]
lappend map "writable attribute" "public variable"
lappend map "readable attribute" "private variable"

set body [string map $map $body]

itcl::class ::$name $body
}

::itcl::class Object {
constructor {args} {
eval configure $args
set ::InstallJammer::ObjMap([namespace tail $this]) [incr objc]
}

destructor {
unset ::InstallJammer::ObjMap([namespace tail $this])
}

method destroy {} {
::itcl::delete object $this
}

method cfgvar { args } {
if {[llength $args] == 2} {
configure -[lindex $args 0] [lindex $args 1]
}
return [cget -[lindex $args 0]]
}

method serialize {} {
set return [list]
foreach list [configure] {
set opt [lindex $list 0]
set def [lindex $list end-1]
set val [lindex $list end]
if {$def == $val} { continue }
lappend return $opt $val
}
return $return
}

common objc 0
} ; ## ::itcl::class Object

::itcl::class TreeObject {
inherit Object

constructor { args } {
set id [namespace tail $this]

eval configure $args

if {!$temp && $parent ne ""} {
$parent children insert $index $id
}
}

destructor {
if {$parent ne ""} { $parent children remove $id }

foreach child $children {
$child destroy
}

CleanupAlias
}

method serialize {} {
set return [list]
foreach list [configure] {
set opt [lindex $list 0]
if {$opt eq "-id" || $opt eq "-index"} { continue }
set def [lindex $list end-1]
set val [lindex $list end]
if {$opt eq "-name" && $val eq [string tolower $id]} { continue }
if {$def == $val} { continue }
lappend return $opt $val
}
return $return
}

method CleanupAlias {} {
variable ::InstallJammer::aliases
variable ::InstallJammer::aliasmap

if {[info exists aliasmap($id)]} {
unset -nocomplain aliases($aliasmap($id))
unset aliasmap($id)
set ::InstallJammer::Properties($id,Alias) ""
}
}

method parent { args } {
if {[lempty $args]} { return $parent }

if {![string equal $args "recursive"]} {
return [set parent [lindex $args 0]]
}

set x    $parent
set list [list]
while {[string length $x]} {
set list [linsert $list 0 $x]
set x [$x parent]
}
return $list
}

method reparent { newParent } {
if {$parent eq $newParent} { return }

if {$parent ne ""} { $parent children remove $id }

set parent $newParent
if {$parent ne ""} { $parent children add $id }
}

method children { args } {
if {![llength $args]} { return $children }

lassign $args command obj
switch -- $command {
"add" {
children insert end $obj
}

"index" {
return [lsearch -exact $children $obj]
}

"insert" {
lassign $args command index obj
if {$index eq "end"} {
lappend children $obj
} else {
set children [linsert $children $index $obj]
}
}

"remove" - "delete" {
set children [lremove $children $obj]
}

"reorder" {
if {[llength $obj]} { set children $obj }
}

"recursive" {
return [::InstallJammer::ObjectChildrenRecursive $this]
}
}
}

method is { args } {
if {[llength $args] == 1} {
return [string equal [type] [lindex $args 0]]
} else {
return [expr {[lsearch -exact $args [type]] > -1}]
}
}

method index {} {
if {[string length $parent]} { return [$parent children index $id] }
}

method id        { args } { eval cfgvar id        $args }
method name      { args } { eval cfgvar name      $args }
method type      { args } { eval cfgvar type      $args }
method alias     { args } { eval cfgvar alias     $args }
method active    { args } { eval cfgvar active    $args }
method comment   { args } { eval cfgvar comment   $args }
method platforms { args } { eval cfgvar platforms $args }

public variable id      ""
public variable temp    0
public variable name    ""
public variable type    ""
public variable index   "end"
public variable active  1
public variable parent  ""
public variable comment ""

public variable platforms [list]

protected variable children [list]

private variable oldalias ""
public variable alias "" {
if {$oldalias ne ""} {
$this CleanupAlias
}
set oldalias $alias

if {$alias ne ""} {
set ::InstallJammer::aliases($alias) $id
set ::InstallJammer::aliasmap($id) $alias
set ::InstallJammer::Properties($id,Alias) $alias
}
}
}

::itcl::class InstallType {
inherit TreeObject

constructor { args } {
eval configure $args
} {
set type installtype
eval configure $args
}

method widget { args } {}
method setup  { args } { eval cfgvar setup       $args }

public variable setup  ""
}

itcl::class File {
inherit TreeObject

constructor {args} {
eval configure $args
} {
eval configure $args
}

method srcfile {} {
return [file join $::conf(vfs) $id]
}

method checkFileMethod { dest } {
if {$filemethod eq ""} {
::set filemethod [$parent filemethod]
}

::set doInstall 1

if {![info exists exists] && $filemethod ne "Always overwrite files"} {
::set exists [file exists $dest]
}

switch -- $filemethod {
"Never overwrite files" {
if {$exists} { ::set doInstall 0 }
}

"Update files with more recent dates" {
if {$exists && [file mtime $dest] >= $mtime} {
::set doInstall 0
}
}

"Update files with a newer version" {
global versions
if {$exists && [info exists versions($dest)]} {
::set c [package vcompare $version $versions($dest)]
if {$c == 0 || $c == -1} { ::set doInstall 0 }
}
}

"Always overwrite files" {
}

"Prompt User" {
if {$exists} {
::set txt "<%FileOverwriteText%>"
::set msg [::InstallJammer::SubstText $txt]
::set ans [::InstallJammer::MessageBox -type yesno  -name FileOverwrite -title "File Exists"  -message $msg]
::set doInstall [expr {$ans eq "yes"}]
}
}
}

return $doInstall
}

method destdir {} {
::set dir [::InstallJammer::SubstText [destdirname]]
if {[file pathtype $dir] eq "relative"} {
::set dir [::InstallJammer::SubstText <%InstallDir%>/[destdirname]]
}
return $dir
}

method destdirname {} {
return $directory
}

method destfile {} {
return [file join [destdir] [destfilename]]
}

method destfilename {} {
if {$targetfilename eq ""} {
return [file tail $name]
} else {
return [::InstallJammer::SubstText $targetfilename]
}
}

method srcfilename {} {
return [file tail $name]
}

method createdir {} {
::InstallJammer::CreateDir [destdir]
}

method install {} {
global conf

if {![::InstallJammer::PauseCheck]} { return 0 }

::set dest [install[type]]

if {$conf(windows)} {
::InstallJammer::SetPermissions $dest $attributes
} else {
if {[type] eq "dir"} {
if {$permissions eq ""} {
::set permissions $::info(DefaultDirectoryPermission)
}

if {[info commands output] eq "output"} {
output [list :DIR $dest $permissions]
}

::InstallJammer::SetPermissions $dest 00777
}
}

return 1
}

method installdir {} {
createdir
}

method installlink {} {
::set dest [destfile]

if {![checkFileMethod $dest]} { return }

createdir

if {[file exists $dest] && [catch { file delete -force $dest } error]} {
return -code error $error
}

if {[catch { exec ln -s $linktarget $dest } error]} {
return -code error $error
}

if {$version eq ""} {
::set version $::info(InstallVersion)
} else {
::set version [::InstallJammer::SubstText $version]
}

::InstallJammer::LogFile $dest
::InstallJammer::SetVersionInfo $dest $version

return $dest
}

method installfile { {dest ""} {checkFileMethod 1} {logFile 1} } {
global conf
global info

createdir

::set src [srcfile]
if {$dest eq ""} { ::set dest [destfile] }

if {$version eq ""} {
::set version $::info(InstallVersion)
} else {
::set version [::InstallJammer::SubstText $version]
}

::set doInstall 1
if {$checkFileMethod} {
::set doInstall [checkFileMethod $dest]
}

::set info(FileSize) $size
if {!$doInstall} {
::set progress ::InstallJammer::IncrProgress
if {[::InstallJammer::CommandExists $progress]} { $progress $size }
return $dest
}

if {$permissions eq ""} {
if {$conf(windows)} {
::set permissions 0666
} else {
::set permissions $info(DefaultFilePermission)
}
}

if {!$size} {
if {[catch { open $dest w $permissions } err]} {
return -code error $err
}
close $err
} else {
::InstallJammer::unpack $src $dest $permissions
}

if {$mtime} {
file mtime $dest $mtime
}

if {$logFile} {
::InstallJammer::LogFile $dest
::InstallJammer::SetVersionInfo $dest $version
}

return $dest
}

method group {} {
return [lindex [parent recursive] 1]
}

method set { args } {
return [eval ::InstallJammer::SetObjectProperties $id $args]
}

method get { property {varName ""} } {
if {[string length $varName]} {
upvar 1 $varName var
return [::InstallJammer::GetObjectProperty $id $property var]
} else {
return [::InstallJammer::GetObjectProperty $id $property]
}
}

method isfile {} {
return [is file link]
}

method object {} {
return ::FileObject
}

method name               { args } { eval cfgvar name              $args }
method size               { args } { eval cfgvar size              $args }
method mtime              { args } { eval cfgvar mtime             $args }
method version            { args } { eval cfgvar version           $args }
method location           { args } { eval cfgvar location          $args }
method directory          { args } { eval cfgvar directory         $args }
method linktarget         { args } { eval cfgvar linktarget        $args }
method filemethod         { args } { eval cfgvar filemethod        $args }
method attributes         { args } { eval cfgvar attributes        $args }
method permissions        { args } { eval cfgvar permissions       $args }
method targetfilename     { args } { eval cfgvar targetfilename    $args }
method compressionmethod  { args } { eval cfgvar compressionmethod $args }

public variable type               "file"
public variable name               ""
public variable size               0
public variable mtime              0
public variable version            ""
public variable location           ""
public variable directory          ""
public variable linktarget         ""
public variable filemethod         ""
public variable attributes         ""
public variable permissions        ""
public variable targetfilename     ""
public variable compressionmethod  ""

private variable exists

} ; ## itcl::class File

::itcl::class InstallComponent {
inherit TreeObject

constructor { args } {
eval configure $args
} {
::set name [string tolower $id]

eval configure $args

if {$temp} {
if {[string length $parent]} { $parent children remove $id }
return
}

if {[info exists ::InstallJammer::Properties($id,Alias)]
&& [string length $::InstallJammer::Properties($id,Alias)]} {
$this set Alias $::InstallJammer::Properties($id,Alias)
}

if {![info exists ::InstallJammer] && [ispane]} {
::set install $parent
::set wizard  $::info(Wizard)

::set node $parent
if {[$parent is installtype]} { ::set node root }

if {[string equal $install "Common"]} {
::InstallJammer::CreateWindow $wizard $id
} elseif {[string equal $install $::info($::conf(mode))]} {
::set create  [list ::InstallJammer::CreateWindow $wizard $id]

get WizardOptions stepopts
eval [list $wizard insert step end $node $id  -createcommand $create] $stepopts

if {[is window]} {
$wizard itemconfigure $id -appendorder 0
}
}
}
}

destructor {
if {!$temp} {
array unset ::InstallJammer::Properties $id,*

foreach condition $conditions {
catch { $condition destroy }
}
}
}

method set { args } {
if {[llength $args] == 0} { return }
if {[llength $args] == 1} { ::set args [lindex $args 0] }
eval [list ::InstallJammer::SetObjectProperties $id] $args
}

method get { property {varName ""} } {
if {[string length $varName]} {
upvar 1 $varName var
return [::InstallJammer::GetObjectProperty $id $property var]
} else {
return [::InstallJammer::GetObjectProperty $id $property]
}
}

method getText { field args } {
eval [list ::InstallJammer::GetText $id $field] $args
}

method setText { languages args } {
if {[llength $args] == 0} { return }
if {[llength $args] == 1} { ::set args [lindex $args 0] }
eval [list ::InstallJammer::SetVirtualText $languages $id] $args
}

method properties { arrayName args } {
upvar 1 $arrayName array
return [eval ::InstallJammer::ObjectProperties $id array $args]
}

method ispane {} {
return [expr {[is "pane"] || [is "window"]}]
}

method object {} {
if {[ispane]} {
variable ::InstallJammer::panes
return $panes($component)
} elseif {[is action]} {
variable ::InstallJammer::actions
return $actions($component)
} elseif {[is actiongroup]} {
return ActionGroupObject
}
}

method initialize {} {
[object] initialize $id
}

method widget { command widget args } {
switch -- $command {
"get" {
if {[info exists widgetData($widget,widget)]} {
return $widgetData($widget,widget)
}
}

"set" {
if {[lsearch -exact $widgets $widget] < 0} {
lappend widgets $widget
}

foreach [list opt val] $args {
::set widgetData($widget,[string range $opt 1 end]) $val
}
}

"type" {
if {[info exists widgetData($widget,type)]} {
return $widgetData($widget,type)
}
return text
}
}
}

method widgets {} {
return $widgets
}

method conditions { args } {
if {[lempty $args]} { return $conditions }

lassign $args command obj
switch -- $command {
"add" {
conditions insert end $obj
}

"index" {
return [lsearch -exact $conditions $obj]
}

"insert" {
lassign $args command index obj
if {[lsearch -exact $conditions $obj] > -1} { return }

if {$index eq "end"} {
lappend conditions $obj
} else {
::set conditions [linsert $conditions $index $obj]
}
}

"remove" - "delete" {
::set conditions [lremove $conditions $obj]
}

"reorder" {
::set conditions $obj
}
}

return
}

method checkConditions { {when ""} } {
if {[ispane]} {
global info
::set info(CurrentPane) $id
}

if {[llength $conditions]} {
::set conditionlist [list]

foreach cid $conditions {
if {![::InstallJammer::ObjExists $cid]} { continue }

if {$when eq "" || [$cid get CheckCondition] eq $when} {
lappend conditionlist $cid
}
}

if {[llength $conditionlist]} {
::set msg "Checking conditions for $id - $title"
if {$when ne ""} { append msg " - $when" }
debug $msg $id

foreach cid $conditionlist {
if {![$cid active]} {
debug "Skipping condition $cid - [$cid title] - condition is inactive" $cid
continue
}

debug "Checking condition $cid - [$cid title]" $cid
::set result [$cid check]

if {!$result} {
debug "Condition failed"
if {$operator eq "AND"} {
return 0
}
} else {
debug "Condition passed"
if {$operator eq "OR"} {
return 1
}
}
}
}
}

return 1
}

method execute {} {
if {$type eq "action"} {
debug "Executing action $id - [$id title]" $id

::set ::info(CurrentAction) $id
::InstallJammer::CurrentObject push $id

if {[file exists .]} { ::set pwd [pwd] }

::set err [catch {::InstallJammer::actions::$component $this} res]

if {[file exists .] && [pwd] ne $pwd} { cd $pwd }

::InstallJammer::CurrentObject pop

if {$err && ![get IgnoreErrors]} {
return -code error "Error in action $component: $res"
}

return $res
}
}

method setup       { args } { eval cfgvar setup       $args }
method title       { args } { eval cfgvar title       $args }
method window      { args } { eval cfgvar window      $args }
method created     { args } { eval cfgvar created     $args }
method command     { args } { eval cfgvar command     $args }
method operator    { args } { eval cfgvar operator    $args }
method component   { args } { eval cfgvar component   $args }
method arguments   { args } { eval cfgvar arguments   $args }
method description { args } { eval cfgvar description $args }

public variable type        "installcomponent"
public variable setup       ""
public variable title       ""
public variable window      ""
public variable created     0

public variable command     ""
public variable operator    "AND"
public variable component   ""
public variable arguments   ""
public variable conditions  [list]
public variable description ""

private variable widgets    [list]
private variable widgetData
} ; ## ::itcl::class InstallComponent

::itcl::class FileGroup {
inherit InstallComponent

constructor { args } {
eval configure $args
} {
eval configure $args
::set setup Install
}

method install {} {
global conf

::set dir [directory]

::InstallJammer::CreateDir $dir

if {$conf(windows)} {
::InstallJammer::SetPermissions $dir [get Attributes]
} else {
::InstallJammer::SetPermissions $dir [get Permissions]
}
}

method destdirname {} {
return [get Destination]
}

method directory {} {
return [::InstallJammer::SubstText [destdirname]]
}

method version {} {
return [get Version]
}

method filemethod {} {
return [get FileUpdateMethod]
}

method object {} {
return ::FileGroupObject
}

method compressionmethod {} {
return [get CompressionMethod]
}

public variable type "filegroup"
} ; ## ::itcl::class FileGroup

::itcl::class Component {
inherit InstallComponent

constructor { args } {
eval configure $args
} {
eval configure $args
::set setup Install
}

method object {} {
return ::ComponentObject
}

public variable type "component"
} ; ## ::itcl::class Component

::itcl::class SetupType {
inherit InstallComponent

constructor { args } {
eval configure $args
} {
eval configure $args
::set setup Install
}

method object {} {
return ::SetupTypeObject
}

public variable type "setuptype"
} ; ## ::itcl::class SetupType

::itcl::class Condition {
inherit Object

constructor { args } {
::set id [namespace tail $this]
eval configure $args

if {[string length $parent]} {
$parent conditions add $id
}
}

destructor {
if {[string length $parent]} {
$parent conditions remove $id
}
}

method serialize {} {
::set return [list]
foreach list [configure] {
::set opt [lindex $list 0]
if {$opt eq "-id"} { continue }

::set def [lindex $list end-1]
::set val [lindex $list end]
if {$def == $val} { continue }
lappend return $opt $val
}
return $return
}

method set { args } {
return [eval ::InstallJammer::SetObjectProperties $id $args]
}

method get { property {varName ""} } {
if {[string length $varName]} {
upvar 1 $varName var
return [::InstallJammer::GetObjectProperty $id $property var]
} else {
return [::InstallJammer::GetObjectProperty $id $property]
}
}

method properties { arrayName args } {
upvar 1 $arrayName array
return [eval ::InstallJammer::ObjectProperties $id array $args]
}

method object {} {
return $::InstallJammer::conditions($component)
}

method check {} {
::set ::info(CurrentCondition) $id
::InstallJammer::CurrentObject push $id

::set res [string is true [::InstallJammer::conditions::$component $id]]
if {!$res} {
::set msg [::InstallJammer::SubstText [get FailureMessage]]
if {$msg ne ""} {
::InstallJammer::Message -icon error -message $msg
}

if {$::info(GuiMode)} {
::set focus [::InstallJammer::GetWidget [get FailureFocus]]
if {[winfo exists $focus]} { focus -force $focus }
}
}

::InstallJammer::CurrentObject pop

return $res
}

method type {} {
return $type
}

method id        { args } { eval cfgvar id        $args }
method title     { args } { eval cfgvar title     $args }
method active    { args } { eval cfgvar active    $args }
method component { args } { eval cfgvar component $args }

public variable id        ""
public variable type      "condition"
public variable title     ""
public variable active    1
public variable parent    ""
public variable component ""
} ; ## ::itcl::class Condition


proc ::installkit::base { {installkit ""} } {
global conf
global info

if {[info exists conf(BuildingInstallkit)]} {
vwait ::conf(BuildingInstallkit)
}

set conf(BuildingInstallkit) 1

if {$installkit eq ""} {
set installkit [::InstallJammer::TmpDir installkit$info(Ext)]
}

if {![file exists $installkit]} {
set installkit [::InstallJammer::Wrap -o $installkit]
}

unset conf(BuildingInstallkit)

return [::InstallJammer::Normalize $installkit]
}

proc ::installkit::Mount { crapFile mountPoint } {
crapvfs::mount $crapFile $mountPoint
}

proc ::installkit::Unmount { mountPoint } {
crapvfs::unmount $mountPoint
}

proc ::InstallAPI::SetVirtualText {args} {
variable ::InstallJammer::UpdateVarCmds
variable ::InstallJammer::AutoUpdateVars

::InstallAPI::ParseArgs _args $args {
-action      { string  0 }
-command     { string  0 }
-autoupdate  { boolean 0 }
-language    { string  0 None }
-value       { string  0 }
-virtualtext { string  1 }
}

set var $_args(-virtualtext)

set val ""

if {[info exists _args(-value)]} {
set val $_args(-value)

if {$_args(-language) eq "None"} {
set ::info($var) $val
} else {
global languages
set lang $languages($_args(-language))
::msgcat::mcset $lang $var $val
}
}

if {[info exists _args(-action)] && $_args(-action) ne ""} {
set command [list ::InstallJammer::ExecuteAction $_args(-action)]
}

if {[info exists _args(-command)] && $_args(-command) ne ""} {
set command $_args(-command)
}

if {[info exists command]} {
lappend UpdateVarCmds($var) $command

if {[info exists ::info($var)]} {
uplevel #0 $command
}
}

if {[info exists _args(-autoupdate)]} {
set auto $_args(-autoupdate)
if {$auto && ![info exists AutoUpdateVars($var)]} {
set AutoUpdateVars($var) $val
::InstallJammer::UpdateWidgets -updateidletasks 1
} elseif {!$auto && [info exists AutoUpdateVars($var)]} {
unset AutoUpdateVars($var)
::InstallJammer::UpdateWidgets -updateidletasks 1
}
}
}

proc ::InstallAPI::PromptForDirectory {args} {
global conf

::InstallAPI::ParseArgs _args $args {
-title       { string 0 "<%PromptForDirectoryTitle%>"}
-message     { string 0 "<%PromptForDirectoryMessage%>"}
-variable    { string 0 }
-initialdir  { string 0 }
-normalize   { string 0 "platform" }
-virtualtext { string 0 }
}

set normalize $_args(-normalize)
unset _args(-normalize)

if {[info exists _args(-virtualtext)]} {
set _args(-variable) ::info($_args(-virtualtext))
unset _args(-virtualtext)
}

if {[info exists _args(-variable)]} {
set varName $_args(-variable)
upvar 1 $varName dir
unset _args(-variable)
}

if {[info exists _args(-initialdir)]} {
set dir $_args(-initialdir)
} elseif {[info exists dir]} {
set _args(-initialdir) $dir
}

set _args(-title)   [::InstallJammer::SubstText $_args(-title)]
set _args(-message) [::InstallJammer::SubstText $_args(-message)]

if {[llength $conf(ParentWindow)] > 1} {
wm withdraw [lindex $conf(ParentWindow) end]
}

set res [eval ::ChooseDirectory .__choose_directory  [list -parent [::InstallJammer::TransientParent]] [array get _args]]

if {[llength $conf(ParentWindow)] > 1} {
wm deiconify [lindex $conf(ParentWindow) end]
}

if {$res ne ""} {
set dir $res
if {$conf(windows) && [file exists $dir]} {
set dir [file attributes $dir -longname]
}

set dir [::InstallJammer::Normalize $dir $normalize]
}

if {[info exists varName]} { set $varName $dir }

::InstallJammer::UpdateWidgets

return $dir
}

proc ::InstallAPI::FindProcesses {args} {
global conf

::InstallAPI::ParseArgs _args $args {
-pid   { string 0 "" }
-name  { string 0 "" }
-user  { string 0 "" }
-group { string 0 "" }
}

if {$conf(windows)} {
if {[info exists _args(-pid)]} {
set pid $_args(-pid)
return [expr {[twapi::process_exists $pid] ? $pid : ""}]
}

set opts {}

if {[info exists _args(-name)]} {
lappend opts -name $_args(-name)
}

if {[info exists _args(-user)]} {
lappend opts -user $_args(-user)
}

return [eval twapi::get_process_ids $opts]
} else {
if {![info exists conf(OldPS)]} {
set conf(OldPS) [catch { exec ps -C ps }]
}

set ps     [list ps]
set all    0
set format "pid"

if {$_args(-pid) ne ""} {
lappend ps -p $_args(-pid)
}

if {$_args(-name) ne ""} {
if {$conf(OldPS)} {
set all 1
lappend format comm
} else {
lappend ps -C $_args(-name)
}
}

if {$_args(-user) ne ""} {
set all 0
lappend ps -U $_args(-user)
}

if {$_args(-group) ne ""} {
set all 0
lappend ps -G $_args(-group)
}

if {$all} { lappend ps -ae }

lappend ps -o $format

if {![catch { eval exec $ps } result]} {
set pids [list]
foreach list [lrange [split [string trim $result] \n] 1 end] {
if {[llength $list] > 1} {
set command [file tail [lindex $list 1]]
if {$_args(-name) ne $command} { continue }
}
lappend pids [lindex $list 0]
}
return $pids
}
}
}

proc ::InstallAPI::SetActiveSetupType {args} {
global info

::InstallAPI::ParseArgs _args $args {
-setuptype  { string  1 }
}

if {[::InstallJammer::ObjExists $_args(-setuptype)]} {
set obj  $_args(-setuptype)
set name [$obj name]

if {![$obj is setuptype]} {
return -code error "$obj is not a valid Setup Type object"
}
} else {
set name $_args(-setuptype)

set setups [SetupTypes children]
set obj [::InstallJammer::FindObjByName $name [SetupTypes children]]
if {$obj eq ""} {
return -code error "Could not find Setup Type '$name'"
}
}

set info(InstallType)   $name
set info(InstallTypeID) $obj
}

proc ::InstallAPI::SetUpdateWidgets {args} {
global conf

::InstallAPI::ParseArgs _args $args {
-widgets  { string 1 }
}

set conf(UpdateWidgets) {}
foreach widget $_args(-widgets) {
lappend conf(UpdateWidgets) [join $widget ""]
}
}

proc ::InstallAPI::ParseArgs {_arrayName _arglist optionspec} {
debug "API Call: [info level -1]"

upvar 1 $_arrayName array

if {[expr {[llength $_arglist] % 2}]} {
if {$_arglist ne "-?"} {
set proc [lindex [info level -1] 0]
return -code error "invalid number of arguments passed to $proc: all arguments must be key-value pairs"
}
}

array set options {
-subst       { string  0 0 }
-errorvar    { string  0 }
-returnerror { boolean 0 }
}

array set options $optionspec

set optionlist [lsort [array names options]]

set required [list]
foreach option $optionlist {
if {[lindex $options($option) 1]} {
lappend required $option
} elseif {[llength $options($option)] > 2} {
set array($option) [lindex $options($option) 2]
}
}

if {(![llength $_arglist] && [llength $required]) || $_arglist eq "-?"} {
set help "Usage: [lindex [info level -1] 0] ?option value ...?"
append help "\n\nOptions:"
foreach option $optionlist {
set type     [lindex $options($option) 0]
set required [lindex $options($option) 1]
set default  [lindex $options($option) 2]
set choices  [lindex $options($option) 3]

append help "\n\t"

if {!$required} { append help ? }
append help $option

if {$type eq "choice"} {
append help " [join $choices " | "]"
} elseif {$type eq "boolean"} {
append help " 0 | 1"
} else {
append help " [string range $option 1 end]"
}

if {$default ne ""} { append help " (Default: $default)" }

if {!$required} { append help ? }
}

return -code error $help
}

if {[expr {[llength $_arglist] % 2}]} {
return -code error "invalid number of arguments"
}

foreach {option value} $_arglist {
set option [string tolower $option]

if {![info exists options($option)]} {
return -code error "invalid option $option"
}

set array($option) $value

set type [lindex $options($option) 0]
if {$type eq "string"} {
if {$array(-subst)} {
set array($option) [::InstallJammer::SubstText $value]
}
} elseif {$type eq "boolean"} {
if {![string is boolean -strict $value]} {
return -code error "invalid boolean value for $option"
}
} elseif {$type eq "choice"} {
set values [lindex $options($option) 3]
if {[lsearch -exact $values $value] < 0} {
set x "[string range $option 1 end] value"
return -code error [BWidget::badOptionString $x $value $values]
}
}
}

foreach option $required {
if {![info exists array($option)]} {
return -code error "missing required option $option"
}
}

unset array(-subst)

if {![info exists array(-returnerror)]} {
set array(-returnerror) 1
if {[info exists array(-errorvar)]} {
set array(-returnerror) 0
uplevel 1 [list upvar 1 $array(-errorvar) error]
}
}
}
} uninstall.tcl {
if {[info exists ::InstallJammer]} { return }

namespace eval ::InstallAPI {}
namespace eval ::InstallJammer {}

set ::debug   "on"
set ::verbose 0

set ::conf(osx)      [string equal $::tcl_platform(os) "Darwin"]
set ::conf(unix)     [string equal $::tcl_platform(platform) "unix"]
set ::conf(windows)  [string equal $::tcl_platform(platform) "windows"]

set ::conf(threaded) [info exists ::tcl_platform(threaded)]

set ::info(Debugging) 0

trace add variable ::info write ::InstallJammer::VirtualTextTrace

proc ::InstallJammer::VirtualTextTrace { name1 name2 op } {
upvar #0 ::info($name2) var

if {[info exists ::InstallJammer::UpdateVarCmds($name2)]} {
foreach cmd $::InstallJammer::UpdateVarCmds($name2) {
uplevel #0 $cmd
}
}

if {[info exists ::InstallJammer::AutoUpdateVars($name2)]
&& $var ne $::InstallJammer::AutoUpdateVars($name2)} {
set ::InstallJammer::AutoUpdateVars($name2) $var
::InstallJammer::UpdateWidgets -updateidletasks 1
}
}

proc ::InstallJammer::SourceCachedFile { file {namespace "::"} } {
if {[info exists ::InstallJammer::files($file)]} {
namespace eval $namespace $::InstallJammer::files($file)
return 1
}
return 0
}
array set ::InstallJammer::CommandLineOptions {
debugconsole
{ShowConsole Switch Yes No {} {run uninstaller with a debug console open}}

mode
{UninstallMode Choice No No {Console Silent Standard} {set the mode to run the uninstaller in}}

test
{Testing Switch Yes No {} {run uninstaller without uninstalling any files}}

}

set PaneList {Uninstall UninstallComplete UninstallDetails}
array set ::InstallJammer::Properties {
19575E4F-426E-D67A-A2B5-F4FF3D3C2E48,Active
Yes

19575E4F-426E-D67A-A2B5-F4FF3D3C2E48,Alias
{Startup Actions}

19575E4F-426E-D67A-A2B5-F4FF3D3C2E48,Conditions
{0 conditions}

19575E4F-426E-D67A-A2B5-F4FF3D3C2E48,ID
{}

1DB48011-D41C-AA1E-206F-D6AD5EC08E98,Action
{Uninstall Actions}

1DB48011-D41C-AA1E-206F-D6AD5EC08E98,Active
Yes

1DB48011-D41C-AA1E-206F-D6AD5EC08E98,Component
{}

1DB48011-D41C-AA1E-206F-D6AD5EC08E98,Conditions
{}

1DB48011-D41C-AA1E-206F-D6AD5EC08E98,EvaluateConditions
Yes

1DB48011-D41C-AA1E-206F-D6AD5EC08E98,ExecuteAction
{After Pane is Displayed}

1DB48011-D41C-AA1E-206F-D6AD5EC08E98,ID
{}

1DB48011-D41C-AA1E-206F-D6AD5EC08E98,IgnoreErrors
No

5C7C0690-2F4B-9108-1252-7B7CB96F9BBF,Active
Yes

5C7C0690-2F4B-9108-1252-7B7CB96F9BBF,Comment
{Ask the user if they want to proceed with the uninstall.}

5C7C0690-2F4B-9108-1252-7B7CB96F9BBF,Component
{}

5C7C0690-2F4B-9108-1252-7B7CB96F9BBF,Conditions
{2 conditions}

5C7C0690-2F4B-9108-1252-7B7CB96F9BBF,ExecuteAction
{After Pane is Displayed}

5C7C0690-2F4B-9108-1252-7B7CB96F9BBF,ExitType
Cancel

5C7C0690-2F4B-9108-1252-7B7CB96F9BBF,ID
{}

5C7C0690-2F4B-9108-1252-7B7CB96F9BBF,IgnoreErrors
No

63831127-5A65-DA44-4ED2-ED24BB923572,Active
Yes

63831127-5A65-DA44-4ED2-ED24BB923572,Alias
{Uninstall Actions}

63831127-5A65-DA44-4ED2-ED24BB923572,Conditions
{0 conditions}

63831127-5A65-DA44-4ED2-ED24BB923572,ID
{}

69A2A177-FC12-F18C-FB99-67C3AC5C9E7D,Active
Yes

69A2A177-FC12-F18C-FB99-67C3AC5C9E7D,Component
{}

69A2A177-FC12-F18C-FB99-67C3AC5C9E7D,Conditions
{}

69A2A177-FC12-F18C-FB99-67C3AC5C9E7D,ExecuteAction
{After Pane is Displayed}

69A2A177-FC12-F18C-FB99-67C3AC5C9E7D,ExitType
Finish

69A2A177-FC12-F18C-FB99-67C3AC5C9E7D,ID
{}

69A2A177-FC12-F18C-FB99-67C3AC5C9E7D,IgnoreErrors
No

72A1FC56-A3AC-2105-DA7D-B11AEC75993E,Active
Yes

72A1FC56-A3AC-2105-DA7D-B11AEC75993E,CheckCondition
{Before Action is Executed}

72A1FC56-A3AC-2105-DA7D-B11AEC75993E,Component
{}

72A1FC56-A3AC-2105-DA7D-B11AEC75993E,FailureFocus
{}

72A1FC56-A3AC-2105-DA7D-B11AEC75993E,FailureMessage
{}

72A1FC56-A3AC-2105-DA7D-B11AEC75993E,ID
{}

72A1FC56-A3AC-2105-DA7D-B11AEC75993E,Operator
true

72A1FC56-A3AC-2105-DA7D-B11AEC75993E,String
<%GuiMode%>

7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5,Action
{Uninstall Actions}

7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5,Active
Yes

7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5,Component
{}

7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5,Conditions
{0 conditions}

7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5,EvaluateConditions
Yes

7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5,ExecuteAction
{After Pane is Displayed}

7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5,ID
{}

7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5,IgnoreErrors
No

8D3722F8-BA23-F5B9-73B0-B18088989F1E,Active
Yes

8D3722F8-BA23-F5B9-73B0-B18088989F1E,AllowQuit
Yes

8D3722F8-BA23-F5B9-73B0-B18088989F1E,Component
{}

8D3722F8-BA23-F5B9-73B0-B18088989F1E,Conditions
{}

8D3722F8-BA23-F5B9-73B0-B18088989F1E,ExecuteAction
{After Pane is Displayed}

8D3722F8-BA23-F5B9-73B0-B18088989F1E,ID
{}

8D3722F8-BA23-F5B9-73B0-B18088989F1E,IgnoreErrors
No

8D3722F8-BA23-F5B9-73B0-B18088989F1E,Message,subst
1

8D3722F8-BA23-F5B9-73B0-B18088989F1E,PaginateMessage
Yes

8D3722F8-BA23-F5B9-73B0-B18088989F1E,WrapText
Yes

9459EC03-BD08-065D-85FE-7ECB05799482,Active
Yes

9459EC03-BD08-065D-85FE-7ECB05799482,Component
{}

9459EC03-BD08-065D-85FE-7ECB05799482,Conditions
{0 conditions}

9459EC03-BD08-065D-85FE-7ECB05799482,ExecuteAction
{After Pane is Displayed}

9459EC03-BD08-065D-85FE-7ECB05799482,ID
{}

9459EC03-BD08-065D-85FE-7ECB05799482,IgnoreErrors
No

976A3095-B0AF-DD3D-9D9D-B9E618FF49B8,Active
Yes

976A3095-B0AF-DD3D-9D9D-B9E618FF49B8,Alias
{Finish Actions}

976A3095-B0AF-DD3D-9D9D-B9E618FF49B8,Conditions
{0 conditions}

976A3095-B0AF-DD3D-9D9D-B9E618FF49B8,ID
{}

9ABA2147-A04C-49F5-A06A-5F389E58E017,Active
Yes

9ABA2147-A04C-49F5-A06A-5F389E58E017,CheckCondition
{Before Action is Executed}

9ABA2147-A04C-49F5-A06A-5F389E58E017,Component
{}

9ABA2147-A04C-49F5-A06A-5F389E58E017,DefaultButton
Yes

9ABA2147-A04C-49F5-A06A-5F389E58E017,FailureFocus
{}

9ABA2147-A04C-49F5-A06A-5F389E58E017,FailureMessage
{}

9ABA2147-A04C-49F5-A06A-5F389E58E017,ID
{}

9ABA2147-A04C-49F5-A06A-5F389E58E017,Icon
info

9ABA2147-A04C-49F5-A06A-5F389E58E017,Message,subst
1

9ABA2147-A04C-49F5-A06A-5F389E58E017,ResultVirtualText
Answer

9ABA2147-A04C-49F5-A06A-5F389E58E017,Title,subst
1

9ABA2147-A04C-49F5-A06A-5F389E58E017,TrueValue
No

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,Active
Yes

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,Component
{}

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,Conditions
{}

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,Default
Yes

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,ExecuteAction
{After Pane is Displayed}

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,ID
{}

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,IgnoreErrors
No

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,Prompt
<%UninstallStartupText%>

9F8AFA18-08BD-4746-1CF7-6A889DDE0671,VirtualText
Answer

AB7687C5-C2D4-ACBD-F7C6-EB90D67A2B14,Active
Yes

AB7687C5-C2D4-ACBD-F7C6-EB90D67A2B14,Alias
{Cancel Actions}

AB7687C5-C2D4-ACBD-F7C6-EB90D67A2B14,Conditions
{0 conditions}

AB7687C5-C2D4-ACBD-F7C6-EB90D67A2B14,ID
{}

AIX-ppc,Active
No

AIX-ppc,DefaultDirectoryPermission
0755

AIX-ppc,DefaultFilePermission
0755

AIX-ppc,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

AIX-ppc,FallBackToConsole
Yes

AIX-ppc,InstallDir
<%Home%>/<%ShortAppName%>

AIX-ppc,InstallMode
Standard

AIX-ppc,InstallType
Typical

AIX-ppc,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

AIX-ppc,ProgramFolderAllUsers
No

AIX-ppc,ProgramFolderName
<%AppName%>

AIX-ppc,ProgramLicense
<%InstallDir%>/LICENSE.txt

AIX-ppc,ProgramName
{}

AIX-ppc,ProgramReadme
<%InstallDir%>/README.txt

AIX-ppc,PromptForRoot
Yes

AIX-ppc,RequireRoot
No

AIX-ppc,RootInstallDir
/usr/local/<%ShortAppName%>

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Active
Yes

B74F7D6B-E488-489F-9A42-BEB18C73F13F,BackButton,subst
1

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Buttons
Next/Cancel

B74F7D6B-E488-489F-9A42-BEB18C73F13F,CancelButton,subst
1

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Caption,subst
1

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Component
{}

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Conditions
{1 condition}

B74F7D6B-E488-489F-9A42-BEB18C73F13F,ID
{}

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Icon
<%Icon%>

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Message,subst
1

B74F7D6B-E488-489F-9A42-BEB18C73F13F,NextButton,subst
1

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Subtitle,subst
1

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Text,subst
1

B74F7D6B-E488-489F-9A42-BEB18C73F13F,Title,subst
1

B8B24DF6-4D75-4ACF-8AFE-F0D930379927,Active
Yes

B8B24DF6-4D75-4ACF-8AFE-F0D930379927,CheckCondition
{Before Action is Executed}

B8B24DF6-4D75-4ACF-8AFE-F0D930379927,Component
{}

B8B24DF6-4D75-4ACF-8AFE-F0D930379927,FailureFocus
{}

B8B24DF6-4D75-4ACF-8AFE-F0D930379927,FailureMessage
{}

B8B24DF6-4D75-4ACF-8AFE-F0D930379927,ID
{}

B8B24DF6-4D75-4ACF-8AFE-F0D930379927,Operator
false

B8B24DF6-4D75-4ACF-8AFE-F0D930379927,String
<%Answer%>

C9880F02-5EB9-4778-8902-2008293F3CE0,Action
{Uninstall Actions}

C9880F02-5EB9-4778-8902-2008293F3CE0,Active
Yes

C9880F02-5EB9-4778-8902-2008293F3CE0,Component
{}

C9880F02-5EB9-4778-8902-2008293F3CE0,Conditions
{}

C9880F02-5EB9-4778-8902-2008293F3CE0,EvaluateConditions
Yes

C9880F02-5EB9-4778-8902-2008293F3CE0,ExecuteAction
{After Pane is Displayed}

C9880F02-5EB9-4778-8902-2008293F3CE0,ID
{}

C9880F02-5EB9-4778-8902-2008293F3CE0,IgnoreErrors
No

C9CE9239-3C5E-97E6-0F98-4619F52759BB,Active
Yes

C9CE9239-3C5E-97E6-0F98-4619F52759BB,BackButton,subst
1

C9CE9239-3C5E-97E6-0F98-4619F52759BB,Buttons
Next/Cancel

C9CE9239-3C5E-97E6-0F98-4619F52759BB,CancelButton,subst
1

C9CE9239-3C5E-97E6-0F98-4619F52759BB,Caption,subst
1

C9CE9239-3C5E-97E6-0F98-4619F52759BB,Component
{}

C9CE9239-3C5E-97E6-0F98-4619F52759BB,Conditions
{}

C9CE9239-3C5E-97E6-0F98-4619F52759BB,ID
{}

C9CE9239-3C5E-97E6-0F98-4619F52759BB,Image
<%Image%>

C9CE9239-3C5E-97E6-0F98-4619F52759BB,Message,subst
1

C9CE9239-3C5E-97E6-0F98-4619F52759BB,NextButton,subst
1

C9CE9239-3C5E-97E6-0F98-4619F52759BB,WizardOptions
{-bg white -separator 0}

D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106,Active
Yes

D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106,Component
{}

D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106,Conditions
{}

D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106,ExecuteAction
{After Pane is Displayed}

D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106,ExitType
Cancel

D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106,ID
{}

D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106,IgnoreErrors
No

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Active
Yes

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,BackButton,subst
1

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Buttons
Next/Cancel

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,CancelButton,subst
1

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Caption,subst
1

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Component
{}

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Conditions
{0 conditions}

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,FileValue,subst
1

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,ID
{}

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Icon
<%Icon%>

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Message,subst
1

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,NextButton,subst
1

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,ProgressValue,subst
1

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Subtitle,subst
1

E3A9B2B7-66C3-77C4-5DB2-F25E797E1697,Title,subst
1

E51C1501-7EA8-0F27-F3BE-C7B1954C361F,Active
Yes

E51C1501-7EA8-0F27-F3BE-C7B1954C361F,Component
{}

E51C1501-7EA8-0F27-F3BE-C7B1954C361F,Conditions
{}

E51C1501-7EA8-0F27-F3BE-C7B1954C361F,ExecuteAction
{After Pane is Displayed}

E51C1501-7EA8-0F27-F3BE-C7B1954C361F,ExitType
Finish

E51C1501-7EA8-0F27-F3BE-C7B1954C361F,ID
{}

E51C1501-7EA8-0F27-F3BE-C7B1954C361F,IgnoreErrors
No

ECEC8AD9-CD06-E158-AD89-F1055F90DD01,Active
Yes

ECEC8AD9-CD06-E158-AD89-F1055F90DD01,Component
{}

ECEC8AD9-CD06-E158-AD89-F1055F90DD01,Conditions
{0 conditions}

ECEC8AD9-CD06-E158-AD89-F1055F90DD01,ExecuteAction
{After Pane is Displayed}

ECEC8AD9-CD06-E158-AD89-F1055F90DD01,ID
{}

ECEC8AD9-CD06-E158-AD89-F1055F90DD01,IgnoreErrors
No

F3B2BC0E-685C-2E69-AC75-2C946771EC85,Active
Yes

F3B2BC0E-685C-2E69-AC75-2C946771EC85,AllowQuit
Yes

F3B2BC0E-685C-2E69-AC75-2C946771EC85,Component
{}

F3B2BC0E-685C-2E69-AC75-2C946771EC85,Conditions
{}

F3B2BC0E-685C-2E69-AC75-2C946771EC85,ExecuteAction
{After Pane is Displayed}

F3B2BC0E-685C-2E69-AC75-2C946771EC85,ID
{}

F3B2BC0E-685C-2E69-AC75-2C946771EC85,IgnoreErrors
No

F3B2BC0E-685C-2E69-AC75-2C946771EC85,Message,subst
1

F3B2BC0E-685C-2E69-AC75-2C946771EC85,PaginateMessage
Yes

F3B2BC0E-685C-2E69-AC75-2C946771EC85,WrapText
Yes

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,Active
Yes

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,Component
{}

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,Conditions
{0 conditions}

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,ExecuteAction
{After Pane is Displayed}

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,ID
{}

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,IgnoreErrors
No

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,State
disabled

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,Text
{}

F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE,Widget
{NextButton; CancelButton}

FA3D5E38-91F2-B088-5EBD-2A3CAB37DBCB,Active
Yes

FA3D5E38-91F2-B088-5EBD-2A3CAB37DBCB,Alias
{Setup Actions}

FA3D5E38-91F2-B088-5EBD-2A3CAB37DBCB,Conditions
{0 conditions}

FA3D5E38-91F2-B088-5EBD-2A3CAB37DBCB,ID
{}

FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809,Active
Yes

FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809,CheckCondition
{Before Pane is Displayed}

FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809,Component
{}

FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809,FailureFocus
{}

FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809,FailureMessage
{}

FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809,ID
{}

FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809,Operator
true

FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809,String
<%ErrorsOccurred%>

FreeBSD-4-x86,Active
No

FreeBSD-4-x86,DefaultDirectoryPermission
0755

FreeBSD-4-x86,DefaultFilePermission
0755

FreeBSD-4-x86,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

FreeBSD-4-x86,FallBackToConsole
Yes

FreeBSD-4-x86,InstallDir
<%Home%>/<%ShortAppName%>

FreeBSD-4-x86,InstallMode
Standard

FreeBSD-4-x86,InstallType
Typical

FreeBSD-4-x86,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

FreeBSD-4-x86,ProgramFolderAllUsers
No

FreeBSD-4-x86,ProgramFolderName
<%AppName%>

FreeBSD-4-x86,ProgramLicense
<%InstallDir%>/LICENSE.txt

FreeBSD-4-x86,ProgramName
{}

FreeBSD-4-x86,ProgramReadme
<%InstallDir%>/README.txt

FreeBSD-4-x86,PromptForRoot
Yes

FreeBSD-4-x86,RequireRoot
No

FreeBSD-4-x86,RootInstallDir
/usr/local/<%ShortAppName%>

FreeBSD-x86,Active
No

FreeBSD-x86,DefaultDirectoryPermission
0755

FreeBSD-x86,DefaultFilePermission
0755

FreeBSD-x86,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

FreeBSD-x86,FallBackToConsole
Yes

FreeBSD-x86,InstallDir
<%Home%>/<%ShortAppName%>

FreeBSD-x86,InstallMode
Standard

FreeBSD-x86,InstallType
Typical

FreeBSD-x86,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

FreeBSD-x86,ProgramFolderAllUsers
No

FreeBSD-x86,ProgramFolderName
<%AppName%>

FreeBSD-x86,ProgramLicense
<%InstallDir%>/LICENSE.txt

FreeBSD-x86,ProgramName
{}

FreeBSD-x86,ProgramReadme
<%InstallDir%>/README.txt

FreeBSD-x86,PromptForRoot
Yes

FreeBSD-x86,RequireRoot
No

FreeBSD-x86,RootInstallDir
/usr/local/<%ShortAppName%>

HPUX-hppa,Active
No

HPUX-hppa,DefaultDirectoryPermission
0755

HPUX-hppa,DefaultFilePermission
0755

HPUX-hppa,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

HPUX-hppa,FallBackToConsole
Yes

HPUX-hppa,InstallDir
<%Home%>/<%ShortAppName%>

HPUX-hppa,InstallMode
Standard

HPUX-hppa,InstallType
Typical

HPUX-hppa,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

HPUX-hppa,ProgramFolderAllUsers
No

HPUX-hppa,ProgramFolderName
<%AppName%>

HPUX-hppa,ProgramLicense
<%InstallDir%>/LICENSE.txt

HPUX-hppa,ProgramName
{}

HPUX-hppa,ProgramReadme
<%InstallDir%>/README.txt

HPUX-hppa,PromptForRoot
Yes

HPUX-hppa,RequireRoot
No

HPUX-hppa,RootInstallDir
/usr/local/<%ShortAppName%>

Linux-x86,Active
Yes

Linux-x86,DefaultDirectoryPermission
0755

Linux-x86,DefaultFilePermission
0755

Linux-x86,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

Linux-x86,FallBackToConsole
Yes

Linux-x86,InstallDir
<%Home%>/<%ShortAppName%>

Linux-x86,InstallMode
Standard

Linux-x86,InstallType
Typical

Linux-x86,ProgramExecutable
<%InstallDir%>/chronojump-<%InstallVersion%>/linux/chronojump.sh

Linux-x86,ProgramFolderAllUsers
No

Linux-x86,ProgramFolderName
<%AppName%>

Linux-x86,ProgramLicense
<%InstallDir%>/LICENSE.txt

Linux-x86,ProgramName
{}

Linux-x86,ProgramReadme
<%InstallDir%>/README.txt

Linux-x86,PromptForRoot
Yes

Linux-x86,RequireRoot
No

Linux-x86,RootInstallDir
/usr/local/<%ShortAppName%>

MacOS-X,Active
No

MacOS-X,DefaultDirectoryPermission
0755

MacOS-X,DefaultFilePermission
0755

MacOS-X,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

MacOS-X,FallBackToConsole
Yes

MacOS-X,InstallDir
<%Home%>/<%ShortAppName%>

MacOS-X,InstallMode
Standard

MacOS-X,InstallType
Typical

MacOS-X,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

MacOS-X,ProgramFolderAllUsers
No

MacOS-X,ProgramFolderName
<%AppName%>

MacOS-X,ProgramLicense
<%InstallDir%>/LICENSE.txt

MacOS-X,ProgramName
{}

MacOS-X,ProgramReadme
<%InstallDir%>/README.txt

MacOS-X,PromptForRoot
Yes

MacOS-X,RequireRoot
No

MacOS-X,RootInstallDir
/usr/local/<%ShortAppName%>

Solaris-sparc,Active
No

Solaris-sparc,DefaultDirectoryPermission
0755

Solaris-sparc,DefaultFilePermission
0755

Solaris-sparc,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

Solaris-sparc,FallBackToConsole
Yes

Solaris-sparc,InstallDir
<%Home%>/<%ShortAppName%>

Solaris-sparc,InstallMode
Standard

Solaris-sparc,InstallType
Typical

Solaris-sparc,ProgramExecutable
<%InstallDir%>/windows/chronojump.bat

Solaris-sparc,ProgramFolderAllUsers
No

Solaris-sparc,ProgramFolderName
<%AppName%>

Solaris-sparc,ProgramLicense
<%InstallDir%>/LICENSE.txt

Solaris-sparc,ProgramName
{}

Solaris-sparc,ProgramReadme
<%InstallDir%>/README.txt

Solaris-sparc,PromptForRoot
Yes

Solaris-sparc,RequireRoot
No

Solaris-sparc,RootInstallDir
/usr/local/<%ShortAppName%>

TarArchive,Active
No

TarArchive,CompressionLevel
6

TarArchive,DefaultDirectoryPermission
0755

TarArchive,DefaultFilePermission
0755

TarArchive,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

TarArchive,FallBackToConsole
Yes

TarArchive,InstallDir
<%Home%>/<%ShortAppName%>

TarArchive,InstallMode
Standard

TarArchive,InstallType
Typical

TarArchive,OutputFileName
<%ShortAppName%>-<%Version%>.tar.gz

TarArchive,ProgramExecutable
{}

TarArchive,ProgramFolderAllUsers
No

TarArchive,ProgramFolderName
<%AppName%>

TarArchive,ProgramLicense
<%InstallDir%>/LICENSE.txt

TarArchive,ProgramName
{}

TarArchive,ProgramReadme
<%InstallDir%>/README.txt

TarArchive,PromptForRoot
Yes

TarArchive,RequireRoot
No

TarArchive,RootInstallDir
/usr/local/<%ShortAppName%>

TarArchive,VirtualTextMap
{<%InstallDir%> <%ShortAppName%>}

Windows,Active
Yes

Windows,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

Windows,IncludeTWAPI
No

Windows,InstallDir
<%PROGRAM_FILES%>/<%AppName%>

Windows,InstallMode
Standard

Windows,InstallType
Typical

Windows,ProgramExecutable
<%InstallDir%>/chronojump-<%InstallVersion%>/windows/chronojump.bat

Windows,ProgramFolderAllUsers
No

Windows,ProgramFolderName
<%AppName%>

Windows,ProgramLicense
<%InstallDir%>/LICENSE.txt

Windows,ProgramName
{}

Windows,ProgramReadme
<%InstallDir%>/README.txt

Windows,WindowsIcon
{Setup Blue Screen.ico}

ZipArchive,Active
No

ZipArchive,CompressionLevel
6

ZipArchive,DefaultDirectoryPermission
0755

ZipArchive,DefaultFilePermission
0755

ZipArchive,Executable
<%AppName%>-<%Version%>-<%Platform%>-Install<%Ext%>

ZipArchive,FallBackToConsole
Yes

ZipArchive,InstallDir
<%Home%>/<%ShortAppName%>

ZipArchive,InstallMode
Standard

ZipArchive,InstallType
Typical

ZipArchive,OutputFileName
<%ShortAppName%>-<%Version%>.zip

ZipArchive,ProgramExecutable
{}

ZipArchive,ProgramFolderAllUsers
No

ZipArchive,ProgramFolderName
<%AppName%>

ZipArchive,ProgramLicense
<%InstallDir%>/LICENSE.txt

ZipArchive,ProgramName
{}

ZipArchive,ProgramReadme
<%InstallDir%>/README.txt

ZipArchive,PromptForRoot
Yes

ZipArchive,RequireRoot
No

ZipArchive,RootInstallDir
/usr/local/<%ShortAppName%>

ZipArchive,VirtualTextMap
{<%InstallDir%> <%ShortAppName%>}

}
namespace eval ::InstallJammer::actions {}
namespace eval ::InstallJammer::conditions {}
proc ::InstallJammer::conditions::AskYesOrNo {obj} {
global info

if {$info(SilentMode)} {
debug "Ask Yes or No condition not valid in Silent mode."
debug "Skipping condition and returning $props(TrueValue)."
return $props(TrueValue)
}

$obj properties props

set id [$obj id]

if {$info(ConsoleMode)} {
debug "Using Console Ask Yes or No action in place of Ask Yes or No condition for console install."

$obj set Default     $props(DefaultButton)
$obj set Prompt      [::InstallJammer::GetText $id Message -subst 0]
$obj set VirtualText $props(ResultVirtualText)

set result [::InstallJammer::actions::ConsoleAskYesOrNo $obj]
return [string equal -nocase $result $props(TrueValue)]
}

set title   [::InstallJammer::GetText $id Title]
set message [::InstallJammer::GetText $id Message]

set args [list -type yesno -title $title -message $message]
lappend args -icon $props(Icon)
lappend args -default [string tolower $props(DefaultButton)]
lappend args -parent [::InstallJammer::TransientParent]

set result [eval ::InstallJammer::MessageBox $args]

if {[string length $props(ResultVirtualText)]} {
global info
set info($props(ResultVirtualText)) $result
}

return [string equal -nocase $result $props(TrueValue)]
}

proc ::InstallJammer::actions::ConsoleAskYesOrNo {obj} {
$obj properties props -subst 1

set prompt \n$props(Prompt)

if {$props(Default) eq "None"} {
append prompt { [y/n]}
} elseif {$props(Default) eq "Yes"} {
append prompt { [n/Y]}
} else {
append prompt { [y/N]}
}

append prompt " "

while {1} {
puts -nonewline stdout [::InstallJammer::WrapText $prompt]
flush stdout

set ans [string trim [string tolower [gets stdin]]]

puts  stdout ""
flush stdout

if {$ans eq "" && $props(Default) ne "None"} {
set ans $props(Default)
break
}

if {$ans eq "n"} { set ans "no" }
if {$ans eq "y"} { set ans "yes" }

if {$ans eq "yes" || $ans eq "no"} { break }
}

if {$props(VirtualText) ne ""} {
set ::info($props(VirtualText)) $ans
}

return $ans
}

proc ::InstallJammer::actions::ConsoleMessage {obj} {
global conf

$obj properties props
set message [::InstallJammer::GetText [$obj id] Message]

if {$props(PaginateMessage)} {
set command [list ::more -allowquit $props(AllowQuit)]

if {$props(WrapText)} {
lappend command -width $conf(ConsoleWidth)
}
} else {
set command [list puts stdout]

if {$props(WrapText)} {
set message [::InstallJammer::WrapText $message]
}
}

eval $command [list $message]
}

proc ::InstallJammer::actions::ExecuteAction {obj} {
set id [$obj id]

$obj properties props -subst 1

if {$props(Action) eq ""} {
return -code error "Error in Execute Action: Action is empty"
}

set eval   $props(EvaluateConditions)
set action [::InstallJammer::ID $props(Action)]

if {![::InstallJammer::ObjExists $action]} {
return -code error "Error in Execute Action: Action \"$action\" does not exist"
}

if {![$action is action actiongroup]} {
return -code error "Error in Execute Action: \"$action\" is not an action or action group"
}

if {[$action is action]} {
::InstallJammer::ExecuteActions $action -parent $id -conditions $eval
return
}


set when "Before Action is Executed"
if {$eval && ![$action checkConditions $when]} {
debug "Skipping action group $id - [$id title] - conditions failed"
return
}

set when "Before Next Action is Executed"
while {1} {
::InstallJammer::ExecuteActions $action -parent $id -conditions $eval
if {!$eval || [$action checkConditions $when]} { break }
}
}

proc ::InstallJammer::actions::Exit {obj} {
global info

if {[$obj get ExitType] eq "Cancel"} {
set info(WizardCancelled) 1
}

foreach command [list ::Exit ::InstallJammer::exit ::exit] {
if {[::InstallJammer::CommandExists $command]} {
$command
}
}
}

proc ::InstallJammer::actions::ModifyWidget {obj} {
global conf
global info

variable hidden

set id     [$obj id]
set parent [$obj parent]

$obj properties props

if {![string length $props(Widget)]} { return }

set allArgs   {}
set labelArgs {}

if {$props(Text) ne ""}  {
lappend labelArgs -text $props(Text)
}

if {$props(State) ne "" && $props(State) ne "hidden"} {
lappend allArgs -state $props(State)
}

set widgets [split $props(Widget) \;]

for {set i 0} {$i < [llength $widgets]} {incr i} {
set name [string trim [lindex $widgets $i]]
set w [join $name ""]
set widget $w

set button 0
if {[lsearch -exact $conf(ButtonWidgets) $widget] > -1} {
set button 1
set w [string tolower [string map {Button ""} $widget]]
}

if {$button} {
set w [$info(Wizard) widget get $w]
} else {
set w [$parent widget get $widget]
}

if {$w eq ""} {
return -code error "bad widget \"$name\""
}

if {$props(Text) ne ""} {
::InstallJammer::SetVirtualText all $parent $widget $props(Text)
}

set class [winfo class $w]
if {$class eq "Frame" || $class eq "TFrame"} {
foreach child [winfo children $w] {
set class [winfo class $child]
if {$class eq "Label" || $class eq "TLabel"} {
eval [list $child configure] $labelArgs
}
eval [list $child configure] $allArgs
}
} else {
eval [list $w configure] $allArgs $labelArgs
}

if {$props(State) eq "hidden" && ![info exists hidden($w)]} {
set manager [winfo manager $w]
set options [$manager info $w]
set hidden($w) [concat $manager configure $w $options]
$manager forget $w
} elseif {$props(State) eq "normal" && [info exists hidden($w)]} {
eval $hidden($w)
unset hidden($w)
}
}

::InstallJammer::UpdateWidgets -buttons 1 -updateidletasks 1
}

proc ::InstallJammer::actions::MoveForward {obj} {
global info

set next [$info(Wizard) step next]

if {![string length $next]} {
debug "No more panes left to move forward... exiting"
::InstallJammer::actions::Exit $obj
} else {
debug "Moving forward to $next"
after 0 [list $info(Wizard) next 1]
}
}

proc ::InstallJammer::conditions::StringIsCondition {obj} {
$obj properties props

debug "Checking to see if $props(String) is $props(Operator)"

set string [::InstallJammer::SubstText $props(String)]

if {$props(Operator) eq "empty"} {
return [expr {[string trim $string] eq ""}]
} elseif {$props(Operator) eq "not empty"} {
return [expr {[string trim $string] ne ""}]
} else {
return [string is $props(Operator) -strict $string]
}
}

proc ::InstallJammer::actions::UninstallSelectedFiles {obj {force 0}} {
global conf
global info

if {[string is true -strict $info(Testing)]} { return }

set id     [$obj id]
set parent [$obj parent]

set info(Errors)                ""
set info(FileBeingUninstalled)  ""
set info(GroupBeingUninstalled) ""
set info(Status)                ""

::InstallAPI::SetUpdateWidgets -widgets  [::InstallJammer::FindUpdateWidgets {Status FileBeingUninstalled  GroupBeingUninstalled UninstallPercentComplete}]

if {!$force} {
set info(Status) "Preparing to uninstall..."

::InstallJammer::GetUninstallInfo

upvar #0 ::uninstall array

if {[info exists conf(AddToUninstall)]} {
foreach line $conf(AddToUninstall) {
lappend array([lindex $line 0]) [lrange $line 1 end]
}
}
} else {
upvar #0 ::leftovers array
}

set fileLen 0
if {[info exists array(:FILE)]} {
set fileLen [llength $array(:FILE)]
}

set dirLen 0
if {[info exists array(:DIR)]} {
set dirLen [llength $array(:DIR)]
}

set regLen 0
if {[info exists array(:REGISTRY)]} {
set regLen [llength $array(:REGISTRY)]
}

set conf(total) [expr $fileLen + $dirLen + $regLen]

set info(GroupBeingUninstalled) "files"
set info(Status) "<%FileBeingUninstalledText%>"

set checkRemove 0
if {[info exists conf(RemoveFromUninstall)]} {
set checkRemove 1
set pattern [join $conf(RemoveFromUninstall) |]
}

for {set i [expr $fileLen -1]} {$i >= 0} {incr i -1} {
set list [lindex $array(:FILE) $i]
set file [lindex $list 0]
set tail [file tail $file]

set info(FileBeingUninstalled) $tail
::InstallJammer::UpdateUninstallProgress

if {$checkRemove && [regexp $pattern $file]} {
if {$::verbose} {
debug "$file removed from uninstall by action."
}
continue
}

if {$::verbose} {
debug "Uninstalling file $file."
}

if {[catch {::InstallJammer::UninstallFile $file} error]} {
debug "Failed to delete $file."
lappend ::leftovers(:FILE) $list
append info(Errors) "$error\n"
}
}

if {$info(Errors) eq ""} {
set conf(UninstallRemoved) 1
::InstallJammer::UninstallFile $conf(uninstall)
}

set info(GroupBeingUninstalled) "directories"
::InstallJammer::UpdateWidgets -update 1

set p $::tcl_platform(platform)
set installdir [::InstallJammer::Normalize $info(InstallDir)]
for {set i [expr $dirLen -1]} {$i >= 0} {incr i -1} {
set list [lindex $array(:DIR) $i]
lassign $list dir forcedir

if {$checkRemove && [regexp $pattern $dir]} {
if {$::verbose} {
debug "$dir removed from uninstall by action."
}
continue
}

set forceDelete $force
if {$forcedir ne ""} {
set forceDelete 1
}

if {$forceDelete} {
set forcedir -force
}

set info(FileBeingUninstalled) [file tail $dir]
::InstallJammer::UpdateUninstallProgress

if {!$forceDelete && ![::InstallJammer::DirIsEmpty $dir]} {
if {[lindex [file split $dir] end] ne $info(Company)} {
lappend ::leftovers(:DIR) $list
append info(Errors) "[::InstallJammer::Normalize $dir $p] "
append info(Errors) "is not empty\n"
}

debug "Skipping non-empty directory $dir."

continue
}

if {$::verbose} {
if {$forceDelete} {
debug "Forcefully deleting directory $dir."
} else {
debug "Deleting directory $dir."
}
}

if {[catch {::InstallJammer::UninstallDirectory $dir $forcedir} err]} {
debug "Failed to delete directory $dir."
append info(Errors) "$err\n"
}
}

if {[info exists array(:ENV)]} {
set info(GroupBeingUninstalled) "environment variables"
::InstallJammer::UpdateWidgets -update 1

if {$conf(windows)} {
foreach list [lreverse $array(:ENV)] {
set conf(UpdateWindowsRegistry) 1

lassign $list var level
set key "<%REG_[string toupper $level]_ENV%>"
set key [::InstallJammer::SubstText $key]

if {[llength $list] == 3} {
set value [lindex $list 2]
debug "Restoring environment variable $var to $value"
catch { registry set $key $var $value expand_sz }
} else {
debug "Deleting environment variable $var."
catch { registry delete $key $var }
}
}
} else {
set ids $conf(UninstallIDs)

foreach list $array(:ENV) {
lappend levels [lindex $list 1]
}

set    pat {; # ADDED BY INSTALLER - DO NOT EDIT OR DELETE}
append pat { THIS COMMENT - ([A-Z0-9-]+) ([A-Z0-9-]+)}

foreach level [lsort -unique $levels] {
set files $conf([string toupper $level 0]RCFiles)

foreach file $files {
if {![file exists $file]} { continue }
if {[catch { read_file $file } contents]} { continue }

set lines {}
foreach line [split $contents \n] {
if {![regexp $pat $line -> appid instid]
|| [lsearch -exact $ids $instid] < 0} {
lappend lines $line
} else {
if {[lindex $lines end] eq ""} {
set lines [lreplace $lines end end]
}
}
}

if {![catch { open $file w } fp]} {
puts  $fp [join $lines \n]
close $fp
}
}
}
}
}

if {[info exists array(:PATH)]} {
set info(GroupBeingUninstalled) "environment variables"
::InstallJammer::UpdateWidgets -update 1

foreach list [lreverse $array(:PATH)] {
set conf(UpdateWindowsRegistry) 1

lassign $list var dirs level

set key   "<%REG_[string toupper $level]_ENV%>"
set key   [::InstallJammer::SubstText $key]
set path  [::installkit::Windows::GetKey $key $var]
set list  [split $path \;]
set lower [split [string tolower $path] \;]

set indexes {}
foreach dir [split $dirs \;] {
set dir [::InstallJammer::Normalize $dir windows]
set chk [string tolower $dir]

eval lappend indexes [lsearch -exact -all $lower $chk]
}

if {[llength $indexes]} {
foreach x [lsort -integer -decreasing $indexes] {
set list [lreplace $list $x $x]
}

set path [join $list \;]

registry set $key $var $path expand_sz
}
}
}

if {$conf(windows)} {
set info(GroupBeingUninstalled) "registry entries"
::InstallJammer::UpdateWidgets -update 1

set command ::InstallJammer::UninstallRegistryKey
for {set i [expr $regLen -1]} {$i >= 0} {incr i -1} {
set list [lindex $array(:REGISTRY) $i]
lassign $list key value
::InstallJammer::UpdateUninstallProgress

if {[catch {eval $command $list} error]} {
lappend ::leftovers(:REGISTRY) $list
append info(Errors) "Could not remove $list: $error\n"
}
}
} elseif {[info exists array(:XDGRESOURCE)]} {
set info(GroupBeingUninstalled) "shortcuts"
::InstallJammer::UpdateWidgets -update 1

if {[::InstallJammer::GetDesktopEnvironment] eq "Gnome"} {
set conf(RestartGnomePanel) 1
}

foreach list [lreverse $array(:XDGRESOURCE)] {
set which [lindex $list 0]
set files [lindex $list 1]
if {$which eq "desktop"} {
catch { eval exec xdg-desktop-icon uninstall --novendor $files }
} elseif {$which eq "menu"} {
set dirfiles  [list]
set deskfiles [list]
foreach file $files {
if {[string match "*.directory" $file]} {
lappend dirfiles $file
} else {
lappend deskfiles $file
}
}

lappend menuUninstall($dirfiles) $deskfiles
}
}

foreach {dirfiles deskfiles} [array get menuUninstall] {
set files [concat $dirfiles $deskfiles]
catch { eval exec xdg-desktop-menu uninstall --novendor $files } res
}
}

set script [::InstallJammer::TmpDir install-cleanup]

set fp [open $script w 0755]
puts $fp "#!/bin/sh\n"

if {[info exists array(:RPM)]} {
foreach list [lreverse $array(:RPM)] {
set db RPM
set package [lindex $list 0]
if {![file exists /tmp/.installjammer.rpm.$package]} {
puts $fp "rpm -e $package"
}
}
}

if {[info exists array(:DPKG)]} {
foreach list [lreverse $array(:DPKG)] {
set db DPKG
set package [lindex $list 0]
puts $fp "dpkg -P $package"
}
}

close $fp

if {[info exists db]} {
set info(FileBeingUninstalled)  "$db database entries"
set info(GroupBeingUninstalled) "package entries"
::InstallJammer::UpdateWidgets -update 1

if {!$info(UserIsRoot)} {
::InstallJammer::ExecAsRoot [list $script] -wait 1
} else {
catch { exec $script } error
}
}

::InstallJammer::CleanupInstallInfoDirs

set info(ErrorsOccurred) [expr {[string length $info(Errors)] > 0}]

::InstallAPI::SetUpdateWidgets -widgets {}

return 1
}


proc CreateWindow.Uninstall {wizard id} {
CreateWindow.CustomBlankPane2 $wizard $id

set base [$id widget get ClientArea]

grid rowconfigure    $base 0 -weight 1
grid columnconfigure $base 0 -weight 1

set frame [frame $base.frame]
grid $frame -row 0 -column 0 -sticky new

grid rowconfigure    $frame 1 -weight 1
grid columnconfigure $frame 0 -weight 1

label $frame.file -anchor w
grid  $frame.file -row 0 -column 0 -sticky new
$id widget set FileValue -widget $frame.file

ttk::progressbar $frame.progress
grid $frame.progress -row 1 -column 0 -sticky ew
$id widget set ProgressValue -widget $frame.progress -type progress
}

proc CreateWindow.UninstallComplete {wizard id} {
CreateWindow.CustomBlankPane1 $wizard $id
}

proc CreateWindow.UninstallDetails {wizard id} {
CreateWindow.CustomTextPane1 $wizard $id
}

proc CreateWindow.CustomBlankPane2 {wizard id} {
set base  [$wizard widget get $id]
set frame $base.titleframe

grid rowconfigure    $base 3 -weight 1
grid columnconfigure $base 0 -weight 1

frame $frame -bd 0 -relief flat -background white
grid  $frame -row 0 -column 0 -sticky nsew

grid rowconfigure    $frame 1 -weight 1
grid columnconfigure $frame 0 -weight 1

Label $frame.title -background white -anchor nw -justify left -autowrap 1  -font TkCaptionFont -textvariable [$wizard variable $id -text1]
grid $frame.title -row 0 -column 0 -sticky new -padx 5 -pady 5
$id widget set Title -widget $frame.title

Label $frame.subtitle -background white -anchor nw -autowrap 1  -justify left -textvariable [$wizard variable $id -text2]
grid $frame.subtitle -row 1 -column 0 -sticky new -padx [list 20 5]
$id widget set Subtitle -widget $frame.subtitle

label $frame.icon -borderwidth 0 -background white -anchor c
grid  $frame.icon -row 0 -column 1 -rowspan 2
$id widget set Icon -widget $frame.icon -type image

Separator $base.separator -relief groove -orient horizontal
grid $base.separator -row 1 -column 0 -sticky ew

Label $base.caption -anchor nw -justify left -autowrap 1  -textvariable [$wizard variable $id -text3]
grid $base.caption -row 2 -sticky nsew -padx 8 -pady [list 8 4]
$id widget set Caption -widget $base.caption

frame $base.clientarea
grid  $base.clientarea -row 3 -sticky nsew -padx 8 -pady 4
$id widget set ClientArea -widget $base.clientarea -type frame

Label $base.message -anchor nw -justify left -autowrap 1  -textvariable [$wizard variable $id -text4]
grid $base.message -row 4 -sticky nsew -padx 8 -pady [list 4 8]
$id widget set Message -widget $base.message
}

proc CreateWindow.CustomBlankPane1 {wizard id} {
set base [$wizard widget get $id]

grid rowconfigure    $base 1 -weight 1
grid columnconfigure $base 1 -weight 1

label $base.image -borderwidth 0
grid  $base.image -row 0 -column 0 -rowspan 2 -sticky nw
$id widget set Image -type image -widget $base.image

Label $base.title -height 3 -bg white -font TkCaptionFont  -autowrap 1 -anchor nw -justify left
grid $base.title -row 0 -column 1 -sticky ew -padx 20 -pady [list 20 10]
$id widget set Caption -type text -widget $base.title

Label $base.message -bg white -autowrap 1 -anchor nw -justify left
grid  $base.message -row 1 -column 1 -sticky news -padx 20
$id widget set Message -type text -widget $base.message

Separator $base.sep -orient horizontal
grid $base.sep -row 2 -column 0 -columnspan 2 -sticky ew
}

proc CreateWindow.CustomTextPane1 {wizard id} {
CreateWindow.CustomBlankPane2 $wizard $id

set base [$id widget get ClientArea]

grid rowconfigure    $base 0 -weight 1
grid columnconfigure $base 0 -weight 1

frame $base.frame
grid  $base.frame -row 0 -column 0 -sticky news

grid rowconfigure    $base.frame 0 -weight 1
grid columnconfigure $base.frame 0 -weight 1

if {![$id get TextFont font]} { set font TkTextFont }

text $base.frame.text  -bg white -font $font -wrap word -highlightthickness 0  -yscrollcommand "$base.frame.vs set"  -xscrollcommand "$base.frame.hs set"
grid $base.frame.text -row 0 -column 0 -sticky news
$id widget set Text -widget $base.frame.text

ttk::scrollbar $base.frame.vs -command "$base.frame.text yview"
grid $base.frame.vs -row 0 -column 1 -sticky ns

ttk::scrollbar $base.frame.hs -command "$base.frame.text xview"  -orient horizontal
grid $base.frame.hs -row 1 -column 0 -sticky ew
}


proc ThemeInit {} {
global info

Wizard $info(Wizard) -width 500 -height 365  -raisecommand  [list RaiseStep %W %S]  -title [::InstallJammer::SubstText "<%UninstallTitleText%>"]  -separatortext [::InstallJammer::SubstText "<%SeparatorText%>"]

bind $info(Wizard) <<WizardFinish>> [list ::InstallJammer::exit 1]

if {$::tcl_platform(platform) eq "unix"} {
$info(Wizard) configure -bg [style configure . -background]
}
}


if {[info exists ::InstallJammer]} { return }

proc ::InstallJammer::UpdateUninstallProgress {} {
global conf
global info

incr0 conf(num)
set pct [expr ($conf(num) * 100) / $conf(total)]
set info(UninstallPercentComplete) $pct

::InstallJammer::UpdateSelectedWidgets
update
}

proc ::InstallJammer::GetUninstallInfo {} {
global conf
global info

set dir   $::installkit::root
set files [glob -nocomplain -dir $dir *.info]
set conf(LogsInUninstaller) 1

if {![llength $files]} {
set conf(LogsInUninstaller) 0
set dir   [::InstallJammer::GetInstallInfoDir]
set files [glob -nocomplain -dir $dir *.info]
}

set uninstaller $info(Uninstaller)

if {$conf(windows)} {
set uninstaller [string tolower [Normalize $uninstaller]]
}

set conf(uninstall)        $uninstaller
set conf(UninstallRemoved) 0

set sort [list]
foreach file $files {
if {[file exists [file root $file].dead]} { continue }

set id [file root [file tail $file]]
::InstallJammer::ReadPropertyFile $file tmp

if {![info exists tmp(Uninstaller)]} {
lappend sort [list $tmp(Date) $id]
continue
}

set tmpuninstaller $tmp(Uninstaller)
if {$conf(windows)} {
set  tmpuninstaller [string tolower [Normalize $tmpuninstaller]]
}

if {$uninstaller eq $tmpuninstaller} {
lappend sort [list $tmp(Date) $id]
}
}

set data ""
foreach list [lsort -integer -index 0 $sort] {
set id [lindex $list 1]

lappend conf(UninstallIDs) $id

set file [file join $dir $id.log]
if {[file exists $file]} {
append data [read_file $file]
}
}

foreach line [split [string trim $data] \n] {
if {[info exists done($line)]} { continue }
set done($line) 1
lappend ::uninstall([lindex $line 0]) [lrange $line 1 end]
}
}

proc ::InstallJammer::CleanupInstallInfoDirs {} {
global info
global conf

if {[string is true -strict $info(Testing)]} { return }

if {![info exists conf(UninstallIDs)]} { return }

debug "Cleaning up install registry..."

set info(Status) "Cleaning up install registry..."
::InstallJammer::UpdateWidgets -update 1

if {!$conf(UninstallRemoved)} {

debug "Uninstaller was not removed."

if {$conf(LogsInUninstaller)} {
debug "Found logs in uninstaller.  Moving them  to new uninstaller."

foreach id $conf(UninstallIDs) {
set file [file join $::installkit::root $id.info]

if {![info exists found]} {
set found $id
file copy -force $file [::InstallJammer::TmpDir]
} else {
close [open [::InstallJammer::TmpDir $id.dead] w]
}
}

set id $found
} else {
debug "Storing install IDs in uninstaller."

foreach id $conf(UninstallIDs) {
set file [file join $info(InstallInfoDir) $id.info]
if {[file exists $file]} {
file copy -force $file [::InstallJammer::TmpDir]
break
}
}
}

set fp [open [::InstallJammer::TmpDir $id.log] w]

foreach var [array names ::leftovers] {
foreach list [lreverse $::leftovers($var)] {
puts $fp [concat $var $list]
}
}

close $fp

::InstallJammer::StoreLogsInUninstall
}

foreach id $conf(UninstallIDs) {
foreach ext {.log .ver .info} {
set file [file join $info(InstallInfoDir) $id$ext]
if {[file exists $file]} {
debug "Deleting $file"
file delete $file
}
}
}

if {[::InstallJammer::DirIsEmpty $info(InstallInfoDir)]} {
debug "Deleting empty registry directory $info(InstallInfoDir)."
catch { file delete -force $info(InstallInfoDir) }
} else {
debug "Will not delete non-empty directory $info(InstallInfoDir)."
}
}

proc ::InstallJammer::exit { {prompt 0} } {
global conf
global info

if {$info(WizardStarted) && !$info(WizardCancelled)} {
::InstallJammer::ExecuteActions "Finish Actions"
} else {
::InstallJammer::ExecuteActions "Cancel Actions"
}

::InstallJammer::CommonExit
}

proc ::InstallJammer::UninstallMain {} {
global conf
global info

if {$::tcl_platform(platform) eq "unix"} {
if {$info(RequireRoot) && !$info(UserIsRoot)} {
::InstallJammer::Message -title "Root Required" -message  "You must be root to run uninstall this application."
exit 1
}
}

if {$info(SilentMode)} {
if {$conf(windows)} {
after 1000
}

::InstallJammer::ExecuteActions "Startup Actions"
::InstallJammer::ExecuteActions Silent
} elseif {$info(ConsoleMode)} {
::InstallJammer::ExecuteActions "Startup Actions"
::InstallJammer::ExecuteActions Console
} else {
::InstallJammer::ExecuteActions "Startup Actions"

set info(WizardStarted) 1
::InstallJammer::CenterWindow $info(Wizard)
::InstallJammer::Wizard next
}
}

proc ::InstallJammer::InitUninstall {} {
global conf
global info
global argv

catch { wm withdraw . }

SourceCachedFile common.tcl

unset -nocomplain info(Temp)
unset -nocomplain info(TempRoot)

set info(RunningInstaller)   0
set info(RunningUninstaller) 1

::InstallJammer::CommonInit

if {$conf(windows)} {
set uninstall $conf(exe)
set test [file join [file dirname $uninstall] .uninstall]
if {![file exists $test]} {
set new [::InstallJammer::TmpDir [file tail $uninstall]]
file copy $uninstall $new
close [open [::InstallJammer::TmpDir .uninstall] w]
eval exec [list $new] $argv &
::exit
}

set info(Temp) [file dirname $uninstall]
cd $info(Temp)
}

::InstallJammer::ReadMessageCatalog messages

set conf(mode)  "UninstallMode"
set conf(stop)  [::InstallJammer::TmpDir .stop]
set conf(pause) [::InstallJammer::TmpDir .pause]

array set info {
ErrorsOccurred            0
RunningUninstaller        1
FileBeingUninstalled      ""
GroupBeingUninstalled     ""
UninstallPercentComplete  0
}

set info(Status) "Preparing to uninstall..."

SafeArraySet info {
FileBeingUninstalledText  "Removing <%FileBeingUninstalled%>"
GroupBeingUninstalledText "Removing <%GroupBeingUninstalled%>"
}

::InstallJammer::ParseCommandLineArguments $::argv

::InstallJammer::LoadTwapi

if {$info(GuiMode)} {
SourceCachedFile gui.tcl
InitGui
}

::InstallJammer::ConfigureBidiFonts
}

::InstallJammer::InitUninstall




proc RaiseStep { wizard id } {
set widget [$id widget get Caption]
if {$widget ne ""} {
if {![string length [::InstallJammer::GetText $id Caption]]} {
grid remove $widget
} else {
grid $widget
}
}

set widget [$id widget get Message]
if {$widget ne ""} {
if {![string length [::InstallJammer::GetText $id Message]]} {
grid remove $widget
} else {
grid $widget
}
}

set widget [$id widget get ClientArea]
if {$widget ne ""} {
grid configure $wizard.buttons -pady {18 5}
} else {
grid configure $wizard.buttons -pady 5
}
}

InstallType ::Common
InstallType ::Standard
InstallComponent E3A9B2B7-66C3-77C4-5DB2-F25E797E1697 -setup Uninstall -type pane -title Uninstall -component Uninstall -active Yes -parent Standard
InstallComponent F4E22616-C4CF-BBE4-B946-A66B8CBAA6AE -setup Uninstall -type action -title {Modify Widget} -component ModifyWidget -active Yes -parent E3A9B2B7-66C3-77C4-5DB2-F25E797E1697
InstallComponent 7DA30E38-9A1A-7168-ADDB-15EC6BF3D3B5 -setup Uninstall -type action -title {Execute Action} -component ExecuteAction -active Yes -parent E3A9B2B7-66C3-77C4-5DB2-F25E797E1697
InstallComponent 9459EC03-BD08-065D-85FE-7ECB05799482 -setup Uninstall -type action -title {Move Forward} -component MoveForward -active Yes -parent E3A9B2B7-66C3-77C4-5DB2-F25E797E1697
InstallComponent B74F7D6B-E488-489F-9A42-BEB18C73F13F -setup Uninstall -type pane -conditions FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809 -title {Uninstall Details} -component UninstallDetails -command insert -active Yes -parent Standard
Condition FBFD5A62-8F76-18B2-EB9D-EEE36AFF6809 -active Yes -parent B74F7D6B-E488-489F-9A42-BEB18C73F13F -title {String Is Condition} -component StringIsCondition
InstallComponent C9CE9239-3C5E-97E6-0F98-4619F52759BB -setup Uninstall -type pane -title {Uninstall Complete} -component UninstallComplete -active Yes -parent Standard
InstallType ::Default
InstallType ::Console
InstallComponent 9F8AFA18-08BD-4746-1CF7-6A889DDE0671 -setup Uninstall -type action -title {Console Ask Yes Or No} -component ConsoleAskYesOrNo -active Yes -parent Console
InstallComponent D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106 -setup Uninstall -type action -conditions B8B24DF6-4D75-4ACF-8AFE-F0D930379927 -title Exit -component Exit -command insert -active Yes -parent Console
Condition B8B24DF6-4D75-4ACF-8AFE-F0D930379927 -active Yes -parent D1A0DBEA-FC47-2DF1-0016-E72F9E1A9106 -title {String Is Condition} -component StringIsCondition
InstallComponent 8D3722F8-BA23-F5B9-73B0-B18088989F1E -setup Uninstall -type action -title {Console Message} -component ConsoleMessage -active Yes -parent Console
InstallComponent C9880F02-5EB9-4778-8902-2008293F3CE0 -setup Uninstall -type action -title {Execute Action} -component ExecuteAction -active Yes -parent Console
InstallComponent F3B2BC0E-685C-2E69-AC75-2C946771EC85 -setup Uninstall -type action -title {Console Message} -component ConsoleMessage -active Yes -parent Console
InstallComponent 69A2A177-FC12-F18C-FB99-67C3AC5C9E7D -setup Uninstall -type action -title Exit -component Exit -active Yes -parent Console
InstallType ::Silent
InstallComponent 1DB48011-D41C-AA1E-206F-D6AD5EC08E98 -setup Uninstall -type action -title {Execute Action} -component ExecuteAction -active Yes -parent Silent
InstallComponent E51C1501-7EA8-0F27-F3BE-C7B1954C361F -setup Uninstall -type action -title Exit -component Exit -active Yes -parent Silent
InstallType ::ActionGroups
InstallComponent FA3D5E38-91F2-B088-5EBD-2A3CAB37DBCB -setup Uninstall -type actiongroup -title {Setup Actions} -alias {Setup Actions} -active Yes -parent ActionGroups
InstallComponent 19575E4F-426E-D67A-A2B5-F4FF3D3C2E48 -setup Uninstall -type actiongroup -title {Startup Actions} -alias {Startup Actions} -active Yes -parent ActionGroups
InstallComponent 5C7C0690-2F4B-9108-1252-7B7CB96F9BBF -setup Uninstall -type action -conditions {72A1FC56-A3AC-2105-DA7D-B11AEC75993E 9ABA2147-A04C-49F5-A06A-5F389E58E017} -title Exit -component Exit -command insert -active Yes -parent 19575E4F-426E-D67A-A2B5-F4FF3D3C2E48
Condition 72A1FC56-A3AC-2105-DA7D-B11AEC75993E -active Yes -parent 5C7C0690-2F4B-9108-1252-7B7CB96F9BBF -title {String Is Condition} -component StringIsCondition
Condition 9ABA2147-A04C-49F5-A06A-5F389E58E017 -active Yes -parent 5C7C0690-2F4B-9108-1252-7B7CB96F9BBF -title {Ask Yes or No} -component AskYesOrNo
InstallComponent 63831127-5A65-DA44-4ED2-ED24BB923572 -setup Uninstall -type actiongroup -title {Uninstall Actions} -alias {Uninstall Actions} -active Yes -parent ActionGroups
InstallComponent ECEC8AD9-CD06-E158-AD89-F1055F90DD01 -setup Uninstall -type action -title {Uninstall Selected Files} -component UninstallSelectedFiles -active Yes -parent 63831127-5A65-DA44-4ED2-ED24BB923572
InstallComponent 976A3095-B0AF-DD3D-9D9D-B9E618FF49B8 -setup Uninstall -type actiongroup -title {Finish Actions} -alias {Finish Actions} -active Yes -parent ActionGroups
InstallComponent AB7687C5-C2D4-ACBD-F7C6-EB90D67A2B14 -setup Uninstall -type actiongroup -title {Cancel Actions} -alias {Cancel Actions} -active Yes -parent ActionGroups


proc ::ThemeMain {} {
::InstallJammer::UninstallMain
}

if {![info exists ::InstallJammer]} { ThemeMain }
} components.tcl {namespace eval ::InstallJammer::actions {}
namespace eval ::InstallJammer::conditions {}
proc ::InstallJammer::actions::AddWidget {obj} {
global info

set id     [$obj id]
set parent [$obj parent]
set window [$parent window]
set widget $window.[$obj name]

if {![info exists ::InstallJammer]} {
variable ::InstallJammer::UserWidgets
if {[info exists UserWidgets($id)]} { return }
set UserWidgets($id) $widget
}

$id window $widget

$obj properties props -subst  {Background Foreground LabelWidth X Y Width Height Value}

set opts {}

set ttk        1
set type       ttk::$props(Type)
set text       [::InstallJammer::GetText $id Text -subst 0]
set style      T[string totitle $props(Type)]
set boolean    0
set command    ""
set varName    ::info($props(VirtualText))
set setWidget  $widget
set widgetType text
set virtualText "<%$props(VirtualText)%>"

set value $props(Value)

if {$props(Action) ne ""} {
set command "::InstallJammer::ExecuteActions [list $props(Action)]"
}

switch -- $props(Type) {
"button" {
lappend opts -command $command
}

"browse entry" {
set type       ttk::entry
set style      TEntry
set browse     1
set varopt     -textvariable
set widgetType entry

if {$text ne ""} { set label $text }
if {$value ne ""} { set varval $value }
}

"checkbutton" {
set varopt -variable

set onval   $props(OnValue)
set offval  $props(OffValue)
set boolean 1

lappend opts -onvalue  $onval
lappend opts -offvalue $offval

lappend opts -command $command

if {$props(Checked) ne ""} {
if {$props(Checked)} {
set varval $onval
} else {
set varval $offval
}
}
}

"entry" - "password entry" {
set type       ttk::entry
set style      TEntry
set varopt     -textvariable
set widgetType entry

if {$props(Type) eq "password entry"} {
lappend opts -show *
}

if {$text ne ""} { set label $text }
if {$value ne ""} { set varval $value }
}

"label frame" {
set ttk  0
set type labelframe
}

"radiobutton" {
set varopt -variable

lappend opts -value $value
lappend opts -command $command

if {[string is true -strict $props(Checked)]} {
set varval $value
}
}

"text" {
set ttk        0
set type       Text
set varopt     -textvariable
set widgetType usertext

if {$text ne ""} { set label $text }
if {$value ne ""} { set varval $value }
}
}

if {[info exists varopt]} {
lappend opts $varopt $varName
if {[info exists varval]} {
set $varName $varval
}

if {![info exists $varName]} {
if {$boolean} {
set $varName $props(OffValue)
} else {
set $varName ""
}
} elseif {$boolean && $onval eq "1" && $offval eq "0"} {
set $varName [string is true [set $varName]]
}
}

::InstallJammer::SetVirtualText $info(Language) $parent $id $text
$parent set $id,subst $props(Text,subst)

set bg $props(Background)

if {$bg ne "system"} {
if {$ttk} {
lappend newStyleOpts -background $bg
} else {
lappend opts -background $bg
}
}

set fg $props(Foreground)

if {$fg ne "system"} {
if {$ttk} {
lappend newStyleOpts -foreground $fg
} else {
lappend opts -foreground $fg
}
}

if {[info exists newStyleOpts]} {
eval lappend opts -style $id
eval [list ::InstallJammer::NewStyle $id $style] $newStyleOpts
}

if {[info exists label] || [info exists browse]} {
set xopts [list]
if {$bg ne "system"} {
::InstallJammer::NewStyle $id-frame TFrame -background $bg
lappend xopts -style $id-frame
}

eval [list ttk::frame $widget] $xopts
grid rowconfigure    $widget 1 -weight 1
grid columnconfigure $widget 1 -weight 1

set row 0
set col 0

if {[info exists label]} {
set widgetType text
set width      $props(LabelWidth)

switch -- $props(LabelSide) {
"bottom" { set row 2; set col 1; set opt -pady }
"top"    { set row 0; set col 1; set opt -pady }
"left"   { set row 1; set col 0; set opt -padx }
"right"  { set row 1; set col 2; set opt -padx }
}

set anchor center
switch -- $props(LabelJustify) {
"left"  { set anchor w }
"right" { set anchor e }
}

set justify $props(LabelJustify)

set xopts [list -anchor $anchor -justify $justify  -text $label -width $width]

if {$bg ne "system"} {
::InstallJammer::NewStyle $id-label TLabel -background $bg
lappend xopts -style $id-label
}
eval [list ttk::label $widget.l] $xopts
grid $widget.l -row $row -column $col -sticky w $opt 2
}

eval [list $type $widget.x] $opts
grid $widget.x -row 1 -column 1 -sticky news

if {[info exists browse]} {
set text [::InstallJammer::SubstText <%Browse%>]

if {$props(BrowseType) eq "directory"} {
set cmd [list ::InstallJammer::ChooseDirectory]
} else {
set type [lindex $props(BrowseType) 0]
set cmd  [list ::InstallJammer::ChooseFile -type $type]
}
lappend cmd -variable $varName

ttk::button $widget.b -text $text -command $cmd
grid $widget.b -row 1 -column 2 -padx 2

$parent widget set $id -widget $widget.b
}
} else {
eval [list $type $widget] $opts
}

place $widget -in $window -x $props(X) -y $props(Y)  -width $props(Width) -height $props(Height)

$parent widget set $id -widget $setWidget -type $widgetType

::InstallJammer::UpdateWidgets -widgets $id -step $parent
}

proc ::InstallJammer::actions::AddWindowsUninstallEntry {obj} {
global conf

if {!$conf(windows)} { return }

set properties {
UninstallString
QuietUninstallString
DisplayName
DisplayIcon
DisplayVersion
Comments
Contact
HelpLink
HelpTelephone
InstallDate
InstallLocation
InstallSource
Publisher
Readme
URLInfoAbout
URLUpdateInfo
}

eval $obj properties props -subst 1 [lsort $properties]

set appkey [::InstallJammer::SubstText [$obj get RegistryKeyName]]
set key {HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion}
append key "\\Uninstall\\$appkey"

if {[catch { registry set $key NoModify 1 dword } error]} {
set key {HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion}
append key "\\Uninstall\\$appkey"

registry set $key NoModify 1 dword
}

registry set $key NoRepair 1 dword

foreach var [array names props] {
registry set $key $var $props($var)
}

::InstallJammer::LogRegistry $key
}

proc ::InstallJammer::conditions::AskYesOrNo {obj} {
global info

if {$info(SilentMode)} {
debug "Ask Yes or No condition not valid in Silent mode."
debug "Skipping condition and returning $props(TrueValue)."
return $props(TrueValue)
}

$obj properties props

set id [$obj id]

if {$info(ConsoleMode)} {
debug "Using Console Ask Yes or No action in place of Ask Yes or No condition for console install."

$obj set Default     $props(DefaultButton)
$obj set Prompt      [::InstallJammer::GetText $id Message -subst 0]
$obj set VirtualText $props(ResultVirtualText)

set result [::InstallJammer::actions::ConsoleAskYesOrNo $obj]
return [string equal -nocase $result $props(TrueValue)]
}

set title   [::InstallJammer::GetText $id Title]
set message [::InstallJammer::GetText $id Message]

set args [list -type yesno -title $title -message $message]
lappend args -icon $props(Icon)
lappend args -default [string tolower $props(DefaultButton)]
lappend args -parent [::InstallJammer::TransientParent]

set result [eval ::InstallJammer::MessageBox $args]

if {[string length $props(ResultVirtualText)]} {
global info
set info($props(ResultVirtualText)) $result
}

return [string equal -nocase $result $props(TrueValue)]
}

proc ::InstallJammer::actions::ConsoleAskYesOrNo {obj} {
$obj properties props -subst 1

set prompt \n$props(Prompt)

if {$props(Default) eq "None"} {
append prompt { [y/n]}
} elseif {$props(Default) eq "Yes"} {
append prompt { [n/Y]}
} else {
append prompt { [y/N]}
}

append prompt " "

while {1} {
puts -nonewline stdout [::InstallJammer::WrapText $prompt]
flush stdout

set ans [string trim [string tolower [gets stdin]]]

puts  stdout ""
flush stdout

if {$ans eq "" && $props(Default) ne "None"} {
set ans $props(Default)
break
}

if {$ans eq "n"} { set ans "no" }
if {$ans eq "y"} { set ans "yes" }

if {$ans eq "yes" || $ans eq "no"} { break }
}

if {$props(VirtualText) ne ""} {
set ::info($props(VirtualText)) $ans
}

return $ans
}

proc ::InstallJammer::actions::CreateInstallPanes {obj} {
global conf
global info

set parent      [$obj parent]
set progressbar [$parent widget get ProgressBar]
if {![string length $progressbar]} { set progressbar noop }

set children [$info($conf(mode)) children recursive]
set total    [llength $children]
foreach id $children {
$progressbar configure -value [expr {[incr0 i] * 100 / $total}]
update
if {[$id ispane]} {
$info(Wizard) createstep $id
}
}
}

proc ::InstallJammer::actions::ExecuteAction {obj} {
set id [$obj id]

$obj properties props -subst 1

if {$props(Action) eq ""} {
return -code error "Error in Execute Action: Action is empty"
}

set eval   $props(EvaluateConditions)
set action [::InstallJammer::ID $props(Action)]

if {![::InstallJammer::ObjExists $action]} {
return -code error "Error in Execute Action: Action \"$action\" does not exist"
}

if {![$action is action actiongroup]} {
return -code error "Error in Execute Action: \"$action\" is not an action or action group"
}

if {[$action is action]} {
::InstallJammer::ExecuteActions $action -parent $id -conditions $eval
return
}


set when "Before Action is Executed"
if {$eval && ![$action checkConditions $when]} {
debug "Skipping action group $id - [$id title] - conditions failed"
return
}

set when "Before Next Action is Executed"
while {1} {
::InstallJammer::ExecuteActions $action -parent $id -conditions $eval
if {!$eval || [$action checkConditions $when]} { break }
}
}

proc ::InstallJammer::actions::ExecuteExternalProgram {obj} {
global conf
global info

set id [$obj id]

$obj properties props -subst {ConsoleTitle}

set resultVarName [::InstallJammer::SubstText $props(ResultVirtualText)]
set statusVarName [::InstallJammer::SubstText $props(StatusVirtualText)]

set resultVar ::conf(ExternalResult)
if {[string length $resultVarName]} { set resultVar ::info($resultVarName) }

set statusVar ::conf(ExternalStatus)
if {[string length $statusVarName]} { set statusVar ::info($statusVarName) }

set $statusVar 0
set $resultVar ""

::InstallJammer::UpdateWidgets -update 1

set workdir [::InstallJammer::SubstText $props(WorkingDirectory)]
if {$workdir ne "" && [file exists $workdir]} {
debug "Changing to working directory $workdir"
set pwd [pwd]
cd $workdir
}

set cmdline $props(ProgramCommandLine)

if {$props(ShowProgressiveOutput)} {
debug "Executing with progressive output"

set proc   ::ReadOutput${id}
set watch  $props(WatchProgressiveOutput)
set widget [join $props(ProgressiveOutputWidget) ""]
set widget [[$obj parent] widget get $widget]

if {!$info(GuiMode) || ![winfo exists $widget]
|| [winfo class $widget] ne "Text"} {
set widget ""
} else {
$widget delete 1.0 end

$widget configure -maxundo 1
}

if {$watch} {
debug "Watching progressive output for special syntax."
}

proc ::CloseProgressive { fp statusVar } {
if {[catch { close $fp } error]} {
if {[lindex $::errorCode 0] eq "CHILDSTATUS"} {
set $statusVar [lindex $::errorCode 2]
} else {
set $statusVar 1
}

set $resultVar $error
return -code error $error
} else {
set $statusVar 0
}
}

proc $proc { fp statusVar resultVar widget watch } {
if {[eof $fp]} {
CloseProgressive $fp $statusVar
return
}

if {$watch ne ""} {
gets $fp data

if {$::conf(windows)} {
set data [string map [list \r ""] $data]
}

if {[eof $fp]} {
CloseProgressive $fp $statusVar
return
}

if {[fblocked $fp]} { return }

if {[regexp $watch $data -> varName theRest]} {
set ::info($varName) [::InstallJammer::SubstText $theRest]
::InstallJammer::UpdateWidgets -update 1
return
}

append data \n
} else {
set data [read $fp]

if {[eof $fp]} {
CloseProgressive $fp $statusVar
return
}

if {$::conf(windows)} {
set data [string map [list \r ""] $data]
}
}

append $resultVar $data

if {$::info(ConsoleMode)} {
puts -nonewline stdout $data
flush stdout
} elseif {$widget ne ""} {
set auto [expr {[lindex [$widget yview] 1] == 1}]

$widget configure -state normal
$widget insert end $data
$widget configure -state disabled

if {$auto} { $widget yview moveto 1.0 }

update idletasks
}
}

set cmd [::InstallJammer::SubstForPipe $cmdline]

if {$props(IncludeStderr)} { lappend cmd "2>@1" }

debug "Executing Command Line: $cmd"

if {[catch { open "|$cmd" } fp]} {
set $statusVar 1
set $resultVar $fp
if {[lindex $::errorCode 0] eq "CHILDSTATUS"} {
set $statusVar [lindex $::errorCode 2]
}

return -code error [set $resultVar]
} else {
if {$watch} {
set watch $props(WatchRegularExpression)
} else {
set watch ""
}

fconfigure $fp -buffering none -blocking 0 -translation lf
fileevent $fp readable  [list $proc $fp $statusVar $resultVar $widget $watch]

if {$props(WaitForProgram)} { vwait $statusVar }
}
} else {
set cmd [::InstallJammer::SubstForPipe $cmdline]

if {$props(ExecuteInConsole)} {
debug "Executing in console"

if {$conf(windows)} {
set cmd [linsert $cmd 0 $::env(COMSPEC) /c]
} else {
set title Console
if {$props(ConsoleTitle) ne ""} {
set title $props(ConsoleTitle)
}

set t       -T
set konsole 0
set desktop [::InstallJammer::GetDesktopEnvironment]

if {$desktop eq "KDE" && [auto_execok konsole] ne ""} {
set konsole 1
set term konsole
} elseif {$desktop eq "Gnome"
&& [auto_execok gnome-terminal] ne ""} {
set t -t
set term gnome-terminal
} else {
set term xterm
}

if {[auto_execok $term] eq ""} {
return -code error "Execute External Program failled: Cannot execute program in console because a suitable terminal program could not be found."
}

if {$konsole} {
set cmd [concat [list $term $t $title] -e $cmd]
} else {
set cmd [list $term $t $title -e $cmd]
}

if {$props(ExecuteAsRoot) && !$info(UserIsRoot)} {
set msg [::InstallJammer::SubstText "<%PromptForRootText%>"]
set cmd [join [::InstallJammer::SubstForPipe $cmdline]]
if {$konsole} {
set cmd [concat [list $term $t $title]  [list -e echo '$msg' && su -c '$cmd']]
} else {
set cmd [list $term $t $title  -e "echo '$msg' && su -c '$cmd'"]
}
}
}

if {!$props(WaitForProgram)} { lappend cmd & }

debug "Executing Command Line: $cmd"

if {[catch { eval exec $cmd } $resultVar]} {
debug "Error while executing: [set $resultVar]"

set $statusVar 1
if {[lindex $::errorCode 0] eq "CHILDSTATUS"} {
set $statusVar [lindex $::errorCode 2]
}
}
} elseif {$props(ExecuteAsRoot) && !$info(UserIsRoot)
&& !$conf(windows)} {
debug "Executing as root"
set cmd [::InstallJammer::SubstForPipe $cmdline]

if {$props(IncludeStderr)} { lappend cmd "2>@1" }

debug "Executing Command Line: $cmd"
::InstallJammer::ExecAsRoot $cmd -wait $props(WaitForProgram)
} else {
if {$props(IncludeStderr)} { lappend cmd "2>@1" }

if {!$props(WaitForProgram)} { lappend cmd & }

debug "Executing Command Line: $cmd"
if {[catch { eval exec $cmd } $resultVar]} {
debug "Error while executing: [set $resultVar]"

set $statusVar 1
if {[lindex $::errorCode 0] eq "CHILDSTATUS"} {
set $statusVar [lindex $::errorCode 2]
}
}
}
}

::InstallJammer::UpdateWidgets -updateidletasks 1

if {[info exists pwd]} { cd $pwd }
}

proc ::InstallJammer::actions::Exit {obj} {
global info

if {[$obj get ExitType] eq "Cancel"} {
set info(WizardCancelled) 1
}

foreach command [list ::Exit ::InstallJammer::exit ::exit] {
if {[::InstallJammer::CommandExists $command]} {
$command
}
}
}

proc ::InstallJammer::conditions::FileExistsCondition {obj} {
$obj properties props

debug "Checking to see if $props(Filename) $props(Operator)"

set file [::InstallJammer::SubstText $props(Filename)]

if {$props(Operator) eq "exists"} {
return [file exists $file]
} else {
return [expr {![file exists $file]}]
}
}

proc ::InstallJammer::conditions::FilePermissionCondition {obj} {
global conf
global info

$obj properties props

if {[string match "can*create" $props(Permission)]} {
debug "Checking to see if we $props(Permission) $props(Filename)"
} else {
debug "Checking to see if $props(Filename) $props(Permission)"
}

set file [::InstallJammer::SubstText $props(Filename)]

switch -- $props(Permission) {
"is readable" {
return [file readable $file]
}

"is writable" {
return [::InstallJammer::DirIsWritable $file]
}

"can create" {
set info(Dir) $file
while {[llength [file split $info(Dir)]]} {
if {[file exists $info(Dir)]} {
return [::InstallJammer::DirIsWritable $info(Dir)]
}

set dir [file dirname $info(Dir)]

if {$dir eq $info(Dir)} { break }

set info(Dir) $dir
}

return 0
}
}
}

proc ::InstallJammer::actions::InstallDesktopShortcut {obj} {
global conf

set allusers [::InstallJammer::SubstText [$obj get InstallForAllUsers]]

if {$conf(windows)} {
$obj set ShortcutDirectory <%DESKTOP%>

if {[string is true -strict $allusers]} {
$obj set ShortcutDirectory <%COMMON_DESKTOP%>
}

::InstallJammer::actions::InstallWindowsShortcut $obj
} else {
$obj set ShortcutLocation Desktop
::InstallJammer::actions::InstallUNIXShortcut $obj
}
}

proc ::InstallJammer::actions::InstallProgramFolderShortcut {obj} {
global conf

set allusers [::InstallJammer::SubstText [$obj get InstallForAllUsers]]

if {$conf(windows)} {
set folder [$obj get ProgramFolderName]

$obj set ShortcutDirectory "<%ProgramFolder%>"

if {$allusers ne ""} {
$obj set ShortcutDirectory "<%PROGRAMS%>/$folder"
if {[string is true $allusers]} {
$obj set ShortcutDirectory "<%COMMON_PROGRAMS%>/$folder"
}
}

::InstallJammer::actions::InstallWindowsShortcut $obj
} else {
$obj set ShortcutLocation "Program Folder"
::InstallJammer::actions::InstallUNIXShortcut $obj
}
}

proc ::InstallJammer::actions::InstallSelectedFiles {obj} {
global info
global conf

update

if {[string is true -strict $info(Testing)]} { return }

set setups [SetupTypes children]

if {![llength $setups]} { return }

set setuptype [::InstallJammer::FindObjByName $info(InstallType) $setups]

if {$setuptype eq ""} {
return -code error "Install Selected Files failed: could not find current Setup Type in list of available Setup Types"
}

set conf(stop)  [::InstallJammer::TmpDir .stop]
set conf(pause) [::InstallJammer::TmpDir .pause]

set id     [$obj id]
set parent [$obj parent]

set conf(InstallID) $parent

set total 0

set info(FileBeingInstalled)  ""
set info(GroupBeingInstalled) ""

set info(Status) "<%InstallPrepareText%>"

set groups [list]
foreach component [$setuptype get Components] {
if {![$component active]} {
debug "Skipping component $component - [$component name] - component is inactive" $component
continue
}

if {[info exists done($component)]} { continue }
set done($component) 1

foreach filegroup [$component get FileGroups] {
if {![$filegroup active]} {
debug "Skipping file group $filegroup - [$filegroup name] - filegroup is inactive" $component
continue
}

if {[info exists done($filegroup)]} { continue }
set done($filegroup) 1

lappend groups $filegroup

if {$::verbose} {
debug "Adding file group [$filegroup name] for installation..."
}

foreach file [$filegroup children] {
if {![$file active]} {
debug "Skipping file $file - [$file name] - file is inactive" $component
continue
}

if {[info exists done($file)]} { continue }
set done($file) 1

incr total [$file size]

if {$::verbose} {
debug "Adding file [$file name] for installation..."
}

lappend files($filegroup) $file
}
}
}

if {![llength $groups]} {
set info(InstallFinished) 1
return
}

set info(TotalSize) $total

if {$info(InstallHasSolidArchives) && !$info(SolidArchivesExtracted)} {
::InstallJammer::UnpackSolidArchives 0
set info(InstallPercentComplete) 0
set info(Status) "<%InstallPrepareText%>"
}

set conf(InstallLog) [file join $info(InstallDir) install.log]

set unpackBin    [::installkit::base]
set unpackInf    [::InstallJammer::BuildUnpackInfo $groups files]
set unpackScript [::InstallJammer::BuildUnpack]

set info(Installing)     1
set info(InstallStarted) 1

set conf(LastPercent)          0
set conf(UpdateFileText)       [$obj get UpdateFileText]
set conf(UpdateFilePercent)    [$obj get UpdateFilePercentage]
set conf(directoryPermissions) {}

if {$conf(UpdateFileText)} {
set info(Status) "<%FileBeingInstalledText%>"
} else {
set info(Status) "<%GroupBeingInstalledText%>"
}

if {$conf(threaded)} {
set tid [installkit::newThread thread::wait]
thread::errorproc ::InstallJammer::HandleThreadError

set conf(UnpackThread) $tid
thread::send $tid [list source $unpackInf]
thread::send -async $tid [list source $unpackScript]
} else {
set cmd "|[list $unpackBin] [list $unpackScript] -- [list $unpackInf]"
set conf(UnpackBin) $unpackBin
set conf(UnpackFp)  [open $cmd]

fconfigure $conf(UnpackFp) -blocking 0
fileevent  $conf(UnpackFp) readable  [list ::InstallJammer::ReadUnpack $parent]
}

vwait ::info(Installing)

set info(Installing)      0
set info(InstallFinished) 1

if {$info(InstallStopped)} { return }

if {$conf(windows)} {
set conf(UpdateWindowsRegistry) 1
}

if {$conf(rollback) && $info(InstallStarted)} {
set info(Status)  "<%CleanupInstallText%>"

foreach {dir perms} $conf(directoryPermissions) {
::InstallJammer::SetPermissions $dir $perms
}

foreach file $conf(rollbackFiles) {
set roll [::InstallJammer::RollbackName $file]
if {[file exists $roll]} { file delete -force $roll }
}
}

set info(FileBeingInstalled)  ""
set info(GroupBeingInstalled) ""
}

proc ::InstallJammer::actions::InstallUNIXShortcut {obj} {
global conf
global info

if {![string match "Linux*" $info(Platform)]
&& ![string match "FreeBSD*" $info(Platform)]} { return }

$obj properties props -subst 1

if {$props(ShortcutLocation) eq "Directory"} {
set file [file join $props(ShortcutDirectory) $props(ShortcutName)]

if {![file exists $props(ShortcutDirectory)]} {
::InstallJammer::CreateDir $props(ShortcutDirectory)
}

::InstallJammer::LogFile $file
} else {
if {$props(FileName) eq ""} {
return -code error "Error in Install UNIX Shortcut: File Name property must not be empty"
}

set file [::InstallJammer::TmpDir $props(FileName)]
}

if {![string match *.desktop $file]} { append file .desktop }

set fp [open $file w]

puts $fp {[Desktop Entry]}
puts $fp "Version=1.0"
puts $fp "Type=$props(ShortcutType)"
puts $fp "Name=$props(ShortcutName)"

if {$props(TargetFileName) ne ""} {
if {$props(ShortcutType) eq "Link"} {
set target $props(TargetFileName)
if {![regexp {[a-z]+://} $target]} { set target "file://$target" }
puts $fp "URL=$target"
} else {
puts $fp "Exec=$props(TargetFileName)"
}
}

if {$props(IconPath) ne ""}  {
puts $fp "Icon=$props(IconPath)"
}

if {$props(AdditionalArguments) ne ""} {
puts $fp $props(AdditionalArguments)
}

close $fp

if {$props(ShortcutLocation) eq "Desktop"} {
catch { exec xdg-desktop-icon install --novendor $file }
::InstallJammer::InstallLog [list :XDGRESOURCE desktop $file]
} elseif {$props(ShortcutLocation) eq "Program Folder"} {

set files [list]
foreach folder [file split $props(ProgramFolderName)] {
set uuid    $info(ApplicationID)-[join $folder ""]
set dirfile [::InstallJammer::TmpDir $uuid.directory]

set fp [open $dirfile w]
puts $fp {[Desktop Entry]}
puts $fp "Version=1.0"
puts $fp "Type=Directory"
puts $fp "Name=$folder"
close $fp

lappend files $dirfile
}

if {![llength $files]} {
return -code error "Error in Install UNIX Shortcut: No program folder found to add icon to"
}

lappend files $file

catch { eval exec xdg-desktop-menu install --novendor $files }

foreach file $files {
lappend logfiles [file tail $file]
}

::InstallJammer::InstallLog [list :XDGRESOURCE menu $logfiles]

if {[::InstallJammer::GetDesktopEnvironment] eq "Gnome"} {
set conf(RestartGnomePanel) 1
}
}
}

proc ::InstallJammer::actions::InstallUninstaller {obj} {
global info
global conf

$obj properties props -subst 1

set info(Status) [$obj get Message]

set uninstallBin [file join $props(UninstallDirectory)  $props(UninstallFilename)]

set conf(uninstall)   $uninstallBin
set info(Uninstaller) $uninstallBin

if {[file exists $uninstallBin]} {

set tmp [::InstallJammer::TmpDir]
set dir [::InstallJammer::TmpMount]

if {![catch { installkit::Mount $uninstallBin $dir } error]} {
foreach pattern {*.info *.log} {
foreach file [glob -nocomplain -dir $dir $pattern] {
file copy -force $file $tmp
}
}

installkit::Unmount $dir
}
}

::InstallJammer::CreateDir [file dirname $uninstallBin]

set arrays [list info ::InstallJammer::Properties]

set uninstall [::InstallJammer::TmpDir uninstall.tcl]

set fp [open $uninstall w]
puts $fp "namespace eval ::InstallAPI {}"
puts $fp "namespace eval ::InstallJammer {}"

puts $fp "set info(Uninstaller) [list $info(Uninstaller)]"

foreach array $arrays {
puts $fp "array set $array [list [array get $array]]"
}

set filedata [array get ::InstallJammer::files gui.tcl]
if {!$conf(windows)} {
eval lappend filedata [array get ::InstallJammer::files console.tcl]
}

puts $fp "array set ::InstallJammer::files [list $filedata]"

foreach file {common.tcl uninstall.tcl} {
puts $fp $::InstallJammer::files($file)
}

close $fp

set opts [list -noinstall -o $uninstallBin -w [::installkit::base]]

if {$conf(windows)} {
set desc "Uninstall <%AppName%> <%Version%>"
lappend opts -filedescription [::InstallJammer::SubstText $desc]
}

set dirs [glob -nocomplain -type d -tails -dir [file join $conf(vfs) lib] *]
set rem  [list InstallJammer installkit itcl jammerTheme tcl tk thread tile]
set dirs [eval lremove [list $dirs] $rem]

foreach dir $dirs {
lappend opts -package [file join $conf(vfs) lib $dir]
}

lappend opts -catalog [file join $conf(vfs) catalogs messages]

eval ::InstallJammer::Wrap $opts [list $uninstall]

::InstallJammer::SetPermissions $uninstallBin 00755

return 1
}

proc ::InstallJammer::actions::InstallWindowsShortcut {obj} {
global conf

if {!$conf(windows)} { return }

$obj properties props

set target [::InstallJammer::SubstText $props(TargetFileName)]

lappend list -objectpath $target

if {![lempty $props(WorkingDirectory)]} {
lappend list -workingdirectory
lappend list [::InstallJammer::SubstText $props(WorkingDirectory)]
}

if {![lempty $props(IconPath)]} {
lappend list -icon [::InstallJammer::SubstText $props(IconPath)]
lappend list $props(IconPathIndex)
}

if {![lempty $props(CommandLineArguments)]} {
lappend list -arguments
lappend list [::InstallJammer::SubstText $props(CommandLineArguments)]
}

lappend list -showcommand $props(WindowState)

set dir      [::InstallJammer::SubstText $props(ShortcutDirectory)]
set linkPath [::InstallJammer::SubstText $props(ShortcutName)]
set linkPath [file join $dir $linkPath]
if {![string match *.lnk $linkPath]} { append linkPath .lnk }

if {![file exists $dir]} { ::InstallJammer::CreateDir $dir }

debug "Creating shortcut $linkPath with these options: $list"

eval [list ::installkit::Windows::createShortcut $linkPath] $list
::InstallJammer::LogFile $linkPath
}

proc ::InstallJammer::actions::ModifyWidget {obj} {
global conf
global info

variable hidden

set id     [$obj id]
set parent [$obj parent]

$obj properties props

if {![string length $props(Widget)]} { return }

set allArgs   {}
set labelArgs {}

if {$props(Text) ne ""}  {
lappend labelArgs -text $props(Text)
}

if {$props(State) ne "" && $props(State) ne "hidden"} {
lappend allArgs -state $props(State)
}

set widgets [split $props(Widget) \;]

for {set i 0} {$i < [llength $widgets]} {incr i} {
set name [string trim [lindex $widgets $i]]
set w [join $name ""]
set widget $w

set button 0
if {[lsearch -exact $conf(ButtonWidgets) $widget] > -1} {
set button 1
set w [string tolower [string map {Button ""} $widget]]
}

if {$button} {
set w [$info(Wizard) widget get $w]
} else {
set w [$parent widget get $widget]
}

if {$w eq ""} {
return -code error "bad widget \"$name\""
}

if {$props(Text) ne ""} {
::InstallJammer::SetVirtualText all $parent $widget $props(Text)
}

set class [winfo class $w]
if {$class eq "Frame" || $class eq "TFrame"} {
foreach child [winfo children $w] {
set class [winfo class $child]
if {$class eq "Label" || $class eq "TLabel"} {
eval [list $child configure] $labelArgs
}
eval [list $child configure] $allArgs
}
} else {
eval [list $w configure] $allArgs $labelArgs
}

if {$props(State) eq "hidden" && ![info exists hidden($w)]} {
set manager [winfo manager $w]
set options [$manager info $w]
set hidden($w) [concat $manager configure $w $options]
$manager forget $w
} elseif {$props(State) eq "normal" && [info exists hidden($w)]} {
eval $hidden($w)
unset hidden($w)
}
}

::InstallJammer::UpdateWidgets -buttons 1 -updateidletasks 1
}

proc ::InstallJammer::actions::MoveForward {obj} {
global info

set next [$info(Wizard) step next]

if {![string length $next]} {
debug "No more panes left to move forward... exiting"
::InstallJammer::actions::Exit $obj
} else {
debug "Moving forward to $next"
after 0 [list $info(Wizard) next 1]
}
}

proc ::InstallJammer::conditions::ScriptCondition {obj} {
return [::InstallJammer::EvalCondition [$obj get Script]]
}

proc ::InstallJammer::conditions::StringIsCondition {obj} {
$obj properties props

debug "Checking to see if $props(String) is $props(Operator)"

set string [::InstallJammer::SubstText $props(String)]

if {$props(Operator) eq "empty"} {
return [expr {[string trim $string] eq ""}]
} elseif {$props(Operator) eq "not empty"} {
return [expr {[string trim $string] ne ""}]
} else {
return [string is $props(Operator) -strict $string]
}
}
} unpack.tcl {
if {[info exists ::InstallJammer]} { return }

if {[info exists ::tcl_platform(threaded)]} {
proc output { line } {
thread::send $::parentThread [list ::InstallJammer::UnpackOutput $line]
}
} else {
proc output {string} {
global conf

catch { puts $conf(runlogFp) $string }
puts stdout $string

catch { flush $conf(runlogFp) }
flush stdout
}
}

proc ::InstallJammer::InstallFiles {} {
global conf
global info
global files
global groups

set conf(unpackTotal) 0

::InstallJammer::CreateDir $info(InstallDir)

foreach group $groups {
output [list :GROUP [$group name] [$group directory]]

$group install

if {![info exists files($group)]} { continue }

foreach file $files($group) {
output [list :FILE [$file destfile] [$file version]]
if {![$file install]} { return }
}
}
}

proc ::InstallJammer::IncrProgress { bytes } {
global conf
global info

if {$info(TotalSize) == 0} {
output ":PERCENT 100"
return
}

incr0 conf(unpackLeft) -$bytes
incr0 conf(unpackTotal) $bytes
incr0 conf(unpackSoFar) $bytes

if {$info(TotalSize) > 0} {
set x [expr round( ($conf(unpackTotal) * 100.0) / $info(TotalSize) )]
if {$x != $conf(lastPercent)} {
output ":PERCENT $x"
set conf(lastPercent) $x
}
}

}

proc ::InstallJammer::unpack { src dest {permissions ""} } {
global conf
global info

if {![PauseCheck]} { return }

if {$conf(rollback) && [file exists $dest]} {
output [list :ROLLBACK $dest]
::InstallJammer::SaveForRollback $dest
}

if {$permissions eq ""} { set permissions 0666 }

set fin [open $src r]
if {[catch {open $dest w $permissions} fout]} {
close $fin
return -code error $fout
}

fconfigure $fin  -translation binary -buffersize $conf(chunk)
fconfigure $fout -translation binary -buffersize $conf(chunk)

set conf(unpackLeft)  $info(FileSize)
set conf(unpackDone)  0
set conf(unpackSoFar) 0
set conf(unpackFin)   $fin
set conf(unpackFout)  $fout
set conf(lastPercent) 0

::InstallJammer::unpackfile $fin $fout 0

vwait ::conf(unpackDone)

return $dest
}

proc ::InstallJammer::unpackfile { in out bytes {error ""} } {
global conf

if {![PauseCheck]} {
set error "Install Stopped"
}

::InstallJammer::IncrProgress $bytes

if {$error ne "" || $conf(unpackLeft) <= 0 || [eof $in]} {
close $in
close $out
set conf(unpackDone) $conf(unpackTotal)
} else {
set size $conf(chunk)
if {$size > $conf(unpackLeft)} { set size $conf(unpackLeft) }
::fcopy $in $out -size $size -command [lrange [info level 0] 0 2]
}
}

proc ::InstallJammer::InstallLog { string } {
output [list :LOG $string]
}

proc ::InstallJammer::exit {} {
global info
global conf

if {!$conf(threaded)} {
::InstallJammer::WriteDoneFile $info(Temp)

catch { close $conf(runlogFp) }
catch { close $conf(unpackFin)  }
catch { close $conf(unpackFout) }

::exit
}

output ":PERCENT 100"
output ":DONE"
}

proc ::InstallJammer::UnpackMain {} {
global conf
global info

catch { wm withdraw . }

::InstallJammer::CommonInit

set conf(pwd) [file dirname [info nameofexe]]

if {!$conf(threaded)} {
set info(Temp) $conf(pwd)
uplevel #0 [list source [file join $conf(pwd) unpack.ini]]
}

set conf(stop)        [TmpDir .stop]
set conf(pause)       [TmpDir .pause]
set conf(chunk)       [expr {64 * 1024}]
set conf(lastPercent) 0

::InstallJammer::InitSetup
::InstallJammer::InitFiles

if {!$conf(threaded)} {
set conf(vfs) /installkitunpackvfs
::installkit::Mount $info(installer) $conf(vfs)
set conf(runlogFp) [open [TmpDir run.log] w]

if {$info(InstallHasSolidArchives)} {
foreach file [glob -nocomplain -dir [TmpDir] solid.*] {
installkit::Mount $file $conf(vfs)
}
}
}

set conf(rollback) [string match "*Rollback*" $info(CancelledInstallAction)]

::InstallJammer::InstallFiles

::InstallJammer::exit
}

::InstallJammer::UnpackMain
}}

proc ::ThemeInit {} {
variable info

Wizard $info(Wizard) -width 500 -height 365  -raisecommand  [list RaiseStep %W %S]  -title [::InstallJammer::SubstText "<%InstallTitleText%>"]  -separatortext [::InstallJammer::SubstText "<%SeparatorText%>"]

if {$::tcl_platform(platform) eq "unix"} {
$info(Wizard) configure -bg [style configure . -background]
}
}



if {[info exists ::InstallJammer]} { return }

proc ::InstallJammer::UpdateInstallInfo {} {
global info

set info(SpaceRequired)      0
set info(SelectedComponents) [list]
set info(SelectedFileGroups) [list]

set setups    [SetupTypes children]
set setuptype [::InstallJammer::FindObjByName $info(InstallType) $setups]

set total 0
foreach component [$setuptype get Components] {
if {![$component active]} { continue }

set name [$component name]
if {[lsearch -exact $info(SelectedComponents) $name] < 0} {
lappend info(SelectedComponents) $name
}

set doSize 1
set size [$component get Size]
if {$size ne ""} {
set doSize 0
incr total $size
}

foreach filegroup [$component get FileGroups] {
if {![$filegroup active]} { continue }

if {$doSize} {
set fsize [$filegroup get Size]
if {$fsize eq ""} { set fsize [$filegroup get FileSize] }

if {[string is integer -strict $fsize]} {
incr total $fsize
}
}

set name [$filegroup name]
if {[lsearch -exact $info(SelectedFileGroups) $name] < 0} {
lappend info(SelectedFileGroups) $name
}
}
}

set info(SpaceRequired) $total

::InstallJammer::UpdateWidgets
}

proc ::InstallJammer::SelectComponent { paneId } {
global info

set id   $paneId
set tree [$id widget get ComponentTree]
set text [$id widget get DescriptionText]
set node [$tree selection get]
set desc [::InstallJammer::GetText $node Description]

::InstallJammer::SetText $text $desc

::InstallJammer::SetVirtualText $info(Language) $id  [list DescriptionText $desc]

::InstallJammer::UpdateInstallInfo
}

proc ::InstallJammer::ToggleComponent { tree id node } {
global info

if {[$node get RequiredComponent]} { return }

set type $info(InstallTypeID)

if {[$node active]} {
$node active 0

foreach component [$node children recursive] {
if {![$component get RequiredComponent]} { $component active 0 }

if {[$tree exists $component]} {
$tree itemconfigure $component -on 0

if {[$tree itemcget $component -type] eq "radiobutton"} {
set group [$component get ComponentGroup]
set ::InstallJammer::Components($type,$group) ""
}
}
}
} else {
$node active 1

foreach component [$node children recursive] {
$component active 1
if {[$tree exists $component]} {
$tree itemconfigure $component -on 1

if {[$tree itemcget $component -type] eq "radiobutton"} {
set group [$component get ComponentGroup]
if {[$component get Checked]} {
set ::InstallJammer::Components($type,$group) $component
} else {
$component active 0
}
}
}
}
}

if {[$tree itemcget $node -type] eq "radiobutton"} {
set group [$node get ComponentGroup]
foreach comp $::InstallJammer::Components($type,$group,ids) {
if {$comp ne $node} { $comp active 0 }
}
}

::InstallJammer::UpdateInstallInfo
}

proc ::InstallJammer::SelectSetupType { {node ""} } {
global info

set change 1
if {$node ne ""} {
set name   [$node name]
set change [expr {$info(InstallType) ne $name}]

set info(InstallType) $name

set id   [$info(Wizard) raise]
set text [$id widget get DescriptionText]
set desc [::InstallJammer::GetText $node Description]

::InstallJammer::SetText $text $desc

::InstallJammer::SetVirtualText $info(Language) $id  [list DescriptionText $desc]

[$id widget get SetupTypeListBox] selection set $node
}

if {$change} {
set setups [SetupTypes children]
set obj    [::InstallJammer::FindObjByName $info(InstallType) $setups]

if {$obj eq ""} { set obj [lindex $setups 0] }

::InstallAPI::SetActiveSetupType -setuptype $obj

set components [$info(InstallTypeID) get Components]

array unset ::InstallJammer::Components $info(InstallTypeID),*

foreach component [Components children recursive] {
if {[lsearch -exact $components $component] < 0} {
$component active 0
} else {
$component active 1
}
}
}

::InstallJammer::UpdateInstallInfo
}

proc ::InstallJammer::PopulateProgramFolders { step } {
global conf

set listbox [$step widget get ProgramFolderListBox]

if {$conf(windows)} {
set folder [list]
foreach dir {PROGRAMS COMMON_PROGRAMS} {
set dir [::InstallJammer::WindowsDir $dir]
eval lappend folders [glob -nocomplain -type d -dir $dir -tails *]
}
eval [list $listbox insert end] [lsort -dict -unique $folders]
}
}

proc ::InstallJammer::SetProgramFolder { {folder ""} } {
global conf
global info

if {![string length $folder]} {
set step $info(CurrentPane)
set listbox [$step widget get ProgramFolderListBox]
set folder  [$listbox get [$listbox curselection]]

set list [file split $info(OriginalProgramFolderName)]
if {[llength $list] > 1} {
set folder [file join $folder [lindex $list end]]
} else {
set folder [file join $folder $info(OriginalProgramFolderName)]
}
}

set info(ProgramFolderName) $folder
}

proc ::InstallJammer::ModifyProgramFolder {} {
global conf
global info

set all $info(ProgramFolderAllUsers)
if {$conf(vista)} { set all 1 }

if {!$all} {
set info(ProgramFolder) "<%PROGRAMS%>/<%ProgramFolderName%>"
} else {
set info(ProgramFolder) "<%COMMON_PROGRAMS%>/<%ProgramFolderName%>"
}
}

proc ::InstallJammer::ScrollLicenseTextBox { force args } {
global info

eval $args

if {!$force} { return }

set w   [lindex $args 0]
lassign [$w yview] y0 y1

if {$y1 == 1} {
$info(Wizard) itemconfigure next -state normal
} else {
$info(Wizard) itemconfigure next -state disabled
}
}

proc ::InstallJammer::exit { {prompt 0} } {
global conf
global info

if {$prompt} {
::InstallJammer::PauseInstall

set title   "Exit Setup"
set message [::InstallJammer::SubstText "<%ExitText%>"]
set ans [MessageBox -type yesno -default no  -parent [::InstallJammer::TransientParent]  -title $title -message $message]

if {$ans eq "no"} {
::InstallJammer::ContinueInstall
return
}

set id [$info(Wizard) raise]

if {$id ne ""} {
set when "After Pane is Cancelled"

::InstallJammer::ExecuteActions $id -when $when

if {![$id checkConditions $when]} { return }
}

set info(WizardCancelled) 1
}

if {$info(Installing)} {
::InstallJammer::StopInstall

vwait ::info(Installing)

if {[string match "*Continue*" $info(CancelledInstallAction)]} {
}
}

if {$info(InstallStarted)
&& $info(InstallStopped)
&& $info(CleanupCancelledInstall)} {
::InstallJammer::CleanupCancelledInstall
}

if {!$info(WizardCancelled) && ($info(WizardStarted) || !$info(GuiMode))} {
::InstallJammer::ExecuteActions "Finish Actions"

if {!$info(InstallStopped)} {
::InstallJammer::StoreVersionInfo
::InstallJammer::CreateInstallLog
::InstallJammer::CreateApplicationInstallLog

if {!$info(InstallRegistryInfo)} {
::InstallJammer::StoreLogsInUninstall
}
}
} else {
::InstallJammer::ExecuteActions "Cancel Actions"
}

::InstallJammer::CheckAndUpdateInstallRegistry

::InstallJammer::CommonExit
}

proc ::InstallJammer::UnpackOutput { line } {
global conf
global info

switch -- [lindex $line 0] {
":DONE" {
set info(FileBeingInstalled)  ""
set info(GroupBeingInstalled) ""

set info(Status) "File installation complete..."

if {[info exists ::tcl_platform(threaded)]} {
} else {
catch { close $conf(UnpackFp) }
}
set info(Installing) 0
}

":LOG" {
::InstallJammer::InstallLog [lindex $line 1]
}

":GROUP" {
set info(GroupBeingInstalled) [lindex $line 1]
::InstallJammer::UpdateWidgets -buttons 0 -updateidletasks 1

if {!$info(GuiMode) && !$info(SilentMode)} {
echo <%Status%> 1
}
}

":DIR" {
set dir   [lindex $line 1]
set perms [lindex $line 2]
lappend conf(directoryPermissions) $dir $perms
}

":FILE" {
set file [lindex $line 1]
set info(FileBeingInstalled) $file
::InstallJammer::SetVersionInfo $file [lindex $line 2]
if {$conf(UpdateFileText)} {
::InstallJammer::UpdateWidgets -buttons 0 -updateidletasks 1
}

if {$::verbose} {
debug "Installing $file..."
}
}

":PERCENT" {
set info(InstallPercentComplete) [lindex $line 1]
if {$info(InstallPercentComplete) != $conf(LastPercent)} {
::InstallJammer::UpdateWidgets -buttons 0 -updateidletasks 1
set conf(LastPercent) $info(InstallPercentComplete)
}
}

":ROLLBACK" {
lappend conf(rollbackFiles) [lindex $line 1]
}

":FILEPERCENT" {
set info(FilePercentComplete) [lindex $line 1]
if {$conf(UpdateFilePercent)} {
::InstallJammer::UpdateWidgets -buttons 0 -updateidletasks 1
}
}

default {
append conf(unpackErrors) $line\n
}
}
}

proc ::InstallJammer::ReadUnpack { id } {
global conf
global info

if {[eof $conf(UnpackFp)]} {
catch { close $conf(UnpackFp) }
set info(Installing) 0
return
}

gets $conf(UnpackFp) line

::InstallJammer::UnpackOutput $line
}

proc ::InstallJammer::BuildUnpackInfo { groupList groupArray } {
global info
global versions

upvar 1 $groupArray groups

::InstallJammer::ReadVersionInfo

set unpack [TmpDir unpack.ini]

set fp [open $unpack w]

puts $fp "namespace eval ::InstallJammer {}"
puts $fp "set info(installer) [list [info nameofexecutable]]"
puts $fp "array set info [list [array get info]]"
puts $fp "set groups [list $groupList]"
puts $fp "array set files [list [array get groups]]"
puts $fp ""
puts $fp "array set versions [list [array get versions]]"

puts -nonewline $fp "array set ::InstallJammer::Properties "
puts $fp "[list [array get ::InstallJammer::Properties]]"

close $fp

return $unpack
}

proc ::InstallJammer::BuildUnpack {} {
global info
global conf

if {[info exists conf(UnpackBin)]} { return $conf(UnpackBin) }

set unpack [TmpDir unpack.tcl]
set conf(UnpackScript) $unpack

set fp [open $unpack w]
fconfigure $fp -translation lf
foreach file {common.tcl files.tcl setup.tcl components.tcl unpack.tcl} {
puts $fp $::InstallJammer::files($file)
}
close $fp

return $unpack
}

proc ::InstallJammer::CleanupCancelledInstall {} {
global conf
global info

set info(Status) "Cleaning up install..."

if {![llength $conf(LOG)]} { return }

for {set i [llength $conf(LOG)]} {$i >= 0} {incr i -1} {
set line [lindex $conf(LOG) $i]
set type [lindex $line 0]
set args [lrange $line 1 end]
switch -- [lindex $line 0] {
":FILE"	{
set file [lindex $args 0]
set roll [::InstallJammer::RollbackName $file]
if {[file exists $roll]} {
file rename -force $roll $file
} else {
eval UninstallFile $args
}
}

":DIR"	{
eval UninstallDirectory $args
}

":REGISTRY"	{
eval UninstallRegistryKey $args
}
}
}
}

proc ::InstallJammer::CreateApplicationInstallLog {} {
global conf
global info

if {$info(InstallRegistryInfo)} {
set file [::InstallJammer::InstallInfoDir $info(InstallID).info]
} else {
set file [::InstallJammer::TmpDir $info(InstallID).info]
}

set fp [open $file w]
fconfigure $fp -translation lf

set    string ""
append string "ApplicationID: <%ApplicationID%>\n"
append string "Dir:           <%InstallDir%>\n"
append string "Date:          [clock seconds]\n"
append string "User:          <%Username%>\n"
append string "RealUser:      <%RealUsername%>\n"
append string "Version:       <%InstallVersion%>\n"
append string "VersionString: <%Version%>\n"
append string "Source:        <%InstallSource%>\n"
append string "Executable:    <%Installer%>\n"
append string "Uninstaller:   <%Uninstaller%>\n"
append string "UpgradeID:     <%UpgradeApplicationID%>\n"

puts $fp [::InstallJammer::SubstText $string]

if {[info exists conf(APPLOG)]} {
foreach {var val} $conf(APPLOG) {
puts $fp "$var: $val"
}
}

close $fp
}

proc ::InstallJammer::CreateInstallLog { {file ""} } {
global conf
global info

if {$file eq ""} {
if {$info(InstallRegistryInfo)} {
set file [::InstallJammer::InstallInfoDir $info(InstallID).log]
} else {
set file [::InstallJammer::TmpDir $info(InstallID).log]
}
}

if {[catch { open $file w } fp]} { return }

::InstallJammer::LogFile $file

set line [list :DIR [Normalize $info(InstallDir) forward]]
puts $fp $line
set done($line) 1

set checkRemove 0
if {[info exists conf(RemoveFromUninstall)]} {
set checkRemove 1
set pattern [join $conf(RemoveFromUninstall) |]
}

foreach line $conf(LOG) {
if {![info exists done($line)]} {
set done($line) 1

if {$checkRemove} {
set type [lindex $line 0]
set dir  [lindex $line 1]
if {($type eq ":DIR" || $type eq ":FILE")
&& [regexp $pattern $dir]} { continue }
}

puts $fp $line
}
}
close $fp
}

proc ::InstallJammer::InstallLog {string} {
lappend ::conf(LOG) $string
}

proc ::InstallJammer::LogRegistry { args } {
::InstallJammer::InstallLog [concat :REGISTRY $args]
}

proc ::InstallJammer::CheckAndUpdateInstallRegistry {} {
global info

set dir [::InstallJammer::GetInstallInfoDir]

if {[file exists [file join $dir install.log]]} {

set newid [::InstallJammer::uuid]

set file [file join $dir .installinfo]
if {[file exists $file]} {
file delete $file
}

set file [file join $dir install.log]
if {[file exists $file]} {
file rename -force $file [file join $dir $newid.log]

set file [file join $dir $newid.log]
foreach x [split [string trim [read_file $file]] \n] {
if {[lindex $x 0] eq ":DIR"} {
set installdir [lindex $x 1]

set fp [open [file join $dir $newid.info] w]
fconfigure $fp -translation lf
puts  $fp "ApplicationID: $info(ApplicationID)"
puts  $fp "Dir:           $installdir"
puts  $fp "Date:          [file mtime $file]"
close $fp
break
}
}
}
}
}

proc ::InstallJammer::ReadPreviousInstall {} {
global conf
global info


variable ::InstallJammer::PreviousInstallInfo

if {[info exists PreviousInstallInfo]} { return }


set dir [::InstallJammer::GetInstallInfoDir]

::InstallJammer::CheckAndUpdateInstallRegistry


foreach file [glob -nocomplain -dir $info(InstallInfoDir) *.info] {
set info(PreviousInstallExists) 1

set id [file root [file tail $file]]
lappend PreviousInstallInfo(ids) $id

unset -nocomplain tmp

set tmp(ID) $id
::InstallJammer::ReadPropertyFile $file tmp

set mtime [file mtime $file]
if {[info exists tmp(Date)]} { set mtime $tmp(Date) }

lappend sort [list $mtime $id]

foreach var [array names tmp] {
set PreviousInstallInfo($id,$var) $tmp($var)
}
}

if {!$info(PreviousInstallExists)} { return }

unset -nocomplain tmp
set installdirs [list]
foreach list [lsort -integer -index 0 $sort] {
set id  [lindex $list 1]
set dir $PreviousInstallInfo($id,Dir)

if {$conf(windows)} {
set dir [string tolower [::InstallJammer::Normalize $dir]]
}

lappend installdirs $dir
}

foreach var [array names PreviousInstallInfo $id,*] {
set name [string range $var [string length $id,] end]
set info(PreviousInstall$name) $PreviousInstallInfo($var)
}

set info(PreviousInstallCount)     [llength [lsort -unique $installdirs]]
set info(PreviousInstallDirExists) [file exists $info(PreviousInstallDir)]
}

proc ::InstallJammer::StoreVersionInfo { {dir ""} {file ""} } {
global conf
global info
global versions


if {$info(InstallRegistryInfo)} {
if {$dir eq ""} { set dir [::InstallJammer::InstallInfoDir] }
if {$file eq ""} { set file $info(InstallID).ver }
} else {
if {$dir eq ""} { set dir $info(InstallDir) }
if {$file eq ""} { set file .installinfo }
}

set file [file join $dir $file]

if {[file exists $file]} {
catch { file delete -force $file }
}

if {[catch { open $file w } fp]} { return }
fconfigure $fp -translation lf

::InstallJammer::LogFile $file

foreach filename [array names versions] {
puts $fp "Ver [list $filename] $versions($filename)"
}

close $fp

if {$conf(windows)} {
file attributes $file -hidden 1
}
}

proc ::InstallJammer::ReadVersionInfo {} {
global info
global versions

set dir  [::InstallJammer::GetInstallInfoDir]
set file [file join $dir $info(InstallID).ver]
if {![file exists $file]} {
set file [file join $info(InstallDir) .installinfo]
}

if {[file exists $file]} {
set fp [open $file]

while {[gets $fp line] != -1} {
switch -- [lindex $line 0] {
"Ver" {
lassign $line cmd file ver
set versions($file) $ver
}
}
}

close $fp
}
}

proc ::InstallJammer::UnpackSolidProgress { in out showGui bytes {error ""} } {
global conf
global info

set top .__solidExtract

if {$error ne "" || [eof $in]} {
set conf(solidUnpackDone) 1
} else {
iincr conf(solidDone) $bytes.0
if {$conf(solidTotal) > 0} {
set conf(solidLeft) [expr {$conf(solidTotal) - $conf(solidDone)}]
set x [expr {round( ($conf(solidDone) * 100) / $conf(solidTotal))}]
if {$showGui} {
$top.p configure -value $x
wm title $top "$x% Extracting"
update
} else {
set info(InstallPercentComplete) $x
::InstallJammer::UpdateWidgets -update 1
}
}

if {$conf(solidLeft) == 0} {
set conf(solidUnpackDone) 1
return
}

set size [expr {64 * 1024}]
if {$size > $conf(solidLeft)} {
set size [expr {round($conf(solidLeft))}]
}

::fcopy $in $out -size $size -command [lrange [info level 0] 0 3]
}
}

proc ::InstallJammer::UnpackSolidArchives { {showGui 0} } {
global conf
global info

if {!$info(InstallHasSolidArchives) || $info(SolidArchivesExtracted)} {
return
}

set files [list]
set conf(solidDone)  0
set conf(solidTotal) 0
foreach file [glob -nocomplain -dir $conf(vfs) solid.*] {
lappend files $file
incr conf(solidTotal) [file size $file]
}

if {![llength $files]} { return }

if {!$info(GuiMode)} { set showGui 0 }

if {$showGui} {
set top .__solidExtract
toplevel    $top
wm withdraw $top
wm title    $top "0% Extracting"
wm geometry $top 270x60
wm protocol $top WM_DELETE_WINDOW {#}

ttk::progressbar $top.p
pack $top.p -expand 1 -fill both -padx 10 -pady 20

BWidget::place $top 270 60 center

wm deiconify $top
update

grab $top
} else {
set info(Status) "Extracting setup files..."
}

if {!$info(GuiMode) && !$info(SilentMode)} {
puts  stdout [::InstallJammer::SubstText $info(Status)]
flush stdout
}

foreach file $files {
set temp [TmpDir [file tail $file]]

set ifp [open $file]
fconfigure $ifp -translation binary

set ofp [open $temp w]
fconfigure $ofp -translation binary

::InstallJammer::UnpackSolidProgress $ifp $ofp $showGui 0

vwait ::conf(solidUnpackDone)

close $ifp
close $ofp

installkit::Mount $temp $conf(vfs)
}

if {$showGui} {
grab release $top
destroy $top
}

set info(SolidArchivesExtracted) 1
}

proc ::InstallJammer::AskUserLanguage {} {
global conf
global info

variable languages
variable languagecodes

set list [::InstallJammer::GetLanguages]

if {[llength $list] < 1} { return }

set top .__askLanguage

Dialog $top -title "Language Selection" -default ok -cancel 1
wm resizable $top 0 0
wm protocol  $top WM_DELETE_WINDOW {::InstallJammer::exit 1}

set f [$top getframe]

ttk::label $f.l -text "Please select the installation language"
pack $f.l -pady 10

ttk::combobox $f.cb -state readonly  -textvariable ::conf(Language) -values $list
pack $f.cb

$top add -name ok     -text "OK"
$top add -name cancel -text "Cancel"

set conf(Language) $info(Language)
foreach loc $conf(mclocale) {
if {[info exists languagecodes($loc)]} {
set conf(Language) $languagecodes($loc)
break
}
}

foreach lang [::msgcat::mcpreferences] {
if {[info exists languagecodes($lang)]} {
set conf(Language) $languagecodes($lang)
break
}
}

if {[$top draw] == 1} {
set info(WizardCancelled) 1
::InstallJammer::exit
}

set info(Language) $languages($conf(Language))
::msgcat::mclocale $info(Language)
}

proc ::InstallJammer::InstallMain {} {
global conf
global info

if {$info(SilentMode)} {
::InstallJammer::ExecuteActions "Startup Actions"
::InstallJammer::ExecuteActions Silent
} elseif {$info(ConsoleMode)} {
::InstallJammer::ConfigureBidiFonts
::InstallJammer::ExecuteActions "Startup Actions"
::InstallJammer::ExecuteActions Console
} else {
if {$info(AllowLanguageSelection)} {
::InstallJammer::AskUserLanguage
}

::InstallJammer::ConfigureBidiFonts

::InstallJammer::ExecuteActions "Startup Actions"

set info(WizardStarted) 1
::InstallJammer::CenterWindow $info(Wizard)
raise $info(Wizard)
::InstallJammer::Wizard next
}
}

proc ::InstallJammer::InitInstall {} {
global conf
global info

catch { wm withdraw . }

SourceCachedFile gui.tcl
SourceCachedFile common.tcl
SourceCachedFile setup.tcl
SourceCachedFile files.tcl
SourceCachedFile components.tcl

set info(InstallID) [::InstallJammer::uuid]

set info(RunningInstaller)   1
set info(RunningUninstaller) 0

::InstallJammer::CommonInit

set conf(stop)  [::InstallJammer::TmpDir .stop]
set conf(pause) [::InstallJammer::TmpDir .pause]

array set info {
Installing             0
InstallStarted         0
InstallStopped         0
InstallFinished        0

LicenseAccepted         No
FileBeingInstalled      ""
GroupBeingInstalled     ""
InstallPercentComplete  0

PreviousInstallDir      ""
PreviousInstallCount    0
PreviousInstallExists   0

RunningInstaller        1

SolidArchivesExtracted  0
InstallHasSolidArchives 0
}

set conf(LOG)      [list]
set conf(mode)     "InstallMode"
set conf(rollback) [string match "*Rollback*" $info(CancelledInstallAction)]
set conf(rollbackFiles) {}

set info(Installer)     $conf(exe)
set info(InstallSource) [file dirname $conf(exe)]

if {[llength [glob -nocomplain -dir $conf(vfs) solid.*]]} {
set info(InstallHasSolidArchives) 1
}

SafeSet info(UpgradeInstall)  [expr {[string trim $info(UpgradeApplicationID)] ne ""}]

::InstallJammer::ReadMessageCatalog messages

::InstallJammer::ParseCommandLineArguments $::argv

if {$info(GuiMode)} {
SourceCachedFile gui.tcl
InitGui
}

if {$info(ExtractSolidArchivesOnStartup)} {
::InstallJammer::UnpackSolidArchives 1
}

if {$::tcl_platform(platform) eq "unix"} {
if {$info(RequireRoot) && !$info(UserIsRoot)} {
if {!$info(PromptForRoot)} {
::InstallJammer::Message -title "Root Required" -message  [::InstallJammer::SubstText "<%RequireRootText%>"]
::exit 1
}

if {$info(PromptForRoot)} {
set msg [::InstallJammer::SubstText "<%PromptForRootText%>"]
set cmd [concat [list [info nameofexecutable]] $::argv]
::InstallJammer::ExecAsRoot $cmd -message $msg
::exit 0
}
}

variable ::InstallJammer::VirtualTextSetByCommandLine
if {$info(RootInstallDir) ne "" && $info(UserIsRoot)
&& ![info exists VirtualTextSetByCommandLine(InstallDir)]} {
set info(InstallDir) $info(RootInstallDir)
}
}

::InstallJammer::InitSetup
::InstallJammer::InitFiles

if {$conf(windows)} {
set key {HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion}
catch {
set info(UserInfoName)    [registry get $key RegisteredOwner]
set info(UserInfoCompany) [registry get $key RegisteredOrganization]
}
}

foreach var [list InstallDir ProgramFolderName] {
set info($var) [::InstallJammer::SubstText <%$var%>]
set info(Original$var) $info($var)
}

::InstallAPI::SetVirtualText -virtualtext ProgramFolderAllUsers  -command ::InstallJammer::ModifyProgramFolder

if {$info(UpgradeInstall)} {
::InstallJammer::ReadPreviousInstall
}

::InstallJammer::SelectSetupType

::InstallJammer::LoadTwapi

if {$conf(threaded)} {
set ::tid [installkit::newThread thread::wait]
thread::send $::tid [list set conf(windows) $conf(windows)]
thread::send $::tid [list set conf(threaded) $conf(threaded)]
thread::send $::tid [list set info(Ext) $info(Ext)]
thread::send $::tid [list set info(Temp) $info(Temp)]
thread::send $::tid [list set info(TempRoot) $info(TempRoot)]
thread::send $::tid [list set info(Platform) $info(Platform)]
thread::send $::tid [list eval $::InstallJammer::files(common.tcl)]
thread::send -async $::tid ::installkit::base
}
}

::InstallJammer::InitInstall

InstallType ::Common
InstallType ::Standard
InstallComponent 70364F59-3542-E36E-FC43-18B295772C15 -setup Install -type pane -title {Welcome Screen} -component Welcome -active Yes -parent Standard
InstallComponent E55EF3C7-ED39-DCC2-538F-81A46E080F8A -setup Install -type pane -conditions {21617B35-8D01-5A86-DB35-86E5F090902A C7ED3A19-3E0D-1162-F05C-367D3ABE881F} -title {Select Destination} -component SelectDestination -command insert -active Yes -parent Standard
Condition 21617B35-8D01-5A86-DB35-86E5F090902A -active Yes -parent E55EF3C7-ED39-DCC2-538F-81A46E080F8A -title {Script Condition} -component ScriptCondition
Condition C7ED3A19-3E0D-1162-F05C-367D3ABE881F -active Yes -parent E55EF3C7-ED39-DCC2-538F-81A46E080F8A -title {File Permission Condition} -component FilePermissionCondition
InstallComponent 8CD31907-2778-AC4C-A178-FB58C43712DF -setup Install -type pane -title {Start Copying Files} -component StartCopyingFiles -active Yes -parent Standard
InstallComponent 073E3F8C-ADC8-8230-15C8-2F8108592782 -setup Install -type pane -title {Copying Files} -component CopyFiles -active Yes -parent Standard
InstallComponent 099A6D97-6A29-C866-5C8E-E131E2D8715E -setup Install -type action -title {Disable Buttons} -component ModifyWidget -active Yes -parent 073E3F8C-ADC8-8230-15C8-2F8108592782
InstallComponent 629F9BF2-5725-73EA-6F47-EA9E75ABFDE7 -setup Install -type action -title {Execute Action} -component ExecuteAction -active Yes -parent 073E3F8C-ADC8-8230-15C8-2F8108592782
InstallComponent 53A63017-8385-B8EE-142A-65136147FA12 -setup Install -type action -title {Move Forward} -component MoveForward -active Yes -parent 073E3F8C-ADC8-8230-15C8-2F8108592782
InstallComponent EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF -setup Install -type pane -title {Setup Complete} -component SetupComplete -active Yes -parent Standard
InstallComponent 4C465E6F-9D44-F4D7-8064-5ECE64239B91 -setup Install -type action -conditions {4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68 9A10D654-6137-2828-5047-AFF307DE53B8} -title {Launch Application Checkbutton} -component AddWidget -command insert -active Yes -parent EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF
Condition 4C240F7C-5F6E-02EC-206D-F0D9BA5BEA68 -active Yes -parent 4C465E6F-9D44-F4D7-8064-5ECE64239B91 -title {File Exists Condition} -component FileExistsCondition
Condition 9A10D654-6137-2828-5047-AFF307DE53B8 -active Yes -parent 4C465E6F-9D44-F4D7-8064-5ECE64239B91 -title {String Is Condition} -component StringIsCondition
InstallComponent 48B4932D-8D72-1214-5078-F33A9BD89960 -setup Install -type action -conditions {E791CEF9-CCAA-8936-1114-79C5BF368152 5D86A438-171D-8286-765B-F1A104123527} -title {Desktop Shortcut Checkbutton} -component AddWidget -command insert -active Yes -parent EF2847CB-E3D7-A3D0-70D3-3E87EA61D5CF
Condition E791CEF9-CCAA-8936-1114-79C5BF368152 -active Yes -parent 48B4932D-8D72-1214-5078-F33A9BD89960 -title {File Exists Condition} -component FileExistsCondition
Condition 5D86A438-171D-8286-765B-F1A104123527 -active Yes -parent 48B4932D-8D72-1214-5078-F33A9BD89960 -title {String Is Condition} -component StringIsCondition
InstallType ::Default
InstallType ::Console
InstallType ::Silent
InstallType ::ActionGroups
InstallComponent B683709A-621C-49B3-69E1-A80071C1CACE -setup Install -type actiongroup -title {Setup Actions} -alias {Setup Actions} -active Yes -parent ActionGroups
InstallComponent 54A3E55E-DDE6-CD53-6011-02D33DF5BFDE -setup Install -type actiongroup -title {Startup Actions} -alias {Startup Actions} -active Yes -parent ActionGroups
InstallComponent 82C326B5-E226-6800-A589-31AA016CC09E -setup Install -type action -conditions {7BB33D54-49D1-24FA-27C9-D8C442EF0711 8938D967-84AB-9BC6-DFEC-AA60B8C1390A} -title Exit -component Exit -command insert -active Yes -parent 54A3E55E-DDE6-CD53-6011-02D33DF5BFDE
Condition 7BB33D54-49D1-24FA-27C9-D8C442EF0711 -active Yes -parent 82C326B5-E226-6800-A589-31AA016CC09E -title {String Is Condition} -component StringIsCondition
Condition 8938D967-84AB-9BC6-DFEC-AA60B8C1390A -active Yes -parent 82C326B5-E226-6800-A589-31AA016CC09E -title {Ask Yes or No} -component AskYesOrNo
InstallComponent F6416306-44AC-E54D-969B-11D71563C442 -setup Install -type action -title {Create Install Panes} -component CreateInstallPanes -active Yes -parent 54A3E55E-DDE6-CD53-6011-02D33DF5BFDE
InstallComponent DF44E112-7C44-054E-DDC6-7B8E119C230E -setup Install -type actiongroup -title {Install Actions} -alias {Install Actions} -active Yes -parent ActionGroups
InstallComponent 294C1998-2566-C983-7BE0-ECB818A339C6 -setup Install -type action -title {Install Selected Files} -component InstallSelectedFiles -active Yes -parent DF44E112-7C44-054E-DDC6-7B8E119C230E
InstallComponent ACE850F7-7260-0918-ED4D-A043B59676BD -setup Install -type action -conditions 3ED374ED-8769-C2E1-A5B4-2611FF0E8792 -title {Install Uninstaller} -component InstallUninstaller -command insert -active Yes -parent DF44E112-7C44-054E-DDC6-7B8E119C230E
Condition 3ED374ED-8769-C2E1-A5B4-2611FF0E8792 -active Yes -parent ACE850F7-7260-0918-ED4D-A043B59676BD -title {String Is Condition} -component StringIsCondition
InstallComponent F68AA157-4B17-FABA-4523-B0D105E7260F -setup Install -type action -conditions E082CAC8-715F-5B82-42E3-7B2FD48577E9 -title {Windows Uninstall Registry} -component AddWindowsUninstallEntry -command insert -active Yes -parent DF44E112-7C44-054E-DDC6-7B8E119C230E
Condition E082CAC8-715F-5B82-42E3-7B2FD48577E9 -active Yes -parent F68AA157-4B17-FABA-4523-B0D105E7260F -title {String Is Condition} -component StringIsCondition
InstallComponent BBFC8BB2-978A-6A82-64A5-956543B03628 -setup Install -type action -conditions B68C718A-7D67-2AE8-FDD8-525A5B934E19 -title {Program Shortcut} -component InstallProgramFolderShortcut -command insert -active Yes -parent DF44E112-7C44-054E-DDC6-7B8E119C230E
Condition B68C718A-7D67-2AE8-FDD8-525A5B934E19 -active Yes -parent BBFC8BB2-978A-6A82-64A5-956543B03628 -title {String Is Condition} -component StringIsCondition
InstallComponent 446BFF70-66AA-8729-5EB1-E5DFB83FCCA9 -setup Install -type action -conditions D8492003-5C19-FCC6-D2C2-BC6E7D29FD09 -title {Uninstall Shortcut} -component InstallProgramFolderShortcut -command insert -active Yes -parent DF44E112-7C44-054E-DDC6-7B8E119C230E
Condition D8492003-5C19-FCC6-D2C2-BC6E7D29FD09 -active Yes -parent 446BFF70-66AA-8729-5EB1-E5DFB83FCCA9 -title {String Is Condition} -component StringIsCondition
InstallComponent FC32BEF7-192F-A3D5-C190-6F5BDF2B783E -setup Install -type actiongroup -title {Finish Actions} -alias {Finish Actions} -active Yes -parent ActionGroups
InstallComponent 97C38F94-90CA-6717-CC51-78D0D43EE48A -setup Install -type action -conditions {B9C43883-A007-209B-5187-6894BC5C7C65 12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F} -title {Install Desktop Shortcut} -component InstallDesktopShortcut -command insert -active Yes -parent FC32BEF7-192F-A3D5-C190-6F5BDF2B783E
Condition B9C43883-A007-209B-5187-6894BC5C7C65 -active Yes -parent 97C38F94-90CA-6717-CC51-78D0D43EE48A -title {String Is Condition} -component StringIsCondition
Condition 12BBAD85-A1BB-2F0E-874F-2638E1CE6B6F -active Yes -parent 97C38F94-90CA-6717-CC51-78D0D43EE48A -title {File Exists Condition} -component FileExistsCondition
InstallComponent F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23 -setup Install -type action -conditions {43A515B8-D335-D77D-4CF0-025B35D62CFD 19F2DF18-82AF-7F49-64C2-061CFB249FD3 2204086F-F5B9-392D-E5E1-8C0EDFB4D38B} -title {Launch Application} -component ExecuteExternalProgram -command insert -active Yes -parent FC32BEF7-192F-A3D5-C190-6F5BDF2B783E
Condition 43A515B8-D335-D77D-4CF0-025B35D62CFD -active Yes -parent F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23 -title {String Is Condition} -component StringIsCondition
Condition 19F2DF18-82AF-7F49-64C2-061CFB249FD3 -active Yes -parent F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23 -title {String Is Condition} -component StringIsCondition
Condition 2204086F-F5B9-392D-E5E1-8C0EDFB4D38B -active Yes -parent F8EBB3C0-597D-D1C6-82CC-1C9B04F06C23 -title {File Exists Condition} -component FileExistsCondition
InstallComponent 25BB083B-B2C6-F7C4-1452-A26D799DA353 -setup Install -type actiongroup -title {Cancel Actions} -alias {Cancel Actions} -active Yes -parent ActionGroups


proc ::ThemeMain {} {
::InstallJammer::InstallMain
}

if {![info exists ::InstallJammer]} { ThemeMain }

