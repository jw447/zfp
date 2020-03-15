static uint _t2(rev_encode_block, Int, DIMS)(bitstream* stream, int minbits, int maxbits, int maxprec, Int* iblock);

/* public functions -------------------------------------------------------- */

/* encode contiguous integer block */
uint
_t2(zfp_encode_block, Int, DIMS)(zfp_stream* zfp, const Int* iblock)
{
  cache_align_(Int block[BLOCK_SIZE]);
  uint i;
  /* copy block */
  for (i = 0; i < BLOCK_SIZE; i++)
    block[i] = iblock[i];
  //return REVERSIBLE(zfp) ? _t2(rev_encode_block, Int, DIMS)(zfp->stream, zfp->minbits, zfp->maxbits, zfp->maxprec, block) : _t2(encode_block, Int, DIMS)(zfp->stream, zfp->minbits, zfp->maxbits, zfp->maxprec, block);
  printf("not available\n");
  return 0;
}

uint
_t2(jw_zfp_encode_block, Int, DIMS)(zfp_stream* zfp, const Int* iblock, CPU_timing* cpu_timing)
{
  cache_align_(Int block[BLOCK_SIZE]);
  uint i;
  /* copy block */
  for (i = 0; i < BLOCK_SIZE; i++)
    block[i] = iblock[i];
  return REVERSIBLE(zfp) ? _t2(rev_encode_block, Int, DIMS)(zfp->stream, zfp->minbits, zfp->maxbits, zfp->maxprec, block) : _t2(encode_block, Int, DIMS)(zfp->stream, zfp->minbits, zfp->maxbits, zfp->maxprec, block, cpu_timing);
}
