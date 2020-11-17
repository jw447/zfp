# 1 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/src/cuda_zfp/cuZFP.cu"
# 770 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/include/zfp.h"
struct timeval expCostS = {0};
struct timeval expCostE = {0};
struct timeval mCostS = {0};
struct timeval mCostE = {0};
struct timeval xCostS = {0};
struct timeval xCostE = {0};
struct timeval oCostS = {0};
struct timeval oCostE = {0};
struct timeval enCostS = {0};
struct timeval enCostE = {0};
# 178 "/usr/include/c++/4.8.2/bits/basic_string.h" 3
extern _ZNSs9size_typeE _ZNSs4_Rep20_S_empty_rep_storageE[] __attribute__((visibility("default")));
# 61 "/usr/include/c++/4.8.2/iostream" 3
extern _ZSt7ostream _ZSt4cout __attribute__((visibility("default")));
extern _ZSt7ostream _ZSt4cerr __attribute__((visibility("default")));
# 74 "/usr/include/c++/4.8.2/iostream" 3
static struct _ZNSt8ios_base4InitE _ZSt8__ioinit __attribute__((visibility("default"))) = {};
# 9 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/src/cuda_zfp/constants.h"
static const unsigned char _ZN5cuZFP7perm_3dE[64];
# 97 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/src/cuda_zfp/constants.h"
static const unsigned char _ZN5cuZFP6perm_1E[4];
# 105 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/src/cuda_zfp/constants.h"
static const unsigned char _ZN5cuZFP6perm_2E[16];
extern void *__dso_handle __attribute__((visibility("hidden")));
# 9 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/src/cuda_zfp/constants.h"
static const unsigned char _ZN5cuZFP7perm_3dE[64] = {((unsigned char)0U),((unsigned char)1U),((unsigned char)4U),((unsigned char)16U),((unsigned char)20U),((unsigned char)17U),((unsigned char)5U),((unsigned char)2U),((unsigned char)8U),((unsigned char)32U),((unsigned char)21U),((unsigned char)6U),((unsigned char)18U),((unsigned char)24U),((unsigned char)9U),((unsigned char)33U),((unsigned char)36U),((unsigned char)3U),((unsigned char)12U),((unsigned char)48U),((unsigned char)22U),((unsigned char)25U),((unsigned char)37U),((unsigned char)40U),((unsigned char)34U),((unsigned char)10U),((unsigned char)7U),((unsigned char)19U),((unsigned char)28U),((unsigned char)13U),((unsigned char)49U),((unsigned char)52U),((unsigned char)41U),((unsigned char)38U),((unsigned char)26U),((unsigned char)23U),((unsigned char)29U),((unsigned char)53U),((unsigned char)11U),((unsigned char)35U),((unsigned char)44U),((unsigned char)14U),((unsigned char)50U),((unsigned char)56U),((unsigned char)42U),((unsigned char)27U),((unsigned char)39U),((unsigned char)45U),((unsigned char)30U),((unsigned char)54U),((unsigned char)57U),((unsigned char)60U),((unsigned char)51U),((unsigned char)15U),((unsigned char)43U),((unsigned char)46U),((unsigned char)58U),((unsigned char)61U),((unsigned char)55U),((unsigned char)31U),((unsigned char)62U),((unsigned char)59U),((unsigned char)47U),((unsigned char)63U)};
# 97 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/src/cuda_zfp/constants.h"
static const unsigned char _ZN5cuZFP6perm_1E[4] = {((unsigned char)0U),((unsigned char)1U),((unsigned char)2U),((unsigned char)3U)};
# 105 "/gpfs/alpine/proj-shared/csc143/jwang/local-build/zfp/src/cuda_zfp/constants.h"
static const unsigned char _ZN5cuZFP6perm_2E[16] = {((unsigned char)0U),((unsigned char)1U),((unsigned char)4U),((unsigned char)5U),((unsigned char)2U),((unsigned char)8U),((unsigned char)6U),((unsigned char)9U),((unsigned char)3U),((unsigned char)12U),((unsigned char)10U),((unsigned char)7U),((unsigned char)13U),((unsigned char)11U),((unsigned char)14U),((unsigned char)15U)};
