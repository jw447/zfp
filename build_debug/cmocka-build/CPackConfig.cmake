# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BINARY_7Z "")
set(CPACK_BINARY_BUNDLE "")
set(CPACK_BINARY_CYGWIN "")
set(CPACK_BINARY_DEB "OFF")
set(CPACK_BINARY_DRAGNDROP "")
set(CPACK_BINARY_FREEBSD "OFF")
set(CPACK_BINARY_IFW "OFF")
set(CPACK_BINARY_NSIS "OFF")
set(CPACK_BINARY_NUGET "")
set(CPACK_BINARY_OSXX11 "")
set(CPACK_BINARY_PACKAGEMAKER "")
set(CPACK_BINARY_PRODUCTBUILD "")
set(CPACK_BINARY_RPM "OFF")
set(CPACK_BINARY_STGZ "ON")
set(CPACK_BINARY_TBZ2 "OFF")
set(CPACK_BINARY_TGZ "ON")
set(CPACK_BINARY_TXZ "OFF")
set(CPACK_BINARY_TZ "ON")
set(CPACK_BINARY_WIX "")
set(CPACK_BINARY_ZIP "")
set(CPACK_BUILD_SOURCE_DIRS "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src;/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-build")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENTS_ALL "")
set(CPACK_COMPONENT_HEADERS_DEPENDS "libraries")
set(CPACK_COMPONENT_HEADERS_DESCRIPTION "C/C++ header files for use with cmocka")
set(CPACK_COMPONENT_HEADERS_DISPLAY_NAME "C/C++ Headers")
set(CPACK_COMPONENT_HEADERS_GROUP "Development")
set(CPACK_COMPONENT_LIBRARIES_DESCRIPTION "Libraries used to build programs which use cmocka")
set(CPACK_COMPONENT_LIBRARIES_DISPLAY_NAME "Libraries")
set(CPACK_COMPONENT_LIBRARIES_GROUP "Development")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_GENERATOR "STGZ;TGZ;TZ")
set(CPACK_INSTALL_CMAKE_PROJECTS "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-build;cmocka;ALL;/")
set(CPACK_INSTALL_PREFIX "/usr/local")
set(CPACK_MODULE_PATH "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src/cmake/Modules")
set(CPACK_NSIS_DISPLAY_NAME "cmocka")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "cmocka")
set(CPACK_OUTPUT_CONFIG_FILE "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-build/CPackConfig.cmake")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src/README")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Unit testing framework for C with mock objects")
set(CPACK_PACKAGE_FILE_NAME "cmocka-1.1.0")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "cmocka")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "cmocka")
set(CPACK_PACKAGE_NAME "cmocka")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Andreas Schneider")
set(CPACK_PACKAGE_VERSION "1.1.0")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_RESOURCE_FILE_LICENSE "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-src/COPYING")
set(CPACK_RESOURCE_FILE_README "/autofs/nccs-svm1_sw/summit/.swci/0-core/opt/spack/20180914/linux-rhel7-ppc64le/gcc-4.8.5/cmake-3.15.2-xit2o3iepxvqbyku77lwcugufilztu7t/share/cmake-3.15/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "/autofs/nccs-svm1_sw/summit/.swci/0-core/opt/spack/20180914/linux-rhel7-ppc64le/gcc-4.8.5/cmake-3.15.2-xit2o3iepxvqbyku77lwcugufilztu7t/share/cmake-3.15/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_7Z "")
set(CPACK_SOURCE_CYGWIN "")
set(CPACK_SOURCE_GENERATOR "TGZ")
set(CPACK_SOURCE_IGNORE_FILES "~$;[.]swp$;/[.]svn/;/[.]git/;.gitignore;/obj*/;tags;cscope.*;.ycm_extra_conf.pyc")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-build/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "cmocka-1.1.0")
set(CPACK_SOURCE_RPM "")
set(CPACK_SOURCE_TBZ2 "")
set(CPACK_SOURCE_TGZ "")
set(CPACK_SOURCE_TXZ "")
set(CPACK_SOURCE_TZ "")
set(CPACK_SOURCE_ZIP "")
set(CPACK_SYSTEM_NAME "Linux")
set(CPACK_TOPLEVEL_TAG "Linux")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/build_debug/cmocka-build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
