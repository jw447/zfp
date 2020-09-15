if("cmocka-1.1.0" STREQUAL "")
  message(FATAL_ERROR "Tag for git checkout should not be empty.")
endif()

set(run 0)

if("/home/ubuntu/local_build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitinfo.txt" IS_NEWER_THAN "/home/ubuntu/local_build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitclone-lastrun.txt")
  set(run 1)
endif()

if(NOT run)
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/ubuntu/local_build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/home/ubuntu/local_build/zfp/build_debug/cmocka-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/ubuntu/local_build/zfp/build_debug/cmocka-src'")
endif()

# try the clone 3 times incase there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git" clone --origin "origin" "https://git.cryptomilk.org/projects/cmocka.git" "cmocka-src"
    WORKING_DIRECTORY "/home/ubuntu/local_build/zfp/build_debug"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://git.cryptomilk.org/projects/cmocka.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git" checkout cmocka-1.1.0
  WORKING_DIRECTORY "/home/ubuntu/local_build/zfp/build_debug/cmocka-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'cmocka-1.1.0'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule init 
  WORKING_DIRECTORY "/home/ubuntu/local_build/zfp/build_debug/cmocka-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to init submodules in: '/home/ubuntu/local_build/zfp/build_debug/cmocka-src'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule update --recursive 
  WORKING_DIRECTORY "/home/ubuntu/local_build/zfp/build_debug/cmocka-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/ubuntu/local_build/zfp/build_debug/cmocka-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/ubuntu/local_build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitinfo.txt"
    "/home/ubuntu/local_build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitclone-lastrun.txt"
  WORKING_DIRECTORY "/home/ubuntu/local_build/zfp/build_debug/cmocka-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/ubuntu/local_build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitclone-lastrun.txt'")
endif()

