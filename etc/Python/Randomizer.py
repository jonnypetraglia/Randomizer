import sys, os, random, fnmatch #glob
if(sys.platform.startswith('win')):
    import win32api, win32con, win32file
else:
    import subprocess
###
helpMessage = "Randomizer v1.0.3: This is the beta of the Python version, so do go easy on me!"###
###
###
###
###
###
###
###
###
###
###
###
###
###
###
###
recurse=True###
thisExt=""###
argCount=len(sys.argv)-1
folder = sys.argv[1] if argCount>0 else ""
if(folder=="-h" or folder=="-help"):
    print helpMessage
    sys.exit(0)

if(argCount==0):
    folder=os.getcwd()
    typeCount=recurse=1 # recurse=true
    thisExt="*"
else:
    if(folder=="-"):
        folder=os.getcwd()
    elif(os.path.exists(folder)==0):
        sys.exit(-4)
    
    if(argCount>1 and (sys.argv[2]=="-r" or sys.argv[2]=="-recurse")):
        recurse=False
        offset=2
    else:
        recurse=offset=1
        typeCount=argCount-offset
array=[]###
fileCount=0
if(typeCount==0):
    thisExt="*"
    typeCount=1
target=""###
for i in range(1,typeCount+1):
    if(not thisExt):
        thisExt = sys.argv[i + offset]
    
    # Ok, the line correlation stops here. #
    if(recurse==False):
        target=random.choice(os.listdir(folder))
        break
    else:
        for path, dirs, files in os.walk(folder):
            for infile in fnmatch.filter(files, "*." + thisExt):
                if(os.path.realpath(os.path.join(sys.path[0],sys.argv[0]))!=os.path.realpath(os.path.join(path,infile)) and os.path.exists(os.path.realpath(os.path.join(path,infile))) and (not sys.platform.startswith('win') or (win32file.GetFileAttributes(infile) and  win32con.FILE_ATTRIBUTE_SYSTEM))):
                    array.append(os.path.realpath(os.path.join(path,infile)))
                else:
                    print "what"

if(not target):
    if(recurse==True and len(array)>0):
        target=array[random.randint(0,len(array)-1)]
    else:
        print "No file(s) found."
        exit(1)
print target
if(sys.platform=="linux2"):
    subprocess.call(["xdg-open", target])
else:
    os.startfile(target) # ? win32api.ShellExecute(0,"",file,None,".",0)
    
    
'''
for infile in glob.glob(folder + "/*/*." + thisExt):           #Need to check recurse
    if(os.path.abspath(infile)!=os.path.abspath(sys.argv[0]) and os.path.isdir(infile)!=True and os.path.exists(infile) and (not sys.platform.startswith('win') or ( win32file.GetFileAttributes(infile) and  win32con.FILE_ATTRIBUTE_SYSTEM))):
        array.append(infile)
'''