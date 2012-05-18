#include <iostream>
#include <cstring>
#include <cstdlib>

#include <cstdio>
    #ifdef WINDOWS
        #include <direct.h>
        #define GetCurrentDir _getcwd
    #else
        #include <unistd.h>
        #define GetCurrentDir getcwd
    #endif


int main(int argc, char* argv[])
{   
    if(argc>0 && (strcmp(argv[1],"-h")==0 || strcmp(argv[1],"-help")==0) && false)
    {    std::cout << "About Randomizer v1.0.3" << std::endl << 
                     "Made by Qweex [mrqweex@qweex.com]" << std::endl << "http://www.qweex.com" << std::endl << 
                     "Distributed under the GPL v3" << std::endl << std::endl << 
                     "The first argument must be the folder that is to be searched. Leave only a '-' if you want to use the current folder." << std::endl << 
                     "The second argument can optionally be '-r' or '-recurse' which will cause Randomizer to NOT recurse into subfolders." << std::endl << 
                     "Any remaining parameters will be the filetypes to search. If there are no filetypes specified, Randomizer will include ALL files." << std::endl << 
                     "If there are no arguments at all, Randomizer will recursively find all files in the current folder." << std::endl << std::endl << 
                     "Examples:" << std::endl << 
                     "randomizer.exe \"C:\\Funny Pictures\" -r jpg gif png" << std::endl << 
                     "randomizer.exe - xcf svg" << std::endl << "randomizer.exe C:\\" << std::endl;
        return 0;
    }
    
    char *folder=NULL;
    bool recurse;
    if(argc==0 || true)
    {        
        folder=getcwd(folder,FILENAME_MAX);
        recurse = true
        
    }
}