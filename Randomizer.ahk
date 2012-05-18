/*
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	~~~~~~~~~~~~~~~~~~Randomizer v1.0.3~~~~~~~~~~~~~~~~~~~
	~~~~~~~~~~~~Copyright Jon Petraglia 2011~~~~~~~~~~~~~~
	~~~Distributed under the GNU General Public License~~~
	~~http://sites.google.com/site/freewarewiresoftware/~~
	~~~~~~~~~~~~~~~~~FreewareWire@gmail.com~~~~~~~~~~~~~~~
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
About_Name=Randomizer
About_Version=1.0b
About_DateLaunch=2009
About_Date=2012
About_CompiledDate=02/06/2012
About_Message=The first argument must be the folder that is to be searched. Leave only a "-" if you want to use the current folder.`nThe second argument can optionally be "-r" or "-recurse" which will cause Randomizer to NOT recurse into subfolders.`nAny remaining parameters will be the filetypes to search. If there are no filetypes specified, Randomizer will include ALL files.`nIf there are no arguments at all`, Randomizer will recursively find all files in the current folder.`n`nExamples:`nrandomizer.exe "C:\Funny Pictures" -r jpg gif png`nrandomizer.exe - xcf svg`nrandomizer.exe C:\
#include Update_noL.ahk

#notrayicon
N=%0%
F=%1%
if(F="-u" || F="-update")
	goto update
if(F="-h" || F="-help")
goto showabout
if !N							;IF THERE ARE NO ARGUMENTS:
{ F:=A_Scriptdir					; then the folder is the current directory,
C:=R:=1								; Recurse is on, and Filetype Count is set to 1
E=*									; This means "all filetypes"
}else{							;OTHERWISE...
if(F="-")							;If the first parameter is "-"
F:=A_ScriptDir							; then the folder is the current directory
ifnotexist,% F						; if the folder doesn't exist
exit -4									; exit the program
O=%2%								; (Temporary variable)
if(O="-r" || O="-recurse")			;If the user turned off recursing
{ R=0									; turn off recursing
O=2										; and there are 2 parameters before the filetypes
} Else								;Otherwise...
R:=O:=1									; Turn recursing on, and there is only 1 paremeter (the folder) before the filetypes
C:=N-O								;The total number of filetypes = the total number of arguments - 
}									; how many paremeters are before the arguments
N=0								;Now N will be used as a Counter
if !C							;If we don't know how many filetypes there are yet
{ E=*							; then include all filetypes
C++								; and make the filetype count = 1 (for the "*")
}
loop % C {						;Loop as many times as the filetype count
if !E								;If E != *
{ E:=A_Index+O							; set E to the next argument; A_index is the iteration and O is how many arguments
E:=%E%									; come before the filetypes
}
Loop,%F%\*.%E%,0,%R%				;Create a list of all the files
{ if(A_LoopFileFullPath!=A_Scriptfullpath and !InStr(FileExist(A_LoopFileFullPath),"S"))
{ X%N%:=A_LoopFileFullPath			;If the file isn't Randomizer and isn't a system file, add it to the list
N++									;Increase the value of the counter
}
}
}
Random,R,1,%N%					;Choose random value between 1 and length of the list
Run,% X%R%						;Run that file!
exitapp

/*
C - FileTypesCount
E - Ext/AllFiletypes
F - Folder
N - ArgCount/TotalFile
O - Temp/Offset
R - Recurse/Random
X - FileArray

Total Count = 1849
Comments = 1314
Character Count = 1849 - 1314 = 535
Line Count = 71 - 30 = 41
Icon courtesy of http://www.iconfinder.com/icondetails/49848/128/media_random_shuffle_icon
*/

#include AboutWindow.ahk