#!/usr/bin/env python

##Copyright 2008 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCasacde library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.

#
# This module sets necessary paths for building pythonOCC
#
import sys
import os, os.path
import shutil
#
# Define pythonOCC version
#
VERSION = '20090126'#'1.0pre2'
#
# Define build parameters
#
SWIG_FILES_PATH = os.path.join(os.getcwd(),'SWIG_src')
#
# Define paths
#
version_info = sys.version_info
if sys.platform == 'win32':
    OCC_BUILD_PATH = os.path.join(os.getcwd(),'build','lib.win32-%i.%i'%(version_info[0],version_info[1]),'OCC')
elif sys.platform == 'linux2':
    OCC_BUILD_PATH = os.path.join(os.getcwd(),'build','lib.linux-i686-%i.%i'%(version_info[0],version_info[1]),'OCC')
    
try:
    OCC_ROOT = os.environ['CASROOT']
except KeyError:
    print "OopenCascade CAS_ROOT environment variable not set."
    OCC_ROOT = None

if sys.platform=='win32':
    SWIG_FILES_PATH_MODULAR = os.path.join(os.getcwd(),'SWIG_src_modular_win32')
    # Try to find OCC paths from environment analysis
    if OCC_ROOT!=None:
        OCC_INC = os.path.join(OCC_ROOT,'inc')
        OCC_LIB = os.path.join(OCC_ROOT,'win32','lib')
    else:
        OCC_INT='C:/OCC/ros/inc'
        OCC_LIB='C:/OCC/ros/win32/lib'
    GCC_XML_PATH = os.path.join(os.getcwd(),'pygccxml','gccxml_bin','v09','win32','bin')
    PYGCCXML_DEFINES = ['WNT','__SWIG_GENERATION__','CSFDB','WIN32','_WINDOWS']
    DEFINE_MACROS = [('WNT', None),('WIN32',None),('_WINDOWS',None),('CSFDB',None)]
    #ECA = ['/D"WNT"','/D"WIN32"','/D"_WINDOWS"','/D"CSFDB"','/link /MACHINE:X86 /SUBSYSTEM:WINDOWS']
    ECA = ['/link','/MACHINE:X86','/SUBSYSTEM:CONSOLE']#,'/Os'] #space optimization
    #SWIG_OPTS = ['-modern','-small','-fastdispatch','-c++','-DWNT','-Wall','-DCSFDB','-DWIN32','-D_WINDOWS']
    SWIG_OPTS = ['-O','-c++','-DWNT','-Wall','-DCSFDB','-DWIN32','-D_WINDOWS']
elif sys.platform=='linux2':
    SWIG_FILES_PATH_MODULAR = os.path.join(os.getcwd(),'SWIG_src_modular_linux_darwin')
    os.environ['CC'] = 'g++'
    os.environ['CPP'] = 'g++'
    OCC_INC = '/usr/local/inc' # Ubuntu 8.04 Hardy default installation path for headers
    OCC_LIB = '/usr/local/lib' # Ubuntu 8.04 Hardy default installation path for libraries
    GCC_XML_PATH = '/usr/bin' # Ubuntu 8.04 Hardy installation path for gccxml
    PYGCCXML_DEFINES = ['HAVE_CONFIG_H','HAVE_LIMITS_H','CSFDB','OCC_CONVERT_SIGNALS','LIN','LININTEL','_GNU_SOURCE=1']
    DEFINE_MACROS = [('HAVE_CONFIG_H',None),('HAVE_LIMITS_H',None),('CSFDB',None),('OCC_CONVERT_SIGNALS',None),('LIN',None),('LININTEL',None),('_GNU_SOURCE','1')]
    SWIG_OPTS = ['-modern','-fcompact','-c++','-DHAVE_LIMITS_H','-DHAVE_CONFIG_H','-DCSFDB','-DOCC_CONVERT_SIGNALS','-DLIN','-DLININTEL','-D_GNU_SOURCE=1']
    ECA = ['-O0']
elif sys.platform=='darwin':
    SWIG_FILES_PATH_MODULAR = os.path.join(os.getcwd(),'SWIG_src_modular_linux_darwin')
    #
    # Fill in this part with your own settings
    #
    os.environ['CC'] = 'g++'
    os.environ['CPP'] = 'g++'
    OCC_INC = '/usr/local/inc'
    OCC_LIB = '/usr/local/lib'
    GCC_XML_PATH = '/usr/bin' 
    PYGCCXML_DEFINES = ['HAVE_CONFIG_H','HAVE_LIMITS_H','CSFDB','OCC_CONVERT_SIGNALS']
    DEFINE_MACROS = [('HAVE_CONFIG_H',None),('HAVE_LIMITS_H',None),('CSFDB',None),('OCC_CONVERT_SIGNALS',None)]
    SWIG_OPTS = ['-modern','-fcompact','-c++','-DHAVE_LIMITS_H','-DHAVE_CONFIG_H','-DCSFDB','-DOCC_CONVERT_SIGNALS']
    ECA = ['-O0']
else:
    raise "Unknown platform"
# if path does not exists, creating it
if not os.path.isdir(SWIG_FILES_PATH):
    os.mkdir(SWIG_FILES_PATH)
if not os.path.isdir(SWIG_FILES_PATH_MODULAR):
    os.mkdir(SWIG_FILES_PATH_MODULAR)
#
# Under WNT, modify Standard_Real.hxx so that it can be parsed by GCCXML without issue
#
if sys.platform == 'win32':
    standard_real_header = os.path.join(OCC_INC,"Standard_Real.hxx")
    if not os.path.isfile(standard_real_header):
        print "%s not found."%standard_file_header
        sys.exit(0)
    else:
        fp = open(standard_real_header,"r")
        file_content = fp.read()
        fp.close()
        if not '__SWIG_GENERATION__' in file_content:#need rewriting
            key = raw_input("Original Standard_Real.hxx header file needs to be modified. Original file will be available with the name Standard_Real_Original.hxx.\nEnter 'y' or 'Y' if you whish to continue.'n' otherwise:")# first mode Standard_Real.hxx to Standard_Real_Original.hxx
            if key.lower()=='y':
                shutil.copy(standard_real_header, os.path.join(OCC_INC,"Standard_Real_Original.hxx"))
                #replacing string
                file_content = file_content.replace("#if defined(WNT)","#if defined(WNT) && !defined(__SWIG_GENERATION__)")
                fp = open(standard_real_header,"w")
                fp.write(file_content)
                fp.close()
            else:
                sys.exit(0)
        else:
            print "Found modified Standard_Real.hxx header file."
#
# OCC header file TopOpeBRepDS_tools.hxx maybe missing, causing a gccxml error.
#
if not os.path.isfile(os.path.join(OCC_INC,'TopOpeBRepDS_tools.hxx')):
    f = open(os.path.join(OCC_INC,'TopOpeBRepDS_tools.hxx'),'w')
    f.close()
    print "TopOpeBRepDS_tools.hxx created in %s"%OCC_INC