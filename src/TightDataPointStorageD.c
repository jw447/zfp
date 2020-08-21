/**
 *  @file TightPointDataStorageD.c
 *  @author Sheng Di and Dingwen Tao
 *  @date Aug, 2016
 *  @brief The functions used to construct the tightPointDataStorage element for storing compressed bytes.
 *  (C) 2016 by Mathematics and Computer Science (MCS), Argonne National Laboratory.
 *      See COPYRIGHT in top-level directory.
 */

#include <stdlib.h> 
#include <stdio.h>
#include <string.h>
#include "TightDataPointStorageD.h"
#include "Huffman.h"
#include "zfp.h"

/*
void new_TightDataPointStorageD_Empty(TightDataPointStorageD **this)
{
	*this = (TightDataPointStorageD*)malloc(sizeof(TightDataPointStorageD));
	(*this)->dataSeriesLength = 0;
	(*this)->allSameData = 0;
	(*this)->exactDataNum = 0;
	(*this)->reservedValue = 0;
	(*this)->reqLength = 0;
	(*this)->radExpo = 0;

	(*this)->rtypeArray = NULL;
	(*this)->rtypeArray_size = 0;

	(*this)->typeArray = NULL; //its size is dataSeriesLength/4 (or xxx/4+1) 
	(*this)->typeArray_size = 0;

	(*this)->leadNumArray = NULL; //its size is exactDataNum/4 (or exactDataNum/4+1)
	(*this)->leadNumArray_size = 0;

	(*this)->exactMidBytes = NULL;
	(*this)->exactMidBytes_size = 0;

	(*this)->residualMidBits = NULL;
	(*this)->residualMidBits_size = 0;
	
	(*this)->intervals = 0;
	(*this)->isLossless = 0;
	
	(*this)->segment_size = 0;
	(*this)->pwrErrBoundBytes = NULL;
	(*this)->pwrErrBoundBytes_size = 0;
	
	(*this)->raBytes = NULL;
	(*this)->raBytes_size = 0;

}
*/

