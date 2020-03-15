
if(NOT "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitinfo.txt" IS_NEWER_THAN "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone  "https://git.cryptomilk.org/projects/cmocka.git" "cmocka-src"
    WORKING_DIRECTORY "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug"
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
  COMMAND "/usr/bin/git"  checkout cmocka-1.1.0 
  WORKING_DIRECTORY "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'cmocka-1.1.0'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  submodule update --recursive --init 
  WORKING_DIRECTORY "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitinfo.txt"
    "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/tests/cmocka_cloned-prefix/src/cmocka_cloned-stamp/cmocka_cloned-gitclone-lastrun.txt'")
endif()

