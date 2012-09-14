#Created on 2009-4-4

#@author: tiger
#'''
import getopt
import sys
import os
import re

def usage( ):
    print( "cscope-indexer [ -v ] [-f database_file ] [-i list_file ] [ -l ] [ -r ]" )
    pass
    

def listRecurse( rootDir, reg, fileName ):
    fp = open( fileName, 'w' )
    for root, dirs, files in os.walk( rootDir ):
        for file in files :
            if reg.search(file) != None :
                fp.write( os.path.join( root, file ) )
    fp.close()
    pass

def lisrNoRecurse( rootDir, reg, fileName ):
    fp = open( fileName, 'w' )
    for file in os.listdir( rootDir ) :
        if reg.search(file) != None :
            fp.write( os.path.join( rootDir, file ) )
    fp.close()
    pass


if __name__ == '__main__':
    databaseFile = "cscope.out"
    listFile = "cscope.files"
    listOnly = False
    recurse = False
    verbose = False
    dir = "."
    try:
        opts,args=getopt.getopt(sys.argv[1:],'vf:i:lr')
        for flag,data in opts :
            if flag == "-v":
                verbose = True
            elif flag == "-f":
                if data == "":
                    usage()
                    os.system.exit()
                else:
                    databaseFile = data
            elif flag == "-i":
                if data == "":
                    usage()
                    os.system.exit()
                else:
                    listFile = data
            elif flag == "-l":
                listOnly = True
            elif flag == "-r":
                recurse = True
            else:
                usage()
                os.system.exit()
        if len(args) != 0:
            dir = args[0]
    except getopt.GetoptError:
        usage()
        os.system.exit()
    if verbose == True:
        print( "Creating list of files to index ..." ) 
    os.chdir( dir )
    reg = re.compile('\.([chly](xx|pp)*|cc|hh)$')
    if recurse == False :
        lisrNoRecurse( dir, reg, listFile )
    else:
        listRecurse( dir, reg, listFile )
    if verbose == True:
        print( "Creating list of files to index ... done" )
    if listOnly == True :
        os.system.exit()
    if verbose == True :
        print( "Indexing files ..." )
    os.system( "cscope -b -i "+listFile+" -f "+databaseFile )
    if verbose == True :
        print( "Indexing files ... done" )
    
    pass