/**
 * 
 * type's length == dataSeriesLength
 * exactMidBytes's length == exactMidBytes_size
 * leadNumIntArray's length == exactDataNum
 * escBytes's length == escBytes_size
 * resiBitLength's length == resiBitLengthSize
 *
 * 
void new_TightDataPointStorageD(TightDataPointStorageD **this, 
		size_t dataSeriesLength, size_t exactDataNum, 
		int* type, unsigned char* exactMidBytes, size_t exactMidBytes_size,
		unsigned char* leadNumIntArray,  //leadNumIntArray contains readable numbers....
		unsigned char* resiMidBits, size_t resiMidBits_size,
		unsigned char resiBitLength, 
		double realPrecision, double medianValue, char reqLength, unsigned int intervals,
		unsigned char* pwrErrBoundBytes, size_t pwrErrBoundBytes_size, unsigned char radExpo) {
	//int i = 0;
	*this = (TightDataPointStorageD *)malloc(sizeof(TightDataPointStorageD));
	(*this)->allSameData = 0;
	(*this)->realPrecision = realPrecision;
	(*this)->medianValue = medianValue;
	(*this)->reqLength = reqLength;

	(*this)->dataSeriesLength = dataSeriesLength;
	(*this)->exactDataNum = exactDataNum;

	(*this)->rtypeArray = NULL;
	(*this)->rtypeArray_size = 0;

	int stateNum = 2*intervals;
	HuffmanTree* huffmanTree = createHuffmanTree(stateNum);
	if(confparams_cpr->errorBoundMode == PW_REL && confparams_cpr->accelerate_pw_rel_compression)
		(*this)->max_bits = encode_withTree_MSST19(huffmanTree, type, dataSeriesLength, &(*this)->typeArray, &(*this)->typeArray_size);
	else
		encode_withTree(huffmanTree, type, dataSeriesLength, &(*this)->typeArray, &(*this)->typeArray_size);
	SZ_ReleaseHuffman(huffmanTree);
		
	(*this)->exactMidBytes = exactMidBytes;
	(*this)->exactMidBytes_size = exactMidBytes_size;

	(*this)->leadNumArray_size = convertIntArray2ByteArray_fast_2b(leadNumIntArray, exactDataNum, &((*this)->leadNumArray));

	(*this)->residualMidBits_size = convertIntArray2ByteArray_fast_dynamic(resiMidBits, resiBitLength, exactDataNum, &((*this)->residualMidBits));
	
	(*this)->intervals = intervals;
	
	(*this)->isLossless = 0;
	
	if(confparams_cpr->errorBoundMode>=PW_REL)
		(*this)->pwrErrBoundBytes = pwrErrBoundBytes;
	else
		(*this)->pwrErrBoundBytes = NULL;
		
	(*this)->radExpo = radExpo;
	
	(*this)->pwrErrBoundBytes_size = pwrErrBoundBytes_size;
}
*/
/*
void new_TightDataPointStorageD2(TightDataPointStorageD **this, 
		size_t dataSeriesLength, size_t exactDataNum, 
		int* type, unsigned char* exactMidBytes, size_t exactMidBytes_size,
		unsigned char* leadNumIntArray,  //leadNumIntArray contains readable numbers....
		unsigned char* resiMidBits, size_t resiMidBits_size,
		unsigned char* resiBitLength, size_t resiBitLengthSize,
		double realPrecision, double medianValue, char reqLength, unsigned int intervals,
		unsigned char* pwrErrBoundBytes, size_t pwrErrBoundBytes_size, unsigned char radExpo) {
	//int i = 0;
	*this = (TightDataPointStorageD *)malloc(sizeof(TightDataPointStorageD));
	(*this)->allSameData = 0;
	(*this)->realPrecision = realPrecision;
	(*this)->medianValue = medianValue;
	(*this)->reqLength = reqLength;

	(*this)->dataSeriesLength = dataSeriesLength;
	(*this)->exactDataNum = exactDataNum;

	(*this)->rtypeArray = NULL;
	(*this)->rtypeArray_size = 0;

	int stateNum = 2*intervals;
	HuffmanTree* huffmanTree = createHuffmanTree(stateNum);
	encode_withTree(huffmanTree, type, dataSeriesLength, &(*this)->typeArray, &(*this)->typeArray_size);
	SZ_ReleaseHuffman(huffmanTree);
	
	(*this)->exactMidBytes = exactMidBytes;
	(*this)->exactMidBytes_size = exactMidBytes_size;

	(*this)->leadNumArray_size = convertIntArray2ByteArray_fast_2b(leadNumIntArray, exactDataNum, &((*this)->leadNumArray));

	//(*this)->residualMidBits = resiMidBits;
	//(*this)->residualMidBits_size = resiMidBits_size;

	(*this)->residualMidBits_size = convertIntArray2ByteArray_fast_dynamic2(resiMidBits, resiBitLength, resiBitLengthSize, &((*this)->residualMidBits));
	
	(*this)->intervals = intervals;
	
	(*this)->isLossless = 0;
	
	if(confparams_cpr->errorBoundMode>=PW_REL)
		(*this)->pwrErrBoundBytes = pwrErrBoundBytes;
	else
		(*this)->pwrErrBoundBytes = NULL;
		
	(*this)->radExpo = radExpo;
	
	(*this)->pwrErrBoundBytes_size = pwrErrBoundBytes_size;
}

void convertTDPStoBytes_double(TightDataPointStorageD* tdps, unsigned char* bytes, unsigned char* dsLengthBytes, unsigned char sameByte)
{
	size_t i, k = 0;
	unsigned char intervalsBytes[4];
	unsigned char typeArrayLengthBytes[8];
	unsigned char exactLengthBytes[8];
	unsigned char exactMidBytesLength[8];
	unsigned char realPrecisionBytes[8];
	
	unsigned char medianValueBytes[8];
	
	unsigned char segment_sizeBytes[8];
	unsigned char pwrErrBoundBytes_sizeBytes[4];
	unsigned char max_quant_intervals_Bytes[4];
	
	for(i = 0;i<3;i++)//3 bytes
		bytes[k++] = versionNumber[i];
	bytes[k++] = sameByte;	//1	byte	
	
	convertSZParamsToBytes(confparams_cpr, &(bytes[k]));
	k = k + MetaDataByteLength_double;
	
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST: 4 or 8 bytes
		bytes[k++] = dsLengthBytes[i];	
	intToBytes_bigEndian(max_quant_intervals_Bytes, confparams_cpr->max_quant_intervals);
	for(i = 0;i<4;i++)//4
		bytes[k++] = max_quant_intervals_Bytes[i];		
	
	if(confparams_cpr->errorBoundMode>=PW_REL)
	{
		bytes[k++] = tdps->radExpo; //1 byte			
		
		sizeToBytes(segment_sizeBytes, confparams_cpr->segment_size);
		for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
			bytes[k++] = segment_sizeBytes[i];				
			
		intToBytes_bigEndian(pwrErrBoundBytes_sizeBytes, tdps->pwrErrBoundBytes_size);
		for(i = 0;i<4;i++)//4
			bytes[k++] = pwrErrBoundBytes_sizeBytes[i];					
	}
	
	intToBytes_bigEndian(intervalsBytes, tdps->intervals);
	for(i = 0;i<4;i++)//4
		bytes[k++] = intervalsBytes[i];		
	
	doubleToBytes(medianValueBytes, tdps->medianValue);
	for (i = 0; i < 8; i++)// 8
		bytes[k++] = medianValueBytes[i];		

	bytes[k++] = tdps->reqLength; //1 byte

	if(confparams_cpr->errorBoundMode == PW_REL && confparams_cpr->accelerate_pw_rel_compression==1)
	{
		bytes[k++] = tdps->plus_bits;
		bytes[k++] = tdps->max_bits;
	}

	doubleToBytes(realPrecisionBytes, tdps->realPrecision);
	for (i = 0; i < 8; i++)// 8
		bytes[k++] = realPrecisionBytes[i];
			
	sizeToBytes(typeArrayLengthBytes, tdps->typeArray_size);
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
		bytes[k++] = typeArrayLengthBytes[i];				
				
	sizeToBytes(exactLengthBytes, tdps->exactDataNum);
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
		bytes[k++] = exactLengthBytes[i];

	sizeToBytes(exactMidBytesLength, tdps->exactMidBytes_size);
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
		bytes[k++] = exactMidBytesLength[i];

	if(confparams_cpr->errorBoundMode>=PW_REL)
	{
		doubleToBytes(exactMidBytesLength, tdps->minLogValue);
		for(i = 0;i < 8; i++)
			bytes[k++] = exactMidBytesLength[i];
	}

	memcpy(&(bytes[k]), tdps->typeArray, tdps->typeArray_size);
	k += tdps->typeArray_size;
	if(confparams_cpr->errorBoundMode>=PW_REL)
	{
		memcpy(&(bytes[k]), tdps->pwrErrBoundBytes, tdps->pwrErrBoundBytes_size);
		k += tdps->pwrErrBoundBytes_size;
	}

	memcpy(&(bytes[k]), tdps->leadNumArray, tdps->leadNumArray_size);
	k += tdps->leadNumArray_size;
	memcpy(&(bytes[k]), tdps->exactMidBytes, tdps->exactMidBytes_size);
	k += tdps->exactMidBytes_size;

	if(tdps->residualMidBits!=NULL)
	{
		memcpy(&(bytes[k]), tdps->residualMidBits, tdps->residualMidBits_size);
		k += tdps->residualMidBits_size;
	}		
}

void convertTDPStoBytes_double_reserve(TightDataPointStorageD* tdps, unsigned char* bytes, unsigned char* dsLengthBytes, unsigned char sameByte)
{
	size_t i, k = 0;
	unsigned char intervalsBytes[4];
	unsigned char typeArrayLengthBytes[8];
	unsigned char rTypeLengthBytes[8];
	unsigned char exactLengthBytes[8];
	unsigned char exactMidBytesLength[8];
	unsigned char reservedValueBytes[8];
	unsigned char realPrecisionBytes[8];
	
	unsigned char medianValueBytes[8];
	
	unsigned char segment_sizeBytes[8];
	unsigned char pwrErrBoundBytes_sizeBytes[4];
	unsigned char max_quant_intervals_Bytes[4];	
	
	for(i = 0;i<3;i++)//3
		bytes[k++] = versionNumber[i];		
	bytes[k++] = sameByte;			//1

	convertSZParamsToBytes(confparams_cpr, &(bytes[k]));
	k = k + MetaDataByteLength_double;
	
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
		bytes[k++] = dsLengthBytes[i];		

	intToBytes_bigEndian(max_quant_intervals_Bytes, confparams_cpr->max_quant_intervals);
	for(i = 0;i<4;i++)//4
		bytes[k++] = max_quant_intervals_Bytes[i];

	if(confparams_cpr->errorBoundMode>=PW_REL)
	{
		bytes[k++] = tdps->radExpo; //1 byte			
		
		sizeToBytes(segment_sizeBytes, confparams_cpr->segment_size);
		for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//4
			bytes[k++] = segment_sizeBytes[i];				
			
		intToBytes_bigEndian(pwrErrBoundBytes_sizeBytes, tdps->pwrErrBoundBytes_size);
		for(i = 0;i<4;i++)//4
			bytes[k++] = pwrErrBoundBytes_sizeBytes[i];					
	}
	intToBytes_bigEndian(intervalsBytes, tdps->intervals);
	for(i = 0;i<4;i++)//4
		bytes[k++] = intervalsBytes[i];	

	doubleToBytes(medianValueBytes, tdps->medianValue);
	for (i = 0; i < 8; i++)// 8
		bytes[k++] = medianValueBytes[i];		

	bytes[k++] = tdps->reqLength; //1 byte

	doubleToBytes(realPrecisionBytes, tdps->realPrecision);
	for (i = 0; i < 8; i++)// 8
		bytes[k++] = realPrecisionBytes[i];		
	
	sizeToBytes(typeArrayLengthBytes, tdps->typeArray_size);
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
		bytes[k++] = typeArrayLengthBytes[i];			
	
	sizeToBytes(rTypeLengthBytes, tdps->rtypeArray_size);
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
		bytes[k++] = rTypeLengthBytes[i];	
	
	sizeToBytes(exactLengthBytes, tdps->exactDataNum);
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
		bytes[k++] = exactLengthBytes[i];

	sizeToBytes(exactMidBytesLength, tdps->exactMidBytes_size);
	for(i = 0;i<exe_params->SZ_SIZE_TYPE;i++)//ST
		bytes[k++] = exactMidBytesLength[i];

	doubleToBytes(reservedValueBytes, tdps->reservedValue);
	for (i = 0; i < 8; i++)// 8
		bytes[k++] = reservedValueBytes[i];
	
	memcpy(&(bytes[k]), tdps->rtypeArray, tdps->rtypeArray_size);
	k += tdps->rtypeArray_size;		
	
	if(confparams_cpr->errorBoundMode>=PW_REL)
	{
		doubleToBytes(exactMidBytesLength, tdps->minLogValue);
		for(i = 0;i < 8; i++)
			bytes[k++] = exactMidBytesLength[i];
	}
	
	memcpy(&(bytes[k]), tdps->typeArray, tdps->typeArray_size);
	k += tdps->typeArray_size;
	if(confparams_cpr->errorBoundMode>=PW_REL)
	{
		memcpy(&(bytes[k]), tdps->pwrErrBoundBytes, tdps->pwrErrBoundBytes_size);
		k += tdps->pwrErrBoundBytes_size;
	}
	memcpy(&(bytes[k]), tdps->leadNumArray, tdps->leadNumArray_size);
	k += tdps->leadNumArray_size;
	memcpy(&(bytes[k]), tdps->exactMidBytes, tdps->exactMidBytes_size);
	k += tdps->exactMidBytes_size;		
	if(tdps->residualMidBits!=NULL)
	{
		memcpy(&(bytes[k]), tdps->residualMidBits, tdps->residualMidBits_size);
		k += tdps->residualMidBits_size;	
	}	
}
//Convert TightDataPointStorageD to bytes...
void convertTDPStoFlatBytes_double(TightDataPointStorageD *tdps, unsigned char** bytes, size_t *size) 
{
	size_t i, k = 0; 
	unsigned char dsLengthBytes[8];
	
	if(exe_params->SZ_SIZE_TYPE==4)
		intToBytes_bigEndian(dsLengthBytes, tdps->dataSeriesLength);//4
	else
		longToBytes_bigEndian(dsLengthBytes, tdps->dataSeriesLength);//8
	
	unsigned char sameByte = tdps->allSameData==1?(unsigned char)1:(unsigned char)0;
	//sameByte = sameByte | (confparams_cpr->szMode << 1);
	if(tdps->isLossless)
		sameByte = (unsigned char) (sameByte | 0x10);	
	if(confparams_cpr->errorBoundMode>=PW_REL)
		sameByte = (unsigned char) (sameByte | 0x20); // 00100000, the 5th bit
	if(exe_params->SZ_SIZE_TYPE==8)
		sameByte = (unsigned char) (sameByte | 0x40); // 01000000, the 6th bit
	if(confparams_cpr->errorBoundMode == PW_REL && confparams_cpr->accelerate_pw_rel_compression)
		sameByte = (unsigned char) (sameByte | 0x08); 	
	
	if(tdps->allSameData==1)
	{
		size_t totalByteLength = 3 + 1 + MetaDataByteLength_double + exe_params->SZ_SIZE_TYPE + tdps->exactMidBytes_size;
		*bytes = (unsigned char *)malloc(sizeof(unsigned char)*totalByteLength);
	
		for (i = 0; i < 3; i++)//3
			(*bytes)[k++] = versionNumber[i];
		(*bytes)[k++] = sameByte;

		convertSZParamsToBytes(confparams_cpr, &((*bytes)[k]));
		k = k + MetaDataByteLength_double;

		for (i = 0; i < exe_params->SZ_SIZE_TYPE; i++)
			(*bytes)[k++] = dsLengthBytes[i];
		
		for (i = 0; i < tdps->exactMidBytes_size; i++)
			(*bytes)[k++] = tdps->exactMidBytes[i];
		
		*size = totalByteLength;
	}
	else if (tdps->rtypeArray == NULL) 
	{
		size_t residualMidBitsLength = tdps->residualMidBits == NULL ? 0 : tdps->residualMidBits_size;
		size_t segmentL = 0, radExpoL = 0, pwrBoundArrayL = 0;

		int minLogValueSize = 0;
		if(confparams_cpr->errorBoundMode>=PW_REL)
		{			
			segmentL = exe_params->SZ_SIZE_TYPE;
			radExpoL = 1;
			pwrBoundArrayL = 4;
			minLogValueSize = 8;
		}

		size_t totalByteLength = 3 + 1 + MetaDataByteLength_double + exe_params->SZ_SIZE_TYPE + 4 + radExpoL + segmentL + pwrBoundArrayL + 4 + 8 + 1 + 8 
				+ exe_params->SZ_SIZE_TYPE + exe_params->SZ_SIZE_TYPE + exe_params->SZ_SIZE_TYPE 
				+ minLogValueSize 
				+ tdps->typeArray_size + tdps->leadNumArray_size
				+ tdps->exactMidBytes_size + residualMidBitsLength + tdps->pwrErrBoundBytes_size;
		if(confparams_cpr->errorBoundMode == PW_REL && confparams_cpr->accelerate_pw_rel_compression)
			totalByteLength += (1+1); // for MSST19
			
		*bytes = (unsigned char *)malloc(sizeof(unsigned char)*totalByteLength);

		convertTDPStoBytes_double(tdps, *bytes, dsLengthBytes, sameByte);
		
		*size = totalByteLength;
	}
	else //the case with reserved value
	{
		//TODO
	}
}

void convertTDPStoFlatBytes_double_args(TightDataPointStorageD *tdps, unsigned char* bytes, size_t *size) 
{
	size_t i, k = 0; 
	unsigned char dsLengthBytes[8];
	
	if(exe_params->SZ_SIZE_TYPE==4)
		intToBytes_bigEndian(dsLengthBytes, tdps->dataSeriesLength);//4
	else
		longToBytes_bigEndian(dsLengthBytes, tdps->dataSeriesLength);//8
		
	unsigned char sameByte = tdps->allSameData==1?(unsigned char)1:(unsigned char)0; //0000,0001
	sameByte = sameByte | (confparams_cpr->szMode << 1); //0000,0110
	if(tdps->isLossless)
		sameByte = (unsigned char) (sameByte | 0x10); // 0001,0000
	if(confparams_cpr->errorBoundMode>=PW_REL)
		sameByte = (unsigned char) (sameByte | 0x20); // 0010,0000, the 5th bit
	if(exe_params->SZ_SIZE_TYPE==8)
		sameByte = (unsigned char) (sameByte | 0x40); //0100,0000, the 6th bit
	if(confparams_cpr->errorBoundMode == PW_REL && confparams_cpr->accelerate_pw_rel_compression)
		sameByte = (unsigned char) (sameByte | 0x08); //0000,1000, the 7th bit 	
	if(tdps->allSameData==1)
	{
		size_t totalByteLength = 3 + 1 + MetaDataByteLength_double + exe_params->SZ_SIZE_TYPE + tdps->exactMidBytes_size;
	
		for (i = 0; i < 3; i++)//3
			bytes[k++] = versionNumber[i];
		bytes[k++] = sameByte;
		
		convertSZParamsToBytes(confparams_cpr, &(bytes[k]));
		k = k + MetaDataByteLength_double;
				
		for (i = 0; i < exe_params->SZ_SIZE_TYPE; i++)
			bytes[k++] = dsLengthBytes[i];		
		for (i = 0; i < tdps->exactMidBytes_size; i++)
			bytes[k++] = tdps->exactMidBytes[i];
		
		*size = totalByteLength;
	}
	else if (tdps->rtypeArray == NULL) 
	{
		size_t residualMidBitsLength = tdps->residualMidBits == NULL ? 0 : tdps->residualMidBits_size;
		size_t segmentL = 0, radExpoL = 0, pwrBoundArrayL = 0;
		if(confparams_cpr->errorBoundMode>=PW_REL)
		{			
			segmentL = exe_params->SZ_SIZE_TYPE;
			radExpoL = 1;
			pwrBoundArrayL = 4;
		}

		size_t totalByteLength = 3 + 1 + MetaDataByteLength_double + exe_params->SZ_SIZE_TYPE+ 4 + radExpoL + segmentL + pwrBoundArrayL + 4 + 8 + 1 + 8 
				+ exe_params->SZ_SIZE_TYPE + exe_params->SZ_SIZE_TYPE + exe_params->SZ_SIZE_TYPE 
				+ tdps->typeArray_size + tdps->leadNumArray_size
				+ tdps->exactMidBytes_size + residualMidBitsLength + tdps->pwrErrBoundBytes_size;
		if(confparams_cpr->errorBoundMode == PW_REL && confparams_cpr->accelerate_pw_rel_compression)
			totalByteLength += (1+1); // for MSST19
		convertTDPStoBytes_double(tdps, bytes, dsLengthBytes, sameByte);
		
		*size = totalByteLength;
	}
	else //the case with reserved value
	{
		//TODO
	}
}


void free_TightDataPointStorageD(TightDataPointStorageD *tdps)
{
	if(tdps->rtypeArray!=NULL)
		free(tdps->rtypeArray);
	if(tdps->typeArray!=NULL)
		free(tdps->typeArray);
	if(tdps->leadNumArray!=NULL)
		free(tdps->leadNumArray);
	if(tdps->exactMidBytes!=NULL)
		free(tdps->exactMidBytes);
	if(tdps->residualMidBits!=NULL)
		free(tdps->residualMidBits);
	if(tdps->pwrErrBoundBytes!=NULL) 	
		free(tdps->pwrErrBoundBytes);
	free(tdps);
}

*/
/**
 * to free the memory used in the decompression
 * 
void free_TightDataPointStorageD2(TightDataPointStorageD *tdps)
{			
	free(tdps);
}

*/
