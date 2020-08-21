/* 64-bit integer traits */

#define Scalar int64                       /* integer type */
#define Int int64                          /* corresponding signed integer type */
#define UInt uint64                        /* corresponding unsigned integer type */
#define PBITS 6                            /* number of bits needed to encode precision */
#define NBMASK UINT64C(0xaaaaaaaaaaaaaaaa) /* negabinary mask */
// dont use the functions below for int compression
#define EBITS 8              
#define FABS(x)     fabsf(x)
#define FREXP(x, e) frexpf(x, e)
#define LDEXP(x, e) ldexpf(x, e)
