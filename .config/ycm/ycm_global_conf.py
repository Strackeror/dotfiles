# Partially stolen from https://bitbucket.org/mblum/libgp/src/2537ea7329ef/.ycm_extra_conf.py
import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
cflags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    # For a C project, you would set this to something like 'c99' instead of
    # 'c++11'.
    '-std=c99',
    # For a C project, you would set this to 'c' instead of 'c++'.
    '-x', 'c',
    # This path will only work on OS X, but extra paths that don't exist are not
    # harmful
    '-isystem', '/usr/local/include',
    '-I', '.',
    '-I', '..',
    '-I', './include',
    '-I', '../include'
]

cppflags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wc++98-compat',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    # For a C project, you would set this to something like 'c99' instead of
    # 'c++11'.
    '-std=c++11',
    # For a C project, you would set this to 'c' instead of 'c++'.
    '-x', 'c++',
    # This path will only work on OS X, but extra paths that don't exist are not
    # harmful
    '-isystem', '/usr/local/include',
    '-I', '.',
    '-I', '..',
    '-I', './include',
    '-I', '../include'
]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags

def flagsFromFileType(filename):
    extension = os.path.splitext(filename)[1]
    if (extension in ['.hpp', '.cpp']):
        return cppflags
    else:
        return cflags

def FlagsForFile( filename ):
  flags = flagsFromFileType(filename)
  relative_to = os.getcwd()
  final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }
