/* 32-bit integer traits */

#define Scalar int32       /* integer type */
#define Int int32          /* corresponding signed integer type */
#define UInt uint32        /* corresponding unsigned integer type */
#define PBITS 5            /* number of bits needed to encode precision */
#define NBMASK 0xaaaaaaaau /* negabinary mask */

// dont use the functions below for int compression
#define EBITS 8              
#define FABS(x)     fabsf(x)
#define FREXP(x, e) frexpf(x, e)
#define LDEXP(x, e) ldexpf(x, e)
