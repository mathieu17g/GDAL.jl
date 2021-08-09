module GDAL
using GDAL_jll

export GDAL_jll

using CEnum

"""
    Stat(const char * pszFilename,
         VSIStatBufL * pStatBuf,
         int nFlags) -> int
"""
const stat = Cvoid

const tm = Libc.TmStruct

const __time_t = Clong

const time_t = __time_t

"""
    cplverifyconfiguration()

Doxygen\\_Suppress 
"""
function cplverifyconfiguration()
    aftercare(ccall((:CPLVerifyConfiguration, libgdal), Cvoid, ()))
end

"""
    CPLGetConfigOption(const char * pszKey,
                       const char * pszDefault) -> const char *

Get the value of a configuration option.

### Parameters
* **pszKey**: the key of the option to retrieve
* **pszDefault**: a default value if the key does not match existing defined options (may be NULL)

### Returns
the value associated to the key, or the default value if not found
"""
function cplgetconfigoption(arg1, arg2)
    aftercare(ccall((:CPLGetConfigOption, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

"""
    CPLGetThreadLocalConfigOption(const char * pszKey,
                                  const char * pszDefault) -> const char *

Same as CPLGetConfigOption() but only with options set with CPLSetThreadLocalConfigOption()
"""
function cplgetthreadlocalconfigoption(arg1, arg2)
    aftercare(ccall((:CPLGetThreadLocalConfigOption, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

"""
    CPLSetConfigOption(const char * pszKey,
                       const char * pszValue) -> void

Set a configuration option for GDAL/OGR use.

### Parameters
* **pszKey**: the key of the option
* **pszValue**: the value of the option, or NULL to clear a setting.
"""
function cplsetconfigoption(arg1, arg2)
    aftercare(ccall((:CPLSetConfigOption, libgdal), Cvoid, (Cstring, Cstring), arg1, arg2))
end

"""
    CPLSetThreadLocalConfigOption(const char * pszKey,
                                  const char * pszValue) -> void

Set a configuration option for GDAL/OGR use.

### Parameters
* **pszKey**: the key of the option
* **pszValue**: the value of the option, or NULL to clear a setting.
"""
function cplsetthreadlocalconfigoption(pszKey, pszValue)
    aftercare(ccall((:CPLSetThreadLocalConfigOption, libgdal), Cvoid, (Cstring, Cstring), pszKey, pszValue))
end

"""
    cplfreeconfig()

Doxygen\\_Suppress 
"""
function cplfreeconfig()
    aftercare(ccall((:CPLFreeConfig, libgdal), Cvoid, ()))
end

"""
    CPLGetConfigOptions(void) -> char **

Return the list of configuration options as KEY=VALUE pairs.

### Returns
a copy of the list, to be freed with CSLDestroy().
"""
function cplgetconfigoptions()
    aftercare(ccall((:CPLGetConfigOptions, libgdal), Ptr{Cstring}, ()))
end

"""
    CPLSetConfigOptions(const char *const * papszConfigOptions) -> void

Replace the full list of configuration options with the passed list of KEY=VALUE pairs.

### Parameters
* **papszConfigOptions**: the new list (or NULL).
"""
function cplsetconfigoptions(papszConfigOptions)
    aftercare(ccall((:CPLSetConfigOptions, libgdal), Cvoid, (Ptr{Cstring},), papszConfigOptions))
end

"""
    CPLGetThreadLocalConfigOptions(void) -> char **

Return the list of thread local configuration options as KEY=VALUE pairs.

### Returns
a copy of the list, to be freed with CSLDestroy().
"""
function cplgetthreadlocalconfigoptions()
    aftercare(ccall((:CPLGetThreadLocalConfigOptions, libgdal), Ptr{Cstring}, ()))
end

"""
    CPLSetThreadLocalConfigOptions(const char *const * papszConfigOptions) -> void

Replace the full list of thread local configuration options with the passed list of KEY=VALUE pairs.

### Parameters
* **papszConfigOptions**: the new list (or NULL).
"""
function cplsetthreadlocalconfigoptions(papszConfigOptions)
    aftercare(ccall((:CPLSetThreadLocalConfigOptions, libgdal), Cvoid, (Ptr{Cstring},), papszConfigOptions))
end

"""
    CPLMalloc(size_t nSize) -> void *

Safe version of malloc().

### Parameters
* **nSize**: size (in bytes) of memory block to allocate.

### Returns
pointer to newly allocated memory, only NULL if nSize is zero.
"""
function cplmalloc(arg1)
    aftercare(ccall((:CPLMalloc, libgdal), Ptr{Cvoid}, (Csize_t,), arg1))
end

"""
    CPLCalloc(size_t nCount,
              size_t nSize) -> void *

Safe version of calloc().

### Parameters
* **nCount**: number of objects to allocate.
* **nSize**: size (in bytes) of object to allocate.

### Returns
pointer to newly allocated memory, only NULL if nSize * nCount is NULL.
"""
function cplcalloc(arg1, arg2)
    aftercare(ccall((:CPLCalloc, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), arg1, arg2))
end

"""
    CPLRealloc(void * pData,
               size_t nNewSize) -> void *

Safe version of realloc().

### Parameters
* **pData**: existing memory block which should be copied to the new block.
* **nNewSize**: new size (in bytes) of memory block to allocate.

### Returns
pointer to allocated memory, only NULL if nNewSize is zero.
"""
function cplrealloc(arg1, arg2)
    aftercare(ccall((:CPLRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t), arg1, arg2))
end

"""
    CPLStrdup(const char * pszString) -> char *

Safe version of strdup() function.

### Parameters
* **pszString**: input string to be duplicated. May be NULL.

### Returns
pointer to a newly allocated copy of the string. Free with CPLFree() or VSIFree().
"""
function cplstrdup(arg1)
    aftercare(ccall((:CPLStrdup, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLStrlwr(char * pszString) -> char *

Convert each characters of the string to lower case.

### Parameters
* **pszString**: input string to be converted.

### Returns
pointer to the same string, pszString.
"""
function cplstrlwr(arg1)
    aftercare(ccall((:CPLStrlwr, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLFGets(char * pszBuffer,
             int nBufferSize,
             FILE * fp) -> char *

Reads in at most one less than nBufferSize characters from the fp stream and stores them into the buffer pointed to by pszBuffer.

### Parameters
* **pszBuffer**: pointer to the targeting character buffer.
* **nBufferSize**: maximum size of the string to read (not including terminating '\\0').
* **fp**: file pointer to read from.

### Returns
pointer to the pszBuffer containing a string read from the file or NULL if the error or end of file was encountered.
"""
function cplfgets(arg1, arg2, arg3)
    aftercare(ccall((:CPLFGets, libgdal), Cstring, (Cstring, Cint, Ptr{Libc.FILE}), arg1, arg2, arg3), false)
end

"""
    CPLReadLine(FILE * fp) -> const char *

Simplified line reading from text file.

### Parameters
* **fp**: file pointer opened with VSIFOpen().

### Returns
pointer to an internal buffer containing a line of text read from the file or NULL if the end of file was encountered.
"""
function cplreadline(arg1)
    aftercare(ccall((:CPLReadLine, libgdal), Cstring, (Ptr{Libc.FILE},), arg1), false)
end

"Opaque type for a FILE that implements the VSIVirtualHandle API "
const VSILFILE = Libc.FILE

"""
    CPLReadLineL(VSILFILE * fp) -> const char *

Simplified line reading from text file.

### Parameters
* **fp**: file pointer opened with VSIFOpenL().

### Returns
pointer to an internal buffer containing a line of text read from the file or NULL if the end of file was encountered.
"""
function cplreadlinel(arg1)
    aftercare(ccall((:CPLReadLineL, libgdal), Cstring, (Ptr{VSILFILE},), arg1), false)
end

"Type of a constant null-terminated list of nul terminated strings. Seen as char** from C and const char* const* from C++ "
const CSLConstList = Ptr{Cstring}

"""
    CPLReadLine2L(VSILFILE * fp,
                  int nMaxCars,
                  CSLConstList papszOptions) -> const char *

Simplified line reading from text file.

### Parameters
* **fp**: file pointer opened with VSIFOpenL().
* **nMaxCars**: maximum number of characters allowed, or -1 for no limit.
* **papszOptions**: NULL-terminated array of options. Unused for now.

### Returns
pointer to an internal buffer containing a line of text read from the file or NULL if the end of file was encountered or the maximum number of characters allowed reached.
"""
function cplreadline2l(arg1, arg2, arg3)
    aftercare(ccall((:CPLReadLine2L, libgdal), Cstring, (Ptr{VSILFILE}, Cint, CSLConstList), arg1, arg2, arg3), false)
end

"""
    CPLReadLine3L(VSILFILE * fp,
                  int nMaxCars,
                  int * pnBufLength,
                  CSLConstList papszOptions) -> const char *

Simplified line reading from text file.

### Parameters
* **fp**: file pointer opened with VSIFOpenL().
* **nMaxCars**: maximum number of characters allowed, or -1 for no limit.
* **papszOptions**: NULL-terminated array of options. Unused for now.
* **pnBufLength**: size of output string (must be non-NULL)

### Returns
pointer to an internal buffer containing a line of text read from the file or NULL if the end of file was encountered or the maximum number of characters allowed reached.
"""
function cplreadline3l(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLReadLine3L, libgdal), Cstring, (Ptr{VSILFILE}, Cint, Ptr{Cint}, CSLConstList), arg1, arg2, arg3, arg4), false)
end

"""
    CPLAtof(const char * nptr) -> double

Converts ASCII string to floating point number.

### Parameters
* **nptr**: Pointer to string to convert.

### Returns
Converted value, if any.
"""
function cplatof(arg1)
    aftercare(ccall((:CPLAtof, libgdal), Cdouble, (Cstring,), arg1))
end

"""
    CPLAtofDelim(const char * nptr,
                 char point) -> double

Converts ASCII string to floating point number.

### Parameters
* **nptr**: Pointer to string to convert.
* **point**: Decimal delimiter.

### Returns
Converted value, if any.
"""
function cplatofdelim(arg1, arg2)
    aftercare(ccall((:CPLAtofDelim, libgdal), Cdouble, (Cstring, Cchar), arg1, arg2))
end

"""
    CPLStrtod(const char * nptr,
              char ** endptr) -> double

Converts ASCII string to floating point number.

### Parameters
* **nptr**: Pointer to string to convert.
* **endptr**: If is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.

### Returns
Converted value, if any.
"""
function cplstrtod(arg1, arg2)
    aftercare(ccall((:CPLStrtod, libgdal), Cdouble, (Cstring, Ptr{Cstring}), arg1, arg2))
end

"""
    CPLStrtodDelim(const char * nptr,
                   char ** endptr,
                   char point) -> double

Converts ASCII string to floating point number using specified delimiter.

### Parameters
* **nptr**: Pointer to string to convert.
* **endptr**: If is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.
* **point**: Decimal delimiter.

### Returns
Converted value, if any.
"""
function cplstrtoddelim(arg1, arg2, arg3)
    aftercare(ccall((:CPLStrtodDelim, libgdal), Cdouble, (Cstring, Ptr{Cstring}, Cchar), arg1, arg2, arg3))
end

"""
    CPLStrtof(const char * nptr,
              char ** endptr) -> float

Converts ASCII string to floating point number.

### Parameters
* **nptr**: Pointer to string to convert.
* **endptr**: If is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.

### Returns
Converted value, if any.
"""
function cplstrtof(arg1, arg2)
    aftercare(ccall((:CPLStrtof, libgdal), Cfloat, (Cstring, Ptr{Cstring}), arg1, arg2))
end

"""
    CPLStrtofDelim(const char * nptr,
                   char ** endptr,
                   char point) -> float

Converts ASCII string to floating point number using specified delimiter.

### Parameters
* **nptr**: Pointer to string to convert.
* **endptr**: If is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.
* **point**: Decimal delimiter.

### Returns
Converted value, if any.
"""
function cplstrtofdelim(arg1, arg2, arg3)
    aftercare(ccall((:CPLStrtofDelim, libgdal), Cfloat, (Cstring, Ptr{Cstring}, Cchar), arg1, arg2, arg3))
end

"""
    CPLAtofM(const char * nptr) -> double

Converts ASCII string to floating point number using any numeric locale.

### Parameters
* **nptr**: The string to convert.

### Returns
Converted value, if any. Zero on failure.
"""
function cplatofm(arg1)
    aftercare(ccall((:CPLAtofM, libgdal), Cdouble, (Cstring,), arg1))
end

"""
    CPLScanString(const char * pszString,
                  int nMaxLength,
                  int bTrimSpaces,
                  int bNormalize) -> char *

Scan up to a maximum number of characters from a given string, allocate a buffer for a new string and fill it with scanned characters.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to read. Less characters will be read if a null character is encountered.
* **bTrimSpaces**: If TRUE, trim ending spaces from the input string. Character considered as empty using isspace(3) function.
* **bNormalize**: If TRUE, replace ':' symbol with the '_'. It is needed if resulting string will be used in CPL dictionaries.

### Returns
Pointer to the resulting string buffer. Caller responsible to free this buffer with CPLFree().
"""
function cplscanstring(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLScanString, libgdal), Cstring, (Cstring, Cint, Cint, Cint), arg1, arg2, arg3, arg4), false)
end

"""
    CPLScanDouble(const char * pszString,
                  int nMaxLength) -> double

Extract double from string.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
Double value, converted from its ASCII form.
"""
function cplscandouble(arg1, arg2)
    aftercare(ccall((:CPLScanDouble, libgdal), Cdouble, (Cstring, Cint), arg1, arg2))
end

"""
    CPLScanLong(const char * pszString,
                int nMaxLength) -> long

Scan up to a maximum number of characters from a string and convert the result to a long.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
Long value, converted from its ASCII form.
"""
function cplscanlong(arg1, arg2)
    aftercare(ccall((:CPLScanLong, libgdal), Clong, (Cstring, Cint), arg1, arg2))
end

"""
    CPLScanULong(const char * pszString,
                 int nMaxLength) -> unsigned long

Scan up to a maximum number of characters from a string and convert the result to a unsigned long.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
Unsigned long value, converted from its ASCII form.
"""
function cplscanulong(arg1, arg2)
    aftercare(ccall((:CPLScanULong, libgdal), Culong, (Cstring, Cint), arg1, arg2))
end

"Large unsigned integer type (generally 64-bit unsigned integer type). Use [`GUInt64`](@ref) when exactly 64 bit is needed "
const GUIntBig = Culonglong

"""
    CPLScanUIntBig(const char * pszString,
                   int nMaxLength) -> GUIntBig

Extract big integer from string.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
GUIntBig value, converted from its ASCII form.
"""
function cplscanuintbig(arg1, arg2)
    aftercare(ccall((:CPLScanUIntBig, libgdal), GUIntBig, (Cstring, Cint), arg1, arg2))
end

"Large signed integer type (generally 64-bit integer type). Use [`GInt64`](@ref) when exactly 64 bit is needed "
const GIntBig = Clonglong

"""
    CPLAtoGIntBig(const char * pszString) -> GIntBig

Convert a string to a 64 bit signed integer.

### Parameters
* **pszString**: String containing 64 bit signed integer.

### Returns
64 bit signed integer.
"""
function cplatogintbig(pszString)
    aftercare(ccall((:CPLAtoGIntBig, libgdal), GIntBig, (Cstring,), pszString))
end

"""
    CPLAtoGIntBigEx(const char * pszString,
                    int bWarn,
                    int * pbOverflow) -> GIntBig

Convert a string to a 64 bit signed integer.

### Parameters
* **pszString**: String containing 64 bit signed integer.
* **bWarn**: Issue a warning if an overflow occurs during conversion
* **pbOverflow**: Pointer to an integer to store if an overflow occurred, or NULL

### Returns
64 bit signed integer.
"""
function cplatogintbigex(pszString, bWarn, pbOverflow)
    aftercare(ccall((:CPLAtoGIntBigEx, libgdal), GIntBig, (Cstring, Cint, Ptr{Cint}), pszString, bWarn, pbOverflow))
end

"""
    CPLScanPointer(const char * pszString,
                   int nMaxLength) -> void *

Extract pointer from string.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
pointer value, converted from its ASCII form.
"""
function cplscanpointer(arg1, arg2)
    aftercare(ccall((:CPLScanPointer, libgdal), Ptr{Cvoid}, (Cstring, Cint), arg1, arg2))
end

"""
    CPLPrintString(char * pszDest,
                   const char * pszSrc,
                   int nMaxLen) -> int

Copy the string pointed to by pszSrc, NOT including the terminating \\0 character, to the array pointed to by pszDest.

### Parameters
* **pszDest**: Pointer to the destination string buffer. Should be large enough to hold the resulting string.
* **pszSrc**: Pointer to the source buffer.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintstring(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintString, libgdal), Cint, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"""
    CPLPrintStringFill(char * pszDest,
                       const char * pszSrc,
                       int nMaxLen) -> int

Copy the string pointed to by pszSrc, NOT including the terminating \\0 character, to the array pointed to by pszDest.

### Parameters
* **pszDest**: Pointer to the destination string buffer. Should be large enough to hold the resulting string.
* **pszSrc**: Pointer to the source buffer.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintstringfill(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintStringFill, libgdal), Cint, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"Int32 type "
const GInt32 = Cint

"""
    CPLPrintInt32(char * pszBuffer,
                  GInt32 iValue,
                  int nMaxLen) -> int

Print GInt32 value into specified string buffer.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **iValue**: Numerical value to print.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintint32(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintInt32, libgdal), Cint, (Cstring, GInt32, Cint), arg1, arg2, arg3))
end

"""
    CPLPrintUIntBig(char * pszBuffer,
                    GUIntBig iValue,
                    int nMaxLen) -> int

Print GUIntBig value into specified string buffer.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **iValue**: Numerical value to print.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintuintbig(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintUIntBig, libgdal), Cint, (Cstring, GUIntBig, Cint), arg1, arg2, arg3))
end

"""
    CPLPrintDouble(char * pszBuffer,
                   const char * pszFormat,
                   double dfValue,
                   const char * pszLocale) -> int

Print double value into specified string buffer.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **pszFormat**: Format specifier (for example, "%16.9E").
* **dfValue**: Numerical value to print.
* **pszLocale**: Unused.

### Returns
Number of characters printed.
"""
function cplprintdouble(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLPrintDouble, libgdal), Cint, (Cstring, Cstring, Cdouble, Cstring), arg1, arg2, arg3, arg4))
end

"""
    CPLPrintTime(char * pszBuffer,
                 int nMaxLen,
                 const char * pszFormat,
                 const struct tm * poBrokenTime,
                 const char * pszLocale) -> int

Print specified time value accordingly to the format options and specified locale name.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.
* **pszFormat**: Controls the output format. Options are the same as for strftime(3) function.
* **poBrokenTime**: Pointer to the broken-down time structure. May be requested with the VSIGMTime() and VSILocalTime() functions.
* **pszLocale**: Pointer to a character string containing locale name ("C", "POSIX", "us_US", "ru_RU.KOI8-R" etc.). If NULL we will not manipulate with locale settings and current process locale will be used for printing. Be aware that it may be unsuitable to use current locale for printing time, because all names will be printed in your native language, as well as time format settings also may be adjusted differently from the C/POSIX defaults. To solve these problems this option was introduced.

### Returns
Number of characters printed.
"""
function cplprinttime(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:CPLPrintTime, libgdal), Cint, (Cstring, Cint, Cstring, Ptr{tm}, Cstring), arg1, arg2, arg3, arg4, arg5))
end

"""
    CPLPrintPointer(char * pszBuffer,
                    void * pValue,
                    int nMaxLen) -> int

Print pointer value into specified string buffer.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **pValue**: Pointer to ASCII encode.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintpointer(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintPointer, libgdal), Cint, (Cstring, Ptr{Cvoid}, Cint), arg1, arg2, arg3))
end

"""
    CPLGetSymbol(const char * pszLibrary,
                 const char * pszSymbolName) -> void *

Fetch a function pointer from a shared library / DLL.

### Parameters
* **pszLibrary**: the name of the shared library or DLL containing the function. May contain path to file. If not system supplies search paths will be used.
* **pszSymbolName**: the name of the function to fetch a pointer to.

### Returns
A pointer to the function if found, or NULL if the function isn't found, or the shared library can't be loaded.
"""
function cplgetsymbol(arg1, arg2)
    aftercare(ccall((:CPLGetSymbol, libgdal), Ptr{Cvoid}, (Cstring, Cstring), arg1, arg2))
end

"""
    CPLGetExecPath(char * pszPathBuf,
                   int nMaxLength) -> int

Fetch path of executable.

### Parameters
* **pszPathBuf**: the buffer into which the path is placed.
* **nMaxLength**: the buffer size, MAX_PATH+1 is suggested.

### Returns
FALSE on failure or TRUE on success.
"""
function cplgetexecpath(pszPathBuf, nMaxLength)
    aftercare(ccall((:CPLGetExecPath, libgdal), Cint, (Cstring, Cint), pszPathBuf, nMaxLength))
end

"""
    CPLGetPath(const char * pszFilename) -> const char *

Extract directory path portion of filename.

### Parameters
* **pszFilename**: the filename potentially including a path.

### Returns
Path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call. The returned will generally not contain a trailing path separator.
"""
function cplgetpath(arg1)
    aftercare(ccall((:CPLGetPath, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetDirname(const char * pszFilename) -> const char *

Extract directory path portion of filename.

### Parameters
* **pszFilename**: the filename potentially including a path.

### Returns
Path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call. The returned will generally not contain a trailing path separator.
"""
function cplgetdirname(arg1)
    aftercare(ccall((:CPLGetDirname, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetFilename(const char * pszFullFilename) -> const char *

Extract non-directory portion of filename.

### Parameters
* **pszFullFilename**: the full filename potentially including a path.

### Returns
just the non-directory portion of the path (points back into original string).
"""
function cplgetfilename(arg1)
    aftercare(ccall((:CPLGetFilename, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetBasename(const char * pszFullFilename) -> const char *

Extract basename (non-directory, non-extension) portion of filename.

### Parameters
* **pszFullFilename**: the full filename potentially including a path.

### Returns
just the non-directory, non-extension portion of the path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call.
"""
function cplgetbasename(arg1)
    aftercare(ccall((:CPLGetBasename, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetExtension(const char * pszFullFilename) -> const char *

Extract filename extension from full filename.

### Parameters
* **pszFullFilename**: the full filename potentially including a path.

### Returns
just the extension portion of the path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call.
"""
function cplgetextension(arg1)
    aftercare(ccall((:CPLGetExtension, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetCurrentDir() -> char *

Get the current working directory name.

### Returns
a pointer to buffer, containing current working directory path or NULL in case of error. User is responsible to free that buffer after usage with CPLFree() function. If HAVE_GETCWD macro is not defined, the function returns NULL.
"""
function cplgetcurrentdir()
    aftercare(ccall((:CPLGetCurrentDir, libgdal), Cstring, ()), false)
end

"""
    CPLFormFilename(const char * pszPath,
                    const char * pszBasename,
                    const char * pszExtension) -> const char *

Build a full file path from a passed path, file basename and extension.

### Parameters
* **pszPath**: directory path to the directory containing the file. This may be relative or absolute, and may have a trailing path separator or not. May be NULL.
* **pszBasename**: file basename. May optionally have path and/or extension. Must NOT be NULL.
* **pszExtension**: file extension, optionally including the period. May be NULL.

### Returns
a fully formed filename in an internal static string. Do not modify or free the returned string. The string may be destroyed by the next CPL call.
"""
function cplformfilename(pszPath, pszBasename, pszExtension)
    aftercare(ccall((:CPLFormFilename, libgdal), Cstring, (Cstring, Cstring, Cstring), pszPath, pszBasename, pszExtension), false)
end

"""
    CPLFormCIFilename(const char * pszPath,
                      const char * pszBasename,
                      const char * pszExtension) -> const char *

Case insensitive file searching, returning full path.

### Parameters
* **pszPath**: directory path to the directory containing the file. This may be relative or absolute, and may have a trailing path separator or not. May be NULL.
* **pszBasename**: file basename. May optionally have path and/or extension. May not be NULL.
* **pszExtension**: file extension, optionally including the period. May be NULL.

### Returns
a fully formed filename in an internal static string. Do not modify or free the returned string. The string may be destroyed by the next CPL call.
"""
function cplformcifilename(pszPath, pszBasename, pszExtension)
    aftercare(ccall((:CPLFormCIFilename, libgdal), Cstring, (Cstring, Cstring, Cstring), pszPath, pszBasename, pszExtension), false)
end

"""
    CPLResetExtension(const char * pszPath,
                      const char * pszExt) -> const char *

Replace the extension with the provided one.

### Parameters
* **pszPath**: the input path, this string is not altered.
* **pszExt**: the new extension to apply to the given path.

### Returns
an altered filename with the new extension. Do not modify or free the returned string. The string may be destroyed by the next CPL call.
"""
function cplresetextension(arg1, arg2)
    aftercare(ccall((:CPLResetExtension, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

"""
    CPLProjectRelativeFilename(const char * pszProjectDir,
                               const char * pszSecondaryFilename) -> const char *

Find a file relative to a project file.

### Parameters
* **pszProjectDir**: the directory relative to which the secondary files path should be interpreted.
* **pszSecondaryFilename**: the filename (potentially with path) that is to be interpreted relative to the project directory.

### Returns
a composed path to the secondary file. The returned string is internal and should not be altered, freed, or depending on past the next CPL call.
"""
function cplprojectrelativefilename(pszProjectDir, pszSecondaryFilename)
    aftercare(ccall((:CPLProjectRelativeFilename, libgdal), Cstring, (Cstring, Cstring), pszProjectDir, pszSecondaryFilename), false)
end

"""
    CPLIsFilenameRelative(const char * pszFilename) -> int

Is filename relative or absolute?

### Parameters
* **pszFilename**: the filename with path to test.

### Returns
TRUE if the filename is relative or FALSE if it is absolute.
"""
function cplisfilenamerelative(pszFilename)
    aftercare(ccall((:CPLIsFilenameRelative, libgdal), Cint, (Cstring,), pszFilename))
end

"""
    CPLExtractRelativePath(const char * pszBaseDir,
                           const char * pszTarget,
                           int * pbGotRelative) -> const char *

Get relative path from directory to target file.

### Parameters
* **pszBaseDir**: the name of the directory relative to which the path should be computed. pszBaseDir may be NULL in which case the original target is returned without relativizing.
* **pszTarget**: the filename to be changed to be relative to pszBaseDir.
* **pbGotRelative**: Pointer to location in which a flag is placed indicating that the returned path is relative to the basename (TRUE) or not (FALSE). This pointer may be NULL if flag is not desired.

### Returns
an adjusted path or the original if it could not be made relative to the pszBaseFile's path.
"""
function cplextractrelativepath(arg1, arg2, arg3)
    aftercare(ccall((:CPLExtractRelativePath, libgdal), Cstring, (Cstring, Cstring, Ptr{Cint}), arg1, arg2, arg3), false)
end

"""
    CPLCleanTrailingSlash(const char * pszPath) -> const char *

Remove trailing forward/backward slash from the path for UNIX/Windows resp.

### Parameters
* **pszPath**: the path to be cleaned up

### Returns
Path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call.
"""
function cplcleantrailingslash(arg1)
    aftercare(ccall((:CPLCleanTrailingSlash, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLCorrespondingPaths(const char * pszOldFilename,
                          const char * pszNewFilename,
                          char ** papszFileList) -> char **

Identify corresponding paths.

### Parameters
* **pszOldFilename**: path to old prototype file.
* **pszNewFilename**: path to new prototype file.
* **papszFileList**: list of other files associated with pszOldFilename to rename similarly.

### Returns
a list of files corresponding to papszFileList but renamed to correspond to pszNewFilename.
"""
function cplcorrespondingpaths(pszOldFilename, pszNewFilename, papszFileList)
    aftercare(ccall((:CPLCorrespondingPaths, libgdal), Ptr{Cstring}, (Cstring, Cstring, Ptr{Cstring}), pszOldFilename, pszNewFilename, papszFileList))
end

"""
    CPLCheckForFile(char * pszFilename,
                    char ** papszSiblingFiles) -> int

Check for file existence.

### Parameters
* **pszFilename**: name of file to check for - filename case updated in some cases.
* **papszSiblingFiles**: a list of files in the same directory as pszFilename if available, or NULL. This list should have no path components.

### Returns
TRUE if a match is found, or FALSE if not.
"""
function cplcheckforfile(pszFilename, papszSiblingList)
    aftercare(ccall((:CPLCheckForFile, libgdal), Cint, (Cstring, Ptr{Cstring}), pszFilename, papszSiblingList))
end

"""
    CPLGenerateTempFilename(const char * pszStem) -> const char *

Generate temporary file name.

### Parameters
* **pszStem**: if non-NULL this will be part of the filename.

### Returns
a filename which is valid till the next CPL call in this thread.
"""
function cplgeneratetempfilename(pszStem)
    aftercare(ccall((:CPLGenerateTempFilename, libgdal), Cstring, (Cstring,), pszStem), false)
end

"""
    CPLExpandTilde(const char * pszFilename) -> const char *

Expands ~/ at start of filename.

### Parameters
* **pszFilename**: filename potentially starting with ~/

### Returns
an expanded filename.
"""
function cplexpandtilde(pszFilename)
    aftercare(ccall((:CPLExpandTilde, libgdal), Cstring, (Cstring,), pszFilename), false)
end

"""
    CPLGetHomeDir() -> const char *

Return the path to the home directory.

### Returns
the home directory, or NULL.
"""
function cplgethomedir()
    aftercare(ccall((:CPLGetHomeDir, libgdal), Cstring, ()), false)
end

"""
    CPLLaunderForFilename(const char * pszName,
                          const char * pszOutputPath) -> const char *

Launder a string to be compatible of a filename.

### Parameters
* **pszName**: The input string to launder.
* **pszOutputPath**: The directory where the file would be created. Unused for now. May be NULL.

### Returns
the laundered name.
"""
function cpllaunderforfilename(pszName, pszOutputPath)
    aftercare(ccall((:CPLLaunderForFilename, libgdal), Cstring, (Cstring, Cstring), pszName, pszOutputPath), false)
end

"Callback for [`CPLPushFileFinder`](@ref) "
const CPLFileFinder = Ptr{Cvoid}

"""
    CPLFindFile(const char * pszClass,
                const char * pszBasename) -> const char *

CPLFindFile.
"""
function cplfindfile(pszClass, pszBasename)
    aftercare(ccall((:CPLFindFile, libgdal), Cstring, (Cstring, Cstring), pszClass, pszBasename), false)
end

"""
    CPLDefaultFindFile(const char *,
                       const char * pszBasename) -> const char *

CPLDefaultFindFile.
"""
function cpldefaultfindfile(pszClass, pszBasename)
    aftercare(ccall((:CPLDefaultFindFile, libgdal), Cstring, (Cstring, Cstring), pszClass, pszBasename), false)
end

"""
    CPLPushFileFinder(CPLFileFinder pfnFinder) -> void

CPLPushFileFinder.
"""
function cplpushfilefinder(pfnFinder)
    aftercare(ccall((:CPLPushFileFinder, libgdal), Cvoid, (CPLFileFinder,), pfnFinder))
end

"""
    CPLPopFileFinder() -> CPLFileFinder

CPLPopFileFinder.
"""
function cplpopfilefinder()
    aftercare(ccall((:CPLPopFileFinder, libgdal), CPLFileFinder, ()))
end

"""
    CPLPushFinderLocation(const char * pszLocation) -> void

CPLPushFinderLocation.
"""
function cplpushfinderlocation(arg1)
    aftercare(ccall((:CPLPushFinderLocation, libgdal), Cvoid, (Cstring,), arg1))
end

"""
    CPLPopFinderLocation() -> void

CPLPopFinderLocation.
"""
function cplpopfinderlocation()
    aftercare(ccall((:CPLPopFinderLocation, libgdal), Cvoid, ()))
end

"""
    CPLFinderClean() -> void

CPLFinderClean.
"""
function cplfinderclean()
    aftercare(ccall((:CPLFinderClean, libgdal), Cvoid, ()))
end

"Doxygen\\\\_Suppress "
const VSIStatBuf = stat

"""
    CPLStat(const char * pszPath,
            VSIStatBuf * psStatBuf) -> int

Same as VSIStat() except it works on "C:" as if it were "C:\\".
"""
function cplstat(arg1, arg2)
    aftercare(ccall((:CPLStat, libgdal), Cint, (Cstring, Ptr{VSIStatBuf}), arg1, arg2))
end

"""
    CPLSharedFileInfo

Information on a shared file 

| Field       | Note                                         |
| :---------- | :------------------------------------------- |
| fp          | File pointer                                 |
| nRefCount   | Reference counter                            |
| bLarge      | Whether fp must be interpreted as VSIFILE*   |
| pszFilename | Filename                                     |
| pszAccess   | Access mode                                  |
"""
struct CPLSharedFileInfo
    fp::Ptr{Libc.FILE}
    nRefCount::Cint
    bLarge::Cint
    pszFilename::Cstring
    pszAccess::Cstring
end

"""
    CPLOpenShared(const char * pszFilename,
                  const char * pszAccess,
                  int bLargeIn) -> FILE *

Open a shared file handle.

### Parameters
* **pszFilename**: the name of the file to open.
* **pszAccess**: the normal fopen()/VSIFOpen() style access string.
* **bLargeIn**: If TRUE VSIFOpenL() (for large files) will be used instead of VSIFOpen().

### Returns
a file handle or NULL if opening fails.
"""
function cplopenshared(arg1, arg2, arg3)
    aftercare(ccall((:CPLOpenShared, libgdal), Ptr{Libc.FILE}, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"""
    CPLCloseShared(FILE * fp) -> void

Close shared file.

### Parameters
* **fp**: file handle from CPLOpenShared() to deaccess.
"""
function cplcloseshared(arg1)
    aftercare(ccall((:CPLCloseShared, libgdal), Cvoid, (Ptr{Libc.FILE},), arg1))
end

"""
    CPLGetSharedList(int * pnCount) -> CPLSharedFileInfo *

Fetch list of open shared files.

### Parameters
* **pnCount**: place to put the count of entries.

### Returns
the pointer to the first in the array of shared file info structures.
"""
function cplgetsharedlist(arg1)
    aftercare(ccall((:CPLGetSharedList, libgdal), Ptr{CPLSharedFileInfo}, (Ptr{Cint},), arg1))
end

"""
    CPLDumpSharedList(FILE * fp) -> void

Report open shared files.

### Parameters
* **fp**: File handle to write to.
"""
function cpldumpsharedlist(arg1)
    aftercare(ccall((:CPLDumpSharedList, libgdal), Cvoid, (Ptr{Libc.FILE},), arg1))
end

"""
    cplcleanupsharedfilemutex()

Doxygen\\_Suppress 
"""
function cplcleanupsharedfilemutex()
    aftercare(ccall((:CPLCleanupSharedFileMutex, libgdal), Cvoid, ()))
end

"""
    CPLDMSToDec(const char * is) -> double

CPLDMSToDec.
"""
function cpldmstodec(is)
    aftercare(ccall((:CPLDMSToDec, libgdal), Cdouble, (Cstring,), is))
end

"""
    CPLDecToDMS(double dfAngle,
                const char * pszAxis,
                int nPrecision) -> const char *

Translate a decimal degrees value to a DMS string with hemisphere.
"""
function cpldectodms(dfAngle, pszAxis, nPrecision)
    aftercare(ccall((:CPLDecToDMS, libgdal), Cstring, (Cdouble, Cstring, Cint), dfAngle, pszAxis, nPrecision), false)
end

"""
    CPLPackedDMSToDec(double dfPacked) -> double

Convert a packed DMS value (DDDMMMSSS.SS) into decimal degrees.

### Parameters
* **dfPacked**: Angle in packed DMS format.

### Returns
Angle in decimal degrees.
"""
function cplpackeddmstodec(arg1)
    aftercare(ccall((:CPLPackedDMSToDec, libgdal), Cdouble, (Cdouble,), arg1))
end

"""
    CPLDecToPackedDMS(double dfDec) -> double

Convert decimal degrees into packed DMS value (DDDMMMSSS.SS).

### Parameters
* **dfDec**: Angle in decimal degrees.

### Returns
Angle in packed DMS format.
"""
function cpldectopackeddms(dfDec)
    aftercare(ccall((:CPLDecToPackedDMS, libgdal), Cdouble, (Cdouble,), dfDec))
end

"""
    CPLStringToComplex(const char * pszString,
                       double * pdfReal,
                       double * pdfImag) -> void

Fetch the real and imaginary part of a serialized complex number.
"""
function cplstringtocomplex(pszString, pdfReal, pdfImag)
    aftercare(ccall((:CPLStringToComplex, libgdal), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}), pszString, pdfReal, pdfImag))
end

"""
    CPLUnlinkTree(const char * pszPath) -> int

Recursively unlink a directory.

### Returns
0 on successful completion, -1 if function fails.
"""
function cplunlinktree(arg1)
    aftercare(ccall((:CPLUnlinkTree, libgdal), Cint, (Cstring,), arg1))
end

"""
    CPLCopyFile(const char * pszNewPath,
                const char * pszOldPath) -> int

Copy a file.
"""
function cplcopyfile(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLCopyFile, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

"""
    CPLCopyTree(const char * pszNewPath,
                const char * pszOldPath) -> int

Recursively copy a tree.
"""
function cplcopytree(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLCopyTree, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

"""
    CPLMoveFile(const char * pszNewPath,
                const char * pszOldPath) -> int

Move a file.
"""
function cplmovefile(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLMoveFile, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

"""
    CPLSymlink(const char * pszOldPath,
               const char * pszNewPath,
               CSLConstList) -> int

Create a symbolic link.
"""
function cplsymlink(pszOldPath, pszNewPath, papszOptions)
    aftercare(ccall((:CPLSymlink, libgdal), Cint, (Cstring, Cstring, CSLConstList), pszOldPath, pszNewPath, papszOptions))
end

"""
    CPLCreateZip(const char * pszZipFilename,
                 char ** papszOptions) -> void *

Create ZIP file.
"""
function cplcreatezip(pszZipFilename, papszOptions)
    aftercare(ccall((:CPLCreateZip, libgdal), Ptr{Cvoid}, (Cstring, Ptr{Cstring}), pszZipFilename, papszOptions))
end

"""
    CPLErr

Error category 
"""
@cenum CPLErr::UInt32 begin
        CE_None = 0
        CE_Debug = 1
        CE_Warning = 2
        CE_Failure = 3
        CE_Fatal = 4
    end

"""
    CPLCreateFileInZip(void * hZip,
                       const char * pszFilename,
                       char ** papszOptions) -> CPLErr

Create a file in a ZIP file.
"""
function cplcreatefileinzip(hZip, pszFilename, papszOptions)
    aftercare(ccall((:CPLCreateFileInZip, libgdal), CPLErr, (Ptr{Cvoid}, Cstring, Ptr{Cstring}), hZip, pszFilename, papszOptions))
end

"""
    CPLWriteFileInZip(void * hZip,
                      const void * pBuffer,
                      int nBufferSize) -> CPLErr

Write in current file inside a ZIP file.
"""
function cplwritefileinzip(hZip, pBuffer, nBufferSize)
    aftercare(ccall((:CPLWriteFileInZip, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}, Cint), hZip, pBuffer, nBufferSize))
end

"""
    CPLCloseFileInZip(void * hZip) -> CPLErr

Close current file inside ZIP file.
"""
function cplclosefileinzip(hZip)
    aftercare(ccall((:CPLCloseFileInZip, libgdal), CPLErr, (Ptr{Cvoid},), hZip))
end

"""
    CPLCloseZip(void * hZip) -> CPLErr

Close ZIP file.
"""
function cplclosezip(hZip)
    aftercare(ccall((:CPLCloseZip, libgdal), CPLErr, (Ptr{Cvoid},), hZip))
end

"""
    CPLZLibDeflate(const void * ptr,
                   size_t nBytes,
                   int nLevel,
                   void * outptr,
                   size_t nOutAvailableBytes,
                   size_t * pnOutBytes) -> void *

Compress a buffer with ZLib DEFLATE compression.

### Parameters
* **ptr**: input buffer.
* **nBytes**: size of input buffer in bytes.
* **nLevel**: ZLib compression level (-1 for default). Currently unused
* **outptr**: output buffer, or NULL to let the function allocate it.
* **nOutAvailableBytes**: size of output buffer if provided, or ignored.
* **pnOutBytes**: pointer to a size_t, where to store the size of the output buffer.

### Returns
the output buffer (to be freed with VSIFree() if not provided) or NULL in case of error.
"""
function cplzlibdeflate(ptr, nBytes, nLevel, outptr, nOutAvailableBytes, pnOutBytes)
    aftercare(ccall((:CPLZLibDeflate, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Cint, Ptr{Cvoid}, Csize_t, Ptr{Csize_t}), ptr, nBytes, nLevel, outptr, nOutAvailableBytes, pnOutBytes))
end

"""
    CPLZLibInflate(const void * ptr,
                   size_t nBytes,
                   void * outptr,
                   size_t nOutAvailableBytes,
                   size_t * pnOutBytes) -> void *

Uncompress a buffer compressed with ZLib DEFLATE compression.

### Parameters
* **ptr**: input buffer.
* **nBytes**: size of input buffer in bytes.
* **outptr**: output buffer, or NULL to let the function allocate it.
* **nOutAvailableBytes**: size of output buffer if provided, or ignored.
* **pnOutBytes**: pointer to a size_t, where to store the size of the output buffer.

### Returns
the output buffer (to be freed with VSIFree() if not provided) or NULL in case of error.
"""
function cplzlibinflate(ptr, nBytes, outptr, nOutAvailableBytes, pnOutBytes)
    aftercare(ccall((:CPLZLibInflate, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t, Ptr{Csize_t}), ptr, nBytes, outptr, nOutAvailableBytes, pnOutBytes))
end

"""
    CPLValidateXML(const char * pszXMLFilename,
                   const char * pszXSDFilename,
                   CSLConstList papszOptions) -> int

Validate a XML file against a XML schema.

### Parameters
* **pszXMLFilename**: the filename of the XML file to validate.
* **pszXSDFilename**: the filename of the XSD schema.
* **papszOptions**: unused for now. Set to NULL.

### Returns
TRUE if the XML file validates against the XML schema.
"""
function cplvalidatexml(pszXMLFilename, pszXSDFilename, papszOptions)
    aftercare(ccall((:CPLValidateXML, libgdal), Cint, (Cstring, Cstring, CSLConstList), pszXMLFilename, pszXSDFilename, papszOptions))
end

"""
    CPLsetlocale(int category,
                 const char * locale) -> char *

Prevents parallel executions of setlocale().

### Parameters
* **category**: See your compiler's documentation on setlocale.
* **locale**: See your compiler's documentation on setlocale.

### Returns
See your compiler's documentation on setlocale.
"""
function cplsetlocale(category, locale)
    aftercare(ccall((:CPLsetlocale, libgdal), Cstring, (Cint, Cstring), category, locale), false)
end

"""
    cplcleanupsetlocalemutex()

Doxygen\\_Suppress 
"""
function cplcleanupsetlocalemutex()
    aftercare(ccall((:CPLCleanupSetlocaleMutex, libgdal), Cvoid, ()))
end

"""
    cplispoweroftwo(i)

[`CPLIsPowerOfTwo`](@ref)() 

### Parameters
* `i`: - tested number 

### Returns
[`TRUE`](@ref) if i is power of two otherwise return [`FALSE`](@ref)
"""
function cplispoweroftwo(i)
    aftercare(ccall((:CPLIsPowerOfTwo, libgdal), Cint, (Cuint,), i))
end

"Error number "
const CPLErrorNum = Cint

function cplemergencyerror(arg1)
    ccall((:CPLEmergencyError, libgdal), Cvoid, (Cstring,), arg1)
end

function cplerrorreset()
    ccall((:CPLErrorReset, libgdal), Cvoid, ())
end

function cplgetlasterrorno()
    ccall((:CPLGetLastErrorNo, libgdal), CPLErrorNum, ())
end

function cplgetlasterrortype()
    ccall((:CPLGetLastErrorType, libgdal), CPLErr, ())
end

"""
    CPLGetLastErrorMsg() -> const char *

Get the last error message.

### Returns
the last error message, or NULL if there is no posted error message.
"""
function cplgetlasterrormsg()
    unsafe_string(ccall((:CPLGetLastErrorMsg, libgdal), Cstring, ()))
end

"Unsigned int32 type "
const GUInt32 = Cuint

function cplgeterrorcounter()
    ccall((:CPLGetErrorCounter, libgdal), GUInt32, ())
end

function cplgeterrorhandleruserdata()
    ccall((:CPLGetErrorHandlerUserData, libgdal), Ptr{Cvoid}, ())
end

function cplerrorsetstate(eErrClass, err_no, pszMsg)
    ccall((:CPLErrorSetState, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), eErrClass, err_no, pszMsg)
end

"""
    cplcleanuperrormutex()

Doxygen\\_Suppress 
"""
function cplcleanuperrormutex()
    ccall((:CPLCleanupErrorMutex, libgdal), Cvoid, ())
end

"Callback for a custom error handler "
const CPLErrorHandler = Ptr{Cvoid}

function cplloggingerrorhandler(arg1, arg2, arg3)
    ccall((:CPLLoggingErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end

function cpldefaulterrorhandler(arg1, arg2, arg3)
    ccall((:CPLDefaultErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end

function cplquieterrorhandler(arg1, arg2, arg3)
    ccall((:CPLQuietErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end

"""
    CPLTurnFailureIntoWarning(int bOn) -> void

Whether failures should be turned into warnings.
"""
function cplturnfailureintowarning(bOn)
    aftercare(ccall((:CPLTurnFailureIntoWarning, libgdal), Cvoid, (Cint,), bOn))
end

function cplseterrorhandler(arg1)
    ccall((:CPLSetErrorHandler, libgdal), CPLErrorHandler, (CPLErrorHandler,), arg1)
end

function cplseterrorhandlerex(arg1, arg2)
    ccall((:CPLSetErrorHandlerEx, libgdal), CPLErrorHandler, (CPLErrorHandler, Ptr{Cvoid}), arg1, arg2)
end

function cplpusherrorhandler(arg1)
    ccall((:CPLPushErrorHandler, libgdal), Cvoid, (CPLErrorHandler,), arg1)
end

function cplpusherrorhandlerex(arg1, arg2)
    ccall((:CPLPushErrorHandlerEx, libgdal), Cvoid, (CPLErrorHandler, Ptr{Cvoid}), arg1, arg2)
end

function cplsetcurrenterrorhandlercatchdebug(bCatchDebug)
    ccall((:CPLSetCurrentErrorHandlerCatchDebug, libgdal), Cvoid, (Cint,), bCatchDebug)
end

function cplpoperrorhandler()
    ccall((:CPLPopErrorHandler, libgdal), Cvoid, ())
end

"""
    _CPLAssert(const char * pszExpression,
               const char * pszFile,
               int iLine) -> void

Report failure of a logical assertion.
"""
function _cplassert(arg1, arg2, arg3)
    aftercare(ccall((:_CPLAssert, libgdal), Cvoid, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"""
    CPLXMLNodeType

XML node type 

| Enumerator      | Note                        |
| :-------------- | :-------------------------- |
| CXT\\_Element   | Node is an element          |
| CXT\\_Text      | Node is a raw text value    |
| CXT\\_Attribute | Node is attribute           |
| CXT\\_Comment   | Node is an XML comment.     |
| CXT\\_Literal   | Node is a special literal   |
"""
@cenum CPLXMLNodeType::UInt32 begin
        CXT_Element = 0
        CXT_Text = 1
        CXT_Attribute = 2
        CXT_Comment = 3
        CXT_Literal = 4
    end

"""
    CPLXMLNode

Document node structure.

This C structure is used to hold a single text fragment representing a component of the document when parsed. It should be allocated with the appropriate CPL function, and freed with [`CPLDestroyXMLNode`](@ref)(). The structure contents should not normally be altered by application code, but may be freely examined by application code.

Using the psChild and psNext pointers, a hierarchical tree structure for a document can be represented as a tree of [`CPLXMLNode`](@ref) structures.

| Field    | Note                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| eType    | Node type  One of CXT\\_Element, CXT\\_Text, CXT\\_Attribute, CXT\\_Comment, or CXT\\_Literal.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| pszValue | Node value  For CXT\\_Element this is the name of the element, without the angle brackets. Note there is a single CXT\\_Element even when the document contains a start and end element tag. The node represents the pair. All text or other elements between the start and end tag will appear as children nodes of this CXT\\_Element node.  For CXT\\_Attribute the pszValue is the attribute name. The value of the attribute will be a CXT\\_Text child.  For CXT\\_Text this is the text itself (value of an attribute, or a text fragment between an element start and end tags.  For CXT\\_Literal it is all the literal text. Currently this is just used for !DOCTYPE lines, and the value would be the entire line.  For CXT\\_Comment the value is all the literal text within the comment, but not including the comment start/end indicators ("<--" and "-->").  |
| psNext   | Next sibling.  Pointer to next sibling, that is the next node appearing after this one that has the same parent as this node. NULL if this node is the last child of the parent element.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| psChild  | Child node.  Pointer to first child node, if any. Only CXT\\_Element and CXT\\_Attribute nodes should have children. For CXT\\_Attribute it should be a single CXT\\_Text value node, while CXT\\_Element can have any kind of child. The full list of children for a node are identified by walking the psNext's starting with the psChild node.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
"""
struct CPLXMLNode
    eType::CPLXMLNodeType
    pszValue::Cstring
    psNext::Ptr{CPLXMLNode}
    psChild::Ptr{CPLXMLNode}
end

"""
    CPLParseXMLString(const char * pszString) -> CPLXMLNode *

Parse an XML string into tree form.

### Parameters
* **pszString**: the document to parse.

### Returns
parsed tree or NULL on error.
"""
function cplparsexmlstring(arg1)
    aftercare(ccall((:CPLParseXMLString, libgdal), Ptr{CPLXMLNode}, (Cstring,), arg1))
end

"""
    CPLDestroyXMLNode(CPLXMLNode * psNode) -> void

Destroy a tree.

### Parameters
* **psNode**: the tree to free.
"""
function cpldestroyxmlnode(arg1)
    aftercare(ccall((:CPLDestroyXMLNode, libgdal), Cvoid, (Ptr{CPLXMLNode},), arg1))
end

"""
    CPLGetXMLNode(CPLXMLNode * psRoot,
                  const char * pszPath) -> CPLXMLNode *

Find node by path.

### Parameters
* **psRoot**: the subtree in which to search. This should be a node of type CXT_Element. NULL is safe.
* **pszPath**: the list of element names in the path (dot separated).

### Returns
the requested element node, or NULL if not found.
"""
function cplgetxmlnode(poRoot, pszPath)
    aftercare(ccall((:CPLGetXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring), poRoot, pszPath))
end

"""
    CPLSearchXMLNode(CPLXMLNode * psRoot,
                     const char * pszElement) -> CPLXMLNode *

Search for a node in document.

### Parameters
* **psRoot**: the subtree to search. This should be a node of type CXT_Element. NULL is safe.
* **pszElement**: the name of the element or attribute to search for.

### Returns
The matching node or NULL on failure.
"""
function cplsearchxmlnode(poRoot, pszTarget)
    aftercare(ccall((:CPLSearchXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring), poRoot, pszTarget))
end

"""
    CPLGetXMLValue(const CPLXMLNode * psRoot,
                   const char * pszPath,
                   const char * pszDefault) -> const char *

Fetch element/attribute value.

### Parameters
* **psRoot**: the subtree in which to search. This should be a node of type CXT_Element. NULL is safe.
* **pszPath**: the list of element names in the path (dot separated). An empty path means get the value of the psRoot node.
* **pszDefault**: the value to return if a corresponding value is not found, may be NULL.

### Returns
the requested value or pszDefault if not found.
"""
function cplgetxmlvalue(poRoot, pszPath, pszDefault)
    aftercare(ccall((:CPLGetXMLValue, libgdal), Cstring, (Ptr{CPLXMLNode}, Cstring, Cstring), poRoot, pszPath, pszDefault), false)
end

"""
    CPLCreateXMLNode(CPLXMLNode * poParent,
                     CPLXMLNodeType eType,
                     const char * pszText) -> CPLXMLNode *

Create an document tree item.

### Parameters
* **poParent**: the parent to which this node should be attached as a child. May be NULL to keep as free standing.
* **eType**: the type of the newly created node
* **pszText**: the value of the newly created node

### Returns
the newly created node, now owned by the caller (or parent node).
"""
function cplcreatexmlnode(poParent, eType, pszText)
    aftercare(ccall((:CPLCreateXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, CPLXMLNodeType, Cstring), poParent, eType, pszText))
end

"""
    CPLSerializeXMLTree(const CPLXMLNode * psNode) -> char *

Convert tree into string document.

### Parameters
* **psNode**: the node to serialize.

### Returns
the document on success or NULL on failure.
"""
function cplserializexmltree(psNode)
    aftercare(ccall((:CPLSerializeXMLTree, libgdal), Cstring, (Ptr{CPLXMLNode},), psNode), false)
end

"""
    CPLAddXMLChild(CPLXMLNode * psParent,
                   CPLXMLNode * psChild) -> void

Add child node to parent.

### Parameters
* **psParent**: the node to attach the child to. May not be NULL.
* **psChild**: the child to add to the parent. May not be NULL. Should not be a child of any other parent.
"""
function cpladdxmlchild(psParent, psChild)
    aftercare(ccall((:CPLAddXMLChild, libgdal), Cvoid, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psParent, psChild))
end

"""
    CPLRemoveXMLChild(CPLXMLNode * psParent,
                      CPLXMLNode * psChild) -> int

Remove child node from parent.

### Parameters
* **psParent**: the node to the child is attached to.
* **psChild**: the child to remove.

### Returns
TRUE on success or FALSE if the child was not found.
"""
function cplremovexmlchild(psParent, psChild)
    aftercare(ccall((:CPLRemoveXMLChild, libgdal), Cint, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psParent, psChild))
end

"""
    CPLAddXMLSibling(CPLXMLNode * psOlderSibling,
                     CPLXMLNode * psNewSibling) -> void

Add new sibling.

### Parameters
* **psOlderSibling**: the node to attach the sibling after.
* **psNewSibling**: the node to add at the end of psOlderSiblings psNext chain.
"""
function cpladdxmlsibling(psOlderSibling, psNewSibling)
    aftercare(ccall((:CPLAddXMLSibling, libgdal), Cvoid, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psOlderSibling, psNewSibling))
end

"""
    CPLCreateXMLElementAndValue(CPLXMLNode * psParent,
                                const char * pszName,
                                const char * pszValue) -> CPLXMLNode *

Create an element and text value.

### Parameters
* **psParent**: the parent node to which the resulting node should be attached. May be NULL to keep as freestanding.
* **pszName**: the element name to create.
* **pszValue**: the text to attach to the element. Must not be NULL.

### Returns
the pointer to the new element node.
"""
function cplcreatexmlelementandvalue(psParent, pszName, pszValue)
    aftercare(ccall((:CPLCreateXMLElementAndValue, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring, Cstring), psParent, pszName, pszValue))
end

"""
    CPLAddXMLAttributeAndValue(CPLXMLNode * psParent,
                               const char * pszName,
                               const char * pszValue) -> void

Create an attribute and text value.

### Parameters
* **psParent**: the parent node to which the resulting node should be attached. Must not be NULL.
* **pszName**: the attribute name to create.
* **pszValue**: the text to attach to the attribute. Must not be NULL.
"""
function cpladdxmlattributeandvalue(psParent, pszName, pszValue)
    aftercare(ccall((:CPLAddXMLAttributeAndValue, libgdal), Cvoid, (Ptr{CPLXMLNode}, Cstring, Cstring), psParent, pszName, pszValue))
end

"""
    CPLCloneXMLTree(const CPLXMLNode * psTree) -> CPLXMLNode *

Copy tree.

### Parameters
* **psTree**: the tree to duplicate.

### Returns
a copy of the whole tree.
"""
function cplclonexmltree(psTree)
    aftercare(ccall((:CPLCloneXMLTree, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode},), psTree))
end

"""
    CPLSetXMLValue(CPLXMLNode * psRoot,
                   const char * pszPath,
                   const char * pszValue) -> int

Set element value by path.

### Parameters
* **psRoot**: the subdocument to be updated.
* **pszPath**: the dot separated path to the target element/attribute.
* **pszValue**: the text value to assign.

### Returns
TRUE on success.
"""
function cplsetxmlvalue(psRoot, pszPath, pszValue)
    aftercare(ccall((:CPLSetXMLValue, libgdal), Cint, (Ptr{CPLXMLNode}, Cstring, Cstring), psRoot, pszPath, pszValue))
end

"""
    CPLStripXMLNamespace(CPLXMLNode * psRoot,
                         const char * pszNamespace,
                         int bRecurse) -> void

Strip indicated namespaces.

### Parameters
* **psRoot**: the document to operate on.
* **pszNamespace**: the name space prefix (not including colon), or NULL.
* **bRecurse**: TRUE to recurse over whole document, or FALSE to only operate on the passed node.
"""
function cplstripxmlnamespace(psRoot, pszNameSpace, bRecurse)
    aftercare(ccall((:CPLStripXMLNamespace, libgdal), Cvoid, (Ptr{CPLXMLNode}, Cstring, Cint), psRoot, pszNameSpace, bRecurse))
end

"""
    CPLCleanXMLElementName(char * pszTarget) -> void

Make string into safe XML token.

### Parameters
* **pszTarget**: the string to be adjusted. It is altered in place.
"""
function cplcleanxmlelementname(arg1)
    aftercare(ccall((:CPLCleanXMLElementName, libgdal), Cvoid, (Cstring,), arg1))
end

"""
    CPLParseXMLFile(const char * pszFilename) -> CPLXMLNode *

Parse XML file into tree.

### Parameters
* **pszFilename**: the file to open.

### Returns
NULL on failure, or the document tree on success.
"""
function cplparsexmlfile(pszFilename)
    aftercare(ccall((:CPLParseXMLFile, libgdal), Ptr{CPLXMLNode}, (Cstring,), pszFilename))
end

"""
    CPLSerializeXMLTreeToFile(const CPLXMLNode * psTree,
                              const char * pszFilename) -> int

Write document tree to a file.

### Parameters
* **psTree**: the document tree to write.
* **pszFilename**: the name of the file to write to.

### Returns
TRUE on success, FALSE otherwise.
"""
function cplserializexmltreetofile(psTree, pszFilename)
    aftercare(ccall((:CPLSerializeXMLTreeToFile, libgdal), Cint, (Ptr{CPLXMLNode}, Cstring), psTree, pszFilename))
end

"Int16 type "
const GInt16 = Cshort

"Unsigned int16 type "
const GUInt16 = Cushort

"Unsigned byte type "
const GByte = Cuchar

"""


Type for boolean values (alias to int) 
"""
const GBool = Cint

"Signed 64 bit integer type "
const GInt64 = GIntBig

"Unsigned 64 bit integer type "
const GUInt64 = GUIntBig

"Integer type large enough to hold the difference between 2 addresses "
const GPtrDiff_t = GIntBig

const GDALProgressFunc = Ptr{Cvoid}

"""
    GDALDummyProgress(double,
                      const char *,
                      void *) -> int

Stub progress function.
"""
function gdaldummyprogress(arg1, arg2, arg3)
    aftercare(ccall((:GDALDummyProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3))
end

"""
    GDALTermProgress(double dfComplete,
                     const char * pszMessage,
                     void * pProgressArg) -> int

Simple progress report to terminal.

### Parameters
* **dfComplete**: completion ratio from 0.0 to 1.0.
* **pszMessage**: optional message.
* **pProgressArg**: ignored callback data argument.

### Returns
Always returns TRUE indicating the process should continue.
"""
function gdaltermprogress(arg1, arg2, arg3)
    aftercare(ccall((:GDALTermProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3))
end

"""
    GDALScaledProgress(double dfComplete,
                       const char * pszMessage,
                       void * pData) -> int

Scaled progress transformer.
"""
function gdalscaledprogress(arg1, arg2, arg3)
    aftercare(ccall((:GDALScaledProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3))
end

"""
    GDALCreateScaledProgress(double dfMin,
                             double dfMax,
                             GDALProgressFunc pfnProgress,
                             void * pData) -> void *

Create scaled progress transformer.

### Parameters
* **dfMin**: the value to which 0.0 in the sub operation is mapped.
* **dfMax**: the value to which 1.0 is the sub operation is mapped.
* **pfnProgress**: the overall progress function.
* **pData**: the overall progress function callback data.

### Returns
pointer to pass as pProgressArg to sub functions. Should be freed with GDALDestroyScaledProgress().
"""
function gdalcreatescaledprogress(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALCreateScaledProgress, libgdal), Ptr{Cvoid}, (Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

"""
    GDALDestroyScaledProgress(void * pData) -> void

Cleanup scaled progress handle.

### Parameters
* **pData**: scaled progress handle returned by GDALCreateScaledProgress().
"""
function gdaldestroyscaledprogress(arg1)
    aftercare(ccall((:GDALDestroyScaledProgress, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

mutable struct CPLVirtualMem
end

"""
Callback triggered when a still unmapped page of virtual memory is accessed. The callback has the responsibility of filling the page with relevant values

### Parameters
* `ctxt`: virtual memory handle. 

* `nOffset`: offset of the page in the memory mapping. 

* `pPageToFill`: address of the page to fill. Note that the address might be a temporary location, and not at [`CPLVirtualMemGetAddr`](@ref)() + nOffset. 

* `nToFill`: number of bytes of the page. 

* `pUserData`: user data that was passed to [`CPLVirtualMemNew`](@ref)().
"""
const CPLVirtualMemCachePageCbk = Ptr{Cvoid}

"""
Callback triggered when a dirty mapped page is going to be freed. (saturation of cache, or termination of the virtual memory mapping).

### Parameters
* `ctxt`: virtual memory handle. 

* `nOffset`: offset of the page in the memory mapping. 

* `pPageToBeEvicted`: address of the page that will be flushed. Note that the address might be a temporary location, and not at [`CPLVirtualMemGetAddr`](@ref)() + nOffset. 

* `nToBeEvicted`: number of bytes of the page. 

* `pUserData`: user data that was passed to [`CPLVirtualMemNew`](@ref)().
"""
const CPLVirtualMemUnCachePageCbk = Ptr{Cvoid}

"""
Callback triggered when a virtual memory mapping is destroyed. 

### Parameters
* `pUserData`: user data that was passed to [`CPLVirtualMemNew`](@ref)().
"""
const CPLVirtualMemFreeUserData = Ptr{Cvoid}

"""
    CPLVirtualMemAccessMode

Access mode of a virtual memory mapping. 

| Enumerator                       | Note                                                                                                                         |
| :------------------------------- | :--------------------------------------------------------------------------------------------------------------------------- |
| VIRTUALMEM\\_READONLY            | The mapping is meant at being read-only, but writes will not be prevented. Note that any content written will be lost.       |
| VIRTUALMEM\\_READONLY\\_ENFORCED | The mapping is meant at being read-only, and this will be enforced through the operating system page protection mechanism.   |
| VIRTUALMEM\\_READWRITE           | The mapping is meant at being read-write, and modified pages can be saved thanks to the pfnUnCachePage callback              |
"""
@cenum CPLVirtualMemAccessMode::UInt32 begin
        VIRTUALMEM_READONLY = 0
        VIRTUALMEM_READONLY_ENFORCED = 1
        VIRTUALMEM_READWRITE = 2
    end

"""
    cplgetpagesize()

Return the size of a page of virtual memory.

\\since GDAL 1.11

### Returns
the page size.
"""
function cplgetpagesize()
    aftercare(ccall((:CPLGetPageSize, libgdal), Csize_t, ()))
end

"""
    cplvirtualmemnew(nSize, nCacheSize, nPageSizeHint, bSingleThreadUsage, eAccessMode, pfnCachePage, pfnUnCachePage, pfnFreeUserData, pCbkUserData)

Create a new virtual memory mapping.

This will reserve an area of virtual memory of size nSize, whose size might be potentially much larger than the physical memory available. Initially, no physical memory will be allocated. As soon as memory pages will be accessed, they will be allocated transparently and filled with the pfnCachePage callback. When the allowed cache size is reached, the least recently used pages will be unallocated.

On Linux AMD64 platforms, the maximum value for nSize is 128 TB. On Linux x86 platforms, the maximum value for nSize is 2 GB.

Only supported on Linux for now.

Note that on Linux, this function will install a SIGSEGV handler. The original handler will be restored by [`CPLVirtualMemManagerTerminate`](@ref)().

\\since GDAL 1.11

### Parameters
* `nSize`: size in bytes of the virtual memory mapping. 

* `nCacheSize`: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM). 

* `nPageSizeHint`: hint for the page size. Must be a multiple of the system page size, returned by [`CPLGetPageSize`](@ref)(). Minimum value is generally 4096. Might be set to 0 to let the function determine a default page size. 

* `bSingleThreadUsage`: set to [`TRUE`](@ref) if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. 

* `eAccessMode`: permission to use for the virtual memory mapping. 

* `pfnCachePage`: callback triggered when a still unmapped page of virtual memory is accessed. The callback has the responsibility of filling the page with relevant values. 

* `pfnUnCachePage`: callback triggered when a dirty mapped page is going to be freed (saturation of cache, or termination of the virtual memory mapping). Might be NULL. 

* `pfnFreeUserData`: callback that can be used to free pCbkUserData. Might be NULL 

* `pCbkUserData`: user data passed to pfnCachePage and pfnUnCachePage.

### Returns
a virtual memory object that must be freed by [`CPLVirtualMemFree`](@ref)(), or NULL in case of failure.
"""
function cplvirtualmemnew(nSize, nCacheSize, nPageSizeHint, bSingleThreadUsage, eAccessMode, pfnCachePage, pfnUnCachePage, pfnFreeUserData, pCbkUserData)
    aftercare(ccall((:CPLVirtualMemNew, libgdal), Ptr{CPLVirtualMem}, (Csize_t, Csize_t, Csize_t, Cint, CPLVirtualMemAccessMode, CPLVirtualMemCachePageCbk, CPLVirtualMemUnCachePageCbk, CPLVirtualMemFreeUserData, Ptr{Cvoid}), nSize, nCacheSize, nPageSizeHint, bSingleThreadUsage, eAccessMode, pfnCachePage, pfnUnCachePage, pfnFreeUserData, pCbkUserData))
end

"""
    cplisvirtualmemfilemapavailable()

Return if virtual memory mapping of a file is available.

\\since GDAL 1.11

### Returns
[`TRUE`](@ref) if virtual memory mapping of a file is available. 
"""
function cplisvirtualmemfilemapavailable()
    aftercare(ccall((:CPLIsVirtualMemFileMapAvailable, libgdal), Cint, ()))
end

"Type for a file offset "
const vsi_l_offset = GUIntBig

"""
    cplvirtualmemfilemapnew(fp, nOffset, nLength, eAccessMode, pfnFreeUserData, pCbkUserData)

Create a new virtual memory mapping from a file.

The file must be a "real" file recognized by the operating system, and not a VSI extended virtual file.

In VIRTUALMEM\\_READWRITE mode, updates to the memory mapping will be written in the file.

On Linux AMD64 platforms, the maximum value for nLength is 128 TB. On Linux x86 platforms, the maximum value for nLength is 2 GB.

Supported on Linux only in GDAL <= 2.0, and all POSIX systems supporting mmap() in GDAL >= 2.1

\\since GDAL 1.11

### Parameters
* `fp`: Virtual file handle. 

* `nOffset`: Offset in the file to start the mapping from. 

* `nLength`: Length of the portion of the file to map into memory. 

* `eAccessMode`: Permission to use for the virtual memory mapping. This must be consistent with how the file has been opened. 

* `pfnFreeUserData`: callback that is called when the object is destroyed. 

* `pCbkUserData`: user data passed to pfnFreeUserData. 

### Returns
a virtual memory object that must be freed by [`CPLVirtualMemFree`](@ref)(), or NULL in case of failure.
"""
function cplvirtualmemfilemapnew(fp, nOffset, nLength, eAccessMode, pfnFreeUserData, pCbkUserData)
    aftercare(ccall((:CPLVirtualMemFileMapNew, libgdal), Ptr{CPLVirtualMem}, (Ptr{VSILFILE}, vsi_l_offset, vsi_l_offset, CPLVirtualMemAccessMode, CPLVirtualMemFreeUserData, Ptr{Cvoid}), fp, nOffset, nLength, eAccessMode, pfnFreeUserData, pCbkUserData))
end

"""
    cplvirtualmemderivednew(pVMemBase, nOffset, nSize, pfnFreeUserData, pCbkUserData)

Create a new virtual memory mapping derived from an other virtual memory mapping.

This may be useful in case of creating mapping for pixel interleaved data.

The new mapping takes a reference on the base mapping.

\\since GDAL 1.11

### Parameters
* `pVMemBase`: Base virtual memory mapping 

* `nOffset`: Offset in the base virtual memory mapping from which to start the new mapping. 

* `nSize`: Size of the base virtual memory mapping to expose in the the new mapping. 

* `pfnFreeUserData`: callback that is called when the object is destroyed. 

* `pCbkUserData`: user data passed to pfnFreeUserData. 

### Returns
a virtual memory object that must be freed by [`CPLVirtualMemFree`](@ref)(), or NULL in case of failure.
"""
function cplvirtualmemderivednew(pVMemBase, nOffset, nSize, pfnFreeUserData, pCbkUserData)
    aftercare(ccall((:CPLVirtualMemDerivedNew, libgdal), Ptr{CPLVirtualMem}, (Ptr{CPLVirtualMem}, vsi_l_offset, vsi_l_offset, CPLVirtualMemFreeUserData, Ptr{Cvoid}), pVMemBase, nOffset, nSize, pfnFreeUserData, pCbkUserData))
end

"""
    cplvirtualmemfree(ctxt)

Free a virtual memory mapping.

The pointer returned by [`CPLVirtualMemGetAddr`](@ref)() will no longer be valid. If the virtual memory mapping was created with read/write permissions and that they are dirty (i.e. modified) pages, they will be flushed through the pfnUnCachePage callback before being freed.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)().
"""
function cplvirtualmemfree(ctxt)
    aftercare(ccall((:CPLVirtualMemFree, libgdal), Cvoid, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemgetaddr(ctxt)

Return the pointer to the start of a virtual memory mapping.

The bytes in the range [p:p+[`CPLVirtualMemGetSize`](@ref)()-1] where p is the pointer returned by this function will be valid, until [`CPLVirtualMemFree`](@ref)() is called.

Note that if a range of bytes used as an argument of a system call (such as read() or write()) contains pages that have not been "realized", the system call will fail with EFAULT. [`CPLVirtualMemPin`](@ref)() can be used to work around this issue.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
the pointer to the start of a virtual memory mapping.
"""
function cplvirtualmemgetaddr(ctxt)
    aftercare(ccall((:CPLVirtualMemGetAddr, libgdal), Ptr{Cvoid}, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemgetsize(ctxt)

Return the size of the virtual memory mapping.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
the size of the virtual memory mapping.
"""
function cplvirtualmemgetsize(ctxt)
    aftercare(ccall((:CPLVirtualMemGetSize, libgdal), Csize_t, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemisfilemapping(ctxt)

Return if the virtual memory mapping is a direct file mapping.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
[`TRUE`](@ref) if the virtual memory mapping is a direct file mapping.
"""
function cplvirtualmemisfilemapping(ctxt)
    aftercare(ccall((:CPLVirtualMemIsFileMapping, libgdal), Cint, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemgetaccessmode(ctxt)

Return the access mode of the virtual memory mapping.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
the access mode of the virtual memory mapping.
"""
function cplvirtualmemgetaccessmode(ctxt)
    aftercare(ccall((:CPLVirtualMemGetAccessMode, libgdal), CPLVirtualMemAccessMode, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemgetpagesize(ctxt)

Return the page size associated to a virtual memory mapping.

The value returned will be at least [`CPLGetPageSize`](@ref)(), but potentially larger.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
the page size
"""
function cplvirtualmemgetpagesize(ctxt)
    aftercare(ccall((:CPLVirtualMemGetPageSize, libgdal), Csize_t, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemisaccessthreadsafe(ctxt)

Return [`TRUE`](@ref) if this memory mapping can be accessed safely from concurrent threads.

The situation that can cause problems is when several threads try to access a page of the mapping that is not yet mapped.

The return value of this function depends on whether bSingleThreadUsage has been set of not in [`CPLVirtualMemNew`](@ref)() and/or the implementation.

On Linux, this will always return [`TRUE`](@ref) if bSingleThreadUsage = [`FALSE`](@ref).

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
[`TRUE`](@ref) if this memory mapping can be accessed safely from concurrent threads.
"""
function cplvirtualmemisaccessthreadsafe(ctxt)
    aftercare(ccall((:CPLVirtualMemIsAccessThreadSafe, libgdal), Cint, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemdeclarethread(ctxt)

Declare that a thread will access a virtual memory mapping.

This function must be called by a thread that wants to access the content of a virtual memory mapping, except if the virtual memory mapping has been created with bSingleThreadUsage = [`TRUE`](@ref).

This function must be paired with [`CPLVirtualMemUnDeclareThread`](@ref)().

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)().
"""
function cplvirtualmemdeclarethread(ctxt)
    aftercare(ccall((:CPLVirtualMemDeclareThread, libgdal), Cvoid, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemundeclarethread(ctxt)

Declare that a thread will stop accessing a virtual memory mapping.

This function must be called by a thread that will no longer access the content of a virtual memory mapping, except if the virtual memory mapping has been created with bSingleThreadUsage = [`TRUE`](@ref).

This function must be paired with [`CPLVirtualMemDeclareThread`](@ref)().

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)().
"""
function cplvirtualmemundeclarethread(ctxt)
    aftercare(ccall((:CPLVirtualMemUnDeclareThread, libgdal), Cvoid, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmempin(ctxt, pAddr, nSize, bWriteOp)

Make sure that a region of virtual memory will be realized.

Calling this function is not required, but might be useful when debugging a process with tools like gdb or valgrind that do not naturally like segmentation fault signals.

It is also needed when wanting to provide part of virtual memory mapping to a system call such as read() or write(). If read() or write() is called on a memory region not yet realized, the call will fail with EFAULT.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

* `pAddr`: the memory region to pin. 

* `nSize`: the size of the memory region. 

* `bWriteOp`: set to [`TRUE`](@ref) if the memory are will be accessed in write mode.
"""
function cplvirtualmempin(ctxt, pAddr, nSize, bWriteOp)
    aftercare(ccall((:CPLVirtualMemPin, libgdal), Cvoid, (Ptr{CPLVirtualMem}, Ptr{Cvoid}, Csize_t, Cint), ctxt, pAddr, nSize, bWriteOp))
end

"""
    cplvirtualmemmanagerterminate()

Cleanup any resource and handlers related to virtual memory.

This function must be called after the last [`CPLVirtualMem`](@ref) object has been freed.

\\since GDAL 2.0
"""
function cplvirtualmemmanagerterminate()
    aftercare(ccall((:CPLVirtualMemManagerTerminate, libgdal), Cvoid, ()))
end

"""
    vsifopen(arg1, arg2)

Doxygen\\_Suppress 
"""
function vsifopen(arg1, arg2)
    aftercare(ccall((:VSIFOpen, libgdal), Ptr{Libc.FILE}, (Cstring, Cstring), arg1, arg2))
end

"""
    VSIFClose(FILE * fp) -> int
"""
function vsifclose(arg1)
    aftercare(ccall((:VSIFClose, libgdal), Cint, (Ptr{Libc.FILE},), arg1))
end

"""
    VSIFSeek(FILE * fp,
             long nOffset,
             int nWhence) -> int
"""
function vsifseek(arg1, arg2, arg3)
    aftercare(ccall((:VSIFSeek, libgdal), Cint, (Ptr{Libc.FILE}, Clong, Cint), arg1, arg2, arg3))
end

"""
    VSIFTell(FILE * fp) -> long
"""
function vsiftell(arg1)
    aftercare(ccall((:VSIFTell, libgdal), Clong, (Ptr{Libc.FILE},), arg1))
end

"""
    VSIRewind(FILE * fp) -> void
"""
function vsirewind(arg1)
    aftercare(ccall((:VSIRewind, libgdal), Cvoid, (Ptr{Libc.FILE},), arg1))
end

"""
    VSIFFlush(FILE * fp) -> void
"""
function vsifflush(arg1)
    aftercare(ccall((:VSIFFlush, libgdal), Cvoid, (Ptr{Libc.FILE},), arg1))
end

"""
    VSIFRead(void * pBuffer,
             size_t nSize,
             size_t nCount,
             FILE * fp) -> size_t
"""
function vsifread(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VSIFRead, libgdal), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Libc.FILE}), arg1, arg2, arg3, arg4))
end

"""
    VSIFWrite(const void * pBuffer,
              size_t nSize,
              size_t nCount,
              FILE * fp) -> size_t
"""
function vsifwrite(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VSIFWrite, libgdal), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Libc.FILE}), arg1, arg2, arg3, arg4))
end

"""
    VSIFGets(char * pszBuffer,
             int nBufferSize,
             FILE * fp) -> char *
"""
function vsifgets(arg1, arg2, arg3)
    aftercare(ccall((:VSIFGets, libgdal), Cstring, (Cstring, Cint, Ptr{Libc.FILE}), arg1, arg2, arg3), false)
end

"""
    VSIFPuts(const char * pszString,
             FILE * fp) -> int
"""
function vsifputs(arg1, arg2)
    aftercare(ccall((:VSIFPuts, libgdal), Cint, (Cstring, Ptr{Libc.FILE}), arg1, arg2))
end

"""
    VSIFGetc(FILE * fp) -> int
"""
function vsifgetc(arg1)
    aftercare(ccall((:VSIFGetc, libgdal), Cint, (Ptr{Libc.FILE},), arg1))
end

"""
    VSIFPutc(int nChar,
             FILE * fp) -> int
"""
function vsifputc(arg1, arg2)
    aftercare(ccall((:VSIFPutc, libgdal), Cint, (Cint, Ptr{Libc.FILE}), arg1, arg2))
end

"""
    VSIUngetc(int c,
              FILE * fp) -> int
"""
function vsiungetc(arg1, arg2)
    aftercare(ccall((:VSIUngetc, libgdal), Cint, (Cint, Ptr{Libc.FILE}), arg1, arg2))
end

"""
    VSIFEof(FILE * fp) -> int
"""
function vsifeof(arg1)
    aftercare(ccall((:VSIFEof, libgdal), Cint, (Ptr{Libc.FILE},), arg1))
end

"""
    VSIStat(const char * pszFilename,
            VSIStatBuf * pStatBuf) -> int
"""
function vsistat(arg1, arg2)
    aftercare(ccall((:VSIStat, libgdal), Cint, (Cstring, Ptr{VSIStatBuf}), arg1, arg2))
end

"""
    VSIFOpenL(const char * pszFilename,
              const char * pszAccess) -> VSILFILE *

Open file.

### Parameters
* **pszFilename**: the file to open. UTF-8 encoded.
* **pszAccess**: access requested (i.e. "r", "r+", "w")

### Returns
NULL on failure, or the file handle.
"""
function vsifopenl(arg1, arg2)
    aftercare(ccall((:VSIFOpenL, libgdal), Ptr{VSILFILE}, (Cstring, Cstring), arg1, arg2))
end

"""
    VSIFOpenExL(const char * pszFilename,
                const char * pszAccess,
                int bSetError) -> VSILFILE *

Open file.

### Parameters
* **pszFilename**: the file to open. UTF-8 encoded.
* **pszAccess**: access requested (i.e. "r", "r+", "w")
* **bSetError**: flag determining whether or not this open call should set VSIErrors on failure.

### Returns
NULL on failure, or the file handle.
"""
function vsifopenexl(arg1, arg2, arg3)
    aftercare(ccall((:VSIFOpenExL, libgdal), Ptr{VSILFILE}, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"""
    VSIFCloseL(VSILFILE * fp) -> int

Close file.

### Parameters
* **fp**: file handle opened with VSIFOpenL(). Passing a nullptr produces undefined behavior.

### Returns
0 on success or -1 on failure.
"""
function vsifclosel(arg1)
    aftercare(ccall((:VSIFCloseL, libgdal), Cint, (Ptr{VSILFILE},), arg1))
end

"""
    VSIFSeekL(VSILFILE * fp,
              vsi_l_offset nOffset,
              int nWhence) -> int

Seek to requested offset.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
* **nOffset**: offset in bytes.
* **nWhence**: one of SEEK_SET, SEEK_CUR or SEEK_END.

### Returns
0 on success or -1 one failure.
"""
function vsifseekl(arg1, arg2, arg3)
    aftercare(ccall((:VSIFSeekL, libgdal), Cint, (Ptr{VSILFILE}, vsi_l_offset, Cint), arg1, arg2, arg3))
end

"""
    VSIFTellL(VSILFILE * fp) -> vsi_l_offset

Tell current file offset.

### Parameters
* **fp**: file handle opened with VSIFOpenL().

### Returns
file offset in bytes.
"""
function vsiftelll(arg1)
    aftercare(ccall((:VSIFTellL, libgdal), vsi_l_offset, (Ptr{VSILFILE},), arg1))
end

"""
    VSIRewindL(VSILFILE * fp) -> void

Rewind the file pointer to the beginning of the file.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
"""
function vsirewindl(arg1)
    aftercare(ccall((:VSIRewindL, libgdal), Cvoid, (Ptr{VSILFILE},), arg1))
end

"""
    VSIFReadL(void * pBuffer,
              size_t nSize,
              size_t nCount,
              VSILFILE * fp) -> size_t

Read bytes from file.

### Parameters
* **pBuffer**: the buffer into which the data should be read (at least nCount * nSize bytes in size.
* **nSize**: size of objects to read in bytes.
* **nCount**: number of objects to read.
* **fp**: file handle opened with VSIFOpenL().

### Returns
number of objects successfully read.
"""
function vsifreadl(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VSIFReadL, libgdal), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{VSILFILE}), arg1, arg2, arg3, arg4))
end

"""
    VSIFReadMultiRangeL(int nRanges,
                        void ** ppData,
                        const vsi_l_offset * panOffsets,
                        const size_t * panSizes,
                        VSILFILE * fp) -> int

Read several ranges of bytes from file.

### Parameters
* **nRanges**: number of ranges to read.
* **ppData**: array of nRanges buffer into which the data should be read (ppData[i] must be at list panSizes[i] bytes).
* **panOffsets**: array of nRanges offsets at which the data should be read.
* **panSizes**: array of nRanges sizes of objects to read (in bytes).
* **fp**: file handle opened with VSIFOpenL().

### Returns
0 in case of success, -1 otherwise.
"""
function vsifreadmultirangel(nRanges, ppData, panOffsets, panSizes, arg5)
    aftercare(ccall((:VSIFReadMultiRangeL, libgdal), Cint, (Cint, Ptr{Ptr{Cvoid}}, Ptr{vsi_l_offset}, Ptr{Csize_t}, Ptr{VSILFILE}), nRanges, ppData, panOffsets, panSizes, arg5))
end

"""
    VSIFWriteL(const void * pBuffer,
               size_t nSize,
               size_t nCount,
               VSILFILE * fp) -> size_t

Write bytes to file.

### Parameters
* **pBuffer**: the buffer from which the data should be written (at least nCount * nSize bytes in size.
* **nSize**: size of objects to read in bytes.
* **nCount**: number of objects to read.
* **fp**: file handle opened with VSIFOpenL().

### Returns
number of objects successfully written.
"""
function vsifwritel(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VSIFWriteL, libgdal), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{VSILFILE}), arg1, arg2, arg3, arg4))
end

"""
    VSIFEofL(VSILFILE * fp) -> int

Test for end of file.

### Parameters
* **fp**: file handle opened with VSIFOpenL().

### Returns
TRUE if at EOF else FALSE.
"""
function vsifeofl(arg1)
    aftercare(ccall((:VSIFEofL, libgdal), Cint, (Ptr{VSILFILE},), arg1))
end

"""
    VSIFTruncateL(VSILFILE * fp,
                  vsi_l_offset nNewSize) -> int

Truncate/expand the file to the specified size.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
* **nNewSize**: new size in bytes.

### Returns
0 on success
"""
function vsiftruncatel(arg1, arg2)
    aftercare(ccall((:VSIFTruncateL, libgdal), Cint, (Ptr{VSILFILE}, vsi_l_offset), arg1, arg2))
end

"""
    VSIFFlushL(VSILFILE * fp) -> int

Flush pending writes to disk.

### Parameters
* **fp**: file handle opened with VSIFOpenL().

### Returns
0 on success or -1 on error.
"""
function vsifflushl(arg1)
    aftercare(ccall((:VSIFFlushL, libgdal), Cint, (Ptr{VSILFILE},), arg1))
end

"""
    VSIFPutcL(int nChar,
              VSILFILE * fp) -> int

Write a single byte to the file.

### Parameters
* **nChar**: character to write.
* **fp**: file handle opened with VSIFOpenL().

### Returns
1 in case of success, 0 on error.
"""
function vsifputcl(arg1, arg2)
    aftercare(ccall((:VSIFPutcL, libgdal), Cint, (Cint, Ptr{VSILFILE}), arg1, arg2))
end

"""
    VSIRangeStatus

Range status 

| Enumerator                     | Note           |
| :----------------------------- | :------------- |
| VSI\\_RANGE\\_STATUS\\_UNKNOWN | Unknown        |
| VSI\\_RANGE\\_STATUS\\_DATA    | Data present   |
| VSI\\_RANGE\\_STATUS\\_HOLE    | Hole           |
"""
@cenum VSIRangeStatus::UInt32 begin
        VSI_RANGE_STATUS_UNKNOWN = 0
        VSI_RANGE_STATUS_DATA = 1
        VSI_RANGE_STATUS_HOLE = 2
    end

"""
    VSIFGetRangeStatusL(VSILFILE * fp,
                        vsi_l_offset nOffset,
                        vsi_l_offset nLength) -> VSIRangeStatus

Return if a given file range contains data or holes filled with zeroes.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
* **nOffset**: offset of the start of the extent.
* **nLength**: extent length.

### Returns
extent status: VSI_RANGE_STATUS_UNKNOWN, VSI_RANGE_STATUS_DATA or VSI_RANGE_STATUS_HOLE
"""
function vsifgetrangestatusl(fp, nStart, nLength)
    aftercare(ccall((:VSIFGetRangeStatusL, libgdal), VSIRangeStatus, (Ptr{VSILFILE}, vsi_l_offset, vsi_l_offset), fp, nStart, nLength))
end

"""
    VSIIngestFile(VSILFILE * fp,
                  const char * pszFilename,
                  GByte ** ppabyRet,
                  vsi_l_offset * pnSize,
                  GIntBig nMaxSize) -> int

Ingest a file into memory.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
* **pszFilename**: filename.
* **ppabyRet**: pointer to the target buffer. *ppabyRet must be freed with VSIFree()
* **pnSize**: pointer to variable to store the file size. May be NULL.
* **nMaxSize**: maximum size of file allowed. If no limit, set to a negative value.

### Returns
TRUE in case of success.
"""
function vsiingestfile(fp, pszFilename, ppabyRet, pnSize, nMaxSize)
    aftercare(ccall((:VSIIngestFile, libgdal), Cint, (Ptr{VSILFILE}, Cstring, Ptr{Ptr{GByte}}, Ptr{vsi_l_offset}, GIntBig), fp, pszFilename, ppabyRet, pnSize, nMaxSize))
end

"""
    VSIOverwriteFile(VSILFILE * fpTarget,
                     const char * pszSourceFilename) -> int

Overwrite an existing file with content from another one.

### Parameters
* **fpTarget**: file handle opened with VSIFOpenL() with "rb+" flag.
* **pszSourceFilename**: source filename

### Returns
TRUE in case of success.
"""
function vsioverwritefile(fpTarget, pszSourceFilename)
    aftercare(ccall((:VSIOverwriteFile, libgdal), Cint, (Ptr{VSILFILE}, Cstring), fpTarget, pszSourceFilename))
end

mutable struct stat64
end

"Type for [`VSIStatL`](@ref)() "
const VSIStatBufL = stat64

"""
    VSIStatL(const char * pszFilename,
             VSIStatBufL * psStatBuf) -> int

Get filesystem object info.

### Parameters
* **pszFilename**: the path of the filesystem object to be queried. UTF-8 encoded.
* **psStatBuf**: the structure to load with information.

### Returns
0 on success or -1 on an error.
"""
function vsistatl(arg1, arg2)
    aftercare(ccall((:VSIStatL, libgdal), Cint, (Cstring, Ptr{VSIStatBufL}), arg1, arg2))
end

"""
    VSIStatExL(const char * pszFilename,
               VSIStatBufL * psStatBuf,
               int nFlags) -> int

Get filesystem object info.

### Parameters
* **pszFilename**: the path of the filesystem object to be queried. UTF-8 encoded.
* **psStatBuf**: the structure to load with information.
* **nFlags**: 0 to get all information, or VSI_STAT_EXISTS_FLAG, VSI_STAT_NATURE_FLAG or VSI_STAT_SIZE_FLAG, or a combination of those to get partial info.

### Returns
0 on success or -1 on an error.
"""
function vsistatexl(pszFilename, psStatBuf, nFlags)
    aftercare(ccall((:VSIStatExL, libgdal), Cint, (Cstring, Ptr{VSIStatBufL}, Cint), pszFilename, psStatBuf, nFlags))
end

"""
    VSIIsCaseSensitiveFS(const char * pszFilename) -> int

Returns if the filenames of the filesystem are case sensitive.

### Parameters
* **pszFilename**: the path of the filesystem object to be tested. UTF-8 encoded.

### Returns
TRUE if the filenames of the filesystem are case sensitive.
"""
function vsiiscasesensitivefs(pszFilename)
    aftercare(ccall((:VSIIsCaseSensitiveFS, libgdal), Cint, (Cstring,), pszFilename))
end

"""
    VSISupportsSparseFiles(const char * pszPath) -> int

Returns if the filesystem supports sparse files.

### Parameters
* **pszPath**: the path of the filesystem object to be tested. UTF-8 encoded.

### Returns
TRUE if the file system is known to support sparse files. FALSE may be returned both in cases where it is known to not support them, or when it is unknown.
"""
function vsisupportssparsefiles(pszPath)
    aftercare(ccall((:VSISupportsSparseFiles, libgdal), Cint, (Cstring,), pszPath))
end

"""
    VSIHasOptimizedReadMultiRange(const char * pszPath) -> int

Returns if the filesystem supports efficient multi-range reading.

### Parameters
* **pszPath**: the path of the filesystem object to be tested. UTF-8 encoded.

### Returns
TRUE if the file system is known to have an efficient multi-range reading.
"""
function vsihasoptimizedreadmultirange(pszPath)
    aftercare(ccall((:VSIHasOptimizedReadMultiRange, libgdal), Cint, (Cstring,), pszPath))
end

"""
    VSIGetActualURL(const char * pszFilename) -> const char *

Returns the actual URL of a supplied filename.

### Parameters
* **pszFilename**: the path of the filesystem object. UTF-8 encoded.

### Returns
the actual URL corresponding to the supplied filename, or NULL. Should not be freed.
"""
function vsigetactualurl(pszFilename)
    aftercare(ccall((:VSIGetActualURL, libgdal), Cstring, (Cstring,), pszFilename), false)
end

"""
    VSIGetSignedURL(const char * pszFilename,
                    CSLConstList papszOptions) -> char *

Returns a signed URL of a supplied filename.

### Parameters
* **pszFilename**: the path of the filesystem object. UTF-8 encoded.
* **papszOptions**: list of options, or NULL. Depend on file system handler. For /vsis3/, /vsigs/, /vsiaz/ and /vsioss/, the following options are supported: 

START_DATE=YYMMDDTHHMMSSZ: date and time in UTC following ISO 8601 standard, corresponding to the start of validity of the URL. If not specified, current date time. 


EXPIRATION_DELAY=number_of_seconds: number between 1 and 604800 (seven days) for the validity of the signed URL. Defaults to 3600 (one hour) 


VERB=GET/HEAD/DELETE/PUT/POST: HTTP VERB for which the request will be used. Default to GET.

### Returns
a signed URL, or NULL. Should be freed with CPLFree().
"""
function vsigetsignedurl(pszFilename, papszOptions)
    aftercare(ccall((:VSIGetSignedURL, libgdal), Cstring, (Cstring, CSLConstList), pszFilename, papszOptions), false)
end

"""
    VSIGetFileSystemOptions(const char * pszFilename) -> const char *

Return the list of options associated with a virtual file system handler as a serialized XML string.

### Parameters
* **pszFilename**: a filename, or prefix of a virtual file system handler.

### Returns
a string, which must not be freed, or NULL if no options is declared.
"""
function vsigetfilesystemoptions(pszFilename)
    aftercare(ccall((:VSIGetFileSystemOptions, libgdal), Cstring, (Cstring,), pszFilename), false)
end

"""
    VSIGetFileSystemsPrefixes(void) -> char **

Return the list of prefixes for virtual file system handlers currently registered.

### Returns
a NULL terminated list of prefixes. Must be freed with CSLDestroy()
"""
function vsigetfilesystemsprefixes()
    aftercare(ccall((:VSIGetFileSystemsPrefixes, libgdal), Ptr{Cstring}, ()))
end

"""
    VSIFGetNativeFileDescriptorL(VSILFILE * fp) -> void *

Returns the "native" file descriptor for the virtual handle.

### Parameters
* **fp**: file handle opened with VSIFOpenL().

### Returns
the native file descriptor, or NULL.
"""
function vsifgetnativefiledescriptorl(arg1)
    aftercare(ccall((:VSIFGetNativeFileDescriptorL, libgdal), Ptr{Cvoid}, (Ptr{VSILFILE},), arg1))
end

"""
    VSIGetFileMetadata(const char * pszFilename,
                       const char * pszDomain,
                       CSLConstList papszOptions) -> char **

Get metadata on files.

### Parameters
* **pszFilename**: the path of the filesystem object to be queried. UTF-8 encoded.
* **pszDomain**: Metadata domain to query. Depends on the file system. The following are supported: 

HEADERS: to get HTTP headers for network-like filesystems (/vsicurl/, /vsis3/, etc) 


TAGS: 

/vsis3/: to get S3 Object tagging information 


/vsiaz/: to get blob tags. Refer to https://docs.microsoft.com/en-us/rest/api/storageservices/get-blob-tags 





STATUS: specific to /vsiadls/: returns all system defined properties for a path (seems in practice to be a subset of HEADERS) 


ACL: specific to /vsiadls/: returns the access control list for a path. 


METADATA: specific to /vsiaz/: to set blob metadata. Refer to https://docs.microsoft.com/en-us/rest/api/storageservices/get-blob-metadata. Note: this will be a subset of what pszDomain=HEADERS returns
* **papszOptions**: Unused. Should be set to NULL.

### Returns
a NULL-terminated list of key=value strings, to be freed with CSLDestroy() or NULL in case of error / empty list.
"""
function vsigetfilemetadata(pszFilename, pszDomain, papszOptions)
    aftercare(ccall((:VSIGetFileMetadata, libgdal), Ptr{Cstring}, (Cstring, Cstring, CSLConstList), pszFilename, pszDomain, papszOptions))
end

"""
    VSISetFileMetadata(const char * pszFilename,
                       CSLConstList papszMetadata,
                       const char * pszDomain,
                       CSLConstList papszOptions) -> int

Set metadata on files.

### Parameters
* **pszFilename**: the path of the filesystem object to be set. UTF-8 encoded.
* **papszMetadata**: NULL-terminated list of key=value strings.
* **pszDomain**: Metadata domain to set. Depends on the file system. The following are supported: 

HEADERS: specific to /vsis3/: to set HTTP headers 


TAGS: Content of papszMetadata should be KEY=VALUE pairs. 

/vsis3/: to set S3 Object tagging information 


/vsiaz/: to set blob tags. Refer to https://docs.microsoft.com/en-us/rest/api/storageservices/set-blob-tags. Note: storageV2 must be enabled on the account 





PROPERTIES: 

to /vsiaz/: to set properties. Refer to https://docs.microsoft.com/en-us/rest/api/storageservices/set-blob-properties. 


to /vsiadls/: to set properties. Refer to https://docs.microsoft.com/en-us/rest/api/storageservices/datalakestoragegen2/path/update for headers valid for action=setProperties. 





ACL: specific to /vsiadls/: to set access control list. Refer to https://docs.microsoft.com/en-us/rest/api/storageservices/datalakestoragegen2/path/update for headers valid for action=setAccessControl or setAccessControlRecursive. In setAccessControlRecursive, x-ms-acl must be specified in papszMetadata 


METADATA: specific to /vsiaz/: to set blob metadata. Refer to https://docs.microsoft.com/en-us/rest/api/storageservices/set-blob-metadata. Content of papszMetadata should be strings in the form x-ms-meta-name=value
* **papszOptions**: NULL or NULL terminated list of options. For /vsiadls/ and pszDomain=ACL, "RECURSIVE=TRUE" can be set to set the access control list recursively. When RECURSIVE=TRUE is set, MODE should also be set to one of "set", "modify" or "remove".

### Returns
TRUE in case of success.
"""
function vsisetfilemetadata(pszFilename, papszMetadata, pszDomain, papszOptions)
    aftercare(ccall((:VSISetFileMetadata, libgdal), Cint, (Cstring, CSLConstList, Cstring, CSLConstList), pszFilename, papszMetadata, pszDomain, papszOptions))
end

"""
    VSICalloc(size_t nCount,
              size_t nSize) -> void *

Analog of calloc().
"""
function vsicalloc(arg1, arg2)
    aftercare(ccall((:VSICalloc, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), arg1, arg2))
end

"""
    VSIMalloc(size_t nSize) -> void *

Analog of malloc().
"""
function vsimalloc(arg1)
    aftercare(ccall((:VSIMalloc, libgdal), Ptr{Cvoid}, (Csize_t,), arg1))
end

"""
    VSIFree(void * pData) -> void

Analog of free() for data allocated with VSIMalloc(), VSICalloc(), VSIRealloc()
"""
function vsifree(arg1)
    aftercare(ccall((:VSIFree, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

"""
    VSIRealloc(void * pData,
               size_t nNewSize) -> void *

Analog of realloc().
"""
function vsirealloc(arg1, arg2)
    aftercare(ccall((:VSIRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t), arg1, arg2))
end

"""
    VSIStrdup(const char * pszString) -> char *

Analog of strdup().
"""
function vsistrdup(arg1)
    aftercare(ccall((:VSIStrdup, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    VSIMallocAligned(size_t nAlignment,
                     size_t nSize) -> void *

Allocates a buffer with an alignment constraint.

### Parameters
* **nAlignment**: Must be a power of 2, multiple of sizeof(void*), and lesser than 256.
* **nSize**: Size of the buffer to allocate.

### Returns
a buffer aligned on nAlignment and of size nSize, or NULL
"""
function vsimallocaligned(nAlignment, nSize)
    aftercare(ccall((:VSIMallocAligned, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), nAlignment, nSize))
end

"""
    VSIMallocAlignedAuto(size_t nSize) -> void *

Allocates a buffer with an alignment constraint such that it can be used by the most demanding vector instruction set on that platform.

### Parameters
* **nSize**: Size of the buffer to allocate.

### Returns
an aligned buffer of size nSize, or NULL
"""
function vsimallocalignedauto(nSize)
    aftercare(ccall((:VSIMallocAlignedAuto, libgdal), Ptr{Cvoid}, (Csize_t,), nSize))
end

"""
    VSIFreeAligned(void * ptr) -> void

Free a buffer allocated with VSIMallocAligned().

### Parameters
* **ptr**: Buffer to free.
"""
function vsifreealigned(ptr)
    aftercare(ccall((:VSIFreeAligned, libgdal), Cvoid, (Ptr{Cvoid},), ptr))
end

"""
    VSIMallocAlignedAutoVerbose(size_t nSize,
                                const char * pszFile,
                                int nLine) -> void *

See VSIMallocAlignedAuto()
"""
function vsimallocalignedautoverbose(nSize, pszFile, nLine)
    aftercare(ccall((:VSIMallocAlignedAutoVerbose, libgdal), Ptr{Cvoid}, (Csize_t, Cstring, Cint), nSize, pszFile, nLine))
end

"""
    vsimalloc2(nSize1, nSize2)

[`VSIMalloc2`](@ref) allocates (nSize1 * nSize2) bytes. In case of overflow of the multiplication, or if memory allocation fails, a NULL pointer is returned and a CE\\_Failure error is raised with [`CPLError`](@ref)(). If nSize1 == 0 || nSize2 == 0, a NULL pointer will also be returned. [`CPLFree`](@ref)() or [`VSIFree`](@ref)() can be used to free memory allocated by this function.
"""
function vsimalloc2(nSize1, nSize2)
    aftercare(ccall((:VSIMalloc2, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), nSize1, nSize2))
end

"""
    vsimalloc3(nSize1, nSize2, nSize3)

[`VSIMalloc3`](@ref) allocates (nSize1 * nSize2 * nSize3) bytes. In case of overflow of the multiplication, or if memory allocation fails, a NULL pointer is returned and a CE\\_Failure error is raised with [`CPLError`](@ref)(). If nSize1 == 0 || nSize2 == 0 || nSize3 == 0, a NULL pointer will also be returned. [`CPLFree`](@ref)() or [`VSIFree`](@ref)() can be used to free memory allocated by this function.
"""
function vsimalloc3(nSize1, nSize2, nSize3)
    aftercare(ccall((:VSIMalloc3, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t, Csize_t), nSize1, nSize2, nSize3))
end

"""
    vsimallocverbose(nSize, pszFile, nLine)

[`VSIMallocVerbose`](@ref) 
"""
function vsimallocverbose(nSize, pszFile, nLine)
    aftercare(ccall((:VSIMallocVerbose, libgdal), Ptr{Cvoid}, (Csize_t, Cstring, Cint), nSize, pszFile, nLine))
end

"""
    vsimalloc2verbose(nSize1, nSize2, pszFile, nLine)

[`VSIMalloc2Verbose`](@ref) 
"""
function vsimalloc2verbose(nSize1, nSize2, pszFile, nLine)
    aftercare(ccall((:VSIMalloc2Verbose, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t, Cstring, Cint), nSize1, nSize2, pszFile, nLine))
end

"""
    vsimalloc3verbose(nSize1, nSize2, nSize3, pszFile, nLine)

[`VSIMalloc3Verbose`](@ref) 
"""
function vsimalloc3verbose(nSize1, nSize2, nSize3, pszFile, nLine)
    aftercare(ccall((:VSIMalloc3Verbose, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t, Csize_t, Cstring, Cint), nSize1, nSize2, nSize3, pszFile, nLine))
end

"""
    vsicallocverbose(nCount, nSize, pszFile, nLine)

[`VSICallocVerbose`](@ref) 
"""
function vsicallocverbose(nCount, nSize, pszFile, nLine)
    aftercare(ccall((:VSICallocVerbose, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t, Cstring, Cint), nCount, nSize, pszFile, nLine))
end

"""
    vsireallocverbose(pOldPtr, nNewSize, pszFile, nLine)

[`VSIReallocVerbose`](@ref) 
"""
function vsireallocverbose(pOldPtr, nNewSize, pszFile, nLine)
    aftercare(ccall((:VSIReallocVerbose, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Cstring, Cint), pOldPtr, nNewSize, pszFile, nLine))
end

"""
    vsistrdupverbose(pszStr, pszFile, nLine)

[`VSIStrdupVerbose`](@ref) 
"""
function vsistrdupverbose(pszStr, pszFile, nLine)
    aftercare(ccall((:VSIStrdupVerbose, libgdal), Cstring, (Cstring, Cstring, Cint), pszStr, pszFile, nLine), false)
end

"""
    CPLGetPhysicalRAM(void) -> GIntBig

Return the total physical RAM in bytes.

### Returns
the total physical RAM in bytes (or 0 in case of failure).
"""
function cplgetphysicalram()
    aftercare(ccall((:CPLGetPhysicalRAM, libgdal), GIntBig, ()))
end

"""
    CPLGetUsablePhysicalRAM(void) -> GIntBig

Return the total physical RAM, usable by a process, in bytes.

### Returns
the total physical RAM, usable by a process, in bytes (or 0 in case of failure).
"""
function cplgetusablephysicalram()
    aftercare(ccall((:CPLGetUsablePhysicalRAM, libgdal), GIntBig, ()))
end

"""
    VSIReadDir(const char * pszPath) -> char **

Read names in a directory.

### Parameters
* **pszPath**: the relative, or absolute path of a directory to read. UTF-8 encoded.

### Returns
The list of entries in the directory, or NULL if the directory doesn't exist. Filenames are returned in UTF-8 encoding.
"""
function vsireaddir(arg1)
    aftercare(ccall((:VSIReadDir, libgdal), Ptr{Cstring}, (Cstring,), arg1))
end

"""
    VSIReadDirRecursive(const char * pszPathIn) -> char **

Read names in a directory recursively.

### Parameters
* **pszPathIn**: the relative, or absolute path of a directory to read. UTF-8 encoded.

### Returns
The list of entries in the directory and subdirectories or NULL if the directory doesn't exist. Filenames are returned in UTF-8 encoding.
"""
function vsireaddirrecursive(pszPath)
    aftercare(ccall((:VSIReadDirRecursive, libgdal), Ptr{Cstring}, (Cstring,), pszPath))
end

"""
    VSIReadDirEx(const char * pszPath,
                 int nMaxFiles) -> char **

Read names in a directory.

### Parameters
* **pszPath**: the relative, or absolute path of a directory to read. UTF-8 encoded.
* **nMaxFiles**: maximum number of files after which to stop, or 0 for no limit.

### Returns
The list of entries in the directory, or NULL if the directory doesn't exist. Filenames are returned in UTF-8 encoding.
"""
function vsireaddirex(pszPath, nMaxFiles)
    aftercare(ccall((:VSIReadDirEx, libgdal), Ptr{Cstring}, (Cstring, Cint), pszPath, nMaxFiles))
end

"""
    VSISiblingFiles(const char * pszFilename) -> char **

Return related filenames.

### Parameters
* **pszFilename**: the path of a filename to inspect UTF-8 encoded.

### Returns
The list of entries, relative to the directory, of all sidecar files available or NULL if the list is not known. Filenames are returned in UTF-8 encoding. Most implementations will return NULL, and a subsequent ReadDir will list all files available in the file's directory. This function will be overridden by VSI FilesystemHandlers that wish to force e.g. an empty list to avoid opening non-existent files on slow filesystems. The return value shall be destroyed with CSLDestroy()
"""
function vsisiblingfiles(pszPath)
    aftercare(ccall((:VSISiblingFiles, libgdal), Ptr{Cstring}, (Cstring,), pszPath))
end

mutable struct VSIDIR
end

"""
    VSIOpenDir(const char * pszPath,
               int nRecurseDepth,
               const char *const * papszOptions) -> VSIDIR *

Open a directory to read its entries.

### Parameters
* **pszPath**: the relative, or absolute path of a directory to read. UTF-8 encoded.
* **nRecurseDepth**: 0 means do not recurse in subdirectories, 1 means recurse only in the first level of subdirectories, etc. -1 means unlimited recursion level
* **papszOptions**: NULL terminated list of options, or NULL.

### Returns
a handle, or NULL in case of error
"""
function vsiopendir(pszPath, nRecurseDepth, papszOptions)
    aftercare(ccall((:VSIOpenDir, libgdal), Ptr{VSIDIR}, (Cstring, Cint, Ptr{Cstring}), pszPath, nRecurseDepth, papszOptions))
end

"""
    VSIDIREntry

Directory entry. 

| Field       | Note                                                           |
| :---------- | :------------------------------------------------------------- |
| pszName     | Filename                                                       |
| nMode       | File mode. See [`VSI_ISREG`](@ref)() / [`VSI_ISDIR`](@ref)()   |
| nSize       | File size                                                      |
| nMTime      | Last modification time (seconds since 1970/01/01)              |
| bModeKnown  | Whether nMode is known: 0 = unknown, 1 = known.                |
| bSizeKnown  | Whether nSize is known: 0 = unknown, 1 = known.                |
| bMTimeKnown | Whether nMTime is known: 0 = unknown, 1 = known.               |
| papszExtra  | NULL-terminated list of extra properties.                      |
"""
struct VSIDIREntry
    pszName::Cstring
    nMode::Cint
    nSize::vsi_l_offset
    nMTime::GIntBig
    bModeKnown::Cchar
    bSizeKnown::Cchar
    bMTimeKnown::Cchar
    papszExtra::Ptr{Cstring}
end

"""
    VSIGetNextDirEntry(VSIDIR * dir) -> const VSIDIREntry *

Return the next entry of the directory.

### Parameters
* **dir**: Directory handled returned by VSIOpenDir(). Must not be NULL.

### Returns
a entry, or NULL if there is no more entry in the directory. This return value must not be freed.
"""
function vsigetnextdirentry(dir)
    aftercare(ccall((:VSIGetNextDirEntry, libgdal), Ptr{VSIDIREntry}, (Ptr{VSIDIR},), dir))
end

"""
    VSICloseDir(VSIDIR * dir) -> void

Close a directory.

### Parameters
* **dir**: Directory handled returned by VSIOpenDir().
"""
function vsiclosedir(dir)
    aftercare(ccall((:VSICloseDir, libgdal), Cvoid, (Ptr{VSIDIR},), dir))
end

"""
    VSIMkdir(const char * pszPathname,
             long mode) -> int

Create a directory.

### Parameters
* **pszPathname**: the path to the directory to create. UTF-8 encoded.
* **mode**: the permissions mode.

### Returns
0 on success or -1 on an error.
"""
function vsimkdir(pszPathname, mode)
    aftercare(ccall((:VSIMkdir, libgdal), Cint, (Cstring, Clong), pszPathname, mode))
end

"""
    VSIMkdirRecursive(const char * pszPathname,
                      long mode) -> int

Create a directory and all its ancestors.

### Parameters
* **pszPathname**: the path to the directory to create. UTF-8 encoded.
* **mode**: the permissions mode.

### Returns
0 on success or -1 on an error.
"""
function vsimkdirrecursive(pszPathname, mode)
    aftercare(ccall((:VSIMkdirRecursive, libgdal), Cint, (Cstring, Clong), pszPathname, mode))
end

"""
    VSIRmdir(const char * pszDirname) -> int

Delete a directory.

### Parameters
* **pszDirname**: the path of the directory to be deleted. UTF-8 encoded.

### Returns
0 on success or -1 on an error.
"""
function vsirmdir(pszDirname)
    aftercare(ccall((:VSIRmdir, libgdal), Cint, (Cstring,), pszDirname))
end

"""
    VSIRmdirRecursive(const char * pszDirname) -> int

Delete a directory recursively.

### Returns
0 on success or -1 on an error.
"""
function vsirmdirrecursive(pszDirname)
    aftercare(ccall((:VSIRmdirRecursive, libgdal), Cint, (Cstring,), pszDirname))
end

"""
    VSIUnlink(const char * pszFilename) -> int

Delete a file.

### Parameters
* **pszFilename**: the path of the file to be deleted. UTF-8 encoded.

### Returns
0 on success or -1 on an error.
"""
function vsiunlink(pszFilename)
    aftercare(ccall((:VSIUnlink, libgdal), Cint, (Cstring,), pszFilename))
end

"""
    VSIUnlinkBatch(CSLConstList papszFiles) -> int *

Delete several files, possibly in a batch.

### Parameters
* **papszFiles**: NULL terminated list of files. UTF-8 encoded.

### Returns
an array of size CSLCount(papszFiles), whose values are TRUE or FALSE depending on the success of deletion of the corresponding file. The array should be freed with VSIFree(). NULL might be return in case of a more general error (for example, files belonging to different file system handlers)
"""
function vsiunlinkbatch(papszFiles)
    aftercare(ccall((:VSIUnlinkBatch, libgdal), Ptr{Cint}, (CSLConstList,), papszFiles))
end

"""
    VSIRename(const char * oldpath,
              const char * newpath) -> int

Rename a file.

### Parameters
* **oldpath**: the name of the file to be renamed. UTF-8 encoded.
* **newpath**: the name the file should be given. UTF-8 encoded.

### Returns
0 on success or -1 on an error.
"""
function vsirename(oldpath, newpath)
    aftercare(ccall((:VSIRename, libgdal), Cint, (Cstring, Cstring), oldpath, newpath))
end

"""
    VSISync(const char * pszSource,
            const char * pszTarget,
            const char *const * papszOptions,
            GDALProgressFunc pProgressFunc,
            void * pProgressData,
            char *** ppapszOutputs) -> int

Synchronize a source file/directory with a target file/directory.

### Parameters
* **pszSource**: Source file or directory. UTF-8 encoded.
* **pszTarget**: Target file or directory. UTF-8 encoded.
* **papszOptions**: Null terminated list of options, or NULL. Currently accepted options are: 

RECURSIVE=NO (the default is YES) 


SYNC_STRATEGY=TIMESTAMP/ETAG/OVERWRITE. Determines which criterion is used to determine if a target file must be replaced when it already exists and has the same file size as the source. Only applies for a source or target being a network filesystem.
The default is TIMESTAMP (similarly to how 'aws s3 sync' works), that is to say that for an upload operation, a remote file is replaced if it has a different size or if it is older than the source. For a download operation, a local file is replaced if it has a different size or if it is newer than the remote file.
The ETAG strategy assumes that the ETag metadata of the remote file is the MD5Sum of the file content, which is only true in the case of /vsis3/ for files not using KMS server side encryption and uploaded in a single PUT operation (so smaller than 50 MB given the default used by GDAL). Only to be used for /vsis3/, /vsigs/ or other filesystems using a MD5Sum as ETAG.
The OVERWRITE strategy (GDAL >= 3.2) will always overwrite the target file with the source one.  


NUM_THREADS=integer. (GDAL >= 3.1) Number of threads to use for parallel file copying. Only use for when /vsis3/, /vsigs/, /vsiaz/ or /vsiadls/ is in source or target. The default is 10 since GDAL 3.3 


CHUNK_SIZE=integer. (GDAL >= 3.1) Maximum size of chunk (in bytes) to use to split large objects when downloading them from /vsis3/, /vsigs/, /vsiaz/ or /vsiadls/ to local file system, or for upload to /vsis3/, /vsiaz/ or /vsiadls/ from local file system. Only used if NUM_THREADS > 1. For upload to /vsis3/, this chunk size must be set at least to 5 MB. The default is 8 MB since GDAL 3.3
* **pProgressFunc**: Progress callback, or NULL.
* **pProgressData**: User data of progress callback, or NULL.
* **ppapszOutputs**: Unused. Should be set to NULL for now.

### Returns
TRUE on success or FALSE on an error.
"""
function vsisync(pszSource, pszTarget, papszOptions, pProgressFunc, pProgressData, ppapszOutputs)
    aftercare(ccall((:VSISync, libgdal), Cint, (Cstring, Cstring, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}, Ptr{Ptr{Cstring}}), pszSource, pszTarget, papszOptions, pProgressFunc, pProgressData, ppapszOutputs))
end

"""
    VSIStrerror(int nErrno) -> char *

Return the error string corresponding to the error number.
"""
function vsistrerror(arg1)
    aftercare(ccall((:VSIStrerror, libgdal), Cstring, (Cint,), arg1), false)
end

"""
    VSIGetDiskFreeSpace(const char * pszDirname) -> GIntBig

Return free disk space available on the filesystem.

### Parameters
* **pszDirname**: a directory of the filesystem to query.

### Returns
The free space in bytes. Or -1 in case of error.
"""
function vsigetdiskfreespace(pszDirname)
    aftercare(ccall((:VSIGetDiskFreeSpace, libgdal), GIntBig, (Cstring,), pszDirname))
end

"""
    VSINetworkStatsReset(void) -> void

Clear network related statistics.
"""
function vsinetworkstatsreset()
    aftercare(ccall((:VSINetworkStatsReset, libgdal), Cvoid, ()))
end

"""
    VSINetworkStatsGetAsSerializedJSON(char ** papszOptions) -> char *

Return network related statistics, as a JSON serialized object.

### Parameters
* **papszOptions**: Unused.

### Returns
a JSON serialized string to free with VSIFree(), or nullptr
"""
function vsinetworkstatsgetasserializedjson(papszOptions)
    aftercare(ccall((:VSINetworkStatsGetAsSerializedJSON, libgdal), Cstring, (Ptr{Cstring},), papszOptions), false)
end

"""
    VSIInstallMemFileHandler() -> void

Install "memory" file system handler.
"""
function vsiinstallmemfilehandler()
    aftercare(ccall((:VSIInstallMemFileHandler, libgdal), Cvoid, ()))
end

"""
    vsiinstalllargefilehandler()

Doxygen\\_Suppress 
"""
function vsiinstalllargefilehandler()
    aftercare(ccall((:VSIInstallLargeFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallSubFileHandler() -> void

Install /vsisubfile/ virtual file handler.
"""
function vsiinstallsubfilehandler()
    aftercare(ccall((:VSIInstallSubFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallCurlFileHandler(void) -> void

Install /vsicurl/ HTTP/FTP file system handler (requires libcurl)
"""
function vsiinstallcurlfilehandler()
    aftercare(ccall((:VSIInstallCurlFileHandler, libgdal), Cvoid, ()))
end

"""
    VSICurlClearCache(void) -> void

Clean local cache associated with /vsicurl/ (and related file systems)
"""
function vsicurlclearcache()
    aftercare(ccall((:VSICurlClearCache, libgdal), Cvoid, ()))
end

"""
    VSICurlPartialClearCache(const char * pszFilenamePrefix) -> void

Clean local cache associated with /vsicurl/ (and related file systems) for a given filename (and its subfiles and subdirectories if it is a directory)

### Parameters
* **pszFilenamePrefix**: Filename prefix
"""
function vsicurlpartialclearcache(pszFilenamePrefix)
    aftercare(ccall((:VSICurlPartialClearCache, libgdal), Cvoid, (Cstring,), pszFilenamePrefix))
end

"""
    VSIInstallCurlStreamingFileHandler(void) -> void

Install /vsicurl_streaming/ HTTP/FTP file system handler (requires libcurl).
"""
function vsiinstallcurlstreamingfilehandler()
    aftercare(ccall((:VSIInstallCurlStreamingFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallS3FileHandler(void) -> void

Install /vsis3/ Amazon S3 file system handler (requires libcurl)
"""
function vsiinstalls3filehandler()
    aftercare(ccall((:VSIInstallS3FileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallS3StreamingFileHandler(void) -> void

Install /vsis3_streaming/ Amazon S3 file system handler (requires libcurl).
"""
function vsiinstalls3streamingfilehandler()
    aftercare(ccall((:VSIInstallS3StreamingFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallGSFileHandler(void) -> void

Install /vsigs/ Google Cloud Storage file system handler (requires libcurl)
"""
function vsiinstallgsfilehandler()
    aftercare(ccall((:VSIInstallGSFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallGSStreamingFileHandler(void) -> void

Install /vsigs_streaming/ Google Cloud Storage file system handler (requires libcurl)
"""
function vsiinstallgsstreamingfilehandler()
    aftercare(ccall((:VSIInstallGSStreamingFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallAzureFileHandler(void) -> void

Install /vsiaz/ Microsoft Azure Blob file system handler (requires libcurl)
"""
function vsiinstallazurefilehandler()
    aftercare(ccall((:VSIInstallAzureFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallAzureStreamingFileHandler(void) -> void

Install /vsiaz_streaming/ Microsoft Azure Blob file system handler (requires libcurl)
"""
function vsiinstallazurestreamingfilehandler()
    aftercare(ccall((:VSIInstallAzureStreamingFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallOSSFileHandler(void) -> void

Install /vsioss/ Alibaba Cloud Object Storage Service (OSS) file system handler (requires libcurl)
"""
function vsiinstallossfilehandler()
    aftercare(ccall((:VSIInstallOSSFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallOSSStreamingFileHandler(void) -> void

Install /vsioss_streaming/ Alibaba Cloud Object Storage Service (OSS) file system handler (requires libcurl)
"""
function vsiinstallossstreamingfilehandler()
    aftercare(ccall((:VSIInstallOSSStreamingFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallSwiftFileHandler(void) -> void

Install /vsiswift/ OpenStack Swif Object Storage (Swift) file system handler (requires libcurl)
"""
function vsiinstallswiftfilehandler()
    aftercare(ccall((:VSIInstallSwiftFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallSwiftStreamingFileHandler(void) -> void

Install /vsiswift_streamin/ OpenStack Swif Object Storage (Swift) file system handler (requires libcurl)
"""
function vsiinstallswiftstreamingfilehandler()
    aftercare(ccall((:VSIInstallSwiftStreamingFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallGZipFileHandler() -> void

Install GZip file system handler.
"""
function vsiinstallgzipfilehandler()
    aftercare(ccall((:VSIInstallGZipFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallZipFileHandler() -> void

Install ZIP file system handler.
"""
function vsiinstallzipfilehandler()
    aftercare(ccall((:VSIInstallZipFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallStdinHandler() -> void

Install /vsistdin/ file system handler.
"""
function vsiinstallstdinhandler()
    aftercare(ccall((:VSIInstallStdinHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallHdfsHandler() -> void

Install /vsihdfs/ file system handler (requires JVM and HDFS support)
"""
function vsiinstallhdfshandler()
    aftercare(ccall((:VSIInstallHdfsHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallWebHdfsHandler(void) -> void

Install /vsiwebhdfs/ WebHDFS (Hadoop File System) REST API file system handler (requires libcurl)
"""
function vsiinstallwebhdfshandler()
    aftercare(ccall((:VSIInstallWebHdfsHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallStdoutHandler() -> void

Install /vsistdout/ file system handler.
"""
function vsiinstallstdouthandler()
    aftercare(ccall((:VSIInstallStdoutHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallSparseFileHandler() -> void

Install /vsisparse/ virtual file handler.
"""
function vsiinstallsparsefilehandler()
    aftercare(ccall((:VSIInstallSparseFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallTarFileHandler(void) -> void

Install /vsitar/ file system handler.
"""
function vsiinstalltarfilehandler()
    aftercare(ccall((:VSIInstallTarFileHandler, libgdal), Cvoid, ()))
end

"""
    VSIInstallCryptFileHandler() -> void

Install /vsicrypt/ encrypted file system handler (requires libcrypto++)
"""
function vsiinstallcryptfilehandler()
    aftercare(ccall((:VSIInstallCryptFileHandler, libgdal), Cvoid, ()))
end

"""
    VSISetCryptKey(const GByte * pabyKey,
                   int nKeySize) -> void

Installs the encryption/decryption key.

### Parameters
* **pabyKey**: key. Might be NULL to clear previously set key.
* **nKeySize**: length of the key in bytes. Might be 0 to clear previously set key.
"""
function vsisetcryptkey(pabyKey, nKeySize)
    aftercare(ccall((:VSISetCryptKey, libgdal), Cvoid, (Ptr{GByte}, Cint), pabyKey, nKeySize))
end

"""
    vsicleanupfilemanager()

Doxygen\\_Suppress 
"""
function vsicleanupfilemanager()
    aftercare(ccall((:VSICleanupFileManager, libgdal), Cvoid, ()))
end

"""
    VSIFileFromMemBuffer(const char * pszFilename,
                         GByte * pabyData,
                         vsi_l_offset nDataLength,
                         int bTakeOwnership) -> VSILFILE *

Create memory "file" from a buffer.

### Parameters
* **pszFilename**: the filename to be created.
* **pabyData**: the data buffer for the file.
* **nDataLength**: the length of buffer in bytes.
* **bTakeOwnership**: TRUE to transfer "ownership" of buffer or FALSE.

### Returns
open file handle on created file (see VSIFOpenL()).
"""
function vsifilefrommembuffer(pszFilename, pabyData, nDataLength, bTakeOwnership)
    aftercare(ccall((:VSIFileFromMemBuffer, libgdal), Ptr{VSILFILE}, (Cstring, Ptr{GByte}, vsi_l_offset, Cint), pszFilename, pabyData, nDataLength, bTakeOwnership))
end

"""
    VSIGetMemFileBuffer(const char * pszFilename,
                        vsi_l_offset * pnDataLength,
                        int bUnlinkAndSeize) -> GByte *

Fetch buffer underlying memory file.

### Parameters
* **pszFilename**: the name of the file to grab the buffer of.
* **pnDataLength**: (file) length returned in this variable.
* **bUnlinkAndSeize**: TRUE to remove the file, or FALSE to leave unaltered.

### Returns
pointer to memory buffer or NULL on failure.
"""
function vsigetmemfilebuffer(pszFilename, pnDataLength, bUnlinkAndSeize)
    aftercare(ccall((:VSIGetMemFileBuffer, libgdal), Ptr{GByte}, (Cstring, Ptr{vsi_l_offset}, Cint), pszFilename, pnDataLength, bUnlinkAndSeize))
end

"Callback used by [`VSIStdoutSetRedirection`](@ref)() "
const VSIWriteFunction = Ptr{Cvoid}

"""
    VSIStdoutSetRedirection(VSIWriteFunction pFct,
                            FILE * stream) -> void

Set an alternative write function and output file handle instead of fwrite() / stdout.

### Parameters
* **pFct**: Function with same signature as fwrite()
* **stream**: File handle on which to output. Passed to pFct.
"""
function vsistdoutsetredirection(pFct, stream)
    aftercare(ccall((:VSIStdoutSetRedirection, libgdal), Cvoid, (VSIWriteFunction, Ptr{Libc.FILE}), pFct, stream))
end

"""
Return information about a handle. Optional (driver dependent)  

\\since GDAL 3.0
"""
const VSIFilesystemPluginStatCallback = Ptr{Cvoid}

"""
Remove handle by name. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginUnlinkCallback = Ptr{Cvoid}

"""
Rename handle. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginRenameCallback = Ptr{Cvoid}

"""
Create Directory. Optional 

\\since GDAL 3.0
"""
const VSIFilesystemPluginMkdirCallback = Ptr{Cvoid}

"""
Delete Directory. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginRmdirCallback = Ptr{Cvoid}

"""
List directory content. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginReadDirCallback = Ptr{Cvoid}

"""
List related files. Must return NULL if unknown, or a list of relative filenames that can be opened along the main file. If no other file than pszFilename needs to be opened, return static\\_cast<char**> ([`CPLCalloc`](@ref)(1,sizeof(char*)));

Optional 

\\since GDAL 3.2
"""
const VSIFilesystemPluginSiblingFilesCallback = Ptr{Cvoid}

"""
Open a handle. Mandatory. Returns an opaque pointer that will be used in subsequent file I/O calls. Should return null and/or set errno if the handle does not exist or the access mode is incorrect. 

\\since GDAL 3.0
"""
const VSIFilesystemPluginOpenCallback = Ptr{Cvoid}

"""
Return current position in handle. Mandatory  

\\since GDAL 3.0
"""
const VSIFilesystemPluginTellCallback = Ptr{Cvoid}

"""
Seek to position in handle. Mandatory except for write only handles  

\\since GDAL 3.0
"""
const VSIFilesystemPluginSeekCallback = Ptr{Cvoid}

"""
Read data from current position, returns the number of blocks correctly read. Mandatory except for write only handles 

\\since GDAL 3.0
"""
const VSIFilesystemPluginReadCallback = Ptr{Cvoid}

"""
Read from multiple offsets. Optional, will be replaced by multiple calls to Read() if not provided  

\\since GDAL 3.0
"""
const VSIFilesystemPluginReadMultiRangeCallback = Ptr{Cvoid}

"""
Get empty ranges. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginGetRangeStatusCallback = Ptr{Cvoid}

"""
Has end of file been reached. Mandatory? for read handles.  

\\since GDAL 3.0
"""
const VSIFilesystemPluginEofCallback = Ptr{Cvoid}

"""
Write bytes at current offset. Mandatory for writable handles  

\\since GDAL 3.0
"""
const VSIFilesystemPluginWriteCallback = Ptr{Cvoid}

"""
Sync written bytes. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginFlushCallback = Ptr{Cvoid}

"Truncate handle. Mandatory (driver dependent?) for write handles "
const VSIFilesystemPluginTruncateCallback = Ptr{Cvoid}

"""
Close file handle. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginCloseCallback = Ptr{Cvoid}

"""
    VSIFilesystemPluginCallbacksStruct

struct containing callbacks to used by the handler. (rw), (r), (w) or () at the end indicate whether the given callback is mandatory for reading and or writing handlers. A (?) indicates that the callback might be mandatory for certain drivers only. 

\\since GDAL 3.0

| Field                | Note                                                                                   |
| :------------------- | :------------------------------------------------------------------------------------- |
| pUserData            | Optional opaque pointer passed back to filemanager callbacks (e.g. open, stat, rmdir)  |
| stat                 | stat handle by name (rw)                                                               |
| unlink               | unlink handle by name ()                                                               |
| rename               | rename handle ()                                                                       |
| mkdir                | make directory ()                                                                      |
| rmdir                | remove directory ()                                                                    |
| read\\_dir           | list directory content (r?)                                                            |
| open                 | open handle by name (rw)                                                               |
| tell                 | get current position of handle (rw)                                                    |
| seek                 | set current position of handle (rw)                                                    |
| read                 | read from current position (r)                                                         |
| read\\_multi\\_range | read multiple blocks ()                                                                |
| get\\_range\\_status | get range status ()                                                                    |
| eof                  | has end of file been reached (r?)                                                      |
| write                | write bytes to current position (w)                                                    |
| flush                | sync bytes (w)                                                                         |
| truncate             | truncate handle (w?)                                                                   |
| close                | close handle (rw)                                                                      |
| nBufferSize          | buffer small reads (makes handler read only)                                           |
| nCacheSize           | max mem to use per file when buffering                                                 |
| sibling\\_files      | list related files                                                                     |
"""
struct VSIFilesystemPluginCallbacksStruct
    pUserData::Ptr{Cvoid}
    stat::VSIFilesystemPluginStatCallback
    unlink::VSIFilesystemPluginUnlinkCallback
    rename::VSIFilesystemPluginRenameCallback
    mkdir::VSIFilesystemPluginMkdirCallback
    rmdir::VSIFilesystemPluginRmdirCallback
    read_dir::VSIFilesystemPluginReadDirCallback
    open::VSIFilesystemPluginOpenCallback
    tell::VSIFilesystemPluginTellCallback
    seek::VSIFilesystemPluginSeekCallback
    read::VSIFilesystemPluginReadCallback
    read_multi_range::VSIFilesystemPluginReadMultiRangeCallback
    get_range_status::VSIFilesystemPluginGetRangeStatusCallback
    eof::VSIFilesystemPluginEofCallback
    write::VSIFilesystemPluginWriteCallback
    flush::VSIFilesystemPluginFlushCallback
    truncate::VSIFilesystemPluginTruncateCallback
    close::VSIFilesystemPluginCloseCallback
    nBufferSize::Csize_t
    nCacheSize::Csize_t
    sibling_files::VSIFilesystemPluginSiblingFilesCallback
end

"""
    vsiallocfilesystemplugincallbacksstruct()

return a [`VSIFilesystemPluginCallbacksStruct`](@ref) to be populated at runtime with handler callbacks  

\\since GDAL 3.0
"""
function vsiallocfilesystemplugincallbacksstruct()
    aftercare(ccall((:VSIAllocFilesystemPluginCallbacksStruct, libgdal), Ptr{VSIFilesystemPluginCallbacksStruct}, ()))
end

"""
    vsifreefilesystemplugincallbacksstruct(poCb)

free resources allocated by [`VSIAllocFilesystemPluginCallbacksStruct`](@ref) 

\\since GDAL 3.0
"""
function vsifreefilesystemplugincallbacksstruct(poCb)
    aftercare(ccall((:VSIFreeFilesystemPluginCallbacksStruct, libgdal), Cvoid, (Ptr{VSIFilesystemPluginCallbacksStruct},), poCb))
end

"""
    vsiinstallpluginhandler(pszPrefix, poCb)

register a handler on the given prefix. All IO on datasets opened with the filename /prefix/xxxxxx will go through these callbacks. pszPrefix must begin and end with a '/' 

\\since GDAL 3.0
"""
function vsiinstallpluginhandler(pszPrefix, poCb)
    aftercare(ccall((:VSIInstallPluginHandler, libgdal), Cint, (Cstring, Ptr{VSIFilesystemPluginCallbacksStruct}), pszPrefix, poCb))
end

"""
    vsitime(arg1)

Doxygen\\_Suppress 
"""
function vsitime(arg1)
    aftercare(ccall((:VSITime, libgdal), Culong, (Ptr{Culong},), arg1))
end

"""
    VSICTime(unsigned long nTime) -> const char *
"""
function vsictime(arg1)
    aftercare(ccall((:VSICTime, libgdal), Cstring, (Culong,), arg1), false)
end

"""
    VSIGMTime(const time_t * pnTime,
              struct tm * poBrokenTime) -> struct tm *
"""
function vsigmtime(pnTime, poBrokenTime)
    aftercare(ccall((:VSIGMTime, libgdal), Ptr{tm}, (Ptr{time_t}, Ptr{tm}), pnTime, poBrokenTime))
end

"""
    VSILocalTime(const time_t * pnTime,
                 struct tm * poBrokenTime) -> struct tm *
"""
function vsilocaltime(pnTime, poBrokenTime)
    aftercare(ccall((:VSILocalTime, libgdal), Ptr{tm}, (Ptr{time_t}, Ptr{tm}), pnTime, poBrokenTime))
end

"""
    GDALDataType

Pixel data types 

| Enumerator      | Note                              |
| :-------------- | :-------------------------------- |
| GDT\\_Unknown   | Unknown or unspecified type       |
| GDT\\_Byte      | Eight bit unsigned integer        |
| GDT\\_UInt16    | Sixteen bit unsigned integer      |
| GDT\\_Int16     | Sixteen bit signed integer        |
| GDT\\_UInt32    | Thirty two bit unsigned integer   |
| GDT\\_Int32     | Thirty two bit signed integer     |
| GDT\\_Float32   | Thirty two bit floating point     |
| GDT\\_Float64   | Sixty four bit floating point     |
| GDT\\_CInt16    | Complex Int16                     |
| GDT\\_CInt32    | Complex Int32                     |
| GDT\\_CFloat32  | Complex Float32                   |
| GDT\\_CFloat64  | Complex Float64                   |
| GDT\\_TypeCount |                                   |
"""
@cenum GDALDataType::UInt32 begin
        GDT_Unknown = 0
        GDT_Byte = 1
        GDT_UInt16 = 2
        GDT_Int16 = 3
        GDT_UInt32 = 4
        GDT_Int32 = 5
        GDT_Float32 = 6
        GDT_Float64 = 7
        GDT_CInt16 = 8
        GDT_CInt32 = 9
        GDT_CFloat32 = 10
        GDT_CFloat64 = 11
        GDT_TypeCount = 12
    end

"""
    GDALGetDataTypeSize(GDALDataType eDataType) -> int

Get data type size in bits.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bits or zero if it is not recognised.
"""
function gdalgetdatatypesize(arg1)
    aftercare(ccall((:GDALGetDataTypeSize, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALGetDataTypeSizeBits(GDALDataType eDataType) -> int

Get data type size in bits.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bits or zero if it is not recognised.
"""
function gdalgetdatatypesizebits(eDataType)
    aftercare(ccall((:GDALGetDataTypeSizeBits, libgdal), Cint, (GDALDataType,), eDataType))
end

"""
    GDALGetDataTypeSizeBytes(GDALDataType eDataType) -> int

Get data type size in bytes.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bytes or zero if it is not recognised.
"""
function gdalgetdatatypesizebytes(arg1)
    aftercare(ccall((:GDALGetDataTypeSizeBytes, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsComplex(GDALDataType eDataType) -> int

Is data type complex?

### Returns
TRUE if the passed type is complex (one of GDT_CInt16, GDT_CInt32, GDT_CFloat32 or GDT_CFloat64), that is it consists of a real and imaginary component.
"""
function gdaldatatypeiscomplex(arg1)
    aftercare(ccall((:GDALDataTypeIsComplex, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsInteger(GDALDataType eDataType) -> int

Is data type integer? (might be complex)

### Returns
TRUE if the passed type is integer (one of GDT_Byte, GDT_Int16, GDT_UInt16, GDT_Int32, GDT_UInt32, GDT_CInt16, GDT_CInt32).
"""
function gdaldatatypeisinteger(arg1)
    aftercare(ccall((:GDALDataTypeIsInteger, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsFloating(GDALDataType eDataType) -> int

Is data type floating? (might be complex)

### Returns
TRUE if the passed type is floating (one of GDT_Float32, GDT_Float64, GDT_CFloat32, GDT_CFloat64)
"""
function gdaldatatypeisfloating(arg1)
    aftercare(ccall((:GDALDataTypeIsFloating, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsSigned(GDALDataType eDataType) -> int

Is data type signed?

### Returns
TRUE if the passed type is signed.
"""
function gdaldatatypeissigned(arg1)
    aftercare(ccall((:GDALDataTypeIsSigned, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALGetDataTypeName(GDALDataType eDataType) -> const char *

Get name of data type.

### Parameters
* **eDataType**: type to get name of.

### Returns
string corresponding to existing data type or NULL pointer if invalid type given.
"""
function gdalgetdatatypename(arg1)
    aftercare(ccall((:GDALGetDataTypeName, libgdal), Cstring, (GDALDataType,), arg1), false)
end

"""
    GDALGetDataTypeByName(const char * pszName) -> GDALDataType

Get data type by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the type.

### Returns
GDAL data type.
"""
function gdalgetdatatypebyname(arg1)
    aftercare(ccall((:GDALGetDataTypeByName, libgdal), GDALDataType, (Cstring,), arg1))
end

"""
    GDALDataTypeUnion(GDALDataType eType1,
                      GDALDataType eType2) -> GDALDataType

Return the smallest data type that can fully express both input data types.

### Parameters
* **eType1**: first data type.
* **eType2**: second data type.

### Returns
a data type able to express eType1 and eType2.
"""
function gdaldatatypeunion(arg1, arg2)
    aftercare(ccall((:GDALDataTypeUnion, libgdal), GDALDataType, (GDALDataType, GDALDataType), arg1, arg2))
end

"""
    GDALDataTypeUnionWithValue(GDALDataType eDT,
                               double dValue,
                               int bComplex) -> GDALDataType

Union a data type with the one found for a value.

### Parameters
* **eDT**: the first data type
* **dValue**: the value for which to find a data type and union with eDT
* **bComplex**: if the value is complex

### Returns
a data type able to express eDT and dValue.
"""
function gdaldatatypeunionwithvalue(eDT, dValue, bComplex)
    aftercare(ccall((:GDALDataTypeUnionWithValue, libgdal), GDALDataType, (GDALDataType, Cdouble, Cint), eDT, dValue, bComplex))
end

"""
    GDALFindDataType(int nBits,
                     int bSigned,
                     int bFloating,
                     int bComplex) -> GDALDataType

Finds the smallest data type able to support the given requirements.

### Parameters
* **nBits**: number of bits necessary
* **bSigned**: if negative values are necessary
* **bFloating**: if non-integer values necessary
* **bComplex**: if complex values are necessary

### Returns
a best fit GDALDataType for supporting the requirements
"""
function gdalfinddatatype(nBits, bSigned, bFloating, bComplex)
    aftercare(ccall((:GDALFindDataType, libgdal), GDALDataType, (Cint, Cint, Cint, Cint), nBits, bSigned, bFloating, bComplex))
end

"""
    GDALFindDataTypeForValue(double dValue,
                             int bComplex) -> GDALDataType

Finds the smallest data type able to support the provided value.

### Parameters
* **dValue**: value to support
* **bComplex**: is the value complex

### Returns
a best fit GDALDataType for supporting the value
"""
function gdalfinddatatypeforvalue(dValue, bComplex)
    aftercare(ccall((:GDALFindDataTypeForValue, libgdal), GDALDataType, (Cdouble, Cint), dValue, bComplex))
end

"""
    GDALAdjustValueToDataType(GDALDataType eDT,
                              double dfValue,
                              int * pbClamped,
                              int * pbRounded) -> double

Adjust a value to the output data type.

### Parameters
* **eDT**: target data type.
* **dfValue**: value to adjust.
* **pbClamped**: pointer to a integer(boolean) to indicate if clamping has been made, or NULL
* **pbRounded**: pointer to a integer(boolean) to indicate if rounding has been made, or NULL

### Returns
adjusted value
"""
function gdaladjustvaluetodatatype(eDT, dfValue, pbClamped, pbRounded)
    aftercare(ccall((:GDALAdjustValueToDataType, libgdal), Cdouble, (GDALDataType, Cdouble, Ptr{Cint}, Ptr{Cint}), eDT, dfValue, pbClamped, pbRounded))
end

"""
    GDALGetNonComplexDataType(GDALDataType eDataType) -> GDALDataType

Return the base data type for the specified input.

### Parameters
* **eDataType**: type, such as GDT_CFloat32.

### Returns
GDAL data type.
"""
function gdalgetnoncomplexdatatype(arg1)
    aftercare(ccall((:GDALGetNonComplexDataType, libgdal), GDALDataType, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsConversionLossy(GDALDataType eTypeFrom,
                                  GDALDataType eTypeTo) -> int

Is conversion from eTypeFrom to eTypeTo potentially lossy.

### Parameters
* **eTypeFrom**: input datatype
* **eTypeTo**: output datatype

### Returns
TRUE if conversion from eTypeFrom to eTypeTo potentially lossy.
"""
function gdaldatatypeisconversionlossy(eTypeFrom, eTypeTo)
    aftercare(ccall((:GDALDataTypeIsConversionLossy, libgdal), Cint, (GDALDataType, GDALDataType), eTypeFrom, eTypeTo))
end

"""
    GDALAsyncStatusType

status of the asynchronous stream
"""
@cenum GDALAsyncStatusType::UInt32 begin
        GARIO_PENDING = 0
        GARIO_UPDATE = 1
        GARIO_ERROR = 2
        GARIO_COMPLETE = 3
        GARIO_TypeCount = 4
    end

"""
    GDALGetAsyncStatusTypeName(GDALAsyncStatusType eAsyncStatusType) -> const char *

Get name of AsyncStatus data type.

### Parameters
* **eAsyncStatusType**: type to get name of.

### Returns
string corresponding to type.
"""
function gdalgetasyncstatustypename(arg1)
    aftercare(ccall((:GDALGetAsyncStatusTypeName, libgdal), Cstring, (GDALAsyncStatusType,), arg1), false)
end

"""
    GDALGetAsyncStatusTypeByName(const char * pszName) -> GDALAsyncStatusType

Get AsyncStatusType by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the type.

### Returns
GDAL AsyncStatus type.
"""
function gdalgetasyncstatustypebyname(arg1)
    aftercare(ccall((:GDALGetAsyncStatusTypeByName, libgdal), GDALAsyncStatusType, (Cstring,), arg1))
end

"""
    GDALAccess

Flag indicating read/write, or read-only access to data. 

| Enumerator    | Note                           |
| :------------ | :----------------------------- |
| GA\\_ReadOnly | Read only (no update) access   |
| GA\\_Update   | Read/write access.             |
"""
@cenum GDALAccess::UInt32 begin
        GA_ReadOnly = 0
        GA_Update = 1
    end

"""
    GDALRWFlag

Read/Write flag for RasterIO() method 

| Enumerator | Note         |
| :--------- | :----------- |
| GF\\_Read  | Read data    |
| GF\\_Write | Write data   |
"""
@cenum GDALRWFlag::UInt32 begin
        GF_Read = 0
        GF_Write = 1
    end

"""
    GDALRIOResampleAlg

RasterIO() resampling method. 

\\since GDAL 2.0

| Enumerator                | Note                                                                          |
| :------------------------ | :---------------------------------------------------------------------------- |
| GRIORA\\_NearestNeighbour | Nearest neighbour                                                             |
| GRIORA\\_Bilinear         | Bilinear (2x2 kernel)                                                         |
| GRIORA\\_Cubic            | Cubic Convolution Approximation (4x4 kernel)                                  |
| GRIORA\\_CubicSpline      | Cubic B-Spline Approximation (4x4 kernel)                                     |
| GRIORA\\_Lanczos          | Lanczos windowed sinc interpolation (6x6 kernel)                              |
| GRIORA\\_Average          | Average                                                                       |
| GRIORA\\_Mode             | Mode (selects the value which appears most often of all the sampled points)   |
| GRIORA\\_Gauss            | Gauss blurring                                                                |
| GRIORA\\_LAST             | Doxygen\\_Suppress                                                            |
"""
@cenum GDALRIOResampleAlg::UInt32 begin
        GRIORA_NearestNeighbour = 0
        GRIORA_Bilinear = 1
        GRIORA_Cubic = 2
        GRIORA_CubicSpline = 3
        GRIORA_Lanczos = 4
        GRIORA_Average = 5
        GRIORA_Mode = 6
        GRIORA_Gauss = 7
        GRIORA_LAST = 7
    end

"""
    GDALRasterIOExtraArg

Structure to pass extra arguments to RasterIO() method 

\\since GDAL 2.0

| Field                        | Note                                                                                                                                                                                                                                                              |
| :--------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| nVersion                     | Version of structure (to allow future extensions of the structure)                                                                                                                                                                                                |
| eResampleAlg                 | Resampling algorithm                                                                                                                                                                                                                                              |
| pfnProgress                  | Progress callback                                                                                                                                                                                                                                                 |
| pProgressData                | Progress callback user data                                                                                                                                                                                                                                       |
| bFloatingPointWindowValidity | Indicate if dfXOff, dfYOff, dfXSize and dfYSize are set. Mostly reserved from the VRT driver to communicate a more precise source window. Must be such that dfXOff - nXOff < 1.0 and dfYOff - nYOff < 1.0 and nXSize - dfXSize < 1.0 and nYSize - dfYSize < 1.0   |
| dfXOff                       | Pixel offset to the top left corner. Only valid if bFloatingPointWindowValidity = [`TRUE`](@ref)                                                                                                                                                                  |
| dfYOff                       | Line offset to the top left corner. Only valid if bFloatingPointWindowValidity = [`TRUE`](@ref)                                                                                                                                                                   |
| dfXSize                      | Width in pixels of the area of interest. Only valid if bFloatingPointWindowValidity = [`TRUE`](@ref)                                                                                                                                                              |
| dfYSize                      | Height in pixels of the area of interest. Only valid if bFloatingPointWindowValidity = [`TRUE`](@ref)                                                                                                                                                             |
"""
struct GDALRasterIOExtraArg
    nVersion::Cint
    eResampleAlg::GDALRIOResampleAlg
    pfnProgress::GDALProgressFunc
    pProgressData::Ptr{Cvoid}
    bFloatingPointWindowValidity::Cint
    dfXOff::Cdouble
    dfYOff::Cdouble
    dfXSize::Cdouble
    dfYSize::Cdouble
end

"""
    GDALColorInterp

Types of color interpretation for raster bands. 

| Enumerator           | Note                                                           |
| :------------------- | :------------------------------------------------------------- |
| GCI\\_Undefined      | Undefined                                                      |
| GCI\\_GrayIndex      | Greyscale                                                      |
| GCI\\_PaletteIndex   | Paletted (see associated color table)                          |
| GCI\\_RedBand        | Red band of RGBA image                                         |
| GCI\\_GreenBand      | Green band of RGBA image                                       |
| GCI\\_BlueBand       | Blue band of RGBA image                                        |
| GCI\\_AlphaBand      | Alpha (0=transparent, 255=opaque)                              |
| GCI\\_HueBand        | Hue band of HLS image                                          |
| GCI\\_SaturationBand | Saturation band of HLS image                                   |
| GCI\\_LightnessBand  | Lightness band of HLS image                                    |
| GCI\\_CyanBand       | Cyan band of CMYK image                                        |
| GCI\\_MagentaBand    | Magenta band of CMYK image                                     |
| GCI\\_YellowBand     | Yellow band of CMYK image                                      |
| GCI\\_BlackBand      | Black band of CMYK image                                       |
| GCI\\_YCbCr\\_YBand  | Y Luminance                                                    |
| GCI\\_YCbCr\\_CbBand | Cb Chroma                                                      |
| GCI\\_YCbCr\\_CrBand | Cr Chroma                                                      |
| GCI\\_Max            | Max current value (equals to GCI\\_YCbCr\\_CrBand currently)   |
"""
@cenum GDALColorInterp::UInt32 begin
        GCI_Undefined = 0
        GCI_GrayIndex = 1
        GCI_PaletteIndex = 2
        GCI_RedBand = 3
        GCI_GreenBand = 4
        GCI_BlueBand = 5
        GCI_AlphaBand = 6
        GCI_HueBand = 7
        GCI_SaturationBand = 8
        GCI_LightnessBand = 9
        GCI_CyanBand = 10
        GCI_MagentaBand = 11
        GCI_YellowBand = 12
        GCI_BlackBand = 13
        GCI_YCbCr_YBand = 14
        GCI_YCbCr_CbBand = 15
        GCI_YCbCr_CrBand = 16
        GCI_Max = 16
    end

"""
    GDALGetColorInterpretationName(GDALColorInterp eInterp) -> const char *

Get name of color interpretation.

### Parameters
* **eInterp**: color interpretation to get name of.

### Returns
string corresponding to color interpretation or NULL pointer if invalid enumerator given.
"""
function gdalgetcolorinterpretationname(arg1)
    aftercare(ccall((:GDALGetColorInterpretationName, libgdal), Cstring, (GDALColorInterp,), arg1), false)
end

"""
    GDALGetColorInterpretationByName(const char * pszName) -> GDALColorInterp

Get color interpretation by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the color interpretation.

### Returns
GDAL color interpretation.
"""
function gdalgetcolorinterpretationbyname(pszName)
    aftercare(ccall((:GDALGetColorInterpretationByName, libgdal), GDALColorInterp, (Cstring,), pszName))
end

"""
    GDALPaletteInterp

Types of color interpretations for a GDALColorTable. 

| Enumerator | Note                                                    |
| :--------- | :------------------------------------------------------ |
| GPI\\_Gray | Grayscale (in [`GDALColorEntry`](@ref).c1)              |
| GPI\\_RGB  | Red, Green, Blue and Alpha in (in c1, c2, c3 and c4)    |
| GPI\\_CMYK | Cyan, Magenta, Yellow and Black (in c1, c2, c3 and c4)  |
| GPI\\_HLS  | Hue, Lightness and Saturation (in c1, c2, and c3)       |
"""
@cenum GDALPaletteInterp::UInt32 begin
        GPI_Gray = 0
        GPI_RGB = 1
        GPI_CMYK = 2
        GPI_HLS = 3
    end

"""
    GDALGetPaletteInterpretationName(GDALPaletteInterp eInterp) -> const char *

Get name of palette interpretation.

### Parameters
* **eInterp**: palette interpretation to get name of.

### Returns
string corresponding to palette interpretation.
"""
function gdalgetpaletteinterpretationname(arg1)
    aftercare(ccall((:GDALGetPaletteInterpretationName, libgdal), Cstring, (GDALPaletteInterp,), arg1), false)
end

"Opaque type used for the C bindings of the C++ GDALMajorObject class "
const GDALMajorObjectH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALDataset class "
const GDALDatasetH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALRasterBand class "
const GDALRasterBandH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALDriver class "
const GDALDriverH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALColorTable class "
const GDALColorTableH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALRasterAttributeTable class "
const GDALRasterAttributeTableH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALAsyncReader class "
const GDALAsyncReaderH = Ptr{Cvoid}

"Type to express pixel, line or band spacing. Signed 64 bit integer. "
const GSpacing = GIntBig

"""
    GDALExtendedDataTypeClass

Enumeration giving the class of a GDALExtendedDataType. 

\\since GDAL 3.1

| Enumerator       | Note                                                         |
| :--------------- | :----------------------------------------------------------- |
| GEDTC\\_NUMERIC  | Numeric value. Based on [`GDALDataType`](@ref) enumeration   |
| GEDTC\\_STRING   | String value.                                                |
| GEDTC\\_COMPOUND | Compound data type.                                          |
"""
@cenum GDALExtendedDataTypeClass::UInt32 begin
        GEDTC_NUMERIC = 0
        GEDTC_STRING = 1
        GEDTC_COMPOUND = 2
    end

mutable struct GDALExtendedDataTypeHS
end

"Opaque type for C++ GDALExtendedDataType "
const GDALExtendedDataTypeH = Ptr{GDALExtendedDataTypeHS}

mutable struct GDALEDTComponentHS
end

"Opaque type for C++ GDALEDTComponent "
const GDALEDTComponentH = Ptr{GDALEDTComponentHS}

mutable struct GDALGroupHS
end

"Opaque type for C++ GDALGroup "
const GDALGroupH = Ptr{GDALGroupHS}

mutable struct GDALMDArrayHS
end

"Opaque type for C++ GDALMDArray "
const GDALMDArrayH = Ptr{GDALMDArrayHS}

mutable struct GDALAttributeHS
end

"Opaque type for C++ GDALAttribute "
const GDALAttributeH = Ptr{GDALAttributeHS}

mutable struct GDALDimensionHS
end

"Opaque type for C++ GDALDimension "
const GDALDimensionH = Ptr{GDALDimensionHS}

"""
    GDALAllRegister() -> void

Register all known configured GDAL drivers.
"""
function gdalallregister()
    aftercare(ccall((:GDALAllRegister, libgdal), Cvoid, ()))
end

"""
    GDALCreate(GDALDriverH hDriver,
               const char * pszFilename,
               int nXSize,
               int nYSize,
               int nBands,
               GDALDataType eBandType,
               CSLConstList papszOptions) -> GDALDatasetH

Create a new dataset with this driver.
"""
function gdalcreate(hDriver, arg2, arg3, arg4, arg5, arg6, arg7)
    aftercare(ccall((:GDALCreate, libgdal), GDALDatasetH, (GDALDriverH, Cstring, Cint, Cint, Cint, GDALDataType, CSLConstList), hDriver, arg2, arg3, arg4, arg5, arg6, arg7))
end

"""
    GDALCreateCopy(GDALDriverH hDriver,
                   const char * pszFilename,
                   GDALDatasetH hSrcDS,
                   int bStrict,
                   CSLConstList papszOptions,
                   GDALProgressFunc pfnProgress,
                   void * pProgressData) -> GDALDatasetH

Create a copy of a dataset.
"""
function gdalcreatecopy(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    aftercare(ccall((:GDALCreateCopy, libgdal), GDALDatasetH, (GDALDriverH, Cstring, GDALDatasetH, Cint, CSLConstList, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7))
end

"""
    GDALIdentifyDriver(const char * pszFilename,
                       CSLConstList papszFileList) -> GDALDriverH

Identify the driver that can open a raster file.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset.
* **papszFileList**: an array of strings, whose last element is the NULL pointer. These strings are filenames that are auxiliary to the main filename. The passed value may be NULL.

### Returns
A GDALDriverH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDriver *.
"""
function gdalidentifydriver(pszFilename, papszFileList)
    aftercare(ccall((:GDALIdentifyDriver, libgdal), GDALDriverH, (Cstring, CSLConstList), pszFilename, papszFileList))
end

"""
    GDALIdentifyDriverEx(const char * pszFilename,
                         unsigned int nIdentifyFlags,
                         const char *const * papszAllowedDrivers,
                         const char *const * papszFileList) -> GDALDriverH

Identify the driver that can open a raster file.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset.
* **nIdentifyFlags**: a combination of GDAL_OF_RASTER for raster drivers or GDAL_OF_VECTOR for vector drivers. If none of the value is specified, both kinds are implied.
* **papszAllowedDrivers**: NULL to consider all candidate drivers, or a NULL terminated list of strings with the driver short names that must be considered.
* **papszFileList**: an array of strings, whose last element is the NULL pointer. These strings are filenames that are auxiliary to the main filename. The passed value may be NULL.

### Returns
A GDALDriverH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDriver *.
"""
function gdalidentifydriverex(pszFilename, nIdentifyFlags, papszAllowedDrivers, papszFileList)
    aftercare(ccall((:GDALIdentifyDriverEx, libgdal), GDALDriverH, (Cstring, Cuint, Ptr{Cstring}, Ptr{Cstring}), pszFilename, nIdentifyFlags, papszAllowedDrivers, papszFileList))
end

"""
    GDALOpen(const char * pszFilename,
             GDALAccess eAccess) -> GDALDatasetH

Open a raster file as a GDALDataset.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset. It should be in UTF-8 encoding.
* **eAccess**: the desired access, either GA_Update or GA_ReadOnly. Many drivers support only read only access.

### Returns
A GDALDatasetH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDataset *.
"""
function gdalopen(pszFilename, eAccess)
    aftercare(ccall((:GDALOpen, libgdal), GDALDatasetH, (Cstring, GDALAccess), pszFilename, eAccess))
end

"""
    GDALOpenShared(const char * pszFilename,
                   GDALAccess eAccess) -> GDALDatasetH

Open a raster file as a GDALDataset.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset. It should be in UTF-8 encoding.
* **eAccess**: the desired access, either GA_Update or GA_ReadOnly. Many drivers support only read only access.

### Returns
A GDALDatasetH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDataset *.
"""
function gdalopenshared(arg1, arg2)
    aftercare(ccall((:GDALOpenShared, libgdal), GDALDatasetH, (Cstring, GDALAccess), arg1, arg2))
end

"""
    GDALOpenEx(const char * pszFilename,
               unsigned int nOpenFlags,
               const char *const * papszAllowedDrivers,
               const char *const * papszOpenOptions,
               const char *const * papszSiblingFiles) -> GDALDatasetH

Open a raster or vector file as a GDALDataset.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset. It should be in UTF-8 encoding.
* **nOpenFlags**: a combination of GDAL_OF_ flags that may be combined through logical or operator. 

Driver kind: GDAL_OF_RASTER for raster drivers, GDAL_OF_VECTOR for vector drivers, GDAL_OF_GNM for Geographic Network Model drivers. If none of the value is specified, all kinds are implied. 


Access mode: GDAL_OF_READONLY (exclusive)or GDAL_OF_UPDATE. 


Shared mode: GDAL_OF_SHARED. If set, it allows the sharing of GDALDataset handles for a dataset with other callers that have set GDAL_OF_SHARED. In particular, GDALOpenEx() will first consult its list of currently open and shared GDALDataset's, and if the GetDescription() name for one exactly matches the pszFilename passed to GDALOpenEx() it will be referenced and returned, if GDALOpenEx() is called from the same thread. 


Verbose error: GDAL_OF_VERBOSE_ERROR. If set, a failed attempt to open the file will lead to an error message to be reported.
* **papszAllowedDrivers**: NULL to consider all candidate drivers, or a NULL terminated list of strings with the driver short names that must be considered.
* **papszOpenOptions**: NULL, or a NULL terminated list of strings with open options passed to candidate drivers. An option exists for all drivers, OVERVIEW_LEVEL=level, to select a particular overview level of a dataset. The level index starts at 0. The level number can be suffixed by "only" to specify that only this overview level must be visible, and not sub-levels. Open options are validated by default, and a warning is emitted in case the option is not recognized. In some scenarios, it might be not desirable (e.g. when not knowing which driver will open the file), so the special open option VALIDATE_OPEN_OPTIONS can be set to NO to avoid such warnings. Alternatively, since GDAL 2.1, an option name can be preceded by the @ character to indicate that it may not cause a warning if the driver doesn't declare this option. Starting with GDAL 3.3, OVERVIEW_LEVEL=NONE is supported to indicate that no overviews should be exposed.
* **papszSiblingFiles**: NULL, or a NULL terminated list of strings that are filenames that are auxiliary to the main filename. If NULL is passed, a probing of the file system will be done.

### Returns
A GDALDatasetH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDataset *.
"""
function gdalopenex(pszFilename, nOpenFlags, papszAllowedDrivers, papszOpenOptions, papszSiblingFiles)
    aftercare(ccall((:GDALOpenEx, libgdal), GDALDatasetH, (Cstring, Cuint, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cstring}), pszFilename, nOpenFlags, papszAllowedDrivers, papszOpenOptions, papszSiblingFiles))
end

"""
    GDALDumpOpenDatasets(FILE * fp) -> int

List open datasets.
"""
function gdaldumpopendatasets(arg1)
    aftercare(ccall((:GDALDumpOpenDatasets, libgdal), Cint, (Ptr{Libc.FILE},), arg1))
end

"""
    GDALGetDriverByName(const char * pszName) -> GDALDriverH

Fetch a driver based on the short name.
"""
function gdalgetdriverbyname(arg1)
    aftercare(ccall((:GDALGetDriverByName, libgdal), GDALDriverH, (Cstring,), arg1))
end

"""
    GDALGetDriverCount() -> int

Fetch the number of registered drivers.
"""
function gdalgetdrivercount()
    aftercare(ccall((:GDALGetDriverCount, libgdal), Cint, ()))
end

"""
    GDALGetDriver(int iDriver) -> GDALDriverH

Fetch driver by index.
"""
function gdalgetdriver(arg1)
    aftercare(ccall((:GDALGetDriver, libgdal), GDALDriverH, (Cint,), arg1))
end

"""
    GDALCreateDriver() -> GDALDriverH

Create a GDALDriver.
"""
function gdalcreatedriver()
    aftercare(ccall((:GDALCreateDriver, libgdal), GDALDriverH, ()))
end

"""
    GDALDestroyDriver(GDALDriverH hDriver) -> void

Destroy a GDALDriver.

### Parameters
* **hDriver**: the driver to destroy.
"""
function gdaldestroydriver(arg1)
    aftercare(ccall((:GDALDestroyDriver, libgdal), Cvoid, (GDALDriverH,), arg1))
end

"""
    GDALRegisterDriver(GDALDriverH hDriver) -> int

Register a driver for use.
"""
function gdalregisterdriver(arg1)
    aftercare(ccall((:GDALRegisterDriver, libgdal), Cint, (GDALDriverH,), arg1))
end

"""
    GDALDeregisterDriver(GDALDriverH hDriver) -> void

Deregister the passed driver.
"""
function gdalderegisterdriver(arg1)
    aftercare(ccall((:GDALDeregisterDriver, libgdal), Cvoid, (GDALDriverH,), arg1))
end

"""
    GDALDestroyDriverManager(void) -> void

Destroy the driver manager.
"""
function gdaldestroydrivermanager()
    aftercare(ccall((:GDALDestroyDriverManager, libgdal), Cvoid, ()))
end

"""
    GDALDestroy(void) -> void
"""
function gdaldestroy()
    aftercare(ccall((:GDALDestroy, libgdal), Cvoid, ()))
end

"""
    GDALDeleteDataset(GDALDriverH hDriver,
                      const char * pszFilename) -> CPLErr

Delete named dataset.
"""
function gdaldeletedataset(arg1, arg2)
    aftercare(ccall((:GDALDeleteDataset, libgdal), CPLErr, (GDALDriverH, Cstring), arg1, arg2))
end

"""
    GDALRenameDataset(GDALDriverH hDriver,
                      const char * pszNewName,
                      const char * pszOldName) -> CPLErr

Rename a dataset.
"""
function gdalrenamedataset(arg1, pszNewName, pszOldName)
    aftercare(ccall((:GDALRenameDataset, libgdal), CPLErr, (GDALDriverH, Cstring, Cstring), arg1, pszNewName, pszOldName))
end

"""
    GDALCopyDatasetFiles(GDALDriverH hDriver,
                         const char * pszNewName,
                         const char * pszOldName) -> CPLErr

Copy the files of a dataset.
"""
function gdalcopydatasetfiles(arg1, pszNewName, pszOldName)
    aftercare(ccall((:GDALCopyDatasetFiles, libgdal), CPLErr, (GDALDriverH, Cstring, Cstring), arg1, pszNewName, pszOldName))
end

"""
    GDALValidateCreationOptions(GDALDriverH hDriver,
                                CSLConstList papszCreationOptions) -> int

Validate the list of creation options that are handled by a driver.

### Parameters
* **hDriver**: the handle of the driver with whom the lists of creation option must be validated
* **papszCreationOptions**: the list of creation options. An array of strings, whose last element is a NULL pointer

### Returns
TRUE if the list of creation options is compatible with the Create() and CreateCopy() method of the driver, FALSE otherwise.
"""
function gdalvalidatecreationoptions(arg1, papszCreationOptions)
    aftercare(ccall((:GDALValidateCreationOptions, libgdal), Cint, (GDALDriverH, CSLConstList), arg1, papszCreationOptions))
end

"""
    GDALGetDriverShortName(GDALDriverH hDriver) -> const char *

Return the short name of a driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the short name of the driver. The returned string should not be freed and is owned by the driver.
"""
function gdalgetdrivershortname(arg1)
    aftercare(ccall((:GDALGetDriverShortName, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDALGetDriverLongName(GDALDriverH hDriver) -> const char *

Return the long name of a driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the long name of the driver or empty string. The returned string should not be freed and is owned by the driver.
"""
function gdalgetdriverlongname(arg1)
    aftercare(ccall((:GDALGetDriverLongName, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDALGetDriverHelpTopic(GDALDriverH hDriver) -> const char *

Return the URL to the help that describes the driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the URL to the help that describes the driver or NULL. The returned string should not be freed and is owned by the driver.
"""
function gdalgetdriverhelptopic(arg1)
    aftercare(ccall((:GDALGetDriverHelpTopic, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDALGetDriverCreationOptionList(GDALDriverH hDriver) -> const char *

Return the list of creation options of the driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
an XML string that describes the list of creation options or empty string. The returned string should not be freed and is owned by the driver.
"""
function gdalgetdrivercreationoptionlist(arg1)
    aftercare(ccall((:GDALGetDriverCreationOptionList, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDAL_GCP

Ground Control Point 

| Field      | Note                                       |
| :--------- | :----------------------------------------- |
| pszId      | Unique identifier, often numeric           |
| pszInfo    | Informational message or ""                |
| dfGCPPixel | Pixel (x) location of GCP on raster        |
| dfGCPLine  | Line (y) location of GCP on raster         |
| dfGCPX     | X position of GCP in georeferenced space   |
| dfGCPY     | Y position of GCP in georeferenced space   |
| dfGCPZ     | Elevation of GCP, or zero if not known     |
"""
struct GDAL_GCP
    pszId::Cstring
    pszInfo::Cstring
    dfGCPPixel::Cdouble
    dfGCPLine::Cdouble
    dfGCPX::Cdouble
    dfGCPY::Cdouble
    dfGCPZ::Cdouble
end

"""
    GDALInitGCPs(int nCount,
                 GDAL_GCP * psGCP) -> void

Initialize an array of GCPs.

### Parameters
* **nCount**: number of GCPs in psGCP
* **psGCP**: array of GCPs of size nCount.
"""
function gdalinitgcps(arg1, arg2)
    aftercare(ccall((:GDALInitGCPs, libgdal), Cvoid, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
end

"""
    GDALDeinitGCPs(int nCount,
                   GDAL_GCP * psGCP) -> void

De-initialize an array of GCPs (initialized with GDALInitGCPs())

### Parameters
* **nCount**: number of GCPs in psGCP
* **psGCP**: array of GCPs of size nCount.
"""
function gdaldeinitgcps(arg1, arg2)
    aftercare(ccall((:GDALDeinitGCPs, libgdal), Cvoid, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
end

"""
    GDALDuplicateGCPs(int nCount,
                      const GDAL_GCP * pasGCPList) -> GDAL_GCP *

Duplicate an array of GCPs.

### Parameters
* **nCount**: number of GCPs in psGCP
* **pasGCPList**: array of GCPs of size nCount.
"""
function gdalduplicategcps(arg1, arg2)
    aftercare(ccall((:GDALDuplicateGCPs, libgdal), Ptr{GDAL_GCP}, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
end

"""
    GDALGCPsToGeoTransform(int nGCPCount,
                           const GDAL_GCP * pasGCPs,
                           double * padfGeoTransform,
                           int bApproxOK) -> int

Generate Geotransform from GCPs.

### Parameters
* **nGCPCount**: the number of GCPs being passed in.
* **pasGCPs**: the list of GCP structures.
* **padfGeoTransform**: the six double array in which the affine geotransformation will be returned.
* **bApproxOK**: If FALSE the function will fail if the geotransform is not essentially an exact fit (within 0.25 pixel) for all GCPs.

### Returns
TRUE on success or FALSE if there aren't enough points to prepare a geotransform, the pointers are ill-determined or if bApproxOK is FALSE and the fit is poor.
"""
function gdalgcpstogeotransform(nGCPCount, pasGCPs, padfGeoTransform, bApproxOK)
    aftercare(ccall((:GDALGCPsToGeoTransform, libgdal), Cint, (Cint, Ptr{GDAL_GCP}, Ptr{Cdouble}, Cint), nGCPCount, pasGCPs, padfGeoTransform, bApproxOK))
end

"""
    GDALInvGeoTransform(double * gt_in,
                        double * gt_out) -> int

Invert Geotransform.

### Parameters
* **gt_in**: Input geotransform (six doubles - unaltered).
* **gt_out**: Output geotransform (six doubles - updated).

### Returns
TRUE on success or FALSE if the equation is uninvertable.
"""
function gdalinvgeotransform(padfGeoTransformIn, padfInvGeoTransformOut)
    aftercare(ccall((:GDALInvGeoTransform, libgdal), Cint, (Ptr{Cdouble}, Ptr{Cdouble}), padfGeoTransformIn, padfInvGeoTransformOut))
end

"""
    GDALApplyGeoTransform(double * padfGeoTransform,
                          double dfPixel,
                          double dfLine,
                          double * pdfGeoX,
                          double * pdfGeoY) -> void

Apply GeoTransform to x/y coordinate.

### Parameters
* **padfGeoTransform**: Six coefficient GeoTransform to apply.
* **dfPixel**: Input pixel position.
* **dfLine**: Input line position.
* **pdfGeoX**: output location where geo_x (easting/longitude) location is placed.
* **pdfGeoY**: output location where geo_y (northing/latitude) location is placed.
"""
function gdalapplygeotransform(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALApplyGeoTransform, libgdal), Cvoid, (Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALComposeGeoTransforms(const double * padfGT1,
                             const double * padfGT2,
                             double * padfGTOut) -> void

Compose two geotransforms.

### Parameters
* **padfGT1**: the first geotransform, six values.
* **padfGT2**: the second geotransform, six values.
* **padfGTOut**: the output geotransform, six values, may safely be the same array as padfGT1 or padfGT2.
"""
function gdalcomposegeotransforms(padfGeoTransform1, padfGeoTransform2, padfGeoTransformOut)
    aftercare(ccall((:GDALComposeGeoTransforms, libgdal), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), padfGeoTransform1, padfGeoTransform2, padfGeoTransformOut))
end

"""
    GDALGetMetadataDomainList(GDALMajorObjectH hObject) -> char **

Fetch list of metadata domains.
"""
function gdalgetmetadatadomainlist(hObject)
    aftercare(ccall((:GDALGetMetadataDomainList, libgdal), Ptr{Cstring}, (GDALMajorObjectH,), hObject))
end

"""
    GDALGetMetadata(GDALMajorObjectH hObject,
                    const char * pszDomain) -> char **

Fetch metadata.
"""
function gdalgetmetadata(arg1, arg2)
    aftercare(ccall((:GDALGetMetadata, libgdal), Ptr{Cstring}, (GDALMajorObjectH, Cstring), arg1, arg2))
end

"""
    GDALSetMetadata(GDALMajorObjectH hObject,
                    CSLConstList papszMD,
                    const char * pszDomain) -> CPLErr

Set metadata.
"""
function gdalsetmetadata(arg1, arg2, arg3)
    aftercare(ccall((:GDALSetMetadata, libgdal), CPLErr, (GDALMajorObjectH, CSLConstList, Cstring), arg1, arg2, arg3))
end

"""
    GDALGetMetadataItem(GDALMajorObjectH hObject,
                        const char * pszName,
                        const char * pszDomain) -> const char *

Fetch single metadata item.
"""
function gdalgetmetadataitem(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetMetadataItem, libgdal), Cstring, (GDALMajorObjectH, Cstring, Cstring), arg1, arg2, arg3), false)
end

"""
    GDALSetMetadataItem(GDALMajorObjectH hObject,
                        const char * pszName,
                        const char * pszValue,
                        const char * pszDomain) -> CPLErr

Set single metadata item.
"""
function gdalsetmetadataitem(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetMetadataItem, libgdal), CPLErr, (GDALMajorObjectH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4))
end

"""
    GDALGetDescription(GDALMajorObjectH hObject) -> const char *

Fetch object description.
"""
function gdalgetdescription(arg1)
    aftercare(ccall((:GDALGetDescription, libgdal), Cstring, (GDALMajorObjectH,), arg1), false)
end

"""
    GDALSetDescription(GDALMajorObjectH hObject,
                       const char * pszNewDesc) -> void

Set object description.
"""
function gdalsetdescription(arg1, arg2)
    aftercare(ccall((:GDALSetDescription, libgdal), Cvoid, (GDALMajorObjectH, Cstring), arg1, arg2))
end

"""
    GDALGetDatasetDriver(GDALDatasetH hDataset) -> GDALDriverH

Fetch the driver to which this dataset relates.
"""
function gdalgetdatasetdriver(arg1)
    aftercare(ccall((:GDALGetDatasetDriver, libgdal), GDALDriverH, (GDALDatasetH,), arg1))
end

"""
    GDALGetFileList(GDALDatasetH hDS) -> char **

Fetch files forming dataset.
"""
function gdalgetfilelist(arg1)
    aftercare(ccall((:GDALGetFileList, libgdal), Ptr{Cstring}, (GDALDatasetH,), arg1))
end

"""
    GDALClose(GDALDatasetH hDS) -> void

Close GDAL dataset.

### Parameters
* **hDS**: The dataset to close. May be cast from a "GDALDataset *".
"""
function gdalclose(arg1)
    aftercare(ccall((:GDALClose, libgdal), Cvoid, (GDALDatasetH,), arg1))
end

"""
    GDALGetRasterXSize(GDALDatasetH hDataset) -> int

Fetch raster width in pixels.
"""
function gdalgetrasterxsize(arg1)
    aftercare(ccall((:GDALGetRasterXSize, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALGetRasterYSize(GDALDatasetH hDataset) -> int

Fetch raster height in pixels.
"""
function gdalgetrasterysize(arg1)
    aftercare(ccall((:GDALGetRasterYSize, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALGetRasterCount(GDALDatasetH hDS) -> int

Fetch the number of raster bands on this dataset.
"""
function gdalgetrastercount(arg1)
    aftercare(ccall((:GDALGetRasterCount, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALGetRasterBand(GDALDatasetH hDS,
                      int nBandId) -> GDALRasterBandH

Fetch a band object for a dataset.
"""
function gdalgetrasterband(arg1, arg2)
    aftercare(ccall((:GDALGetRasterBand, libgdal), GDALRasterBandH, (GDALDatasetH, Cint), arg1, arg2))
end

"""
    GDALAddBand(GDALDatasetH hDataset,
                GDALDataType eType,
                CSLConstList papszOptions) -> CPLErr

Add a band to a dataset.
"""
function gdaladdband(hDS, eType, papszOptions)
    aftercare(ccall((:GDALAddBand, libgdal), CPLErr, (GDALDatasetH, GDALDataType, CSLConstList), hDS, eType, papszOptions))
end

"""
    GDALBeginAsyncReader(GDALDatasetH hDS,
                         int nXOff,
                         int nYOff,
                         int nXSize,
                         int nYSize,
                         void * pBuf,
                         int nBufXSize,
                         int nBufYSize,
                         GDALDataType eBufType,
                         int nBandCount,
                         int * panBandMap,
                         int nPixelSpace,
                         int nLineSpace,
                         int nBandSpace,
                         CSLConstList papszOptions) -> GDALAsyncReaderH

Sets up an asynchronous data request.

### Parameters
* **hDS**: handle to the dataset object.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **pBuf**: The buffer into which the data should be read. This buffer must contain at least nBufXSize * nBufYSize * nBandCount words of type eBufType. It is organized in left to right,top to bottom pixel order. Spacing is controlled by the nPixelSpace, and nLineSpace parameters.
* **nBufXSize**: the width of the buffer image into which the desired region is to be read, or from which it is to be written.
* **nBufYSize**: the height of the buffer image into which the desired region is to be read, or from which it is to be written.
* **eBufType**: the type of the pixel values in the pData data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nBandCount**: the number of bands being read or written.
* **panBandMap**: the list of nBandCount band numbers being read/written. Note band numbers are 1 based. This may be NULL to select the first nBandCount bands.
* **nPixelSpace**: The byte offset from the start of one pixel value in pData to the start of the next pixel value within a scanline. If defaulted (0) the size of the datatype eBufType is used.
* **nLineSpace**: The byte offset from the start of one scanline in pData to the start of the next. If defaulted the size of the datatype eBufType * nBufXSize is used.
* **nBandSpace**: the byte offset from the start of one bands data to the start of the next. If defaulted (zero) the value will be nLineSpace * nBufYSize implying band sequential organization of the data buffer.
* **papszOptions**: Driver specific control options in a string list or NULL. Consult driver documentation for options supported.

### Returns
handle representing the request.
"""
function gdalbeginasyncreader(hDS, nXOff, nYOff, nXSize, nYSize, pBuf, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, papszOptions)
    aftercare(ccall((:GDALBeginAsyncReader, libgdal), GDALAsyncReaderH, (GDALDatasetH, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint, CSLConstList), hDS, nXOff, nYOff, nXSize, nYSize, pBuf, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, papszOptions))
end

"""
    GDALEndAsyncReader(GDALDatasetH hDS,
                       GDALAsyncReaderH hAsyncReaderH) -> void

End asynchronous request.

### Parameters
* **hDS**: handle to the dataset object.
* **hAsyncReaderH**: handle returned by GDALBeginAsyncReader()
"""
function gdalendasyncreader(hDS, hAsynchReaderH)
    aftercare(ccall((:GDALEndAsyncReader, libgdal), Cvoid, (GDALDatasetH, GDALAsyncReaderH), hDS, hAsynchReaderH))
end

"""
    GDALDatasetRasterIO(GDALDatasetH hDS,
                        GDALRWFlag eRWFlag,
                        int nXOff,
                        int nYOff,
                        int nXSize,
                        int nYSize,
                        void * pData,
                        int nBufXSize,
                        int nBufYSize,
                        GDALDataType eBufType,
                        int nBandCount,
                        int * panBandMap,
                        int nPixelSpace,
                        int nLineSpace,
                        int nBandSpace) -> CPLErr

Read/write a region of image data from multiple bands.
"""
function gdaldatasetrasterio(hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace)
    aftercare(ccall((:GDALDatasetRasterIO, libgdal), CPLErr, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint), hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace))
end

"""
    GDALDatasetRasterIOEx(GDALDatasetH hDS,
                          GDALRWFlag eRWFlag,
                          int nXOff,
                          int nYOff,
                          int nXSize,
                          int nYSize,
                          void * pData,
                          int nBufXSize,
                          int nBufYSize,
                          GDALDataType eBufType,
                          int nBandCount,
                          int * panBandMap,
                          GSpacing nPixelSpace,
                          GSpacing nLineSpace,
                          GSpacing nBandSpace,
                          GDALRasterIOExtraArg * psExtraArg) -> CPLErr

Read/write a region of image data from multiple bands.
"""
function gdaldatasetrasterioex(hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace, psExtraArg)
    aftercare(ccall((:GDALDatasetRasterIOEx, libgdal), CPLErr, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, GSpacing, GSpacing, GSpacing, Ptr{GDALRasterIOExtraArg}), hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace, psExtraArg))
end

"""
    GDALDatasetAdviseRead(GDALDatasetH hDS,
                          int nXOff,
                          int nYOff,
                          int nXSize,
                          int nYSize,
                          int nBufXSize,
                          int nBufYSize,
                          GDALDataType eDT,
                          int nBandCount,
                          int * panBandMap,
                          CSLConstList papszOptions) -> CPLErr

Advise driver of upcoming read requests.
"""
function gdaldatasetadviseread(hDS, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, papszOptions)
    aftercare(ccall((:GDALDatasetAdviseRead, libgdal), CPLErr, (GDALDatasetH, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, CSLConstList), hDS, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, papszOptions))
end

"""
    GDALGetProjectionRef(GDALDatasetH hDS) -> const char *

Fetch the projection definition string for this dataset.
"""
function gdalgetprojectionref(arg1)
    aftercare(ccall((:GDALGetProjectionRef, libgdal), Cstring, (GDALDatasetH,), arg1), false)
end

"Opaque type for a spatial reference system "
const OGRSpatialReferenceH = Ptr{Cvoid}

"""
    GDALGetSpatialRef(GDALDatasetH hDS) -> OGRSpatialReferenceH

Fetch the spatial reference for this dataset.
"""
function gdalgetspatialref(arg1)
    aftercare(ccall((:GDALGetSpatialRef, libgdal), OGRSpatialReferenceH, (GDALDatasetH,), arg1))
end

"""
    GDALSetProjection(GDALDatasetH hDS,
                      const char * pszProjection) -> CPLErr

Set the projection reference string for this dataset.
"""
function gdalsetprojection(arg1, arg2)
    aftercare(ccall((:GDALSetProjection, libgdal), CPLErr, (GDALDatasetH, Cstring), arg1, arg2))
end

"""
    GDALSetSpatialRef(GDALDatasetH hDS,
                      OGRSpatialReferenceH hSRS) -> CPLErr

Set the spatial reference system for this dataset.
"""
function gdalsetspatialref(arg1, arg2)
    aftercare(ccall((:GDALSetSpatialRef, libgdal), CPLErr, (GDALDatasetH, OGRSpatialReferenceH), arg1, arg2))
end

"""
    GDALGetGeoTransform(GDALDatasetH hDS,
                        double * padfTransform) -> CPLErr

Fetch the affine transformation coefficients.
"""
function gdalgetgeotransform(arg1, arg2)
    aftercare(ccall((:GDALGetGeoTransform, libgdal), CPLErr, (GDALDatasetH, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALSetGeoTransform(GDALDatasetH hDS,
                        double * padfTransform) -> CPLErr

Set the affine transformation coefficients.
"""
function gdalsetgeotransform(arg1, arg2)
    aftercare(ccall((:GDALSetGeoTransform, libgdal), CPLErr, (GDALDatasetH, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALGetGCPCount(GDALDatasetH hDS) -> int

Get number of GCPs.
"""
function gdalgetgcpcount(arg1)
    aftercare(ccall((:GDALGetGCPCount, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALGetGCPProjection(GDALDatasetH hDS) -> const char *

Get output projection for GCPs.
"""
function gdalgetgcpprojection(arg1)
    aftercare(ccall((:GDALGetGCPProjection, libgdal), Cstring, (GDALDatasetH,), arg1), false)
end

"""
    GDALGetGCPSpatialRef(GDALDatasetH hDS) -> OGRSpatialReferenceH

Get output spatial reference system for GCPs.
"""
function gdalgetgcpspatialref(arg1)
    aftercare(ccall((:GDALGetGCPSpatialRef, libgdal), OGRSpatialReferenceH, (GDALDatasetH,), arg1))
end

"""
    GDALGetGCPs(GDALDatasetH hDS) -> const GDAL_GCP *

Fetch GCPs.
"""
function gdalgetgcps(arg1)
    aftercare(ccall((:GDALGetGCPs, libgdal), Ptr{GDAL_GCP}, (GDALDatasetH,), arg1))
end

"""
    GDALSetGCPs(GDALDatasetH hDS,
                int nGCPCount,
                const GDAL_GCP * pasGCPList,
                const char * pszGCPProjection) -> CPLErr

Assign GCPs.
"""
function gdalsetgcps(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetGCPs, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{GDAL_GCP}, Cstring), arg1, arg2, arg3, arg4))
end

"""
    GDALSetGCPs2(GDALDatasetH hDS,
                 int nGCPCount,
                 const GDAL_GCP * pasGCPList,
                 OGRSpatialReferenceH hSRS) -> CPLErr

Assign GCPs.
"""
function gdalsetgcps2(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetGCPs2, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{GDAL_GCP}, OGRSpatialReferenceH), arg1, arg2, arg3, arg4))
end

"""
    GDALGetInternalHandle(GDALDatasetH hDS,
                          const char * pszRequest) -> void *

Fetch a format specific internally meaningful handle.
"""
function gdalgetinternalhandle(arg1, arg2)
    aftercare(ccall((:GDALGetInternalHandle, libgdal), Ptr{Cvoid}, (GDALDatasetH, Cstring), arg1, arg2))
end

"""
    GDALReferenceDataset(GDALDatasetH hDataset) -> int

Add one to dataset reference count.
"""
function gdalreferencedataset(arg1)
    aftercare(ccall((:GDALReferenceDataset, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALDereferenceDataset(GDALDatasetH hDataset) -> int

Subtract one from dataset reference count.
"""
function gdaldereferencedataset(arg1)
    aftercare(ccall((:GDALDereferenceDataset, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALReleaseDataset(GDALDatasetH hDataset) -> int

Drop a reference to this object, and destroy if no longer referenced.
"""
function gdalreleasedataset(arg1)
    aftercare(ccall((:GDALReleaseDataset, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALBuildOverviews(GDALDatasetH hDataset,
                       const char * pszResampling,
                       int nOverviews,
                       int * panOverviewList,
                       int nListBands,
                       int * panBandList,
                       GDALProgressFunc pfnProgress,
                       void * pProgressData) -> CPLErr

Build raster overview(s)
"""
function gdalbuildoverviews(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    aftercare(ccall((:GDALBuildOverviews, libgdal), CPLErr, (GDALDatasetH, Cstring, Cint, Ptr{Cint}, Cint, Ptr{Cint}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8))
end

"""
    GDALGetOpenDatasets(GDALDatasetH ** ppahDSList,
                        int * pnCount) -> void

Fetch all open GDAL dataset handles.
"""
function gdalgetopendatasets(hDS, pnCount)
    aftercare(ccall((:GDALGetOpenDatasets, libgdal), Cvoid, (Ptr{Ptr{GDALDatasetH}}, Ptr{Cint}), hDS, pnCount))
end

"""
    GDALGetAccess(GDALDatasetH hDS) -> int

Return access flag.
"""
function gdalgetaccess(hDS)
    aftercare(ccall((:GDALGetAccess, libgdal), Cint, (GDALDatasetH,), hDS))
end

"""
    GDALFlushCache(GDALDatasetH hDS) -> void

Flush all write cached data to disk.
"""
function gdalflushcache(hDS)
    aftercare(ccall((:GDALFlushCache, libgdal), Cvoid, (GDALDatasetH,), hDS))
end

"""
    GDALCreateDatasetMaskBand(GDALDatasetH hDS,
                              int nFlags) -> CPLErr

Adds a mask band to the dataset.
"""
function gdalcreatedatasetmaskband(hDS, nFlags)
    aftercare(ccall((:GDALCreateDatasetMaskBand, libgdal), CPLErr, (GDALDatasetH, Cint), hDS, nFlags))
end

"""
    GDALDatasetCopyWholeRaster(GDALDatasetH hSrcDS,
                               GDALDatasetH hDstDS,
                               CSLConstList papszOptions,
                               GDALProgressFunc pfnProgress,
                               void * pProgressData) -> CPLErr

Copy all dataset raster data.

### Parameters
* **hSrcDS**: the source dataset
* **hDstDS**: the destination dataset
* **papszOptions**: transfer hints in "StringList" Name=Value format.
* **pfnProgress**: progress reporting function.
* **pProgressData**: callback data for progress function.

### Returns
CE_None on success, or CE_Failure on failure.
"""
function gdaldatasetcopywholeraster(hSrcDS, hDstDS, papszOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDatasetCopyWholeRaster, libgdal), CPLErr, (GDALDatasetH, GDALDatasetH, CSLConstList, GDALProgressFunc, Ptr{Cvoid}), hSrcDS, hDstDS, papszOptions, pfnProgress, pProgressData))
end

"""
    GDALRasterBandCopyWholeRaster(GDALRasterBandH hSrcBand,
                                  GDALRasterBandH hDstBand,
                                  const char *const *const papszOptions,
                                  GDALProgressFunc pfnProgress,
                                  void * pProgressData) -> CPLErr

Copy a whole raster band.

### Parameters
* **hSrcBand**: the source band
* **hDstBand**: the destination band
* **papszOptions**: transfer hints in "StringList" Name=Value format.
* **pfnProgress**: progress reporting function.
* **pProgressData**: callback data for progress function.

### Returns
CE_None on success, or CE_Failure on failure.
"""
function gdalrasterbandcopywholeraster(hSrcBand, hDstBand, constpapszOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRasterBandCopyWholeRaster, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hDstBand, constpapszOptions, pfnProgress, pProgressData))
end

"""
    GDALRegenerateOverviews(GDALRasterBandH hSrcBand,
                            int nOverviewCount,
                            GDALRasterBandH * pahOvrBands,
                            const char * pszResampling,
                            GDALProgressFunc pfnProgress,
                            void * pProgressData) -> CPLErr

Generate downsampled overviews.

### Parameters
* **hSrcBand**: the source (base level) band.
* **nOverviewCount**: the number of downsampled bands being generated.
* **pahOvrBands**: the list of downsampled bands to be generated.
* **pszResampling**: Resampling algorithm (e.g. "AVERAGE").
* **pfnProgress**: progress report function.
* **pProgressData**: progress function callback data.

### Returns
CE_None on success or CE_Failure on failure.
"""
function gdalregenerateoverviews(hSrcBand, nOverviewCount, pahOverviewBands, pszResampling, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRegenerateOverviews, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{GDALRasterBandH}, Cstring, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, nOverviewCount, pahOverviewBands, pszResampling, pfnProgress, pProgressData))
end

"""
    GDALDatasetGetLayerCount(GDALDatasetH hDS) -> int

Get the number of layers in this dataset.

### Parameters
* **hDS**: the dataset handle.

### Returns
layer count.
"""
function gdaldatasetgetlayercount(arg1)
    aftercare(ccall((:GDALDatasetGetLayerCount, libgdal), Cint, (GDALDatasetH,), arg1))
end

"Opaque type for a layer (OGRLayer) "
const OGRLayerH = Ptr{Cvoid}

"""
    GDALDatasetGetLayer(GDALDatasetH hDS,
                        int iLayer) -> OGRLayerH

Fetch a layer by index.

### Parameters
* **hDS**: the dataset handle.
* **iLayer**: a layer number between 0 and GetLayerCount()-1.

### Returns
the layer, or NULL if iLayer is out of range or an error occurs.
"""
function gdaldatasetgetlayer(arg1, arg2)
    aftercare(ccall((:GDALDatasetGetLayer, libgdal), OGRLayerH, (GDALDatasetH, Cint), arg1, arg2))
end

"""
    GDALDatasetGetLayerByName(GDALDatasetH hDS,
                              const char * pszName) -> OGRLayerH

Fetch a layer by name.

### Parameters
* **hDS**: the dataset handle.
* **pszName**: the layer name of the layer to fetch.

### Returns
the layer, or NULL if Layer is not found or an error occurs.
"""
function gdaldatasetgetlayerbyname(arg1, arg2)
    aftercare(ccall((:GDALDatasetGetLayerByName, libgdal), OGRLayerH, (GDALDatasetH, Cstring), arg1, arg2))
end

"Type for a OGR error "
const OGRErr = Cint

"""
    GDALDatasetDeleteLayer(GDALDatasetH hDS,
                           int iLayer) -> OGRErr

Delete the indicated layer from the datasource.

### Parameters
* **hDS**: the dataset handle.
* **iLayer**: the index of the layer to delete.

### Returns
OGRERR_NONE on success, or OGRERR_UNSUPPORTED_OPERATION if deleting layers is not supported for this datasource.
"""
function gdaldatasetdeletelayer(arg1, arg2)
    aftercare(ccall((:GDALDatasetDeleteLayer, libgdal), OGRErr, (GDALDatasetH, Cint), arg1, arg2))
end

"""
    OGRwkbGeometryType

List of well known binary geometry types. These are used within the BLOBs but are also returned from OGRGeometry::getGeometryType() to identify the type of a geometry object.

| Enumerator               | Note                                                                                                                                            |
| :----------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------- |
| wkbUnknown               | unknown type, non-standard                                                                                                                      |
| wkbPoint                 | 0-dimensional geometric object, standard WKB                                                                                                    |
| wkbLineString            | 1-dimensional geometric object with linear interpolation between Points, standard WKB                                                           |
| wkbPolygon               | planar 2-dimensional geometric object defined by 1 exterior boundary and 0 or more interior boundaries, standard WKB                            |
| wkbMultiPoint            | GeometryCollection of Points, standard WKB                                                                                                      |
| wkbMultiLineString       | GeometryCollection of LineStrings, standard WKB                                                                                                 |
| wkbMultiPolygon          | GeometryCollection of Polygons, standard WKB                                                                                                    |
| wkbGeometryCollection    | geometric object that is a collection of 1 or more geometric objects, standard WKB                                                              |
| wkbCircularString        | one or more circular arc segments connected end to end, ISO SQL/MM Part 3. GDAL >= 2.0                                                          |
| wkbCompoundCurve         | sequence of contiguous curves, ISO SQL/MM Part 3. GDAL >= 2.0                                                                                   |
| wkbCurvePolygon          | planar surface, defined by 1 exterior boundary and zero or more interior boundaries, that are curves. ISO SQL/MM Part 3. GDAL >= 2.0            |
| wkbMultiCurve            | GeometryCollection of Curves, ISO SQL/MM Part 3. GDAL >= 2.0                                                                                    |
| wkbMultiSurface          | GeometryCollection of Surfaces, ISO SQL/MM Part 3. GDAL >= 2.0                                                                                  |
| wkbCurve                 | Curve (abstract type). ISO SQL/MM Part 3. GDAL >= 2.1                                                                                           |
| wkbSurface               | Surface (abstract type). ISO SQL/MM Part 3. GDAL >= 2.1                                                                                         |
| wkbPolyhedralSurface     | a contiguous collection of polygons, which share common boundary segments, ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented   |
| wkbTIN                   | a PolyhedralSurface consisting only of Triangle patches ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                      |
| wkbTriangle              | a Triangle. ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                                                                  |
| wkbNone                  | non-standard, for pure attribute records                                                                                                        |
| wkbLinearRing            | non-standard, just for createGeometry()                                                                                                         |
| wkbCircularStringZ       | wkbCircularString with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                              |
| wkbCompoundCurveZ        | wkbCompoundCurve with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                               |
| wkbCurvePolygonZ         | wkbCurvePolygon with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                                |
| wkbMultiCurveZ           | wkbMultiCurve with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                                  |
| wkbMultiSurfaceZ         | wkbMultiSurface with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                                |
| wkbCurveZ                | wkbCurve with Z component. ISO SQL/MM Part 3. GDAL >= 2.1                                                                                       |
| wkbSurfaceZ              | wkbSurface with Z component. ISO SQL/MM Part 3. GDAL >= 2.1                                                                                     |
| wkbPolyhedralSurfaceZ    | ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                                                                              |
| wkbTINZ                  |                                                                                                                                                 |
| wkbTriangleZ             |                                                                                                                                                 |
| wkbPointM                | ISO SQL/MM Part 3. GDAL >= 2.1                                                                                                                  |
| wkbLineStringM           |                                                                                                                                                 |
| wkbPolygonM              |                                                                                                                                                 |
| wkbMultiPointM           |                                                                                                                                                 |
| wkbMultiLineStringM      |                                                                                                                                                 |
| wkbMultiPolygonM         |                                                                                                                                                 |
| wkbGeometryCollectionM   |                                                                                                                                                 |
| wkbCircularStringM       |                                                                                                                                                 |
| wkbCompoundCurveM        |                                                                                                                                                 |
| wkbCurvePolygonM         |                                                                                                                                                 |
| wkbMultiCurveM           |                                                                                                                                                 |
| wkbMultiSurfaceM         |                                                                                                                                                 |
| wkbCurveM                |                                                                                                                                                 |
| wkbSurfaceM              |                                                                                                                                                 |
| wkbPolyhedralSurfaceM    | ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                                                                              |
| wkbTINM                  |                                                                                                                                                 |
| wkbTriangleM             |                                                                                                                                                 |
| wkbPointZM               | ISO SQL/MM Part 3. GDAL >= 2.1                                                                                                                  |
| wkbLineStringZM          |                                                                                                                                                 |
| wkbPolygonZM             |                                                                                                                                                 |
| wkbMultiPointZM          |                                                                                                                                                 |
| wkbMultiLineStringZM     |                                                                                                                                                 |
| wkbMultiPolygonZM        |                                                                                                                                                 |
| wkbGeometryCollectionZM  |                                                                                                                                                 |
| wkbCircularStringZM      |                                                                                                                                                 |
| wkbCompoundCurveZM       |                                                                                                                                                 |
| wkbCurvePolygonZM        |                                                                                                                                                 |
| wkbMultiCurveZM          |                                                                                                                                                 |
| wkbMultiSurfaceZM        |                                                                                                                                                 |
| wkbCurveZM               |                                                                                                                                                 |
| wkbSurfaceZM             |                                                                                                                                                 |
| wkbPolyhedralSurfaceZM   | ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                                                                              |
| wkbTINZM                 |                                                                                                                                                 |
| wkbTriangleZM            |                                                                                                                                                 |
| wkbPoint25D              | 2.5D extension as per 99-402                                                                                                                    |
| wkbLineString25D         |                                                                                                                                                 |
| wkbPolygon25D            |                                                                                                                                                 |
| wkbMultiPoint25D         |                                                                                                                                                 |
| wkbMultiLineString25D    |                                                                                                                                                 |
| wkbMultiPolygon25D       |                                                                                                                                                 |
| wkbGeometryCollection25D |                                                                                                                                                 |
"""
@cenum OGRwkbGeometryType::UInt32 begin
        wkbUnknown = 0
        wkbPoint = 1
        wkbLineString = 2
        wkbPolygon = 3
        wkbMultiPoint = 4
        wkbMultiLineString = 5
        wkbMultiPolygon = 6
        wkbGeometryCollection = 7
        wkbCircularString = 8
        wkbCompoundCurve = 9
        wkbCurvePolygon = 10
        wkbMultiCurve = 11
        wkbMultiSurface = 12
        wkbCurve = 13
        wkbSurface = 14
        wkbPolyhedralSurface = 15
        wkbTIN = 16
        wkbTriangle = 17
        wkbNone = 100
        wkbLinearRing = 101
        wkbCircularStringZ = 1008
        wkbCompoundCurveZ = 1009
        wkbCurvePolygonZ = 1010
        wkbMultiCurveZ = 1011
        wkbMultiSurfaceZ = 1012
        wkbCurveZ = 1013
        wkbSurfaceZ = 1014
        wkbPolyhedralSurfaceZ = 1015
        wkbTINZ = 1016
        wkbTriangleZ = 1017
        wkbPointM = 2001
        wkbLineStringM = 2002
        wkbPolygonM = 2003
        wkbMultiPointM = 2004
        wkbMultiLineStringM = 2005
        wkbMultiPolygonM = 2006
        wkbGeometryCollectionM = 2007
        wkbCircularStringM = 2008
        wkbCompoundCurveM = 2009
        wkbCurvePolygonM = 2010
        wkbMultiCurveM = 2011
        wkbMultiSurfaceM = 2012
        wkbCurveM = 2013
        wkbSurfaceM = 2014
        wkbPolyhedralSurfaceM = 2015
        wkbTINM = 2016
        wkbTriangleM = 2017
        wkbPointZM = 3001
        wkbLineStringZM = 3002
        wkbPolygonZM = 3003
        wkbMultiPointZM = 3004
        wkbMultiLineStringZM = 3005
        wkbMultiPolygonZM = 3006
        wkbGeometryCollectionZM = 3007
        wkbCircularStringZM = 3008
        wkbCompoundCurveZM = 3009
        wkbCurvePolygonZM = 3010
        wkbMultiCurveZM = 3011
        wkbMultiSurfaceZM = 3012
        wkbCurveZM = 3013
        wkbSurfaceZM = 3014
        wkbPolyhedralSurfaceZM = 3015
        wkbTINZM = 3016
        wkbTriangleZM = 3017
        wkbPoint25D = 0x0000000080000001
        wkbLineString25D = 0x0000000080000002
        wkbPolygon25D = 0x0000000080000003
        wkbMultiPoint25D = 0x0000000080000004
        wkbMultiLineString25D = 0x0000000080000005
        wkbMultiPolygon25D = 0x0000000080000006
        wkbGeometryCollection25D = 0x0000000080000007
    end

"""
    GDALDatasetCreateLayer(GDALDatasetH hDS,
                           const char * pszName,
                           OGRSpatialReferenceH hSpatialRef,
                           OGRwkbGeometryType eGType,
                           CSLConstList papszOptions) -> OGRLayerH

This function attempts to create a new layer on the dataset with the indicated name, coordinate system, geometry type.

### Parameters
* **hDS**: the dataset handle
* **pszName**: the name for the new layer. This should ideally not match any existing layer on the datasource.
* **hSpatialRef**: the coordinate system to use for the new layer, or NULL if no coordinate system is available. The driver might only increase the reference counter of the object to take ownership, and not make a full copy, so do not use OSRDestroySpatialReference(), but OSRRelease() instead when you are done with the object.
* **eGType**: the geometry type for the layer. Use wkbUnknown if there are no constraints on the types geometry to be written.
* **papszOptions**: a StringList of name=value options. Options are driver specific.

### Returns
NULL is returned on failure, or a new OGRLayer handle on success.
"""
function gdaldatasetcreatelayer(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALDatasetCreateLayer, libgdal), OGRLayerH, (GDALDatasetH, Cstring, OGRSpatialReferenceH, OGRwkbGeometryType, CSLConstList), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALDatasetCopyLayer(GDALDatasetH hDS,
                         OGRLayerH hSrcLayer,
                         const char * pszNewName,
                         CSLConstList papszOptions) -> OGRLayerH

Duplicate an existing layer.

### Parameters
* **hDS**: the dataset handle.
* **hSrcLayer**: source layer.
* **pszNewName**: the name of the layer to create.
* **papszOptions**: a StringList of name=value options. Options are driver specific.

### Returns
a handle to the layer, or NULL if an error occurs.
"""
function gdaldatasetcopylayer(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALDatasetCopyLayer, libgdal), OGRLayerH, (GDALDatasetH, OGRLayerH, Cstring, CSLConstList), arg1, arg2, arg3, arg4))
end

"""
    GDALDatasetResetReading(GDALDatasetH hDS) -> void

Reset feature reading to start on the first feature.

### Parameters
* **hDS**: dataset handle
"""
function gdaldatasetresetreading(arg1)
    aftercare(ccall((:GDALDatasetResetReading, libgdal), Cvoid, (GDALDatasetH,), arg1))
end

"Opaque type for a feature (OGRFeature) "
const OGRFeatureH = Ptr{Cvoid}

"""
    GDALDatasetGetNextFeature(GDALDatasetH hDS,
                              OGRLayerH * phBelongingLayer,
                              double * pdfProgressPct,
                              GDALProgressFunc pfnProgress,
                              void * pProgressData) -> OGRFeatureH

Fetch the next available feature from this dataset.

### Parameters
* **hDS**: dataset handle.
* **phBelongingLayer**: a pointer to a OGRLayer* variable to receive the layer to which the object belongs to, or NULL. It is possible that the output of *ppoBelongingLayer to be NULL despite the feature not being NULL.
* **pdfProgressPct**: a pointer to a double variable to receive the percentage progress (in [0,1] range), or NULL. On return, the pointed value might be negative if determining the progress is not possible.
* **pfnProgress**: a progress callback to report progress (for GetNextFeature() calls that might have a long duration) and offer cancellation possibility, or NULL
* **pProgressData**: user data provided to pfnProgress, or NULL

### Returns
a feature, or NULL if no more features are available.
"""
function gdaldatasetgetnextfeature(hDS, phBelongingLayer, pdfProgressPct, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDatasetGetNextFeature, libgdal), OGRFeatureH, (GDALDatasetH, Ptr{OGRLayerH}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), hDS, phBelongingLayer, pdfProgressPct, pfnProgress, pProgressData))
end

"""
    GDALDatasetTestCapability(GDALDatasetH hDS,
                              const char * pszCap) -> int

Test if capability is available.

### Parameters
* **hDS**: the dataset handle.
* **pszCap**: the capability to test.

### Returns
TRUE if capability available otherwise FALSE.
"""
function gdaldatasettestcapability(arg1, arg2)
    aftercare(ccall((:GDALDatasetTestCapability, libgdal), Cint, (GDALDatasetH, Cstring), arg1, arg2))
end

"Opaque type for a geometry "
const OGRGeometryH = Ptr{Cvoid}

"""
    GDALDatasetExecuteSQL(GDALDatasetH hDS,
                          const char * pszStatement,
                          OGRGeometryH hSpatialFilter,
                          const char * pszDialect) -> OGRLayerH

Execute an SQL statement against the data store.

### Parameters
* **hDS**: the dataset handle.
* **pszStatement**: the SQL statement to execute.
* **hSpatialFilter**: geometry which represents a spatial filter. Can be NULL.
* **pszDialect**: allows control of the statement dialect. If set to NULL, the OGR SQL engine will be used, except for RDBMS drivers that will use their dedicated SQL engine, unless OGRSQL is explicitly passed as the dialect. Starting with OGR 1.10, the SQLITE dialect can also be used.

### Returns
an OGRLayer containing the results of the query. Deallocate with GDALDatasetReleaseResultSet().
"""
function gdaldatasetexecutesql(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALDatasetExecuteSQL, libgdal), OGRLayerH, (GDALDatasetH, Cstring, OGRGeometryH, Cstring), arg1, arg2, arg3, arg4))
end

"""
    GDALDatasetAbortSQL(GDALDatasetH hDS) -> OGRErr

Abort any SQL statement running in the data store.

### Parameters
* **hDS**: the dataset handle.

### Returns
OGRERR_NONE on success, or OGRERR_UNSUPPORTED_OPERATION if AbortSQL is not supported for this datasource. .
"""
function gdaldatasetabortsql(arg1)
    aftercare(ccall((:GDALDatasetAbortSQL, libgdal), OGRErr, (GDALDatasetH,), arg1))
end

"""
    GDALDatasetReleaseResultSet(GDALDatasetH hDS,
                                OGRLayerH hLayer) -> void

Release results of ExecuteSQL().

### Parameters
* **hDS**: the dataset handle.
* **hLayer**: the result of a previous ExecuteSQL() call.
"""
function gdaldatasetreleaseresultset(arg1, arg2)
    aftercare(ccall((:GDALDatasetReleaseResultSet, libgdal), Cvoid, (GDALDatasetH, OGRLayerH), arg1, arg2))
end

"Opaque type for a style table (OGRStyleTable) "
const OGRStyleTableH = Ptr{Cvoid}

"""
    GDALDatasetGetStyleTable(GDALDatasetH hDS) -> OGRStyleTableH

Returns dataset style table.

### Parameters
* **hDS**: the dataset handle

### Returns
handle to a style table which should not be modified or freed by the caller.
"""
function gdaldatasetgetstyletable(arg1)
    aftercare(ccall((:GDALDatasetGetStyleTable, libgdal), OGRStyleTableH, (GDALDatasetH,), arg1))
end

"""
    GDALDatasetSetStyleTableDirectly(GDALDatasetH hDS,
                                     OGRStyleTableH hStyleTable) -> void

Set dataset style table.

### Parameters
* **hDS**: the dataset handle
* **hStyleTable**: style table handle to set
"""
function gdaldatasetsetstyletabledirectly(arg1, arg2)
    aftercare(ccall((:GDALDatasetSetStyleTableDirectly, libgdal), Cvoid, (GDALDatasetH, OGRStyleTableH), arg1, arg2))
end

"""
    GDALDatasetSetStyleTable(GDALDatasetH hDS,
                             OGRStyleTableH hStyleTable) -> void

Set dataset style table.

### Parameters
* **hDS**: the dataset handle
* **hStyleTable**: style table handle to set
"""
function gdaldatasetsetstyletable(arg1, arg2)
    aftercare(ccall((:GDALDatasetSetStyleTable, libgdal), Cvoid, (GDALDatasetH, OGRStyleTableH), arg1, arg2))
end

"""
    GDALDatasetStartTransaction(GDALDatasetH hDS,
                                int bForce) -> OGRErr

For datasources which support transactions, StartTransaction creates a transaction.

### Parameters
* **hDS**: the dataset handle.
* **bForce**: can be set to TRUE if an emulation, possibly slow, of a transaction mechanism is acceptable.

### Returns
OGRERR_NONE on success.
"""
function gdaldatasetstarttransaction(hDS, bForce)
    aftercare(ccall((:GDALDatasetStartTransaction, libgdal), OGRErr, (GDALDatasetH, Cint), hDS, bForce))
end

"""
    GDALDatasetCommitTransaction(GDALDatasetH hDS) -> OGRErr

For datasources which support transactions, CommitTransaction commits a transaction.

### Returns
OGRERR_NONE on success.
"""
function gdaldatasetcommittransaction(hDS)
    aftercare(ccall((:GDALDatasetCommitTransaction, libgdal), OGRErr, (GDALDatasetH,), hDS))
end

"""
    GDALDatasetRollbackTransaction(GDALDatasetH hDS) -> OGRErr

For datasources which support transactions, RollbackTransaction will roll back a datasource to its state before the start of the current transaction.

### Returns
OGRERR_NONE on success.
"""
function gdaldatasetrollbacktransaction(hDS)
    aftercare(ccall((:GDALDatasetRollbackTransaction, libgdal), OGRErr, (GDALDatasetH,), hDS))
end

"""
    GDALDatasetClearStatistics(GDALDatasetH hDS) -> void

Clear statistics.
"""
function gdaldatasetclearstatistics(hDS)
    aftercare(ccall((:GDALDatasetClearStatistics, libgdal), Cvoid, (GDALDatasetH,), hDS))
end

"""
Type of functions to pass to [`GDALAddDerivedBandPixelFunc`](@ref). 

\\since GDAL 2.2 
"""
const GDALDerivedPixelFunc = Ptr{Cvoid}

"""
    GDALGetRasterDataType(GDALRasterBandH hBand) -> GDALDataType

Fetch the pixel data type for this band.
"""
function gdalgetrasterdatatype(arg1)
    aftercare(ccall((:GDALGetRasterDataType, libgdal), GDALDataType, (GDALRasterBandH,), arg1))
end

"""
    GDALGetBlockSize(GDALRasterBandH hBand,
                     int * pnXSize,
                     int * pnYSize) -> void

Fetch the "natural" block size of this band.
"""
function gdalgetblocksize(arg1, pnXSize, pnYSize)
    aftercare(ccall((:GDALGetBlockSize, libgdal), Cvoid, (GDALRasterBandH, Ptr{Cint}, Ptr{Cint}), arg1, pnXSize, pnYSize))
end

"""
    GDALGetActualBlockSize(GDALRasterBandH hBand,
                           int nXBlockOff,
                           int nYBlockOff,
                           int * pnXValid,
                           int * pnYValid) -> CPLErr

Retrieve the actual block size for a given block offset.
"""
function gdalgetactualblocksize(arg1, nXBlockOff, nYBlockOff, pnXValid, pnYValid)
    aftercare(ccall((:GDALGetActualBlockSize, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cint}, Ptr{Cint}), arg1, nXBlockOff, nYBlockOff, pnXValid, pnYValid))
end

"""
    GDALRasterAdviseRead(GDALRasterBandH hBand,
                         int nXOff,
                         int nYOff,
                         int nXSize,
                         int nYSize,
                         int nBufXSize,
                         int nBufYSize,
                         GDALDataType eDT,
                         CSLConstList papszOptions) -> CPLErr

Advise driver of upcoming read requests.
"""
function gdalrasteradviseread(hRB, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, papszOptions)
    aftercare(ccall((:GDALRasterAdviseRead, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, CSLConstList), hRB, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, papszOptions))
end

"""
    GDALRasterIO(GDALRasterBandH hBand,
                 GDALRWFlag eRWFlag,
                 int nXOff,
                 int nYOff,
                 int nXSize,
                 int nYSize,
                 void * pData,
                 int nBufXSize,
                 int nBufYSize,
                 GDALDataType eBufType,
                 int nPixelSpace,
                 int nLineSpace) -> CPLErr

Read/write a region of image data for this band.
"""
function gdalrasterio(hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace)
    aftercare(ccall((:GDALRasterIO, libgdal), CPLErr, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Cint), hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace))
end

"""
    GDALRasterIOEx(GDALRasterBandH hBand,
                   GDALRWFlag eRWFlag,
                   int nXOff,
                   int nYOff,
                   int nXSize,
                   int nYSize,
                   void * pData,
                   int nBufXSize,
                   int nBufYSize,
                   GDALDataType eBufType,
                   GSpacing nPixelSpace,
                   GSpacing nLineSpace,
                   GDALRasterIOExtraArg * psExtraArg) -> CPLErr

Read/write a region of image data for this band.
"""
function gdalrasterioex(hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace, psExtraArg)
    aftercare(ccall((:GDALRasterIOEx, libgdal), CPLErr, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, GSpacing, GSpacing, Ptr{GDALRasterIOExtraArg}), hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace, psExtraArg))
end

"""
    GDALReadBlock(GDALRasterBandH hBand,
                  int nXOff,
                  int nYOff,
                  void * pData) -> CPLErr

Read a block of image data efficiently.
"""
function gdalreadblock(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALReadBlock, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

"""
    GDALWriteBlock(GDALRasterBandH hBand,
                   int nXOff,
                   int nYOff,
                   void * pData) -> CPLErr

Write a block of image data efficiently.
"""
function gdalwriteblock(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALWriteBlock, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

"""
    GDALGetRasterBandXSize(GDALRasterBandH hBand) -> int

Fetch XSize of raster.
"""
function gdalgetrasterbandxsize(arg1)
    aftercare(ccall((:GDALGetRasterBandXSize, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterBandYSize(GDALRasterBandH hBand) -> int

Fetch YSize of raster.
"""
function gdalgetrasterbandysize(arg1)
    aftercare(ccall((:GDALGetRasterBandYSize, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterAccess(GDALRasterBandH hBand) -> GDALAccess

Find out if we have update permission for this band.
"""
function gdalgetrasteraccess(arg1)
    aftercare(ccall((:GDALGetRasterAccess, libgdal), GDALAccess, (GDALRasterBandH,), arg1))
end

"""
    GDALGetBandNumber(GDALRasterBandH hBand) -> int

Fetch the band number.
"""
function gdalgetbandnumber(arg1)
    aftercare(ccall((:GDALGetBandNumber, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetBandDataset(GDALRasterBandH hBand) -> GDALDatasetH

Fetch the owning dataset handle.
"""
function gdalgetbanddataset(arg1)
    aftercare(ccall((:GDALGetBandDataset, libgdal), GDALDatasetH, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterColorInterpretation(GDALRasterBandH hBand) -> GDALColorInterp

How should this band be interpreted as color?
"""
function gdalgetrastercolorinterpretation(arg1)
    aftercare(ccall((:GDALGetRasterColorInterpretation, libgdal), GDALColorInterp, (GDALRasterBandH,), arg1))
end

"""
    GDALSetRasterColorInterpretation(GDALRasterBandH hBand,
                                     GDALColorInterp eColorInterp) -> CPLErr

Set color interpretation of a band.
"""
function gdalsetrastercolorinterpretation(arg1, arg2)
    aftercare(ccall((:GDALSetRasterColorInterpretation, libgdal), CPLErr, (GDALRasterBandH, GDALColorInterp), arg1, arg2))
end

"""
    GDALGetRasterColorTable(GDALRasterBandH hBand) -> GDALColorTableH

Fetch the color table associated with band.
"""
function gdalgetrastercolortable(arg1)
    aftercare(ccall((:GDALGetRasterColorTable, libgdal), GDALColorTableH, (GDALRasterBandH,), arg1))
end

"""
    GDALSetRasterColorTable(GDALRasterBandH hBand,
                            GDALColorTableH hCT) -> CPLErr

Set the raster color table.
"""
function gdalsetrastercolortable(arg1, arg2)
    aftercare(ccall((:GDALSetRasterColorTable, libgdal), CPLErr, (GDALRasterBandH, GDALColorTableH), arg1, arg2))
end

"""
    GDALHasArbitraryOverviews(GDALRasterBandH hBand) -> int

Check for arbitrary overviews.
"""
function gdalhasarbitraryoverviews(arg1)
    aftercare(ccall((:GDALHasArbitraryOverviews, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetOverviewCount(GDALRasterBandH hBand) -> int

Return the number of overview layers available.
"""
function gdalgetoverviewcount(arg1)
    aftercare(ccall((:GDALGetOverviewCount, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetOverview(GDALRasterBandH hBand,
                    int i) -> GDALRasterBandH

Fetch overview raster band object.
"""
function gdalgetoverview(arg1, arg2)
    aftercare(ccall((:GDALGetOverview, libgdal), GDALRasterBandH, (GDALRasterBandH, Cint), arg1, arg2))
end

"""
    GDALGetRasterNoDataValue(GDALRasterBandH hBand,
                             int * pbSuccess) -> double

Fetch the no data value for this band.
"""
function gdalgetrasternodatavalue(arg1, arg2)
    aftercare(ccall((:GDALGetRasterNoDataValue, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, arg2))
end

"""
    GDALSetRasterNoDataValue(GDALRasterBandH hBand,
                             double dfValue) -> CPLErr

Set the no data value for this band.
"""
function gdalsetrasternodatavalue(arg1, arg2)
    aftercare(ccall((:GDALSetRasterNoDataValue, libgdal), CPLErr, (GDALRasterBandH, Cdouble), arg1, arg2))
end

"""
    GDALDeleteRasterNoDataValue(GDALRasterBandH hBand) -> CPLErr

Remove the no data value for this band.
"""
function gdaldeleterasternodatavalue(arg1)
    aftercare(ccall((:GDALDeleteRasterNoDataValue, libgdal), CPLErr, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterCategoryNames(GDALRasterBandH hBand) -> char **

Fetch the list of category names for this raster.
"""
function gdalgetrastercategorynames(arg1)
    aftercare(ccall((:GDALGetRasterCategoryNames, libgdal), Ptr{Cstring}, (GDALRasterBandH,), arg1))
end

"""
    GDALSetRasterCategoryNames(GDALRasterBandH hBand,
                               CSLConstList papszNames) -> CPLErr

Set the category names for this band.
"""
function gdalsetrastercategorynames(arg1, arg2)
    aftercare(ccall((:GDALSetRasterCategoryNames, libgdal), CPLErr, (GDALRasterBandH, CSLConstList), arg1, arg2))
end

"""
    GDALGetRasterMinimum(GDALRasterBandH hBand,
                         int * pbSuccess) -> double

Fetch the minimum value for this band.
"""
function gdalgetrasterminimum(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterMinimum, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

"""
    GDALGetRasterMaximum(GDALRasterBandH hBand,
                         int * pbSuccess) -> double

Fetch the maximum value for this band.
"""
function gdalgetrastermaximum(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterMaximum, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

"""
    GDALGetRasterStatistics(GDALRasterBandH hBand,
                            int bApproxOK,
                            int bForce,
                            double * pdfMin,
                            double * pdfMax,
                            double * pdfMean,
                            double * pdfStdDev) -> CPLErr

Fetch image statistics.
"""
function gdalgetrasterstatistics(arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev)
    aftercare(ccall((:GDALGetRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev))
end

"""
    GDALComputeRasterStatistics(GDALRasterBandH hBand,
                                int bApproxOK,
                                double * pdfMin,
                                double * pdfMax,
                                double * pdfMean,
                                double * pdfStdDev,
                                GDALProgressFunc pfnProgress,
                                void * pProgressData) -> CPLErr

Compute image statistics.
"""
function gdalcomputerasterstatistics(arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pfnProgress, pProgressData)
    aftercare(ccall((:GDALComputeRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pfnProgress, pProgressData))
end

"""
    GDALSetRasterStatistics(GDALRasterBandH hBand,
                            double dfMin,
                            double dfMax,
                            double dfMean,
                            double dfStdDev) -> CPLErr

Set statistics on band.
"""
function gdalsetrasterstatistics(hBand, dfMin, dfMax, dfMean, dfStdDev)
    aftercare(ccall((:GDALSetRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cdouble, Cdouble), hBand, dfMin, dfMax, dfMean, dfStdDev))
end

"""
    GDALRasterBandAsMDArray(GDALRasterBandH hBand) -> GDALMDArrayH

Return a view of this raster band as a 2D multidimensional GDALMDArray.

### Returns
a new array, or NULL.
"""
function gdalrasterbandasmdarray(arg1)
    aftercare(ccall((:GDALRasterBandAsMDArray, libgdal), GDALMDArrayH, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterUnitType(GDALRasterBandH hBand) -> const char *

Return raster unit type.
"""
function gdalgetrasterunittype(arg1)
    aftercare(ccall((:GDALGetRasterUnitType, libgdal), Cstring, (GDALRasterBandH,), arg1), false)
end

"""
    GDALSetRasterUnitType(GDALRasterBandH hBand,
                          const char * pszNewValue) -> CPLErr

Set unit type.
"""
function gdalsetrasterunittype(hBand, pszNewValue)
    aftercare(ccall((:GDALSetRasterUnitType, libgdal), CPLErr, (GDALRasterBandH, Cstring), hBand, pszNewValue))
end

"""
    GDALGetRasterOffset(GDALRasterBandH hBand,
                        int * pbSuccess) -> double

Fetch the raster value offset.
"""
function gdalgetrasteroffset(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterOffset, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

"""
    GDALSetRasterOffset(GDALRasterBandH hBand,
                        double dfNewOffset) -> CPLErr

Set scaling offset.
"""
function gdalsetrasteroffset(hBand, dfNewOffset)
    aftercare(ccall((:GDALSetRasterOffset, libgdal), CPLErr, (GDALRasterBandH, Cdouble), hBand, dfNewOffset))
end

"""
    GDALGetRasterScale(GDALRasterBandH hBand,
                       int * pbSuccess) -> double

Fetch the raster value scale.
"""
function gdalgetrasterscale(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterScale, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

"""
    GDALSetRasterScale(GDALRasterBandH hBand,
                       double dfNewOffset) -> CPLErr

Set scaling ratio.
"""
function gdalsetrasterscale(hBand, dfNewOffset)
    aftercare(ccall((:GDALSetRasterScale, libgdal), CPLErr, (GDALRasterBandH, Cdouble), hBand, dfNewOffset))
end

"""
    GDALComputeRasterMinMax(GDALRasterBandH hBand,
                            int bApproxOK,
                            double adfMinMax) -> void

Compute the min/max values for a band.
"""
function gdalcomputerasterminmax(hBand, bApproxOK, adfMinMax)
    aftercare(ccall((:GDALComputeRasterMinMax, libgdal), Cvoid, (GDALRasterBandH, Cint, Ptr{Cdouble}), hBand, bApproxOK, adfMinMax))
end

"""
    GDALFlushRasterCache(GDALRasterBandH hBand) -> CPLErr

Flush raster data cache.
"""
function gdalflushrastercache(hBand)
    aftercare(ccall((:GDALFlushRasterCache, libgdal), CPLErr, (GDALRasterBandH,), hBand))
end

"""
    GDALGetRasterHistogram(GDALRasterBandH hBand,
                           double dfMin,
                           double dfMax,
                           int nBuckets,
                           int * panHistogram,
                           int bIncludeOutOfRange,
                           int bApproxOK,
                           GDALProgressFunc pfnProgress,
                           void * pProgressData) -> CPLErr

Compute raster histogram.
"""
function gdalgetrasterhistogram(hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetRasterHistogram, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cint}, Cint, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData))
end

"""
    GDALGetRasterHistogramEx(GDALRasterBandH hBand,
                             double dfMin,
                             double dfMax,
                             int nBuckets,
                             GUIntBig * panHistogram,
                             int bIncludeOutOfRange,
                             int bApproxOK,
                             GDALProgressFunc pfnProgress,
                             void * pProgressData) -> CPLErr

Compute raster histogram.
"""
function gdalgetrasterhistogramex(hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetRasterHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{GUIntBig}, Cint, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData))
end

"""
    GDALGetDefaultHistogram(GDALRasterBandH hBand,
                            double * pdfMin,
                            double * pdfMax,
                            int * pnBuckets,
                            int ** ppanHistogram,
                            int bForce,
                            GDALProgressFunc pfnProgress,
                            void * pProgressData) -> CPLErr

Fetch default raster histogram.
"""
function gdalgetdefaulthistogram(hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetDefaultHistogram, libgdal), CPLErr, (GDALRasterBandH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cint}}, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData))
end

"""
    GDALGetDefaultHistogramEx(GDALRasterBandH hBand,
                              double * pdfMin,
                              double * pdfMax,
                              int * pnBuckets,
                              GUIntBig ** ppanHistogram,
                              int bForce,
                              GDALProgressFunc pfnProgress,
                              void * pProgressData) -> CPLErr

Fetch default raster histogram.
"""
function gdalgetdefaulthistogramex(hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetDefaultHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{GUIntBig}}, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData))
end

"""
    GDALSetDefaultHistogram(GDALRasterBandH hBand,
                            double dfMin,
                            double dfMax,
                            int nBuckets,
                            int * panHistogram) -> CPLErr

Set default histogram.
"""
function gdalsetdefaulthistogram(hBand, dfMin, dfMax, nBuckets, panHistogram)
    aftercare(ccall((:GDALSetDefaultHistogram, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cint}), hBand, dfMin, dfMax, nBuckets, panHistogram))
end

"""
    GDALSetDefaultHistogramEx(GDALRasterBandH hBand,
                              double dfMin,
                              double dfMax,
                              int nBuckets,
                              GUIntBig * panHistogram) -> CPLErr

Set default histogram.
"""
function gdalsetdefaulthistogramex(hBand, dfMin, dfMax, nBuckets, panHistogram)
    aftercare(ccall((:GDALSetDefaultHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{GUIntBig}), hBand, dfMin, dfMax, nBuckets, panHistogram))
end

"""
    GDALGetRandomRasterSample(GDALRasterBandH hBand,
                              int nSamples,
                              float * pafSampleBuf) -> int

Undocumented.

### Parameters
* **hBand**: undocumented.
* **nSamples**: undocumented.
* **pafSampleBuf**: undocumented.

### Returns
undocumented
"""
function gdalgetrandomrastersample(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetRandomRasterSample, libgdal), Cint, (GDALRasterBandH, Cint, Ptr{Cfloat}), arg1, arg2, arg3))
end

"""
    GDALGetRasterSampleOverview(GDALRasterBandH hBand,
                                int nDesiredSamples) -> GDALRasterBandH

Fetch best sampling overview.
"""
function gdalgetrastersampleoverview(arg1, arg2)
    aftercare(ccall((:GDALGetRasterSampleOverview, libgdal), GDALRasterBandH, (GDALRasterBandH, Cint), arg1, arg2))
end

"""
    GDALGetRasterSampleOverviewEx(GDALRasterBandH hBand,
                                  GUIntBig nDesiredSamples) -> GDALRasterBandH

Fetch best sampling overview.
"""
function gdalgetrastersampleoverviewex(arg1, arg2)
    aftercare(ccall((:GDALGetRasterSampleOverviewEx, libgdal), GDALRasterBandH, (GDALRasterBandH, GUIntBig), arg1, arg2))
end

"""
    GDALFillRaster(GDALRasterBandH hBand,
                   double dfRealValue,
                   double dfImaginaryValue) -> CPLErr

Fill this band with a constant value.
"""
function gdalfillraster(hBand, dfRealValue, dfImaginaryValue)
    aftercare(ccall((:GDALFillRaster, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble), hBand, dfRealValue, dfImaginaryValue))
end

"""
    GDALComputeBandStats(GDALRasterBandH hSrcBand,
                         int nSampleStep,
                         double * pdfMean,
                         double * pdfStdDev,
                         GDALProgressFunc pfnProgress,
                         void * pProgressData) -> CPLErr

Undocumented.

### Parameters
* **hSrcBand**: undocumented.
* **nSampleStep**: undocumented.
* **pdfMean**: undocumented.
* **pdfStdDev**: undocumented.
* **pfnProgress**: undocumented.
* **pProgressData**: undocumented.

### Returns
undocumented
"""
function gdalcomputebandstats(hBand, nSampleStep, pdfMean, pdfStdDev, pfnProgress, pProgressData)
    aftercare(ccall((:GDALComputeBandStats, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), hBand, nSampleStep, pdfMean, pdfStdDev, pfnProgress, pProgressData))
end

"""
    GDALOverviewMagnitudeCorrection(GDALRasterBandH hBaseBand,
                                    int nOverviewCount,
                                    GDALRasterBandH * pahOverviews,
                                    GDALProgressFunc pfnProgress,
                                    void * pProgressData) -> CPLErr

Undocumented.

### Parameters
* **hBaseBand**: undocumented.
* **nOverviewCount**: undocumented.
* **pahOverviews**: undocumented.
* **pfnProgress**: undocumented.
* **pProgressData**: undocumented.

### Returns
undocumented
"""
function gdaloverviewmagnitudecorrection(hBaseBand, nOverviewCount, pahOverviews, pfnProgress, pProgressData)
    aftercare(ccall((:GDALOverviewMagnitudeCorrection, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{GDALRasterBandH}, GDALProgressFunc, Ptr{Cvoid}), hBaseBand, nOverviewCount, pahOverviews, pfnProgress, pProgressData))
end

"""
    GDALGetDefaultRAT(GDALRasterBandH hBand) -> GDALRasterAttributeTableH

Fetch default Raster Attribute Table.
"""
function gdalgetdefaultrat(hBand)
    aftercare(ccall((:GDALGetDefaultRAT, libgdal), GDALRasterAttributeTableH, (GDALRasterBandH,), hBand))
end

"""
    GDALSetDefaultRAT(GDALRasterBandH hBand,
                      GDALRasterAttributeTableH hRAT) -> CPLErr

Set default Raster Attribute Table.
"""
function gdalsetdefaultrat(arg1, arg2)
    aftercare(ccall((:GDALSetDefaultRAT, libgdal), CPLErr, (GDALRasterBandH, GDALRasterAttributeTableH), arg1, arg2))
end

"""
    GDALAddDerivedBandPixelFunc(const char * pszFuncName,
                                GDALDerivedPixelFunc pfnNewFunction) -> CPLErr

This adds a pixel function to the global list of available pixel functions for derived bands.

### Parameters
* **pszFuncName**: Name used to access pixel function
* **pfnNewFunction**: Pixel function associated with name. An existing pixel function registered with the same name will be replaced with the new one.

### Returns
CE_None, invalid (NULL) parameters are currently ignored.
"""
function gdaladdderivedbandpixelfunc(pszName, pfnPixelFunc)
    aftercare(ccall((:GDALAddDerivedBandPixelFunc, libgdal), CPLErr, (Cstring, GDALDerivedPixelFunc), pszName, pfnPixelFunc))
end

"""
    GDALGetMaskBand(GDALRasterBandH hBand) -> GDALRasterBandH

Return the mask band associated with the band.
"""
function gdalgetmaskband(hBand)
    aftercare(ccall((:GDALGetMaskBand, libgdal), GDALRasterBandH, (GDALRasterBandH,), hBand))
end

"""
    GDALGetMaskFlags(GDALRasterBandH hBand) -> int

Return the status flags of the mask band associated with the band.
"""
function gdalgetmaskflags(hBand)
    aftercare(ccall((:GDALGetMaskFlags, libgdal), Cint, (GDALRasterBandH,), hBand))
end

"""
    GDALCreateMaskBand(GDALRasterBandH hBand,
                       int nFlags) -> CPLErr

Adds a mask band to the current band.
"""
function gdalcreatemaskband(hBand, nFlags)
    aftercare(ccall((:GDALCreateMaskBand, libgdal), CPLErr, (GDALRasterBandH, Cint), hBand, nFlags))
end

"""
    GDALGetDataCoverageStatus(GDALRasterBandH hBand,
                              int nXOff,
                              int nYOff,
                              int nXSize,
                              int nYSize,
                              int nMaskFlagStop,
                              double * pdfDataPct) -> int

Get the coverage status of a sub-window of the raster.

### Parameters
* **hBand**: raster band
* **nXOff**: The pixel offset to the top left corner of the region of the band to be queried. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be queried. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be queried in pixels.
* **nYSize**: The height of the region of the band to be queried in lines.
* **nMaskFlagStop**: 0, or a binary-or'ed mask of possible values GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED, GDAL_DATA_COVERAGE_STATUS_DATA and GDAL_DATA_COVERAGE_STATUS_EMPTY. As soon as the computation of the coverage matches the mask, the computation will be stopped. *pdfDataPct will not be valid in that case.
* **pdfDataPct**: Optional output parameter whose pointed value will be set to the (approximate) percentage in [0,100] of pixels in the queried sub-window that have valid values. The implementation might not always be able to compute it, in which case it will be set to a negative value.

### Returns
a binary-or'ed combination of possible values GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED, GDAL_DATA_COVERAGE_STATUS_DATA and GDAL_DATA_COVERAGE_STATUS_EMPTY
"""
function gdalgetdatacoveragestatus(hBand, nXOff, nYOff, nXSize, nYSize, nMaskFlagStop, pdfDataPct)
    aftercare(ccall((:GDALGetDataCoverageStatus, libgdal), Cint, (GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Ptr{Cdouble}), hBand, nXOff, nYOff, nXSize, nYSize, nMaskFlagStop, pdfDataPct))
end

"""
    GDALARGetNextUpdatedRegion(GDALAsyncReaderH hARIO,
                               double dfTimeout,
                               int * pnBufXOff,
                               int * pnBufYOff,
                               int * pnBufXSize,
                               int * pnBufYSize) -> GDALAsyncStatusType

Get async IO update.

### Parameters
* **hARIO**: handle to the async reader.
* **dfTimeout**: the number of seconds to wait for additional updates. Use -1 to wait indefinitely, or zero to not wait at all if there is no data available.
* **pnBufXOff**: location to return the X offset of the area of the request buffer that has been updated.
* **pnBufYOff**: location to return the Y offset of the area of the request buffer that has been updated.
* **pnBufXSize**: location to return the X size of the area of the request buffer that has been updated.
* **pnBufYSize**: location to return the Y size of the area of the request buffer that has been updated.

### Returns
GARIO_ status, details described above.
"""
function gdalargetnextupdatedregion(hARIO, dfTimeout, pnXBufOff, pnYBufOff, pnXBufSize, pnYBufSize)
    aftercare(ccall((:GDALARGetNextUpdatedRegion, libgdal), GDALAsyncStatusType, (GDALAsyncReaderH, Cdouble, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), hARIO, dfTimeout, pnXBufOff, pnYBufOff, pnXBufSize, pnYBufSize))
end

"""
    GDALARLockBuffer(GDALAsyncReaderH hARIO,
                     double dfTimeout) -> int

Lock image buffer.

### Parameters
* **hARIO**: handle to async reader.
* **dfTimeout**: the time in seconds to wait attempting to lock the buffer. -1.0 to wait indefinitely and 0 to not wait at all if it can't be acquired immediately. Default is -1.0 (infinite wait).

### Returns
TRUE if successful, or FALSE on an error.
"""
function gdalarlockbuffer(hARIO, dfTimeout)
    aftercare(ccall((:GDALARLockBuffer, libgdal), Cint, (GDALAsyncReaderH, Cdouble), hARIO, dfTimeout))
end

"""
    GDALARUnlockBuffer(GDALAsyncReaderH hARIO) -> void

Unlock image buffer.

### Parameters
* **hARIO**: handle to async reader.
"""
function gdalarunlockbuffer(hARIO)
    aftercare(ccall((:GDALARUnlockBuffer, libgdal), Cvoid, (GDALAsyncReaderH,), hARIO))
end

"""
    GDALGeneralCmdLineProcessor(int nArgc,
                                char *** ppapszArgv,
                                int nOptions) -> int

General utility option processing.

### Parameters
* **nArgc**: number of values in the argument list.
* **ppapszArgv**: pointer to the argument list array (will be updated in place).
* **nOptions**: a or-able combination of GDAL_OF_RASTER and GDAL_OF_VECTOR to determine which drivers should be displayed by formats. If set to 0, GDAL_OF_RASTER is assumed.

### Returns
updated nArgc argument count. Return of 0 requests terminate without error, return of -1 requests exit with error code.
"""
function gdalgeneralcmdlineprocessor(nArgc, ppapszArgv, nOptions)
    aftercare(ccall((:GDALGeneralCmdLineProcessor, libgdal), Cint, (Cint, Ptr{Ptr{Cstring}}, Cint), nArgc, ppapszArgv, nOptions))
end

"""
    GDALSwapWords(void * pData,
                  int nWordSize,
                  int nWordCount,
                  int nWordSkip) -> void

Byte swap words in-place.

### Parameters
* **pData**: pointer to start of data buffer.
* **nWordSize**: size of words being swapped in bytes. Normally 2, 4 or 8.
* **nWordCount**: the number of words to be swapped in this call.
* **nWordSkip**: the byte offset from the start of one word to the start of the next. For packed buffers this is the same as nWordSize.
"""
function gdalswapwords(pData, nWordSize, nWordCount, nWordSkip)
    aftercare(ccall((:GDALSwapWords, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Cint, Cint), pData, nWordSize, nWordCount, nWordSkip))
end

"""
    GDALSwapWordsEx(void * pData,
                    int nWordSize,
                    size_t nWordCount,
                    int nWordSkip) -> void

Byte swap words in-place.

### Parameters
* **pData**: pointer to start of data buffer.
* **nWordSize**: size of words being swapped in bytes. Normally 2, 4 or 8.
* **nWordCount**: the number of words to be swapped in this call.
* **nWordSkip**: the byte offset from the start of one word to the start of the next. For packed buffers this is the same as nWordSize.
"""
function gdalswapwordsex(pData, nWordSize, nWordCount, nWordSkip)
    aftercare(ccall((:GDALSwapWordsEx, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Csize_t, Cint), pData, nWordSize, nWordCount, nWordSkip))
end

"""
    GDALCopyWords(const void * pSrcData,
                  GDALDataType eSrcType,
                  int nSrcPixelStride,
                  void * pDstData,
                  GDALDataType eDstType,
                  int nDstPixelStride,
                  int nWordCount) -> void

Copy pixel words from buffer to buffer.
"""
function gdalcopywords(pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount)
    aftercare(ccall((:GDALCopyWords, libgdal), Cvoid, (Ptr{Cvoid}, GDALDataType, Cint, Ptr{Cvoid}, GDALDataType, Cint, Cint), pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount))
end

"""
    GDALCopyWords64(const void * pSrcData,
                    GDALDataType eSrcType,
                    int nSrcPixelStride,
                    void * pDstData,
                    GDALDataType eDstType,
                    int nDstPixelStride,
                    GPtrDiff_t nWordCount) -> void

Copy pixel words from buffer to buffer.

### Parameters
* **pSrcData**: Pointer to source data to be converted.
* **eSrcType**: the source data type (see GDALDataType enum)
* **nSrcPixelStride**: Source pixel stride (i.e. distance between 2 words), in bytes
* **pDstData**: Pointer to buffer where destination data should go
* **eDstType**: the destination data type (see GDALDataType enum)
* **nDstPixelStride**: Destination pixel stride (i.e. distance between 2 words), in bytes
* **nWordCount**: number of words to be copied
"""
function gdalcopywords64(pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount)
    aftercare(ccall((:GDALCopyWords64, libgdal), Cvoid, (Ptr{Cvoid}, GDALDataType, Cint, Ptr{Cvoid}, GDALDataType, Cint, GPtrDiff_t), pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount))
end

"""
    GDALCopyBits(const GByte * pabySrcData,
                 int nSrcOffset,
                 int nSrcStep,
                 GByte * pabyDstData,
                 int nDstOffset,
                 int nDstStep,
                 int nBitCount,
                 int nStepCount) -> void

Bitwise word copying.

### Parameters
* **pabySrcData**: the source data buffer.
* **nSrcOffset**: the offset (in bits) in pabySrcData to the start of the first word to copy.
* **nSrcStep**: the offset in bits from the start one source word to the start of the next.
* **pabyDstData**: the destination data buffer.
* **nDstOffset**: the offset (in bits) in pabyDstData to the start of the first word to copy over.
* **nDstStep**: the offset in bits from the start one word to the start of the next.
* **nBitCount**: the number of bits in a word to be copied.
* **nStepCount**: the number of words to copy.
"""
function gdalcopybits(pabySrcData, nSrcOffset, nSrcStep, pabyDstData, nDstOffset, nDstStep, nBitCount, nStepCount)
    aftercare(ccall((:GDALCopyBits, libgdal), Cvoid, (Ptr{GByte}, Cint, Cint, Ptr{GByte}, Cint, Cint, Cint, Cint), pabySrcData, nSrcOffset, nSrcStep, pabyDstData, nDstOffset, nDstStep, nBitCount, nStepCount))
end

"""
    GDALLoadWorldFile(const char * pszFilename,
                      double * padfGeoTransform) -> int

Read ESRI world file.

### Parameters
* **pszFilename**: the world file name.
* **padfGeoTransform**: the six double array into which the geotransformation should be placed.

### Returns
TRUE on success or FALSE on failure.
"""
function gdalloadworldfile(arg1, arg2)
    aftercare(ccall((:GDALLoadWorldFile, libgdal), Cint, (Cstring, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALReadWorldFile(const char * pszBaseFilename,
                      const char * pszExtension,
                      double * padfGeoTransform) -> int

Read ESRI world file.

### Parameters
* **pszBaseFilename**: the target raster file.
* **pszExtension**: the extension to use (i.e. "wld") or NULL to derive it from the pszBaseFilename
* **padfGeoTransform**: the six double array into which the geotransformation should be placed.

### Returns
TRUE on success or FALSE on failure.
"""
function gdalreadworldfile(arg1, arg2, arg3)
    aftercare(ccall((:GDALReadWorldFile, libgdal), Cint, (Cstring, Cstring, Ptr{Cdouble}), arg1, arg2, arg3))
end

"""
    GDALWriteWorldFile(const char * pszBaseFilename,
                       const char * pszExtension,
                       double * padfGeoTransform) -> int

Write ESRI world file.

### Parameters
* **pszBaseFilename**: the target raster file.
* **pszExtension**: the extension to use (i.e. "wld"). Must not be NULL
* **padfGeoTransform**: the six double array from which the geotransformation should be read.

### Returns
TRUE on success or FALSE on failure.
"""
function gdalwriteworldfile(arg1, arg2, arg3)
    aftercare(ccall((:GDALWriteWorldFile, libgdal), Cint, (Cstring, Cstring, Ptr{Cdouble}), arg1, arg2, arg3))
end

"""
    GDALLoadTabFile(const char * pszFilename,
                    double * padfGeoTransform,
                    char ** ppszWKT,
                    int * pnGCPCount,
                    GDAL_GCP ** ppasGCPs) -> int

Helper function for translator implementer wanting support for MapInfo .tab files.

### Parameters
* **pszFilename**: filename of .tab
* **padfGeoTransform**: output geotransform. Must hold 6 doubles.
* **ppszWKT**: output pointer to a string that will be allocated with CPLMalloc().
* **pnGCPCount**: output pointer to GCP count.
* **ppasGCPs**: outputer pointer to an array of GCPs.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function gdalloadtabfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALLoadTabFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALReadTabFile(const char * pszBaseFilename,
                    double * padfGeoTransform,
                    char ** ppszWKT,
                    int * pnGCPCount,
                    GDAL_GCP ** ppasGCPs) -> int

Helper function for translator implementer wanting support for MapInfo .tab files.

### Parameters
* **pszBaseFilename**: filename whose basename will help building the .tab filename.
* **padfGeoTransform**: output geotransform. Must hold 6 doubles.
* **ppszWKT**: output pointer to a string that will be allocated with CPLMalloc().
* **pnGCPCount**: output pointer to GCP count.
* **ppasGCPs**: outputer pointer to an array of GCPs.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function gdalreadtabfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALReadTabFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALLoadOziMapFile(const char * pszFilename,
                       double * padfGeoTransform,
                       char ** ppszWKT,
                       int * pnGCPCount,
                       GDAL_GCP ** ppasGCPs) -> int

Helper function for translator implementer wanting support for OZI .map.

### Parameters
* **pszFilename**: filename of .tab file
* **padfGeoTransform**: output geotransform. Must hold 6 doubles.
* **ppszWKT**: output pointer to a string that will be allocated with CPLMalloc().
* **pnGCPCount**: output pointer to GCP count.
* **ppasGCPs**: outputer pointer to an array of GCPs.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function gdalloadozimapfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALLoadOziMapFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALReadOziMapFile(const char * pszBaseFilename,
                       double * padfGeoTransform,
                       char ** ppszWKT,
                       int * pnGCPCount,
                       GDAL_GCP ** ppasGCPs) -> int

Helper function for translator implementer wanting support for OZI .map.

### Parameters
* **pszBaseFilename**: filename whose basename will help building the .map filename.
* **padfGeoTransform**: output geotransform. Must hold 6 doubles.
* **ppszWKT**: output pointer to a string that will be allocated with CPLMalloc().
* **pnGCPCount**: output pointer to GCP count.
* **ppasGCPs**: outputer pointer to an array of GCPs.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function gdalreadozimapfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALReadOziMapFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALDecToDMS(double dfAngle,
                 const char * pszAxis,
                 int nPrecision) -> const char *

Translate a decimal degrees value to a DMS string with hemisphere.
"""
function gdaldectodms(arg1, arg2, arg3)
    aftercare(ccall((:GDALDecToDMS, libgdal), Cstring, (Cdouble, Cstring, Cint), arg1, arg2, arg3), false)
end

"""
    GDALPackedDMSToDec(double dfPacked) -> double

Convert a packed DMS value (DDDMMMSSS.SS) into decimal degrees.
"""
function gdalpackeddmstodec(arg1)
    aftercare(ccall((:GDALPackedDMSToDec, libgdal), Cdouble, (Cdouble,), arg1))
end

"""
    GDALDecToPackedDMS(double dfDec) -> double

Convert decimal degrees into packed DMS value (DDDMMMSSS.SS).
"""
function gdaldectopackeddms(arg1)
    aftercare(ccall((:GDALDecToPackedDMS, libgdal), Cdouble, (Cdouble,), arg1))
end

"""
    GDALRPCInfo

Structure to store Rational Polynomial Coefficients / Rigorous Projection Model. See http://geotiff.maptools.org/rpc\\_prop.html 

| Field                 | Note                                    |
| :-------------------- | :-------------------------------------- |
| dfLINE\\_OFF          | Line offset                             |
| dfSAMP\\_OFF          | Sample/Pixel offset                     |
| dfLAT\\_OFF           | Latitude offset                         |
| dfLONG\\_OFF          | Longitude offset                        |
| dfHEIGHT\\_OFF        | Height offset                           |
| dfLINE\\_SCALE        | Line scale                              |
| dfSAMP\\_SCALE        | Sample/Pixel scale                      |
| dfLAT\\_SCALE         | Latitude scale                          |
| dfLONG\\_SCALE        | Longitude scale                         |
| dfHEIGHT\\_SCALE      | Height scale                            |
| adfLINE\\_NUM\\_COEFF | Line Numerator Coefficients             |
| adfLINE\\_DEN\\_COEFF | Line Denominator Coefficients           |
| adfSAMP\\_NUM\\_COEFF | Sample/Pixel Numerator Coefficients     |
| adfSAMP\\_DEN\\_COEFF | Sample/Pixel Denominator Coefficients   |
| dfMIN\\_LONG          | Minimum longitude                       |
| dfMIN\\_LAT           | Minimum latitude                        |
| dfMAX\\_LONG          | Maximum longitude                       |
| dfMAX\\_LAT           | Maximum latitude                        |
"""
struct GDALRPCInfo
    dfLINE_OFF::Cdouble
    dfSAMP_OFF::Cdouble
    dfLAT_OFF::Cdouble
    dfLONG_OFF::Cdouble
    dfHEIGHT_OFF::Cdouble
    dfLINE_SCALE::Cdouble
    dfSAMP_SCALE::Cdouble
    dfLAT_SCALE::Cdouble
    dfLONG_SCALE::Cdouble
    dfHEIGHT_SCALE::Cdouble
    adfLINE_NUM_COEFF::NTuple{20, Cdouble}
    adfLINE_DEN_COEFF::NTuple{20, Cdouble}
    adfSAMP_NUM_COEFF::NTuple{20, Cdouble}
    adfSAMP_DEN_COEFF::NTuple{20, Cdouble}
    dfMIN_LONG::Cdouble
    dfMIN_LAT::Cdouble
    dfMAX_LONG::Cdouble
    dfMAX_LAT::Cdouble
end

function gdalextractrpcinfo(arg1, arg2)
    aftercare(ccall((:GDALExtractRPCInfo, libgdal), Cint, (CSLConstList, Ptr{GDALRPCInfo}), arg1, arg2))
end

"""
    GDALColorEntry

Color tuple 

| Field | Note                           |
| :---- | :----------------------------- |
| c1    | gray, red, cyan or hue         |
| c2    | green, magenta, or lightness   |
| c3    | blue, yellow, or saturation    |
| c4    | alpha or blackband             |
"""
struct GDALColorEntry
    c1::Cshort
    c2::Cshort
    c3::Cshort
    c4::Cshort
end

"""
    GDALCreateColorTable(GDALPaletteInterp eInterp) -> GDALColorTableH

Construct a new color table.
"""
function gdalcreatecolortable(arg1)
    aftercare(ccall((:GDALCreateColorTable, libgdal), GDALColorTableH, (GDALPaletteInterp,), arg1))
end

"""
    GDALDestroyColorTable(GDALColorTableH hTable) -> void

Destroys a color table.
"""
function gdaldestroycolortable(arg1)
    aftercare(ccall((:GDALDestroyColorTable, libgdal), Cvoid, (GDALColorTableH,), arg1))
end

"""
    GDALCloneColorTable(GDALColorTableH hTable) -> GDALColorTableH

Make a copy of a color table.
"""
function gdalclonecolortable(arg1)
    aftercare(ccall((:GDALCloneColorTable, libgdal), GDALColorTableH, (GDALColorTableH,), arg1))
end

"""
    GDALGetPaletteInterpretation(GDALColorTableH hTable) -> GDALPaletteInterp

Fetch palette interpretation.
"""
function gdalgetpaletteinterpretation(arg1)
    aftercare(ccall((:GDALGetPaletteInterpretation, libgdal), GDALPaletteInterp, (GDALColorTableH,), arg1))
end

"""
    GDALGetColorEntryCount(GDALColorTableH hTable) -> int

Get number of color entries in table.
"""
function gdalgetcolorentrycount(arg1)
    aftercare(ccall((:GDALGetColorEntryCount, libgdal), Cint, (GDALColorTableH,), arg1))
end

"""
    GDALGetColorEntry(GDALColorTableH hTable,
                      int i) -> const GDALColorEntry *

Fetch a color entry from table.
"""
function gdalgetcolorentry(arg1, arg2)
    aftercare(ccall((:GDALGetColorEntry, libgdal), Ptr{GDALColorEntry}, (GDALColorTableH, Cint), arg1, arg2))
end

"""
    GDALGetColorEntryAsRGB(GDALColorTableH hTable,
                           int i,
                           GDALColorEntry * poEntry) -> int

Fetch a table entry in RGB format.
"""
function gdalgetcolorentryasrgb(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetColorEntryAsRGB, libgdal), Cint, (GDALColorTableH, Cint, Ptr{GDALColorEntry}), arg1, arg2, arg3))
end

"""
    GDALSetColorEntry(GDALColorTableH hTable,
                      int i,
                      const GDALColorEntry * poEntry) -> void

Set entry in color table.
"""
function gdalsetcolorentry(arg1, arg2, arg3)
    aftercare(ccall((:GDALSetColorEntry, libgdal), Cvoid, (GDALColorTableH, Cint, Ptr{GDALColorEntry}), arg1, arg2, arg3))
end

"""
    GDALCreateColorRamp(GDALColorTableH hTable,
                        int nStartIndex,
                        const GDALColorEntry * psStartColor,
                        int nEndIndex,
                        const GDALColorEntry * psEndColor) -> void

Create color ramp.
"""
function gdalcreatecolorramp(hTable, nStartIndex, psStartColor, nEndIndex, psEndColor)
    aftercare(ccall((:GDALCreateColorRamp, libgdal), Cvoid, (GDALColorTableH, Cint, Ptr{GDALColorEntry}, Cint, Ptr{GDALColorEntry}), hTable, nStartIndex, psStartColor, nEndIndex, psEndColor))
end

"""
    GDALRATFieldType

Field type of raster attribute table 

| Enumerator    | Note                            |
| :------------ | :------------------------------ |
| GFT\\_Integer | Integer field                   |
| GFT\\_Real    | Floating point (double) field   |
| GFT\\_String  | String field                    |
"""
@cenum GDALRATFieldType::UInt32 begin
        GFT_Integer = 0
        GFT_Real = 1
        GFT_String = 2
    end

"""
    GDALRATFieldUsage

Field usage of raster attribute table 

| Enumerator       | Note                                                       |
| :--------------- | :--------------------------------------------------------- |
| GFU\\_Generic    | General purpose field.                                     |
| GFU\\_PixelCount | Histogram pixel count                                      |
| GFU\\_Name       | Class name                                                 |
| GFU\\_Min        | Class range minimum                                        |
| GFU\\_Max        | Class range maximum                                        |
| GFU\\_MinMax     | Class value (min=max)                                      |
| GFU\\_Red        | Red class color (0-255)                                    |
| GFU\\_Green      | Green class color (0-255)                                  |
| GFU\\_Blue       | Blue class color (0-255)                                   |
| GFU\\_Alpha      | Alpha (0=transparent,255=opaque)                           |
| GFU\\_RedMin     | Color Range Red Minimum                                    |
| GFU\\_GreenMin   | Color Range Green Minimum                                  |
| GFU\\_BlueMin    | Color Range Blue Minimum                                   |
| GFU\\_AlphaMin   | Color Range Alpha Minimum                                  |
| GFU\\_RedMax     | Color Range Red Maximum                                    |
| GFU\\_GreenMax   | Color Range Green Maximum                                  |
| GFU\\_BlueMax    | Color Range Blue Maximum                                   |
| GFU\\_AlphaMax   | Color Range Alpha Maximum                                  |
| GFU\\_MaxCount   | Maximum GFU value (equals to GFU\\_AlphaMax+1 currently)   |
"""
@cenum GDALRATFieldUsage::UInt32 begin
        GFU_Generic = 0
        GFU_PixelCount = 1
        GFU_Name = 2
        GFU_Min = 3
        GFU_Max = 4
        GFU_MinMax = 5
        GFU_Red = 6
        GFU_Green = 7
        GFU_Blue = 8
        GFU_Alpha = 9
        GFU_RedMin = 10
        GFU_GreenMin = 11
        GFU_BlueMin = 12
        GFU_AlphaMin = 13
        GFU_RedMax = 14
        GFU_GreenMax = 15
        GFU_BlueMax = 16
        GFU_AlphaMax = 17
        GFU_MaxCount = 18
    end

"""
    GDALRATTableType

RAT table type (thematic or athematic) 

\\since GDAL 2.4

| Enumerator       | Note                   |
| :--------------- | :--------------------- |
| GRTT\\_THEMATIC  | Thematic table type    |
| GRTT\\_ATHEMATIC | Athematic table type   |
"""
@cenum GDALRATTableType::UInt32 begin
        GRTT_THEMATIC = 0
        GRTT_ATHEMATIC = 1
    end

"""
    GDALCreateRasterAttributeTable() -> GDALRasterAttributeTableH

Construct empty table.
"""
function gdalcreaterasterattributetable()
    aftercare(ccall((:GDALCreateRasterAttributeTable, libgdal), GDALRasterAttributeTableH, ()))
end

"""
    GDALDestroyRasterAttributeTable(GDALRasterAttributeTableH hRAT) -> void

Destroys a RAT.
"""
function gdaldestroyrasterattributetable(arg1)
    aftercare(ccall((:GDALDestroyRasterAttributeTable, libgdal), Cvoid, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATGetColumnCount(GDALRasterAttributeTableH hRAT) -> int

Fetch table column count.
"""
function gdalratgetcolumncount(arg1)
    aftercare(ccall((:GDALRATGetColumnCount, libgdal), Cint, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATGetNameOfCol(GDALRasterAttributeTableH hRAT,
                        int iCol) -> const char *

Fetch name of indicated column.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
name.
"""
function gdalratgetnameofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetNameOfCol, libgdal), Cstring, (GDALRasterAttributeTableH, Cint), arg1, arg2), false)
end

"""
    GDALRATGetUsageOfCol(GDALRasterAttributeTableH hRAT,
                         int iCol) -> GDALRATFieldUsage

Fetch column usage value.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
usage.
"""
function gdalratgetusageofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetUsageOfCol, libgdal), GDALRATFieldUsage, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

"""
    GDALRATGetTypeOfCol(GDALRasterAttributeTableH hRAT,
                        int iCol) -> GDALRATFieldType

Fetch column type.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
type.
"""
function gdalratgettypeofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetTypeOfCol, libgdal), GDALRATFieldType, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

"""
    GDALRATGetColOfUsage(GDALRasterAttributeTableH hRAT,
                         GDALRATFieldUsage eUsage) -> int

Fetch column index for given usage.
"""
function gdalratgetcolofusage(arg1, arg2)
    aftercare(ccall((:GDALRATGetColOfUsage, libgdal), Cint, (GDALRasterAttributeTableH, GDALRATFieldUsage), arg1, arg2))
end

"""
    GDALRATGetRowCount(GDALRasterAttributeTableH hRAT) -> int

Fetch row count.
"""
function gdalratgetrowcount(arg1)
    aftercare(ccall((:GDALRATGetRowCount, libgdal), Cint, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATGetValueAsString(GDALRasterAttributeTableH hRAT,
                            int iRow,
                            int iField) -> const char *

Fetch field value as a string.
"""
function gdalratgetvalueasstring(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsString, libgdal), Cstring, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3), false)
end

"""
    GDALRATGetValueAsInt(GDALRasterAttributeTableH hRAT,
                         int iRow,
                         int iField) -> int

Fetch field value as a integer.
"""
function gdalratgetvalueasint(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsInt, libgdal), Cint, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3))
end

"""
    GDALRATGetValueAsDouble(GDALRasterAttributeTableH hRAT,
                            int iRow,
                            int iField) -> double

Fetch field value as a double.
"""
function gdalratgetvalueasdouble(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsDouble, libgdal), Cdouble, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3))
end

"""
    GDALRATSetValueAsString(GDALRasterAttributeTableH hRAT,
                            int iRow,
                            int iField,
                            const char * pszValue) -> void

Set field value from string.

### Parameters
* **hRAT**: RAT handle.
* **iRow**: row index.
* **iField**: field index.
* **pszValue**: value.
"""
function gdalratsetvalueasstring(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsString, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cstring), arg1, arg2, arg3, arg4))
end

"""
    GDALRATSetValueAsInt(GDALRasterAttributeTableH hRAT,
                         int iRow,
                         int iField,
                         int nValue) -> void

Set field value from integer.
"""
function gdalratsetvalueasint(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsInt, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cint), arg1, arg2, arg3, arg4))
end

"""
    GDALRATSetValueAsDouble(GDALRasterAttributeTableH hRAT,
                            int iRow,
                            int iField,
                            double dfValue) -> void

Set field value from double.
"""
function gdalratsetvalueasdouble(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsDouble, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cdouble), arg1, arg2, arg3, arg4))
end

"""
    GDALRATChangesAreWrittenToFile(GDALRasterAttributeTableH hRAT) -> int

Determine whether changes made to this RAT are reflected directly in the dataset.
"""
function gdalratchangesarewrittentofile(hRAT)
    aftercare(ccall((:GDALRATChangesAreWrittenToFile, libgdal), Cint, (GDALRasterAttributeTableH,), hRAT))
end

"""
    GDALRATValuesIOAsDouble(GDALRasterAttributeTableH hRAT,
                            GDALRWFlag eRWFlag,
                            int iField,
                            int iStartRow,
                            int iLength,
                            double * pdfData) -> CPLErr

Read or Write a block of doubles to/from the Attribute Table.
"""
function gdalratvaluesioasdouble(hRAT, eRWFlag, iField, iStartRow, iLength, pdfData)
    aftercare(ccall((:GDALRATValuesIOAsDouble, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, Ptr{Cdouble}), hRAT, eRWFlag, iField, iStartRow, iLength, pdfData))
end

"""
    GDALRATValuesIOAsInteger(GDALRasterAttributeTableH hRAT,
                             GDALRWFlag eRWFlag,
                             int iField,
                             int iStartRow,
                             int iLength,
                             int * pnData) -> CPLErr

Read or Write a block of ints to/from the Attribute Table.
"""
function gdalratvaluesioasinteger(hRAT, eRWFlag, iField, iStartRow, iLength, pnData)
    aftercare(ccall((:GDALRATValuesIOAsInteger, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, Ptr{Cint}), hRAT, eRWFlag, iField, iStartRow, iLength, pnData))
end

"""
    GDALRATValuesIOAsString(GDALRasterAttributeTableH hRAT,
                            GDALRWFlag eRWFlag,
                            int iField,
                            int iStartRow,
                            int iLength,
                            CSLConstList papszStrList) -> CPLErr

Read or Write a block of strings to/from the Attribute Table.
"""
function gdalratvaluesioasstring(hRAT, eRWFlag, iField, iStartRow, iLength, papszStrList)
    aftercare(ccall((:GDALRATValuesIOAsString, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, CSLConstList), hRAT, eRWFlag, iField, iStartRow, iLength, papszStrList))
end

"""
    GDALRATSetRowCount(GDALRasterAttributeTableH hRAT,
                       int nNewCount) -> void

Set row count.

### Parameters
* **hRAT**: RAT handle.
* **nNewCount**: the new number of rows.
"""
function gdalratsetrowcount(arg1, arg2)
    aftercare(ccall((:GDALRATSetRowCount, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

"""
    GDALRATCreateColumn(GDALRasterAttributeTableH hRAT,
                        const char * pszFieldName,
                        GDALRATFieldType eFieldType,
                        GDALRATFieldUsage eFieldUsage) -> CPLErr

Create new column.
"""
function gdalratcreatecolumn(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATCreateColumn, libgdal), CPLErr, (GDALRasterAttributeTableH, Cstring, GDALRATFieldType, GDALRATFieldUsage), arg1, arg2, arg3, arg4))
end

"""
    GDALRATSetLinearBinning(GDALRasterAttributeTableH hRAT,
                            double dfRow0Min,
                            double dfBinSize) -> CPLErr

Set linear binning information.
"""
function gdalratsetlinearbinning(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATSetLinearBinning, libgdal), CPLErr, (GDALRasterAttributeTableH, Cdouble, Cdouble), arg1, arg2, arg3))
end

"""
    GDALRATGetLinearBinning(GDALRasterAttributeTableH hRAT,
                            double * pdfRow0Min,
                            double * pdfBinSize) -> int

Get linear binning information.
"""
function gdalratgetlinearbinning(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetLinearBinning, libgdal), Cint, (GDALRasterAttributeTableH, Ptr{Cdouble}, Ptr{Cdouble}), arg1, arg2, arg3))
end

"""
    GDALRATSetTableType(GDALRasterAttributeTableH hRAT,
                        const GDALRATTableType eInTableType) -> CPLErr

Set RAT Table Type.
"""
function gdalratsettabletype(hRAT, eInTableType)
    aftercare(ccall((:GDALRATSetTableType, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRATTableType), hRAT, eInTableType))
end

"""
    GDALRATGetTableType(GDALRasterAttributeTableH hRAT) -> GDALRATTableType

Get Rat Table Type.
"""
function gdalratgettabletype(hRAT)
    aftercare(ccall((:GDALRATGetTableType, libgdal), GDALRATTableType, (GDALRasterAttributeTableH,), hRAT))
end

"""
    GDALRATInitializeFromColorTable(GDALRasterAttributeTableH hRAT,
                                    GDALColorTableH hCT) -> CPLErr

Initialize from color table.
"""
function gdalratinitializefromcolortable(arg1, arg2)
    aftercare(ccall((:GDALRATInitializeFromColorTable, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALColorTableH), arg1, arg2))
end

"""
    GDALRATTranslateToColorTable(GDALRasterAttributeTableH hRAT,
                                 int nEntryCount) -> GDALColorTableH

Translate to a color table.
"""
function gdalrattranslatetocolortable(arg1, nEntryCount)
    aftercare(ccall((:GDALRATTranslateToColorTable, libgdal), GDALColorTableH, (GDALRasterAttributeTableH, Cint), arg1, nEntryCount))
end

"""
    GDALRATDumpReadable(GDALRasterAttributeTableH hRAT,
                        FILE * fp) -> void

Dump RAT in readable form.
"""
function gdalratdumpreadable(arg1, arg2)
    aftercare(ccall((:GDALRATDumpReadable, libgdal), Cvoid, (GDALRasterAttributeTableH, Ptr{Libc.FILE}), arg1, arg2))
end

"""
    GDALRATClone(const GDALRasterAttributeTableH hRAT) -> GDALRasterAttributeTableH

Copy Raster Attribute Table.
"""
function gdalratclone(arg1)
    aftercare(ccall((:GDALRATClone, libgdal), GDALRasterAttributeTableH, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATSerializeJSON(GDALRasterAttributeTableH hRAT) -> void *

Serialize Raster Attribute Table in Json format.
"""
function gdalratserializejson(arg1)
    aftercare(ccall((:GDALRATSerializeJSON, libgdal), Ptr{Cvoid}, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATGetRowOfValue(GDALRasterAttributeTableH hRAT,
                         double dfValue) -> int

Get row for pixel value.
"""
function gdalratgetrowofvalue(arg1, arg2)
    aftercare(ccall((:GDALRATGetRowOfValue, libgdal), Cint, (GDALRasterAttributeTableH, Cdouble), arg1, arg2))
end

"""
    GDALRATRemoveStatistics(GDALRasterAttributeTableH hRAT) -> void

Remove Statistics from RAT.
"""
function gdalratremovestatistics(arg1)
    aftercare(ccall((:GDALRATRemoveStatistics, libgdal), Cvoid, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALSetCacheMax(int nNewSizeInBytes) -> void

Set maximum cache memory.

### Parameters
* **nNewSizeInBytes**: the maximum number of bytes for caching.
"""
function gdalsetcachemax(nBytes)
    aftercare(ccall((:GDALSetCacheMax, libgdal), Cvoid, (Cint,), nBytes))
end

"""
    GDALGetCacheMax() -> int

Get maximum cache memory.

### Returns
maximum in bytes.
"""
function gdalgetcachemax()
    aftercare(ccall((:GDALGetCacheMax, libgdal), Cint, ()))
end

"""
    GDALGetCacheUsed() -> int

Get cache memory used.

### Returns
the number of bytes of memory currently in use by the GDALRasterBlock memory caching.
"""
function gdalgetcacheused()
    aftercare(ccall((:GDALGetCacheUsed, libgdal), Cint, ()))
end

"""
    GDALSetCacheMax64(GIntBig nNewSizeInBytes) -> void

Set maximum cache memory.

### Parameters
* **nNewSizeInBytes**: the maximum number of bytes for caching.
"""
function gdalsetcachemax64(nBytes)
    aftercare(ccall((:GDALSetCacheMax64, libgdal), Cvoid, (GIntBig,), nBytes))
end

"""
    GDALGetCacheMax64() -> GIntBig

Get maximum cache memory.

### Returns
maximum in bytes.
"""
function gdalgetcachemax64()
    aftercare(ccall((:GDALGetCacheMax64, libgdal), GIntBig, ()))
end

"""
    GDALGetCacheUsed64() -> GIntBig

Get cache memory used.

### Returns
the number of bytes of memory currently in use by the GDALRasterBlock memory caching.
"""
function gdalgetcacheused64()
    aftercare(ccall((:GDALGetCacheUsed64, libgdal), GIntBig, ()))
end

"""
    GDALFlushCacheBlock() -> int

Try to flush one cached raster block.

### Returns
TRUE if one block was flushed, FALSE if there are no cached blocks or if they are currently locked.
"""
function gdalflushcacheblock()
    aftercare(ccall((:GDALFlushCacheBlock, libgdal), Cint, ()))
end

"""
    GDALDatasetGetVirtualMem(GDALDatasetH hDS,
                             GDALRWFlag eRWFlag,
                             int nXOff,
                             int nYOff,
                             int nXSize,
                             int nYSize,
                             int nBufXSize,
                             int nBufYSize,
                             GDALDataType eBufType,
                             int nBandCount,
                             int * panBandMap,
                             int nPixelSpace,
                             GIntBig nLineSpace,
                             GIntBig nBandSpace,
                             size_t nCacheSize,
                             size_t nPageSizeHint,
                             int bSingleThreadUsage,
                             CSLConstList papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL dataset object.

### Parameters
* **hDS**: Dataset object
* **eRWFlag**: Either GF_Read to read a region of data, or GF_Write to write a region of data.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **nBufXSize**: the width of the buffer image into which the desired region is to be read, or from which it is to be written.
* **nBufYSize**: the height of the buffer image into which the desired region is to be read, or from which it is to be written.
* **eBufType**: the type of the pixel values in the data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nBandCount**: the number of bands being read or written.
* **panBandMap**: the list of nBandCount band numbers being read/written. Note band numbers are 1 based. This may be NULL to select the first nBandCount bands.
* **nPixelSpace**: The byte offset from the start of one pixel value in the buffer to the start of the next pixel value within a scanline. If defaulted (0) the size of the datatype eBufType is used.
* **nLineSpace**: The byte offset from the start of one scanline in the buffer to the start of the next. If defaulted (0) the size of the datatype eBufType * nBufXSize is used.
* **nBandSpace**: the byte offset from the start of one bands data to the start of the next. If defaulted (0) the value will be nLineSpace * nBufYSize implying band sequential organization of the data buffer.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM)
* **nPageSizeHint**: hint for the page size. Must be a multiple of the system page size, returned by CPLGetPageSize(). Minimum value is generally 4096. Might be set to 0 to let the function determine a default page size.
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. If set to FALSE, CPLVirtualMemDeclareThread() must be called.
* **papszOptions**: NULL terminated list of options. Unused for now.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function gdaldatasetgetvirtualmem(hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALDatasetGetVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, GIntBig, GIntBig, Csize_t, Csize_t, Cint, CSLConstList), hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions))
end

"""
    GDALRasterBandGetVirtualMem(GDALRasterBandH hBand,
                                GDALRWFlag eRWFlag,
                                int nXOff,
                                int nYOff,
                                int nXSize,
                                int nYSize,
                                int nBufXSize,
                                int nBufYSize,
                                GDALDataType eBufType,
                                int nPixelSpace,
                                GIntBig nLineSpace,
                                size_t nCacheSize,
                                size_t nPageSizeHint,
                                int bSingleThreadUsage,
                                CSLConstList papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL raster band object.

### Parameters
* **hBand**: Rasterband object
* **eRWFlag**: Either GF_Read to read a region of data, or GF_Write to write a region of data.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **nBufXSize**: the width of the buffer image into which the desired region is to be read, or from which it is to be written.
* **nBufYSize**: the height of the buffer image into which the desired region is to be read, or from which it is to be written.
* **eBufType**: the type of the pixel values in the data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nPixelSpace**: The byte offset from the start of one pixel value in the buffer to the start of the next pixel value within a scanline. If defaulted (0) the size of the datatype eBufType is used.
* **nLineSpace**: The byte offset from the start of one scanline in the buffer to the start of the next. If defaulted (0) the size of the datatype eBufType * nBufXSize is used.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM)
* **nPageSizeHint**: hint for the page size. Must be a multiple of the system page size, returned by CPLGetPageSize(). Minimum value is generally 4096. Might be set to 0 to let the function determine a default page size.
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. If set to FALSE, CPLVirtualMemDeclareThread() must be called.
* **papszOptions**: NULL terminated list of options. Unused for now.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function gdalrasterbandgetvirtualmem(hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALRasterBandGetVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, GIntBig, Csize_t, Csize_t, Cint, CSLConstList), hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions))
end

"""
    GDALGetVirtualMemAuto(GDALRasterBandH hBand,
                          GDALRWFlag eRWFlag,
                          int * pnPixelSpace,
                          GIntBig * pnLineSpace,
                          CSLConstList papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL raster band object.
"""
function gdalgetvirtualmemauto(hBand, eRWFlag, pnPixelSpace, pnLineSpace, papszOptions)
    aftercare(ccall((:GDALGetVirtualMemAuto, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Ptr{Cint}, Ptr{GIntBig}, CSLConstList), hBand, eRWFlag, pnPixelSpace, pnLineSpace, papszOptions))
end

"""
    GDALTileOrganization

! Enumeration to describe the tile organization 

| Enumerator | Note                                                                                                                                           |
| :--------- | :--------------------------------------------------------------------------------------------------------------------------------------------- |
| GTO\\_TIP  | Tile Interleaved by Pixel: tile (0,0) with internal band interleaved by pixel organization, tile (1, 0), ...                                   |
| GTO\\_BIT  | Band Interleaved by Tile : tile (0,0) of first band, tile (0,0) of second band, ... tile (1,0) of first band, tile (1,0) of second band, ...   |
| GTO\\_BSQ  | Band SeQuential : all the tiles of first band, all the tiles of following band...                                                              |
"""
@cenum GDALTileOrganization::UInt32 begin
        GTO_TIP = 0
        GTO_BIT = 1
        GTO_BSQ = 2
    end

"""
    GDALDatasetGetTiledVirtualMem(GDALDatasetH hDS,
                                  GDALRWFlag eRWFlag,
                                  int nXOff,
                                  int nYOff,
                                  int nXSize,
                                  int nYSize,
                                  int nTileXSize,
                                  int nTileYSize,
                                  GDALDataType eBufType,
                                  int nBandCount,
                                  int * panBandMap,
                                  GDALTileOrganization eTileOrganization,
                                  size_t nCacheSize,
                                  int bSingleThreadUsage,
                                  CSLConstList papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL dataset object, with tiling organization.

### Parameters
* **hDS**: Dataset object
* **eRWFlag**: Either GF_Read to read a region of data, or GF_Write to write a region of data.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **nTileXSize**: the width of the tiles.
* **nTileYSize**: the height of the tiles.
* **eBufType**: the type of the pixel values in the data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nBandCount**: the number of bands being read or written.
* **panBandMap**: the list of nBandCount band numbers being read/written. Note band numbers are 1 based. This may be NULL to select the first nBandCount bands.
* **eTileOrganization**: tile organization.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM)
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. If set to FALSE, CPLVirtualMemDeclareThread() must be called.
* **papszOptions**: NULL terminated list of options. Unused for now.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function gdaldatasetgettiledvirtualmem(hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nBandCount, panBandMap, eTileOrganization, nCacheSize, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALDatasetGetTiledVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, GDALTileOrganization, Csize_t, Cint, CSLConstList), hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nBandCount, panBandMap, eTileOrganization, nCacheSize, bSingleThreadUsage, papszOptions))
end

"""
    GDALRasterBandGetTiledVirtualMem(GDALRasterBandH hBand,
                                     GDALRWFlag eRWFlag,
                                     int nXOff,
                                     int nYOff,
                                     int nXSize,
                                     int nYSize,
                                     int nTileXSize,
                                     int nTileYSize,
                                     GDALDataType eBufType,
                                     size_t nCacheSize,
                                     int bSingleThreadUsage,
                                     CSLConstList papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL rasterband object, with tiling organization.

### Parameters
* **hBand**: Rasterband object
* **eRWFlag**: Either GF_Read to read a region of data, or GF_Write to write a region of data.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **nTileXSize**: the width of the tiles.
* **nTileYSize**: the height of the tiles.
* **eBufType**: the type of the pixel values in the data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM)
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. If set to FALSE, CPLVirtualMemDeclareThread() must be called.
* **papszOptions**: NULL terminated list of options. Unused for now.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function gdalrasterbandgettiledvirtualmem(hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nCacheSize, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALRasterBandGetTiledVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Csize_t, Cint, CSLConstList), hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nCacheSize, bSingleThreadUsage, papszOptions))
end

"""
    GDALCreatePansharpenedVRT(const char * pszXML,
                              GDALRasterBandH hPanchroBand,
                              int nInputSpectralBands,
                              GDALRasterBandH * pahInputSpectralBands) -> GDALDatasetH

Create a virtual pansharpened dataset.

### Parameters
* **pszXML**: Pansharpened VRT XML where <SpectralBand> elements have no explicit SourceFilename and SourceBand. The spectral bands in the XML will be assigned the successive values of the pahInputSpectralBands array. Must not be NULL.
* **hPanchroBand**: Panchromatic band. Must not be NULL.
* **nInputSpectralBands**: Number of input spectral bands. Must be greater than zero.
* **pahInputSpectralBands**: Array of nInputSpectralBands spectral bands.

### Returns
NULL on failure, or a new virtual dataset handle on success to be closed with GDALClose().
"""
function gdalcreatepansharpenedvrt(pszXML, hPanchroBand, nInputSpectralBands, pahInputSpectralBands)
    aftercare(ccall((:GDALCreatePansharpenedVRT, libgdal), GDALDatasetH, (Cstring, GDALRasterBandH, Cint, Ptr{GDALRasterBandH}), pszXML, hPanchroBand, nInputSpectralBands, pahInputSpectralBands))
end

"""
    GDALGetJPEG2000Structure(const char * pszFilename,
                             CSLConstList papszOptions) -> CPLXMLNode *

Dump the structure of a JPEG2000 file as a XML tree.

### Parameters
* **pszFilename**: filename.
* **papszOptions**: NULL terminated list of options, or NULL. Allowed options are BINARY_CONTENT=YES, TEXT_CONTENT=YES, CODESTREAM=YES, ALL=YES.

### Returns
XML tree (to be freed with CPLDestroyXMLNode()) or NULL in case of error
"""
function gdalgetjpeg2000structure(pszFilename, papszOptions)
    aftercare(ccall((:GDALGetJPEG2000Structure, libgdal), Ptr{CPLXMLNode}, (Cstring, CSLConstList), pszFilename, papszOptions))
end

"""
    GDALCreateMultiDimensional(GDALDriverH hDriver,
                               const char * pszName,
                               CSLConstList papszRootGroupOptions,
                               CSLConstList papszOptions) -> GDALDatasetH

Create a new multidimensional dataset with this driver.
"""
function gdalcreatemultidimensional(hDriver, pszName, papszRootGroupOptions, papszOptions)
    aftercare(ccall((:GDALCreateMultiDimensional, libgdal), GDALDatasetH, (GDALDriverH, Cstring, CSLConstList, CSLConstList), hDriver, pszName, papszRootGroupOptions, papszOptions))
end

"""
    GDALExtendedDataTypeCreate(GDALDataType eType) -> GDALExtendedDataTypeH

Return a new GDALExtendedDataType of class GEDTC_NUMERIC.

### Parameters
* **eType**: Numeric data type.

### Returns
a new GDALExtendedDataTypeH handle, or nullptr.
"""
function gdalextendeddatatypecreate(eType)
    aftercare(ccall((:GDALExtendedDataTypeCreate, libgdal), GDALExtendedDataTypeH, (GDALDataType,), eType))
end

"""
    GDALExtendedDataTypeCreateString(size_t nMaxStringLength) -> GDALExtendedDataTypeH

Return a new GDALExtendedDataType of class GEDTC_STRING.

### Returns
a new GDALExtendedDataTypeH handle, or nullptr.
"""
function gdalextendeddatatypecreatestring(nMaxStringLength)
    aftercare(ccall((:GDALExtendedDataTypeCreateString, libgdal), GDALExtendedDataTypeH, (Csize_t,), nMaxStringLength))
end

"""
    GDALExtendedDataTypeCreateCompound(const char * pszName,
                                       size_t nTotalSize,
                                       size_t nComponents,
                                       const GDALEDTComponentH * comps) -> GDALExtendedDataTypeH

Return a new GDALExtendedDataType of class GEDTC_COMPOUND.

### Parameters
* **pszName**: Type name.
* **nTotalSize**: Total size of the type in bytes. Should be large enough to store all components.
* **nComponents**: Number of components in comps array.
* **comps**: Components.

### Returns
a new GDALExtendedDataTypeH handle, or nullptr.
"""
function gdalextendeddatatypecreatecompound(pszName, nTotalSize, nComponents, comps)
    aftercare(ccall((:GDALExtendedDataTypeCreateCompound, libgdal), GDALExtendedDataTypeH, (Cstring, Csize_t, Csize_t, Ptr{GDALEDTComponentH}), pszName, nTotalSize, nComponents, comps))
end

"""
    GDALExtendedDataTypeRelease(GDALExtendedDataTypeH hEDT) -> void

Release the GDAL in-memory object associated with a GDALExtendedDataTypeH.
"""
function gdalextendeddatatyperelease(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeRelease, libgdal), Cvoid, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetName(GDALExtendedDataTypeH hEDT) -> const char *

Return type name.
"""
function gdalextendeddatatypegetname(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetName, libgdal), Cstring, (GDALExtendedDataTypeH,), hEDT), false)
end

"""
    GDALExtendedDataTypeGetClass(GDALExtendedDataTypeH hEDT) -> GDALExtendedDataTypeClass

Return type class.
"""
function gdalextendeddatatypegetclass(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetClass, libgdal), GDALExtendedDataTypeClass, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetNumericDataType(GDALExtendedDataTypeH hEDT) -> GDALDataType

Return numeric data type (only valid when GetClass() == GEDTC_NUMERIC)
"""
function gdalextendeddatatypegetnumericdatatype(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetNumericDataType, libgdal), GDALDataType, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetSize(GDALExtendedDataTypeH hEDT) -> size_t

Return data type size in bytes.
"""
function gdalextendeddatatypegetsize(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetSize, libgdal), Csize_t, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetMaxStringLength(GDALExtendedDataTypeH hEDT) -> size_t

Return the maximum length of a string in bytes.
"""
function gdalextendeddatatypegetmaxstringlength(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetMaxStringLength, libgdal), Csize_t, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetComponents(GDALExtendedDataTypeH hEDT,
                                      size_t * pnCount) -> GDALEDTComponentH *

Return the components of the data type (only valid when GetClass() == GEDTC_COMPOUND)

### Parameters
* **hEDT**: Data type
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
an array of *pnCount components.
"""
function gdalextendeddatatypegetcomponents(hEDT, pnCount)
    aftercare(ccall((:GDALExtendedDataTypeGetComponents, libgdal), Ptr{GDALEDTComponentH}, (GDALExtendedDataTypeH, Ptr{Csize_t}), hEDT, pnCount))
end

"""
    GDALExtendedDataTypeFreeComponents(GDALEDTComponentH * components,
                                       size_t nCount) -> void

Free the return of GDALExtendedDataTypeGetComponents().

### Parameters
* **components**: return value of GDALExtendedDataTypeGetComponents()
* **nCount**: *pnCount value returned by GDALExtendedDataTypeGetComponents()
"""
function gdalextendeddatatypefreecomponents(components, nCount)
    aftercare(ccall((:GDALExtendedDataTypeFreeComponents, libgdal), Cvoid, (Ptr{GDALEDTComponentH}, Csize_t), components, nCount))
end

"""
    GDALExtendedDataTypeCanConvertTo(GDALExtendedDataTypeH hSourceEDT,
                                     GDALExtendedDataTypeH hTargetEDT) -> int

Return whether this data type can be converted to the other one.

### Parameters
* **hSourceEDT**: Source data type for the conversion being considered.
* **hTargetEDT**: Target data type for the conversion being considered.

### Returns
TRUE if hSourceEDT can be convert to hTargetEDT. FALSE otherwise.
"""
function gdalextendeddatatypecanconvertto(hSourceEDT, hTargetEDT)
    aftercare(ccall((:GDALExtendedDataTypeCanConvertTo, libgdal), Cint, (GDALExtendedDataTypeH, GDALExtendedDataTypeH), hSourceEDT, hTargetEDT))
end

"""
    GDALExtendedDataTypeEquals(GDALExtendedDataTypeH hFirstEDT,
                               GDALExtendedDataTypeH hSecondEDT) -> int

Return whether this data type is equal to another one.

### Parameters
* **hFirstEDT**: First data type.
* **hSecondEDT**: Second data type.

### Returns
TRUE if they are equal. FALSE otherwise.
"""
function gdalextendeddatatypeequals(hFirstEDT, hSecondEDT)
    aftercare(ccall((:GDALExtendedDataTypeEquals, libgdal), Cint, (GDALExtendedDataTypeH, GDALExtendedDataTypeH), hFirstEDT, hSecondEDT))
end

"""
    GDALEDTComponentCreate(const char * pszName,
                           size_t nOffset,
                           GDALExtendedDataTypeH hType) -> GDALEDTComponentH

Create a new GDALEDTComponent.
"""
function gdaledtcomponentcreate(pszName, nOffset, hType)
    aftercare(ccall((:GDALEDTComponentCreate, libgdal), GDALEDTComponentH, (Cstring, Csize_t, GDALExtendedDataTypeH), pszName, nOffset, hType))
end

"""
    GDALEDTComponentRelease(GDALEDTComponentH hComp) -> void

Release the GDAL in-memory object associated with a GDALEDTComponentH.
"""
function gdaledtcomponentrelease(hComp)
    aftercare(ccall((:GDALEDTComponentRelease, libgdal), Cvoid, (GDALEDTComponentH,), hComp))
end

"""
    GDALEDTComponentGetName(GDALEDTComponentH hComp) -> const char *

Return the name.
"""
function gdaledtcomponentgetname(hComp)
    aftercare(ccall((:GDALEDTComponentGetName, libgdal), Cstring, (GDALEDTComponentH,), hComp), false)
end

"""
    GDALEDTComponentGetOffset(GDALEDTComponentH hComp) -> size_t

Return the offset (in bytes) of the component in the compound data type.
"""
function gdaledtcomponentgetoffset(hComp)
    aftercare(ccall((:GDALEDTComponentGetOffset, libgdal), Csize_t, (GDALEDTComponentH,), hComp))
end

"""
    GDALEDTComponentGetType(GDALEDTComponentH hComp) -> GDALExtendedDataTypeH

Return the data type of the component.
"""
function gdaledtcomponentgettype(hComp)
    aftercare(ccall((:GDALEDTComponentGetType, libgdal), GDALExtendedDataTypeH, (GDALEDTComponentH,), hComp))
end

"""
    GDALDatasetGetRootGroup(GDALDatasetH hDS) -> GDALGroupH

Return the root GDALGroup of this dataset.
"""
function gdaldatasetgetrootgroup(hDS)
    aftercare(ccall((:GDALDatasetGetRootGroup, libgdal), GDALGroupH, (GDALDatasetH,), hDS))
end

"""
    GDALGroupRelease(GDALGroupH hGroup) -> void

Release the GDAL in-memory object associated with a GDALGroupH.
"""
function gdalgrouprelease(hGroup)
    aftercare(ccall((:GDALGroupRelease, libgdal), Cvoid, (GDALGroupH,), hGroup))
end

"""
    GDALGroupGetName(GDALGroupH hGroup) -> const char *

Return the name of the group.
"""
function gdalgroupgetname(hGroup)
    aftercare(ccall((:GDALGroupGetName, libgdal), Cstring, (GDALGroupH,), hGroup), false)
end

"""
    GDALGroupGetFullName(GDALGroupH hGroup) -> const char *

Return the full name of the group.
"""
function gdalgroupgetfullname(hGroup)
    aftercare(ccall((:GDALGroupGetFullName, libgdal), Cstring, (GDALGroupH,), hGroup), false)
end

"""
    GDALGroupGetMDArrayNames(GDALGroupH hGroup,
                             CSLConstList papszOptions) -> char **

Return the list of multidimensional array names contained in this group.

### Returns
the array names, to be freed with CSLDestroy()
"""
function gdalgroupgetmdarraynames(hGroup, papszOptions)
    aftercare(ccall((:GDALGroupGetMDArrayNames, libgdal), Ptr{Cstring}, (GDALGroupH, CSLConstList), hGroup, papszOptions))
end

"""
    GDALGroupOpenMDArray(GDALGroupH hGroup,
                         const char * pszMDArrayName,
                         CSLConstList papszOptions) -> GDALMDArrayH

Open and return a multidimensional array.

### Returns
the array, to be freed with GDALMDArrayRelease(), or nullptr.
"""
function gdalgroupopenmdarray(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

"""
    GDALGroupOpenMDArrayFromFullname(GDALGroupH hGroup,
                                     const char * pszFullname,
                                     CSLConstList papszOptions) -> GDALMDArrayH

Open and return a multidimensional array from its fully qualified name.

### Returns
the array, to be freed with GDALMDArrayRelease(), or nullptr.
"""
function gdalgroupopenmdarrayfromfullname(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenMDArrayFromFullname, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

"""
    GDALGroupResolveMDArray(GDALGroupH hGroup,
                            const char * pszName,
                            const char * pszStartingPoint,
                            CSLConstList papszOptions) -> GDALMDArrayH

Locate an array in a group and its subgroups by name.
"""
function gdalgroupresolvemdarray(hGroup, pszName, pszStartingPoint, papszOptions)
    aftercare(ccall((:GDALGroupResolveMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, Cstring, CSLConstList), hGroup, pszName, pszStartingPoint, papszOptions))
end

"""
    GDALGroupGetGroupNames(GDALGroupH hGroup,
                           CSLConstList papszOptions) -> char **

Return the list of sub-groups contained in this group.

### Returns
the group names, to be freed with CSLDestroy()
"""
function gdalgroupgetgroupnames(hGroup, papszOptions)
    aftercare(ccall((:GDALGroupGetGroupNames, libgdal), Ptr{Cstring}, (GDALGroupH, CSLConstList), hGroup, papszOptions))
end

"""
    GDALGroupOpenGroup(GDALGroupH hGroup,
                       const char * pszSubGroupName,
                       CSLConstList papszOptions) -> GDALGroupH

Open and return a sub-group.

### Returns
the sub-group, to be freed with GDALGroupRelease(), or nullptr.
"""
function gdalgroupopengroup(hGroup, pszSubGroupName, papszOptions)
    aftercare(ccall((:GDALGroupOpenGroup, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszSubGroupName, papszOptions))
end

"""
    GDALGroupOpenGroupFromFullname(GDALGroupH hGroup,
                                   const char * pszFullname,
                                   CSLConstList papszOptions) -> GDALGroupH

Open and return a sub-group from its fully qualified name.

### Returns
the sub-group, to be freed with GDALGroupRelease(), or nullptr.
"""
function gdalgroupopengroupfromfullname(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenGroupFromFullname, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

"""
    GDALGroupGetDimensions(GDALGroupH hGroup,
                           size_t * pnCount,
                           CSLConstList papszOptions) -> GDALDimensionH *

Return the list of dimensions contained in this group and used by its arrays.

### Parameters
* **hGroup**: Group.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.
* **papszOptions**: Driver specific options determining how dimensions should be retrieved. Pass nullptr for default behavior.

### Returns
an array of *pnCount dimensions.
"""
function gdalgroupgetdimensions(hGroup, pnCount, papszOptions)
    aftercare(ccall((:GDALGroupGetDimensions, libgdal), Ptr{GDALDimensionH}, (GDALGroupH, Ptr{Csize_t}, CSLConstList), hGroup, pnCount, papszOptions))
end

"""
    GDALGroupGetAttribute(GDALGroupH hGroup,
                          const char * pszName) -> GDALAttributeH

Return an attribute by its name.
"""
function gdalgroupgetattribute(hGroup, pszName)
    aftercare(ccall((:GDALGroupGetAttribute, libgdal), GDALAttributeH, (GDALGroupH, Cstring), hGroup, pszName))
end

"""
    GDALGroupGetAttributes(GDALGroupH hGroup,
                           size_t * pnCount,
                           CSLConstList papszOptions) -> GDALAttributeH *

Return the list of attributes contained in this group.

### Parameters
* **hGroup**: Group.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.
* **papszOptions**: Driver specific options determining how attributes should be retrieved. Pass nullptr for default behavior.

### Returns
an array of *pnCount attributes.
"""
function gdalgroupgetattributes(hGroup, pnCount, papszOptions)
    aftercare(ccall((:GDALGroupGetAttributes, libgdal), Ptr{GDALAttributeH}, (GDALGroupH, Ptr{Csize_t}, CSLConstList), hGroup, pnCount, papszOptions))
end

"""
    GDALGroupGetStructuralInfo(GDALGroupH hGroup) -> CSLConstList

Return structural information on the group.
"""
function gdalgroupgetstructuralinfo(hGroup)
    aftercare(ccall((:GDALGroupGetStructuralInfo, libgdal), CSLConstList, (GDALGroupH,), hGroup))
end

"""
    GDALGroupCreateGroup(GDALGroupH hGroup,
                         const char * pszSubGroupName,
                         CSLConstList papszOptions) -> GDALGroupH

Create a sub-group within a group.

### Returns
the sub-group, to be freed with GDALGroupRelease(), or nullptr.
"""
function gdalgroupcreategroup(hGroup, pszSubGroupName, papszOptions)
    aftercare(ccall((:GDALGroupCreateGroup, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszSubGroupName, papszOptions))
end

"""
    GDALGroupCreateDimension(GDALGroupH hGroup,
                             const char * pszName,
                             const char * pszType,
                             const char * pszDirection,
                             GUInt64 nSize,
                             CSLConstList papszOptions) -> GDALDimensionH

Create a dimension within a group.

### Returns
the dimension, to be freed with GDALDimensionRelease(), or nullptr.
"""
function gdalgroupcreatedimension(hGroup, pszName, pszType, pszDirection, nSize, papszOptions)
    aftercare(ccall((:GDALGroupCreateDimension, libgdal), GDALDimensionH, (GDALGroupH, Cstring, Cstring, Cstring, GUInt64, CSLConstList), hGroup, pszName, pszType, pszDirection, nSize, papszOptions))
end

"""
    GDALGroupCreateMDArray(GDALGroupH hGroup,
                           const char * pszName,
                           size_t nDimensions,
                           GDALDimensionH * pahDimensions,
                           GDALExtendedDataTypeH hEDT,
                           CSLConstList papszOptions) -> GDALMDArrayH

Create a multidimensional array within a group.

### Returns
the array, to be freed with GDALMDArrayRelease(), or nullptr.
"""
function gdalgroupcreatemdarray(hGroup, pszName, nDimensions, pahDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALGroupCreateMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, Csize_t, Ptr{GDALDimensionH}, GDALExtendedDataTypeH, CSLConstList), hGroup, pszName, nDimensions, pahDimensions, hEDT, papszOptions))
end

"""
    GDALGroupCreateAttribute(GDALGroupH hGroup,
                             const char * pszName,
                             size_t nDimensions,
                             const GUInt64 * panDimensions,
                             GDALExtendedDataTypeH hEDT,
                             CSLConstList papszOptions) -> GDALAttributeH

Create a attribute within a group.

### Returns
the attribute, to be freed with GDALAttributeRelease(), or nullptr.
"""
function gdalgroupcreateattribute(hGroup, pszName, nDimensions, panDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALGroupCreateAttribute, libgdal), GDALAttributeH, (GDALGroupH, Cstring, Csize_t, Ptr{GUInt64}, GDALExtendedDataTypeH, CSLConstList), hGroup, pszName, nDimensions, panDimensions, hEDT, papszOptions))
end

"""
    GDALMDArrayRelease(GDALMDArrayH hMDArray) -> void

Release the GDAL in-memory object associated with a GDALMDArray.
"""
function gdalmdarrayrelease(hMDArray)
    aftercare(ccall((:GDALMDArrayRelease, libgdal), Cvoid, (GDALMDArrayH,), hMDArray))
end

"""
    GDALMDArrayGetName(GDALMDArrayH hArray) -> const char *

Return array name.
"""
function gdalmdarraygetname(hArray)
    aftercare(ccall((:GDALMDArrayGetName, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

"""
    GDALMDArrayGetFullName(GDALMDArrayH hArray) -> const char *

Return array full name.
"""
function gdalmdarraygetfullname(hArray)
    aftercare(ccall((:GDALMDArrayGetFullName, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

"""
    GDALMDArrayGetTotalElementsCount(GDALMDArrayH hArray) -> GUInt64

Return the total number of values in the array.
"""
function gdalmdarraygettotalelementscount(hArray)
    aftercare(ccall((:GDALMDArrayGetTotalElementsCount, libgdal), GUInt64, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetDimensionCount(GDALMDArrayH hArray) -> size_t

Return the number of dimensions.
"""
function gdalmdarraygetdimensioncount(hArray)
    aftercare(ccall((:GDALMDArrayGetDimensionCount, libgdal), Csize_t, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetDimensions(GDALMDArrayH hArray,
                             size_t * pnCount) -> GDALDimensionH *

Return the dimensions of the array.

### Parameters
* **hArray**: Array.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
an array of *pnCount dimensions.
"""
function gdalmdarraygetdimensions(hArray, pnCount)
    aftercare(ccall((:GDALMDArrayGetDimensions, libgdal), Ptr{GDALDimensionH}, (GDALMDArrayH, Ptr{Csize_t}), hArray, pnCount))
end

"""
    GDALMDArrayGetDataType(GDALMDArrayH hArray) -> GDALExtendedDataTypeH

Return the data type.
"""
function gdalmdarraygetdatatype(hArray)
    aftercare(ccall((:GDALMDArrayGetDataType, libgdal), GDALExtendedDataTypeH, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayRead(GDALMDArrayH hArray,
                    const GUInt64 * arrayStartIdx,
                    const size_t * count,
                    const GInt64 * arrayStep,
                    const GPtrDiff_t * bufferStride,
                    GDALExtendedDataTypeH bufferDataType,
                    void * pDstBuffer,
                    const void * pDstBufferAllocStart,
                    size_t nDstBufferAllocSize) -> int

Read part or totality of a multidimensional array.

### Returns
TRUE in case of success.
"""
function gdalmdarrayread(hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pDstBuffer, pDstBufferAllocStart, nDstBufferllocSize)
    aftercare(ccall((:GDALMDArrayRead, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}, Ptr{GInt64}, Ptr{GPtrDiff_t}, GDALExtendedDataTypeH, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pDstBuffer, pDstBufferAllocStart, nDstBufferllocSize))
end

"""
    GDALMDArrayWrite(GDALMDArrayH hArray,
                     const GUInt64 * arrayStartIdx,
                     const size_t * count,
                     const GInt64 * arrayStep,
                     const GPtrDiff_t * bufferStride,
                     GDALExtendedDataTypeH bufferDataType,
                     const void * pSrcBuffer,
                     const void * pSrcBufferAllocStart,
                     size_t nSrcBufferAllocSize) -> int

Write part or totality of a multidimensional array.

### Returns
TRUE in case of success.
"""
function gdalmdarraywrite(hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pSrcBuffer, psrcBufferAllocStart, nSrcBufferllocSize)
    aftercare(ccall((:GDALMDArrayWrite, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}, Ptr{GInt64}, Ptr{GPtrDiff_t}, GDALExtendedDataTypeH, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pSrcBuffer, psrcBufferAllocStart, nSrcBufferllocSize))
end

"""
    GDALMDArrayAdviseRead(GDALMDArrayH hArray,
                          const GUInt64 * arrayStartIdx,
                          const size_t * count) -> int

Advise driver of upcoming read requests.

### Returns
TRUE in case of success.
"""
function gdalmdarrayadviseread(hArray, arrayStartIdx, count)
    aftercare(ccall((:GDALMDArrayAdviseRead, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}), hArray, arrayStartIdx, count))
end

"""
    GDALMDArrayGetAttribute(GDALMDArrayH hArray,
                            const char * pszName) -> GDALAttributeH

Return an attribute by its name.
"""
function gdalmdarraygetattribute(hArray, pszName)
    aftercare(ccall((:GDALMDArrayGetAttribute, libgdal), GDALAttributeH, (GDALMDArrayH, Cstring), hArray, pszName))
end

"""
    GDALMDArrayGetAttributes(GDALMDArrayH hArray,
                             size_t * pnCount,
                             CSLConstList papszOptions) -> GDALAttributeH *

Return the list of attributes contained in this array.

### Parameters
* **hArray**: Array.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.
* **papszOptions**: Driver specific options determining how attributes should be retrieved. Pass nullptr for default behavior.

### Returns
an array of *pnCount attributes.
"""
function gdalmdarraygetattributes(hArray, pnCount, papszOptions)
    aftercare(ccall((:GDALMDArrayGetAttributes, libgdal), Ptr{GDALAttributeH}, (GDALMDArrayH, Ptr{Csize_t}, CSLConstList), hArray, pnCount, papszOptions))
end

"""
    GDALMDArrayCreateAttribute(GDALMDArrayH hArray,
                               const char * pszName,
                               size_t nDimensions,
                               const GUInt64 * panDimensions,
                               GDALExtendedDataTypeH hEDT,
                               CSLConstList papszOptions) -> GDALAttributeH

Create a attribute within an array.

### Returns
the attribute, to be freed with GDALAttributeRelease(), or nullptr.
"""
function gdalmdarraycreateattribute(hArray, pszName, nDimensions, panDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALMDArrayCreateAttribute, libgdal), GDALAttributeH, (GDALMDArrayH, Cstring, Csize_t, Ptr{GUInt64}, GDALExtendedDataTypeH, CSLConstList), hArray, pszName, nDimensions, panDimensions, hEDT, papszOptions))
end

"""
    GDALMDArrayGetRawNoDataValue(GDALMDArrayH hArray) -> const void *

Return the nodata value as a "raw" value.

### Returns
nullptr or a pointer to GetDataType().GetSize() bytes.
"""
function gdalmdarraygetrawnodatavalue(hArray)
    aftercare(ccall((:GDALMDArrayGetRawNoDataValue, libgdal), Ptr{Cvoid}, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetNoDataValueAsDouble(GDALMDArrayH hArray,
                                      int * pbHasNoDataValue) -> double

Return the nodata value as a double.

### Parameters
* **hArray**: Array handle.
* **pbHasNoDataValue**: Pointer to a output boolean that will be set to true if a nodata value exists and can be converted to double. Might be nullptr.

### Returns
the nodata value as a double. A 0.0 value might also indicate the absence of a nodata value or an error in the conversion (*pbHasNoDataValue will be set to false then).
"""
function gdalmdarraygetnodatavalueasdouble(hArray, pbHasNoDataValue)
    aftercare(ccall((:GDALMDArrayGetNoDataValueAsDouble, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasNoDataValue))
end

"""
    GDALMDArraySetRawNoDataValue(GDALMDArrayH hArray,
                                 const void * pNoData) -> int

Set the nodata value as a "raw" value.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetrawnodatavalue(hArray, arg2)
    aftercare(ccall((:GDALMDArraySetRawNoDataValue, libgdal), Cint, (GDALMDArrayH, Ptr{Cvoid}), hArray, arg2))
end

"""
    GDALMDArraySetNoDataValueAsDouble(GDALMDArrayH hArray,
                                      double dfNoDataValue) -> int

Set the nodata value as a double.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetnodatavalueasdouble(hArray, dfNoDataValue)
    aftercare(ccall((:GDALMDArraySetNoDataValueAsDouble, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfNoDataValue))
end

"""
    GDALMDArraySetScale(GDALMDArrayH hArray,
                        double dfScale) -> int

Set the scale value to apply to raw values.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetscale(hArray, dfScale)
    aftercare(ccall((:GDALMDArraySetScale, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfScale))
end

"""
    GDALMDArrayGetScale(GDALMDArrayH hArray,
                        int * pbHasValue) -> double

Get the scale value to apply to raw values.

### Returns
the scale value
"""
function gdalmdarraygetscale(hArray, pbHasValue)
    aftercare(ccall((:GDALMDArrayGetScale, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasValue))
end

"""
    GDALMDArraySetOffset(GDALMDArrayH hArray,
                         double dfOffset) -> int

Set the scale value to apply to raw values.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetoffset(hArray, dfOffset)
    aftercare(ccall((:GDALMDArraySetOffset, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfOffset))
end

"""
    GDALMDArrayGetOffset(GDALMDArrayH hArray,
                         int * pbHasValue) -> double

Get the scale value to apply to raw values.

### Returns
the scale value
"""
function gdalmdarraygetoffset(hArray, pbHasValue)
    aftercare(ccall((:GDALMDArrayGetOffset, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasValue))
end

"""
    GDALMDArrayGetBlockSize(GDALMDArrayH hArray,
                            size_t * pnCount) -> GUInt64 *

Return the "natural" block size of the array along all dimensions.

### Returns
the block size, in number of elements along each dimension.
"""
function gdalmdarraygetblocksize(hArray, pnCount)
    aftercare(ccall((:GDALMDArrayGetBlockSize, libgdal), Ptr{GUInt64}, (GDALMDArrayH, Ptr{Csize_t}), hArray, pnCount))
end

"""
    GDALMDArraySetUnit(GDALMDArrayH hArray,
                       const char * pszUnit) -> int

Set the variable unit.

### Parameters
* **hArray**: array.
* **pszUnit**: unit name.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetunit(hArray, arg2)
    aftercare(ccall((:GDALMDArraySetUnit, libgdal), Cint, (GDALMDArrayH, Cstring), hArray, arg2))
end

"""
    GDALMDArrayGetUnit(GDALMDArrayH hArray) -> const char *

Return the array unit.
"""
function gdalmdarraygetunit(hArray)
    aftercare(ccall((:GDALMDArrayGetUnit, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

"""
    GDALMDArraySetSpatialRef(GDALMDArrayH hArray,
                             OGRSpatialReferenceH hSRS) -> int

Assign a spatial reference system object to the the array.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetspatialref(arg1, arg2)
    aftercare(ccall((:GDALMDArraySetSpatialRef, libgdal), Cint, (GDALMDArrayH, OGRSpatialReferenceH), arg1, arg2))
end

"""
    GDALMDArrayGetSpatialRef(GDALMDArrayH hArray) -> OGRSpatialReferenceH

Return the spatial reference system object associated with the array.
"""
function gdalmdarraygetspatialref(hArray)
    aftercare(ccall((:GDALMDArrayGetSpatialRef, libgdal), OGRSpatialReferenceH, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetProcessingChunkSize(GDALMDArrayH hArray,
                                      size_t * pnCount,
                                      size_t nMaxChunkMemory) -> size_t *

Return an optimal chunk size for read/write oerations, given the natural block size and memory constraints specified.

### Parameters
* **hArray**: Array.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.
* **nMaxChunkMemory**: Maximum amount of memory, in bytes, to use for the chunk.

### Returns
the chunk size, in number of elements along each dimension.
"""
function gdalmdarraygetprocessingchunksize(hArray, pnCount, nMaxChunkMemory)
    aftercare(ccall((:GDALMDArrayGetProcessingChunkSize, libgdal), Ptr{Csize_t}, (GDALMDArrayH, Ptr{Csize_t}, Csize_t), hArray, pnCount, nMaxChunkMemory))
end

"""
    GDALMDArrayGetStructuralInfo(GDALMDArrayH hArray) -> CSLConstList

Return structural information on the array.
"""
function gdalmdarraygetstructuralinfo(hArray)
    aftercare(ccall((:GDALMDArrayGetStructuralInfo, libgdal), CSLConstList, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetView(GDALMDArrayH hArray,
                       const char * pszViewExpr) -> GDALMDArrayH

Return a view of the array using slicing or field access.
"""
function gdalmdarraygetview(hArray, pszViewExpr)
    aftercare(ccall((:GDALMDArrayGetView, libgdal), GDALMDArrayH, (GDALMDArrayH, Cstring), hArray, pszViewExpr))
end

"""
    GDALMDArrayTranspose(GDALMDArrayH hArray,
                         size_t nNewAxisCount,
                         const int * panMapNewAxisToOldAxis) -> GDALMDArrayH

Return a view of the array whose axis have been reordered.
"""
function gdalmdarraytranspose(hArray, nNewAxisCount, panMapNewAxisToOldAxis)
    aftercare(ccall((:GDALMDArrayTranspose, libgdal), GDALMDArrayH, (GDALMDArrayH, Csize_t, Ptr{Cint}), hArray, nNewAxisCount, panMapNewAxisToOldAxis))
end

"""
    GDALMDArrayGetUnscaled(GDALMDArrayH hArray) -> GDALMDArrayH

Return an array that is the unscaled version of the current one.
"""
function gdalmdarraygetunscaled(hArray)
    aftercare(ccall((:GDALMDArrayGetUnscaled, libgdal), GDALMDArrayH, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetMask(GDALMDArrayH hArray,
                       CSLConstList papszOptions) -> GDALMDArrayH

Return an array that is a mask for the current array.
"""
function gdalmdarraygetmask(hArray, papszOptions)
    aftercare(ccall((:GDALMDArrayGetMask, libgdal), GDALMDArrayH, (GDALMDArrayH, CSLConstList), hArray, papszOptions))
end

"""
    GDALMDArrayAsClassicDataset(GDALMDArrayH hArray,
                                size_t iXDim,
                                size_t iYDim) -> GDALDatasetH

Return a view of this array as a "classic" GDALDataset (ie 2D)

### Parameters
* **hArray**: Array.
* **iXDim**: Index of the dimension that will be used as the X/width axis.
* **iYDim**: Index of the dimension that will be used as the Y/height axis.

### Returns
a new GDALDataset that must be freed with GDALClose(), or nullptr
"""
function gdalmdarrayasclassicdataset(hArray, iXDim, iYDim)
    aftercare(ccall((:GDALMDArrayAsClassicDataset, libgdal), GDALDatasetH, (GDALMDArrayH, Csize_t, Csize_t), hArray, iXDim, iYDim))
end

"""
    GDALMDArrayGetStatistics(GDALMDArrayH hArray,
                             GDALDatasetH hDS,
                             int bApproxOK,
                             int bForce,
                             double * pdfMin,
                             double * pdfMax,
                             double * pdfMean,
                             double * pdfStdDev,
                             GUInt64 * pnValidCount,
                             GDALProgressFunc pfnProgress,
                             void * pProgressData) -> CPLErr

Fetch statistics.
"""
function gdalmdarraygetstatistics(hArray, arg2, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, pfnProgress, pProgressData)
    aftercare(ccall((:GDALMDArrayGetStatistics, libgdal), CPLErr, (GDALMDArrayH, GDALDatasetH, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{GUInt64}, GDALProgressFunc, Ptr{Cvoid}), hArray, arg2, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, pfnProgress, pProgressData))
end

"""
    GDALMDArrayComputeStatistics(GDALMDArrayH hArray,
                                 GDALDatasetH hDS,
                                 int bApproxOK,
                                 double * pdfMin,
                                 double * pdfMax,
                                 double * pdfMean,
                                 double * pdfStdDev,
                                 GUInt64 * pnValidCount,
                                 GDALProgressFunc pfnProgress,
                                 void * pProgressData) -> int

Compute statistics.
"""
function gdalmdarraycomputestatistics(hArray, arg2, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, arg9, pProgressData)
    aftercare(ccall((:GDALMDArrayComputeStatistics, libgdal), Cint, (GDALMDArrayH, GDALDatasetH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{GUInt64}, GDALProgressFunc, Ptr{Cvoid}), hArray, arg2, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, arg9, pProgressData))
end

"""
    GDALAttributeRelease(GDALAttributeH hAttr) -> void

Release the GDAL in-memory object associated with a GDALAttribute.
"""
function gdalattributerelease(hAttr)
    aftercare(ccall((:GDALAttributeRelease, libgdal), Cvoid, (GDALAttributeH,), hAttr))
end

"""
    GDALReleaseAttributes(GDALAttributeH * attributes,
                          size_t nCount) -> void

Free the return of GDALGroupGetAttributes() or GDALMDArrayGetAttributes()

### Parameters
* **attributes**: return pointer of above methods
* **nCount**: *pnCount value returned by above methods
"""
function gdalreleaseattributes(attributes, nCount)
    aftercare(ccall((:GDALReleaseAttributes, libgdal), Cvoid, (Ptr{GDALAttributeH}, Csize_t), attributes, nCount))
end

"""
    GDALAttributeGetName(GDALAttributeH hAttr) -> const char *

Return the name of the attribute.
"""
function gdalattributegetname(hAttr)
    aftercare(ccall((:GDALAttributeGetName, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

"""
    GDALAttributeGetFullName(GDALAttributeH hAttr) -> const char *

Return the full name of the attribute.
"""
function gdalattributegetfullname(hAttr)
    aftercare(ccall((:GDALAttributeGetFullName, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

"""
    GDALAttributeGetTotalElementsCount(GDALAttributeH hAttr) -> GUInt64

Return the total number of values in the attribute.
"""
function gdalattributegettotalelementscount(hAttr)
    aftercare(ccall((:GDALAttributeGetTotalElementsCount, libgdal), GUInt64, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeGetDimensionCount(GDALAttributeH hAttr) -> size_t

Return the number of dimensions.
"""
function gdalattributegetdimensioncount(hAttr)
    aftercare(ccall((:GDALAttributeGetDimensionCount, libgdal), Csize_t, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeGetDimensionsSize(GDALAttributeH hAttr,
                                   size_t * pnCount) -> GUInt64 *

Return the dimension sizes of the attribute.

### Parameters
* **hAttr**: Attribute.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
an array of *pnCount values.
"""
function gdalattributegetdimensionssize(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeGetDimensionsSize, libgdal), Ptr{GUInt64}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

"""
    GDALAttributeGetDataType(GDALAttributeH hAttr) -> GDALExtendedDataTypeH

Return the data type.
"""
function gdalattributegetdatatype(hAttr)
    aftercare(ccall((:GDALAttributeGetDataType, libgdal), GDALExtendedDataTypeH, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeReadAsRaw(GDALAttributeH hAttr,
                           size_t * pnSize) -> GByte *

Return the raw value of an attribute.

### Parameters
* **hAttr**: Attribute.
* **pnSize**: Pointer to the number of bytes returned. Must NOT be NULL.

### Returns
a buffer of *pnSize bytes.
"""
function gdalattributereadasraw(hAttr, pnSize)
    aftercare(ccall((:GDALAttributeReadAsRaw, libgdal), Ptr{GByte}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnSize))
end

"""
    GDALAttributeFreeRawResult(GDALAttributeH hAttr,
                               GByte * raw,
                               size_t nSize) -> void

Free the return of GDALAttributeAsRaw()
"""
function gdalattributefreerawresult(hAttr, raw, nSize)
    aftercare(ccall((:GDALAttributeFreeRawResult, libgdal), Cvoid, (GDALAttributeH, Ptr{GByte}, Csize_t), hAttr, raw, nSize))
end

"""
    GDALAttributeReadAsString(GDALAttributeH hAttr) -> const char *

Return the value of an attribute as a string.

### Returns
a string, or nullptr.
"""
function gdalattributereadasstring(hAttr)
    aftercare(ccall((:GDALAttributeReadAsString, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

"""
    GDALAttributeReadAsInt(GDALAttributeH hAttr) -> int

Return the value of an attribute as a integer.

### Returns
a integer, or INT_MIN in case of error.
"""
function gdalattributereadasint(hAttr)
    aftercare(ccall((:GDALAttributeReadAsInt, libgdal), Cint, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeReadAsDouble(GDALAttributeH hAttr) -> double

Return the value of an attribute as a double.

### Returns
a double value.
"""
function gdalattributereadasdouble(hAttr)
    aftercare(ccall((:GDALAttributeReadAsDouble, libgdal), Cdouble, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeReadAsStringArray(GDALAttributeH hAttr) -> char **

Return the value of an attribute as an array of strings.
"""
function gdalattributereadasstringarray(hAttr)
    aftercare(ccall((:GDALAttributeReadAsStringArray, libgdal), Ptr{Cstring}, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeReadAsIntArray(GDALAttributeH hAttr,
                                size_t * pnCount) -> int *

Return the value of an attribute as an array of integers.

### Parameters
* **hAttr**: Attribute
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
array to be freed with CPLFree(), or nullptr.
"""
function gdalattributereadasintarray(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeReadAsIntArray, libgdal), Ptr{Cint}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

"""
    GDALAttributeReadAsDoubleArray(GDALAttributeH hAttr,
                                   size_t * pnCount) -> double *

Return the value of an attribute as an array of doubles.

### Parameters
* **hAttr**: Attribute
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
array to be freed with CPLFree(), or nullptr.
"""
function gdalattributereadasdoublearray(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeReadAsDoubleArray, libgdal), Ptr{Cdouble}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

"""
    GDALAttributeWriteRaw(GDALAttributeH hAttr,
                          const void * pabyValue,
                          size_t nLength) -> int

Write an attribute from raw values expressed in GetDataType()

### Parameters
* **hAttr**: Attribute
* **pabyValue**: Buffer of nLen bytes.
* **nLength**: Size of pabyValue in bytes. Should be equal to GetTotalElementsCount() * GetDataType().GetSize()

### Returns
TRUE in case of success.
"""
function gdalattributewriteraw(hAttr, arg2, arg3)
    aftercare(ccall((:GDALAttributeWriteRaw, libgdal), Cint, (GDALAttributeH, Ptr{Cvoid}, Csize_t), hAttr, arg2, arg3))
end

"""
    GDALAttributeWriteString(GDALAttributeH hAttr,
                             const char * pszVal) -> int

Write an attribute from a string value.

### Parameters
* **hAttr**: Attribute
* **pszVal**: Pointer to a string.

### Returns
TRUE in case of success.
"""
function gdalattributewritestring(hAttr, arg2)
    aftercare(ccall((:GDALAttributeWriteString, libgdal), Cint, (GDALAttributeH, Cstring), hAttr, arg2))
end

"""
    GDALAttributeWriteStringArray(GDALAttributeH hAttr,
                                  CSLConstList papszValues) -> int

Write an attribute from an array of strings.

### Parameters
* **hAttr**: Attribute
* **papszValues**: Array of strings.

### Returns
TRUE in case of success.
"""
function gdalattributewritestringarray(hAttr, arg2)
    aftercare(ccall((:GDALAttributeWriteStringArray, libgdal), Cint, (GDALAttributeH, CSLConstList), hAttr, arg2))
end

"""
    GDALAttributeWriteInt(GDALAttributeH hAttr,
                          int nVal) -> int

Write an attribute from a integer value.

### Parameters
* **hAttr**: Attribute
* **nVal**: Value.

### Returns
TRUE in case of success.
"""
function gdalattributewriteint(hAttr, arg2)
    aftercare(ccall((:GDALAttributeWriteInt, libgdal), Cint, (GDALAttributeH, Cint), hAttr, arg2))
end

"""
    GDALAttributeWriteDouble(GDALAttributeH hAttr,
                             double dfVal) -> int

Write an attribute from a double value.

### Parameters
* **hAttr**: Attribute
* **dfVal**: Value.

### Returns
TRUE in case of success.
"""
function gdalattributewritedouble(hAttr, arg2)
    aftercare(ccall((:GDALAttributeWriteDouble, libgdal), Cint, (GDALAttributeH, Cdouble), hAttr, arg2))
end

"""
    GDALAttributeWriteDoubleArray(GDALAttributeH hAttr,
                                  const double * padfValues,
                                  size_t nCount) -> int

Write an attribute from an array of double.

### Parameters
* **hAttr**: Attribute
* **padfValues**: Array of double.
* **nCount**: Should be equal to GetTotalElementsCount().

### Returns
TRUE in case of success.
"""
function gdalattributewritedoublearray(hAttr, arg2, arg3)
    aftercare(ccall((:GDALAttributeWriteDoubleArray, libgdal), Cint, (GDALAttributeH, Ptr{Cdouble}, Csize_t), hAttr, arg2, arg3))
end

"""
    GDALDimensionRelease(GDALDimensionH hDim) -> void

Release the GDAL in-memory object associated with a GDALDimension.
"""
function gdaldimensionrelease(hDim)
    aftercare(ccall((:GDALDimensionRelease, libgdal), Cvoid, (GDALDimensionH,), hDim))
end

"""
    GDALReleaseDimensions(GDALDimensionH * dims,
                          size_t nCount) -> void

Free the return of GDALGroupGetDimensions() or GDALMDArrayGetDimensions()

### Parameters
* **dims**: return pointer of above methods
* **nCount**: *pnCount value returned by above methods
"""
function gdalreleasedimensions(dims, nCount)
    aftercare(ccall((:GDALReleaseDimensions, libgdal), Cvoid, (Ptr{GDALDimensionH}, Csize_t), dims, nCount))
end

"""
    GDALDimensionGetName(GDALDimensionH hDim) -> const char *

Return dimension name.
"""
function gdaldimensiongetname(hDim)
    aftercare(ccall((:GDALDimensionGetName, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

"""
    GDALDimensionGetFullName(GDALDimensionH hDim) -> const char *

Return dimension full name.
"""
function gdaldimensiongetfullname(hDim)
    aftercare(ccall((:GDALDimensionGetFullName, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

"""
    GDALDimensionGetType(GDALDimensionH hDim) -> const char *

Return dimension type.
"""
function gdaldimensiongettype(hDim)
    aftercare(ccall((:GDALDimensionGetType, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

"""
    GDALDimensionGetDirection(GDALDimensionH hDim) -> const char *

Return dimension direction.
"""
function gdaldimensiongetdirection(hDim)
    aftercare(ccall((:GDALDimensionGetDirection, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

"""
    GDALDimensionGetSize(GDALDimensionH hDim) -> GUInt64

Return the size, that is the number of values along the dimension.
"""
function gdaldimensiongetsize(hDim)
    aftercare(ccall((:GDALDimensionGetSize, libgdal), GUInt64, (GDALDimensionH,), hDim))
end

"""
    GDALDimensionGetIndexingVariable(GDALDimensionH hDim) -> GDALMDArrayH

Return the variable that is used to index the dimension (if there is one).
"""
function gdaldimensiongetindexingvariable(hDim)
    aftercare(ccall((:GDALDimensionGetIndexingVariable, libgdal), GDALMDArrayH, (GDALDimensionH,), hDim))
end

"""
    GDALDimensionSetIndexingVariable(GDALDimensionH hDim,
                                     GDALMDArrayH hArray) -> int

Set the variable that is used to index the dimension.

### Returns
TRUE in case of success.
"""
function gdaldimensionsetindexingvariable(hDim, hArray)
    aftercare(ccall((:GDALDimensionSetIndexingVariable, libgdal), Cint, (GDALDimensionH, GDALMDArrayH), hDim, hArray))
end

"""
    GDALComputeMedianCutPCT(GDALRasterBandH hRed,
                            GDALRasterBandH hGreen,
                            GDALRasterBandH hBlue,
                            int(*)(int, int, void *) pfnIncludePixel,
                            int nColors,
                            GDALColorTableH hColorTable,
                            GDALProgressFunc pfnProgress,
                            void * pProgressArg) -> int

Compute optimal PCT for RGB image.

### Parameters
* **hRed**: Red input band.
* **hGreen**: Green input band.
* **hBlue**: Blue input band.
* **pfnIncludePixel**: function used to test which pixels should be included in the analysis. At this time this argument is ignored and all pixels are utilized. This should normally be NULL.
* **nColors**: the desired number of colors to be returned (2-256).
* **hColorTable**: the colors will be returned in this color table object.
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
returns CE_None on success or CE_Failure if an error occurs.
"""
function gdalcomputemediancutpct(hRed, hGreen, hBlue, pfnIncludePixel, nColors, hColorTable, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALComputeMedianCutPCT, libgdal), Cint, (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, Ptr{Cvoid}, Cint, GDALColorTableH, GDALProgressFunc, Ptr{Cvoid}), hRed, hGreen, hBlue, pfnIncludePixel, nColors, hColorTable, pfnProgress, pProgressArg))
end

"""
    GDALDitherRGB2PCT(GDALRasterBandH hRed,
                      GDALRasterBandH hGreen,
                      GDALRasterBandH hBlue,
                      GDALRasterBandH hTarget,
                      GDALColorTableH hColorTable,
                      GDALProgressFunc pfnProgress,
                      void * pProgressArg) -> int

24bit to 8bit conversion with dithering.

### Parameters
* **hRed**: Red input band.
* **hGreen**: Green input band.
* **hBlue**: Blue input band.
* **hTarget**: Output band.
* **hColorTable**: the color table to use with the output band.
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function gdalditherrgb2pct(hRed, hGreen, hBlue, hTarget, hColorTable, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALDitherRGB2PCT, libgdal), Cint, (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALColorTableH, GDALProgressFunc, Ptr{Cvoid}), hRed, hGreen, hBlue, hTarget, hColorTable, pfnProgress, pProgressArg))
end

"""
    GDALChecksumImage(GDALRasterBandH hBand,
                      int nXOff,
                      int nYOff,
                      int nXSize,
                      int nYSize) -> int

Compute checksum for image region.

### Parameters
* **hBand**: the raster band to read from.
* **nXOff**: pixel offset of window to read.
* **nYOff**: line offset of window to read.
* **nXSize**: pixel size of window to read.
* **nYSize**: line size of window to read.

### Returns
Checksum value.
"""
function gdalchecksumimage(hBand, nXOff, nYOff, nXSize, nYSize)
    aftercare(ccall((:GDALChecksumImage, libgdal), Cint, (GDALRasterBandH, Cint, Cint, Cint, Cint), hBand, nXOff, nYOff, nXSize, nYSize))
end

"""
    GDALComputeProximity(GDALRasterBandH hSrcBand,
                         GDALRasterBandH hProximityBand,
                         char ** papszOptions,
                         GDALProgressFunc pfnProgress,
                         void * pProgressArg) -> CPLErr

Compute the proximity of all pixels in the image to a set of pixels in the source image.
"""
function gdalcomputeproximity(hSrcBand, hProximityBand, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALComputeProximity, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hProximityBand, papszOptions, pfnProgress, pProgressArg))
end

"""
    GDALFillNodata(GDALRasterBandH hTargetBand,
                   GDALRasterBandH hMaskBand,
                   double dfMaxSearchDist,
                   int bDeprecatedOption,
                   int nSmoothingIterations,
                   char ** papszOptions,
                   GDALProgressFunc pfnProgress,
                   void * pProgressArg) -> CPLErr

Fill selected raster regions by interpolation from the edges.

### Parameters
* **hTargetBand**: the raster band to be modified in place.
* **hMaskBand**: a mask band indicating pixels to be interpolated (zero valued).
* **dfMaxSearchDist**: the maximum number of pixels to search in all directions to find values to interpolate from.
* **bDeprecatedOption**: unused argument, should be zero.
* **nSmoothingIterations**: the number of 3x3 smoothing filter passes to run (0 or more).
* **papszOptions**: additional name=value options in a string list. 

TEMP_FILE_DRIVER=gdal_driver_name. For example MEM. 


NODATA=value (starting with GDAL 2.4). Source pixels at that value will be ignored by the interpolator. Warning: currently this will not be honored by smoothing passes.
* **pfnProgress**: the progress function to report completion.
* **pProgressArg**: callback data for progress function.

### Returns
CE_None on success or CE_Failure if something goes wrong.
"""
function gdalfillnodata(hTargetBand, hMaskBand, dfMaxSearchDist, bDeprecatedOption, nSmoothingIterations, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALFillNodata, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, Cdouble, Cint, Cint, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hTargetBand, hMaskBand, dfMaxSearchDist, bDeprecatedOption, nSmoothingIterations, papszOptions, pfnProgress, pProgressArg))
end

"""
    GDALPolygonize(GDALRasterBandH hSrcBand,
                   GDALRasterBandH hMaskBand,
                   OGRLayerH hOutLayer,
                   int iPixValField,
                   char ** papszOptions,
                   GDALProgressFunc pfnProgress,
                   void * pProgressArg) -> CPLErr

Create polygon coverage from raster data.

### Parameters
* **hSrcBand**: the source raster band to be processed.
* **hMaskBand**: an optional mask band. All pixels in the mask band with a value other than zero will be considered suitable for collection as polygons.
* **hOutLayer**: the vector feature layer to which the polygons should be written.
* **iPixValField**: the attribute field index indicating the feature attribute into which the pixel value of the polygon should be written. Or -1 to indicate that the pixel value must not be written.
* **papszOptions**: a name/value list of additional options 

8CONNECTED=8: May be set to "8" to use 8 connectedness. Otherwise 4 connectedness will be applied to the algorithm
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
CE_None on success or CE_Failure on a failure.
"""
function gdalpolygonize(hSrcBand, hMaskBand, hOutLayer, iPixValField, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALPolygonize, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, OGRLayerH, Cint, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hMaskBand, hOutLayer, iPixValField, papszOptions, pfnProgress, pProgressArg))
end

"""
    GDALFPolygonize(GDALRasterBandH hSrcBand,
                    GDALRasterBandH hMaskBand,
                    OGRLayerH hOutLayer,
                    int iPixValField,
                    char ** papszOptions,
                    GDALProgressFunc pfnProgress,
                    void * pProgressArg) -> CPLErr

Create polygon coverage from raster data.

### Parameters
* **hSrcBand**: the source raster band to be processed.
* **hMaskBand**: an optional mask band. All pixels in the mask band with a value other than zero will be considered suitable for collection as polygons.
* **hOutLayer**: the vector feature layer to which the polygons should be written.
* **iPixValField**: the attribute field index indicating the feature attribute into which the pixel value of the polygon should be written. Or -1 to indicate that the pixel value must not be written.
* **papszOptions**: a name/value list of additional options 

8CONNECTED=8: May be set to "8" to use 8 connectedness. Otherwise 4 connectedness will be applied to the algorithm
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
CE_None on success or CE_Failure on a failure.
"""
function gdalfpolygonize(hSrcBand, hMaskBand, hOutLayer, iPixValField, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALFPolygonize, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, OGRLayerH, Cint, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hMaskBand, hOutLayer, iPixValField, papszOptions, pfnProgress, pProgressArg))
end

"""
    GDALSieveFilter(GDALRasterBandH hSrcBand,
                    GDALRasterBandH hMaskBand,
                    GDALRasterBandH hDstBand,
                    int nSizeThreshold,
                    int nConnectedness,
                    char ** papszOptions,
                    GDALProgressFunc pfnProgress,
                    void * pProgressArg) -> CPLErr

Removes small raster polygons.

### Parameters
* **hSrcBand**: the source raster band to be processed.
* **hMaskBand**: an optional mask band. All pixels in the mask band with a value other than zero will be considered suitable for inclusion in polygons.
* **hDstBand**: the output raster band. It may be the same as hSrcBand to update the source in place.
* **nSizeThreshold**: raster polygons with sizes smaller than this will be merged into their largest neighbour.
* **nConnectedness**: either 4 indicating that diagonal pixels are not considered directly adjacent for polygon membership purposes or 8 indicating they are.
* **papszOptions**: algorithm options in name=value list form. None currently supported.
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function gdalsievefilter(hSrcBand, hMaskBand, hDstBand, nSizeThreshold, nConnectedness, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALSieveFilter, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, Cint, Cint, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hMaskBand, hDstBand, nSizeThreshold, nConnectedness, papszOptions, pfnProgress, pProgressArg))
end

const GDALTransformerFunc = Ptr{Cvoid}

struct GDALTransformerInfo
    abySignature::NTuple{4, GByte}
    pszClassName::Cstring
    pfnTransform::GDALTransformerFunc
    pfnCleanup::Ptr{Cvoid}
    pfnSerialize::Ptr{Cvoid}
    pfnCreateSimilar::Ptr{Cvoid}
end

"""
    gdaldestroytransformer(pTransformerArg)

Doxygen\\_Suppress 
"""
function gdaldestroytransformer(pTransformerArg)
    aftercare(ccall((:GDALDestroyTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformerArg))
end

"""
    GDALUseTransformer(void * pTransformArg,
                       int bDstToSrc,
                       int nPointCount,
                       double * x,
                       double * y,
                       double * z,
                       int * panSuccess) -> int
"""
function gdalusetransformer(pTransformerArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALUseTransformer, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformerArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    GDALCreateSimilarTransformer(void * pTransformArg,
                                 double dfRatioX,
                                 double dfRatioY) -> void *
"""
function gdalcreatesimilartransformer(psTransformerArg, dfSrcRatioX, dfSrcRatioY)
    aftercare(ccall((:GDALCreateSimilarTransformer, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Cdouble, Cdouble), psTransformerArg, dfSrcRatioX, dfSrcRatioY))
end

"""
    GDALCreateGenImgProjTransformer(GDALDatasetH hSrcDS,
                                    const char * pszSrcWKT,
                                    GDALDatasetH hDstDS,
                                    const char * pszDstWKT,
                                    int bGCPUseOK,
                                    double dfGCPErrorThreshold,
                                    int nOrder) -> void *

Create image to image transformer.

### Parameters
* **hSrcDS**: source dataset, or NULL.
* **pszSrcWKT**: the coordinate system for the source dataset. If NULL, it will be read from the dataset itself.
* **hDstDS**: destination dataset (or NULL).
* **pszDstWKT**: the coordinate system for the destination dataset. If NULL, and hDstDS not NULL, it will be read from the destination dataset.
* **bGCPUseOK**: TRUE if GCPs should be used if the geotransform is not available on the source dataset (not destination).
* **dfGCPErrorThreshold**: ignored/deprecated.
* **nOrder**: the maximum order to use for GCP derived polynomials if possible. Use 0 to autoselect, or -1 for thin plate splines.

### Returns
handle suitable for use GDALGenImgProjTransform(), and to be deallocated with GDALDestroyGenImgProjTransformer().
"""
function gdalcreategenimgprojtransformer(hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, bGCPUseOK, dfGCPErrorThreshold, nOrder)
    aftercare(ccall((:GDALCreateGenImgProjTransformer, libgdal), Ptr{Cvoid}, (GDALDatasetH, Cstring, GDALDatasetH, Cstring, Cint, Cdouble, Cint), hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, bGCPUseOK, dfGCPErrorThreshold, nOrder))
end

"""
    GDALCreateGenImgProjTransformer2(GDALDatasetH hSrcDS,
                                     GDALDatasetH hDstDS,
                                     char ** papszOptions) -> void *

Create image to image transformer.

### Parameters
* **hSrcDS**: source dataset, or NULL.
* **hDstDS**: destination dataset (or NULL).
* **papszOptions**: NULL-terminated list of string options (or NULL).

### Returns
handle suitable for use GDALGenImgProjTransform(), and to be deallocated with GDALDestroyGenImgProjTransformer() or NULL on failure.
"""
function gdalcreategenimgprojtransformer2(hSrcDS, hDstDS, papszOptions)
    aftercare(ccall((:GDALCreateGenImgProjTransformer2, libgdal), Ptr{Cvoid}, (GDALDatasetH, GDALDatasetH, Ptr{Cstring}), hSrcDS, hDstDS, papszOptions))
end

"""
    GDALCreateGenImgProjTransformer3(const char * pszSrcWKT,
                                     const double * padfSrcGeoTransform,
                                     const char * pszDstWKT,
                                     const double * padfDstGeoTransform) -> void *

Create image to image transformer.

### Parameters
* **pszSrcWKT**: source WKT (or NULL).
* **padfSrcGeoTransform**: source geotransform (or NULL).
* **pszDstWKT**: destination WKT (or NULL).
* **padfDstGeoTransform**: destination geotransform (or NULL).

### Returns
handle suitable for use GDALGenImgProjTransform(), and to be deallocated with GDALDestroyGenImgProjTransformer() or NULL on failure.
"""
function gdalcreategenimgprojtransformer3(pszSrcWKT, padfSrcGeoTransform, pszDstWKT, padfDstGeoTransform)
    aftercare(ccall((:GDALCreateGenImgProjTransformer3, libgdal), Ptr{Cvoid}, (Cstring, Ptr{Cdouble}, Cstring, Ptr{Cdouble}), pszSrcWKT, padfSrcGeoTransform, pszDstWKT, padfDstGeoTransform))
end

"""
    GDALCreateGenImgProjTransformer4(OGRSpatialReferenceH hSrcSRS,
                                     const double * padfSrcGeoTransform,
                                     OGRSpatialReferenceH hDstSRS,
                                     const double * padfDstGeoTransform,
                                     const char *const * papszOptions) -> void *

Create image to image transformer.
"""
function gdalcreategenimgprojtransformer4(hSrcSRS, padfSrcGeoTransform, hDstSRS, padfDstGeoTransform, papszOptions)
    aftercare(ccall((:GDALCreateGenImgProjTransformer4, libgdal), Ptr{Cvoid}, (OGRSpatialReferenceH, Ptr{Cdouble}, OGRSpatialReferenceH, Ptr{Cdouble}, Ptr{Cstring}), hSrcSRS, padfSrcGeoTransform, hDstSRS, padfDstGeoTransform, papszOptions))
end

"""
    GDALSetGenImgProjTransformerDstGeoTransform(void * hTransformArg,
                                                const double * padfGeoTransform) -> void

Set GenImgProj output geotransform.

### Parameters
* **hTransformArg**: the handle to update.
* **padfGeoTransform**: the destination geotransform to apply (six doubles).
"""
function gdalsetgenimgprojtransformerdstgeotransform(arg1, arg2)
    aftercare(ccall((:GDALSetGenImgProjTransformerDstGeoTransform, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALDestroyGenImgProjTransformer(void * hTransformArg) -> void

GenImgProjTransformer deallocator.

### Parameters
* **hTransformArg**: the handle to deallocate.
"""
function gdaldestroygenimgprojtransformer(arg1)
    aftercare(ccall((:GDALDestroyGenImgProjTransformer, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

"""
    GDALGenImgProjTransform(void * pTransformArgIn,
                            int bDstToSrc,
                            int nPointCount,
                            double * padfX,
                            double * padfY,
                            double * padfZ,
                            int * panSuccess) -> int

Perform general image reprojection transformation.
"""
function gdalgenimgprojtransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALGenImgProjTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    GDALSetTransformerDstGeoTransform(void * pTransformArg,
                                      const double * padfGeoTransform) -> void

Set ApproxTransformer or GenImgProj output geotransform.

### Parameters
* **pTransformArg**: the handle to update.
* **padfGeoTransform**: the destination geotransform to apply (six doubles).
"""
function gdalsettransformerdstgeotransform(arg1, arg2)
    aftercare(ccall((:GDALSetTransformerDstGeoTransform, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALGetTransformerDstGeoTransform(void * pTransformArg,
                                      double * padfGeoTransform) -> void

Get ApproxTransformer or GenImgProj output geotransform.

### Parameters
* **pTransformArg**: transformer handle.
* **padfGeoTransform**: (output) the destination geotransform to return (six doubles).
"""
function gdalgettransformerdstgeotransform(arg1, arg2)
    aftercare(ccall((:GDALGetTransformerDstGeoTransform, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALCreateReprojectionTransformer(const char * pszSrcWKT,
                                      const char * pszDstWKT) -> void *

Create reprojection transformer.

### Parameters
* **pszSrcWKT**: the coordinate system for the source coordinate system.
* **pszDstWKT**: the coordinate system for the destination coordinate system.

### Returns
Handle for use with GDALReprojectionTransform(), or NULL if the system fails to initialize the reprojection.
"""
function gdalcreatereprojectiontransformer(pszSrcWKT, pszDstWKT)
    aftercare(ccall((:GDALCreateReprojectionTransformer, libgdal), Ptr{Cvoid}, (Cstring, Cstring), pszSrcWKT, pszDstWKT))
end

"""
    GDALCreateReprojectionTransformerEx(OGRSpatialReferenceH hSrcSRS,
                                        OGRSpatialReferenceH hDstSRS,
                                        const char *const * papszOptions) -> void *

Create reprojection transformer.

### Parameters
* **hSrcSRS**: the coordinate system for the source coordinate system.
* **hDstSRS**: the coordinate system for the destination coordinate system.
* **papszOptions**: NULL-terminated list of options, or NULL. Currently supported options are: 

AREA_OF_INTEREST=west_long,south_lat,east_long,north_lat: Values in degrees. longitudes in [-180,180], latitudes in [-90,90]. 


COORDINATE_OPERATION=string: PROJ or WKT string representing a coordinate operation, overriding the default computed transformation. 


COORDINATE_EPOCH=decimal_year: Coordinate epoch, expressed as a decimal year. Useful for time-dependant coordinate operations.

### Returns
Handle for use with GDALReprojectionTransform(), or NULL if the system fails to initialize the reprojection.
"""
function gdalcreatereprojectiontransformerex(hSrcSRS, hDstSRS, papszOptions)
    aftercare(ccall((:GDALCreateReprojectionTransformerEx, libgdal), Ptr{Cvoid}, (OGRSpatialReferenceH, OGRSpatialReferenceH, Ptr{Cstring}), hSrcSRS, hDstSRS, papszOptions))
end

"""
    GDALDestroyReprojectionTransformer(void * pTransformArg) -> void

Destroy reprojection transformation.

### Parameters
* **pTransformArg**: the transformation handle returned by GDALCreateReprojectionTransformer().
"""
function gdaldestroyreprojectiontransformer(arg1)
    aftercare(ccall((:GDALDestroyReprojectionTransformer, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

"""
    GDALReprojectionTransform(void * pTransformArg,
                              int bDstToSrc,
                              int nPointCount,
                              double * padfX,
                              double * padfY,
                              double * padfZ,
                              int * panSuccess) -> int

Perform reprojection transformation.
"""
function gdalreprojectiontransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALReprojectionTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    GDALCreateGCPTransformer(int nGCPCount,
                             const GDAL_GCP * pasGCPList,
                             int nReqOrder,
                             int bReversed) -> void *

Create GCP based polynomial transformer.

### Parameters
* **nGCPCount**: the number of GCPs in pasGCPList.
* **pasGCPList**: an array of GCPs to be used as input.
* **nReqOrder**: the requested polynomial order. It should be 1, 2 or 3. Using 3 is not recommended due to potential numeric instabilities issues.
* **bReversed**: set it to TRUE to compute the reversed transformation.

### Returns
the transform argument or nullptr if creation fails.
"""
function gdalcreategcptransformer(nGCPCount, pasGCPList, nReqOrder, bReversed)
    aftercare(ccall((:GDALCreateGCPTransformer, libgdal), Ptr{Cvoid}, (Cint, Ptr{GDAL_GCP}, Cint, Cint), nGCPCount, pasGCPList, nReqOrder, bReversed))
end

"""
    GDALCreateGCPRefineTransformer(int nGCPCount,
                                   const GDAL_GCP * pasGCPList,
                                   int nReqOrder,
                                   int bReversed,
                                   double dfTolerance,
                                   int nMinimumGcps) -> void *

Create GCP based polynomial transformer, with a tolerance threshold to discard GCPs that transform badly.
"""
function gdalcreategcprefinetransformer(nGCPCount, pasGCPList, nReqOrder, bReversed, tolerance, minimumGcps)
    aftercare(ccall((:GDALCreateGCPRefineTransformer, libgdal), Ptr{Cvoid}, (Cint, Ptr{GDAL_GCP}, Cint, Cint, Cdouble, Cint), nGCPCount, pasGCPList, nReqOrder, bReversed, tolerance, minimumGcps))
end

"""
    GDALDestroyGCPTransformer(void * pTransformArg) -> void

Destroy GCP transformer.

### Parameters
* **pTransformArg**: the transform arg previously returned by GDALCreateGCPTransformer().
"""
function gdaldestroygcptransformer(pTransformArg)
    aftercare(ccall((:GDALDestroyGCPTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformArg))
end

"""
    GDALGCPTransform(void * pTransformArg,
                     int bDstToSrc,
                     int nPointCount,
                     double * x,
                     double * y,
                     double * z,
                     int * panSuccess) -> int

Transforms point based on GCP derived polynomial model.

### Parameters
* **pTransformArg**: return value from GDALCreateGCPTransformer().
* **bDstToSrc**: TRUE if transformation is from the destination (georeferenced) coordinates to pixel/line or FALSE when transforming from pixel/line to georeferenced coordinates.
* **nPointCount**: the number of values in the x, y and z arrays.
* **x**: array containing the X values to be transformed.
* **y**: array containing the Y values to be transformed.
* **z**: array containing the Z values to be transformed.
* **panSuccess**: array in which a flag indicating success (TRUE) or failure (FALSE) of the transformation are placed.

### Returns
TRUE.
"""
function gdalgcptransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALGCPTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    GDALCreateTPSTransformer(int nGCPCount,
                             const GDAL_GCP * pasGCPList,
                             int bReversed) -> void *

Create Thin Plate Spline transformer from GCPs.

### Parameters
* **nGCPCount**: the number of GCPs in pasGCPList.
* **pasGCPList**: an array of GCPs to be used as input.
* **bReversed**: set it to TRUE to compute the reversed transformation.

### Returns
the transform argument or NULL if creation fails.
"""
function gdalcreatetpstransformer(nGCPCount, pasGCPList, bReversed)
    aftercare(ccall((:GDALCreateTPSTransformer, libgdal), Ptr{Cvoid}, (Cint, Ptr{GDAL_GCP}, Cint), nGCPCount, pasGCPList, bReversed))
end

"""
    GDALDestroyTPSTransformer(void * pTransformArg) -> void

Destroy TPS transformer.

### Parameters
* **pTransformArg**: the transform arg previously returned by GDALCreateTPSTransformer().
"""
function gdaldestroytpstransformer(pTransformArg)
    aftercare(ccall((:GDALDestroyTPSTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformArg))
end

"""
    GDALTPSTransform(void * pTransformArg,
                     int bDstToSrc,
                     int nPointCount,
                     double * x,
                     double * y,
                     double * z,
                     int * panSuccess) -> int

Transforms point based on GCP derived polynomial model.

### Parameters
* **pTransformArg**: return value from GDALCreateTPSTransformer().
* **bDstToSrc**: TRUE if transformation is from the destination (georeferenced) coordinates to pixel/line or FALSE when transforming from pixel/line to georeferenced coordinates.
* **nPointCount**: the number of values in the x, y and z arrays.
* **x**: array containing the X values to be transformed.
* **y**: array containing the Y values to be transformed.
* **z**: array containing the Z values to be transformed.
* **panSuccess**: array in which a flag indicating success (TRUE) or failure (FALSE) of the transformation are placed.

### Returns
TRUE.
"""
function gdaltpstransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALTPSTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    rpcinfotomd(psRPCInfo)

Doxygen\\_Suppress 
"""
function rpcinfotomd(psRPCInfo)
    aftercare(ccall((:RPCInfoToMD, libgdal), Ptr{Cstring}, (Ptr{GDALRPCInfo},), psRPCInfo))
end

function gdalcreaterpctransformer(psRPC, bReversed, dfPixErrThreshold, papszOptions)
    aftercare(ccall((:GDALCreateRPCTransformer, libgdal), Ptr{Cvoid}, (Ptr{GDALRPCInfo}, Cint, Cdouble, Ptr{Cstring}), psRPC, bReversed, dfPixErrThreshold, papszOptions))
end

"""
    GDALDestroyRPCTransformer(void * pTransformAlg) -> void

Destroy RPC tranformer.
"""
function gdaldestroyrpctransformer(pTransformArg)
    aftercare(ccall((:GDALDestroyRPCTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformArg))
end

"""
    GDALRPCTransform(void * pTransformArg,
                     int bDstToSrc,
                     int nPointCount,
                     double * padfX,
                     double * padfY,
                     double * padfZ,
                     int * panSuccess) -> int

RPC transform.
"""
function gdalrpctransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALRPCTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    GDALCreateGeoLocTransformer(GDALDatasetH hBaseDS,
                                char ** papszGeolocationInfo,
                                int bReversed) -> void *

Create GeoLocation transformer.
"""
function gdalcreategeoloctransformer(hBaseDS, papszGeolocationInfo, bReversed)
    aftercare(ccall((:GDALCreateGeoLocTransformer, libgdal), Ptr{Cvoid}, (GDALDatasetH, Ptr{Cstring}, Cint), hBaseDS, papszGeolocationInfo, bReversed))
end

"""
    GDALDestroyGeoLocTransformer(void * pTransformAlg) -> void

Destroy GeoLocation transformer.
"""
function gdaldestroygeoloctransformer(pTransformArg)
    aftercare(ccall((:GDALDestroyGeoLocTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformArg))
end

"""
    GDALGeoLocTransform(void * pTransformArg,
                        int bDstToSrc,
                        int nPointCount,
                        double * padfX,
                        double * padfY,
                        double * padfZ,
                        int * panSuccess) -> int

Use GeoLocation transformer.
"""
function gdalgeoloctransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALGeoLocTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    GDALCreateApproxTransformer(GDALTransformerFunc pfnBaseTransformer,
                                void * pBaseTransformArg,
                                double dfMaxError) -> void *

Create an approximating transformer.

### Parameters
* **pfnBaseTransformer**: the high precision transformer which should be approximated.
* **pBaseTransformArg**: the callback argument for the high precision transformer.
* **dfMaxError**: the maximum cartesian error in the "output" space that is to be accepted in the linear approximation.

### Returns
callback pointer suitable for use with GDALApproxTransform(). It should be deallocated with GDALDestroyApproxTransformer().
"""
function gdalcreateapproxtransformer(pfnRawTransformer, pRawTransformerArg, dfMaxError)
    aftercare(ccall((:GDALCreateApproxTransformer, libgdal), Ptr{Cvoid}, (GDALTransformerFunc, Ptr{Cvoid}, Cdouble), pfnRawTransformer, pRawTransformerArg, dfMaxError))
end

"""
    GDALApproxTransformerOwnsSubtransformer(void * pCBData,
                                            int bOwnFlag) -> void

Set bOwnSubtransformer flag.
"""
function gdalapproxtransformerownssubtransformer(pCBData, bOwnFlag)
    aftercare(ccall((:GDALApproxTransformerOwnsSubtransformer, libgdal), Cvoid, (Ptr{Cvoid}, Cint), pCBData, bOwnFlag))
end

"""
    GDALDestroyApproxTransformer(void * pCBData) -> void

Cleanup approximate transformer.

### Parameters
* **pCBData**: callback data originally returned by GDALCreateApproxTransformer().
"""
function gdaldestroyapproxtransformer(pApproxArg)
    aftercare(ccall((:GDALDestroyApproxTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pApproxArg))
end

"""
    GDALApproxTransform(void * pCBData,
                        int bDstToSrc,
                        int nPoints,
                        double * x,
                        double * y,
                        double * z,
                        int * panSuccess) -> int

Perform approximate transformation.
"""
function gdalapproxtransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALApproxTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    GDALSimpleImageWarp(GDALDatasetH hSrcDS,
                        GDALDatasetH hDstDS,
                        int nBandCount,
                        int * panBandList,
                        GDALTransformerFunc pfnTransform,
                        void * pTransformArg,
                        GDALProgressFunc pfnProgress,
                        void * pProgressArg,
                        char ** papszWarpOptions) -> int

Perform simple image warp.

### Parameters
* **hSrcDS**: the source image dataset.
* **hDstDS**: the destination image dataset.
* **nBandCount**: the number of bands to be warped. If zero, all bands will be processed.
* **panBandList**: the list of bands to translate.
* **pfnTransform**: the transformation function to call. See GDALTransformerFunc().
* **pTransformArg**: the callback handle to pass to pfnTransform.
* **pfnProgress**: the function used to report progress. See GDALProgressFunc().
* **pProgressArg**: the callback handle to pass to pfnProgress.
* **papszWarpOptions**: additional options controlling the warp.

### Returns
TRUE if the operation completes, or FALSE if an error occurs.
"""
function gdalsimpleimagewarp(hSrcDS, hDstDS, nBandCount, panBandList, pfnTransform, pTransformArg, pfnProgress, pProgressArg, papszWarpOptions)
    aftercare(ccall((:GDALSimpleImageWarp, libgdal), Cint, (GDALDatasetH, GDALDatasetH, Cint, Ptr{Cint}, GDALTransformerFunc, Ptr{Cvoid}, GDALProgressFunc, Ptr{Cvoid}, Ptr{Cstring}), hSrcDS, hDstDS, nBandCount, panBandList, pfnTransform, pTransformArg, pfnProgress, pProgressArg, papszWarpOptions))
end

"""
    GDALSuggestedWarpOutput(GDALDatasetH hSrcDS,
                            GDALTransformerFunc pfnTransformer,
                            void * pTransformArg,
                            double * padfGeoTransformOut,
                            int * pnPixels,
                            int * pnLines) -> CPLErr

Suggest output file size.

### Parameters
* **hSrcDS**: the input image (it is assumed the whole input images is being transformed).
* **pfnTransformer**: the transformer function.
* **pTransformArg**: the callback data for the transformer function.
* **padfGeoTransformOut**: the array of six doubles in which the suggested geotransform is returned.
* **pnPixels**: int in which the suggest pixel width of output is returned.
* **pnLines**: int in which the suggest pixel height of output is returned.

### Returns
CE_None if successful or CE_Failure otherwise.
"""
function gdalsuggestedwarpoutput(hSrcDS, pfnTransformer, pTransformArg, padfGeoTransformOut, pnPixels, pnLines)
    aftercare(ccall((:GDALSuggestedWarpOutput, libgdal), CPLErr, (GDALDatasetH, GDALTransformerFunc, Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), hSrcDS, pfnTransformer, pTransformArg, padfGeoTransformOut, pnPixels, pnLines))
end

"""
    GDALSuggestedWarpOutput2(GDALDatasetH hSrcDS,
                             GDALTransformerFunc pfnTransformer,
                             void * pTransformArg,
                             double * padfGeoTransformOut,
                             int * pnPixels,
                             int * pnLines,
                             double * padfExtent,
                             int nOptions) -> CPLErr

Suggest output file size.

### Parameters
* **hSrcDS**: the input image (it is assumed the whole input images is being transformed).
* **pfnTransformer**: the transformer function.
* **pTransformArg**: the callback data for the transformer function.
* **padfGeoTransformOut**: the array of six doubles in which the suggested geotransform is returned.
* **pnPixels**: int in which the suggest pixel width of output is returned.
* **pnLines**: int in which the suggest pixel height of output is returned.
* **padfExtent**: Four entry array to return extents as (xmin, ymin, xmax, ymax).
* **nOptions**: Options, currently always zero.

### Returns
CE_None if successful or CE_Failure otherwise.
"""
function gdalsuggestedwarpoutput2(hSrcDS, pfnTransformer, pTransformArg, padfGeoTransformOut, pnPixels, pnLines, padfExtents, nOptions)
    aftercare(ccall((:GDALSuggestedWarpOutput2, libgdal), CPLErr, (GDALDatasetH, GDALTransformerFunc, Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), hSrcDS, pfnTransformer, pTransformArg, padfGeoTransformOut, pnPixels, pnLines, padfExtents, nOptions))
end

"""
    gdalserializetransformer(pfnFunc, pTransformArg)

Doxygen\\_Suppress 
"""
function gdalserializetransformer(pfnFunc, pTransformArg)
    aftercare(ccall((:GDALSerializeTransformer, libgdal), Ptr{CPLXMLNode}, (GDALTransformerFunc, Ptr{Cvoid}), pfnFunc, pTransformArg))
end

"""
    GDALDeserializeTransformer(CPLXMLNode * psTree,
                               GDALTransformerFunc * ppfnFunc,
                               void ** ppTransformArg) -> CPLErr
"""
function gdaldeserializetransformer(psTree, ppfnFunc, ppTransformArg)
    aftercare(ccall((:GDALDeserializeTransformer, libgdal), CPLErr, (Ptr{CPLXMLNode}, Ptr{GDALTransformerFunc}, Ptr{Ptr{Cvoid}}), psTree, ppfnFunc, ppTransformArg))
end

"""
    GDALTransformGeolocations(GDALRasterBandH hXBand,
                              GDALRasterBandH hYBand,
                              GDALRasterBandH hZBand,
                              GDALTransformerFunc pfnTransformer,
                              void * pTransformArg,
                              GDALProgressFunc pfnProgress,
                              void * pProgressArg,
                              char ** papszOptions) -> CPLErr

Transform locations held in bands.

### Parameters
* **hXBand**: the band containing the X locations (usually long/easting).
* **hYBand**: the band containing the Y locations (usually lat/northing).
* **hZBand**: the band containing the Z locations (may be NULL).
* **pfnTransformer**: the transformer function.
* **pTransformArg**: the callback data for the transformer function.
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.
* **papszOptions**: list of name/value options - none currently supported.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function gdaltransformgeolocations(hXBand, hYBand, hZBand, pfnTransformer, pTransformArg, pfnProgress, pProgressArg, papszOptions)
    aftercare(ccall((:GDALTransformGeolocations, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALTransformerFunc, Ptr{Cvoid}, GDALProgressFunc, Ptr{Cvoid}, Ptr{Cstring}), hXBand, hYBand, hZBand, pfnTransformer, pTransformArg, pfnProgress, pProgressArg, papszOptions))
end

"Contour writer callback type "
const GDALContourWriter = Ptr{Cvoid}

"Contour generator opaque type "
const GDALContourGeneratorH = Ptr{Cvoid}

"""
    GDAL_CG_Create(int nWidth,
                   int nHeight,
                   int bNoDataSet,
                   double dfNoDataValue,
                   double dfContourInterval,
                   double dfContourBase,
                   GDALContourWriter pfnWriter,
                   void * pCBData) -> GDALContourGeneratorH

Create contour generator.
"""
function gdal_cg_create(nWidth, nHeight, bNoDataSet, dfNoDataValue, dfContourInterval, dfContourBase, pfnWriter, pCBData)
    aftercare(ccall((:GDAL_CG_Create, libgdal), GDALContourGeneratorH, (Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, GDALContourWriter, Ptr{Cvoid}), nWidth, nHeight, bNoDataSet, dfNoDataValue, dfContourInterval, dfContourBase, pfnWriter, pCBData))
end

"""
    GDAL_CG_FeedLine(GDALContourGeneratorH hCG,
                     double * padfScanline) -> CPLErr

Feed a line to the contour generator.
"""
function gdal_cg_feedline(hCG, padfScanline)
    aftercare(ccall((:GDAL_CG_FeedLine, libgdal), CPLErr, (GDALContourGeneratorH, Ptr{Cdouble}), hCG, padfScanline))
end

"""
    GDAL_CG_Destroy(GDALContourGeneratorH hCG) -> void

Destroy contour generator.
"""
function gdal_cg_destroy(hCG)
    aftercare(ccall((:GDAL_CG_Destroy, libgdal), Cvoid, (GDALContourGeneratorH,), hCG))
end

"""
    OGRContourWriterInfo

Doxygen\\_Suppress 
"""
struct OGRContourWriterInfo
    hLayer::Ptr{Cvoid}
    adfGeoTransform::NTuple{6, Cdouble}
    nElevField::Cint
    nElevFieldMin::Cint
    nElevFieldMax::Cint
    nIDField::Cint
    nNextID::Cint
end

"""
    OGRContourWriter(double dfLevel,
                     int nPoints,
                     double * padfX,
                     double * padfY,
                     void * pInfo) -> CPLErr
"""
function ogrcontourwriter(arg1, arg2, arg3, arg4, pInfo)
    aftercare(ccall((:OGRContourWriter, libgdal), CPLErr, (Cdouble, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}), arg1, arg2, arg3, arg4, pInfo))
end

"""
    GDALContourGenerate(GDALRasterBandH hBand,
                        double dfContourInterval,
                        double dfContourBase,
                        int nFixedLevelCount,
                        double * padfFixedLevels,
                        int bUseNoData,
                        double dfNoDataValue,
                        void * hLayer,
                        int iIDField,
                        int iElevField,
                        GDALProgressFunc pfnProgress,
                        void * pProgressArg) -> CPLErr

Create vector contours from raster DEM.

### Parameters
* **hBand**: The band to read raster data from. The whole band will be processed.
* **dfContourInterval**: The elevation interval between contours generated.
* **dfContourBase**: The "base" relative to which contour intervals are applied. This is normally zero, but could be different. To generate 10m contours at 5, 15, 25, ... the ContourBase would be 5.
* **nFixedLevelCount**: The number of fixed levels. If this is greater than zero, then fixed levels will be used, and ContourInterval and ContourBase are ignored.
* **padfFixedLevels**: The list of fixed contour levels at which contours should be generated. It will contain FixedLevelCount entries, and may be NULL if fixed levels are disabled (FixedLevelCount = 0).
* **bUseNoData**: If TRUE the dfNoDataValue will be used.
* **dfNoDataValue**: The value to use as a "nodata" value. That is, a pixel value which should be ignored in generating contours as if the value of the pixel were not known.
* **hLayer**: The layer to which new contour vectors will be written. Each contour will have a LINESTRING geometry attached to it. This is really of type OGRLayerH, but void * is used to avoid pulling the ogr_api.h file in here.
* **iIDField**: If not -1 this will be used as a field index to indicate where a unique id should be written for each feature (contour) written.
* **iElevField**: If not -1 this will be used as a field index to indicate where the elevation value of the contour should be written.
* **pfnProgress**: A GDALProgressFunc that may be used to report progress to the user, or to interrupt the algorithm. May be NULL if not required.
* **pProgressArg**: The callback data for the pfnProgress function.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function gdalcontourgenerate(hBand, dfContourInterval, dfContourBase, nFixedLevelCount, padfFixedLevels, bUseNoData, dfNoDataValue, hLayer, iIDField, iElevField, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALContourGenerate, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cdouble}, Cint, Cdouble, Ptr{Cvoid}, Cint, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, dfContourInterval, dfContourBase, nFixedLevelCount, padfFixedLevels, bUseNoData, dfNoDataValue, hLayer, iIDField, iElevField, pfnProgress, pProgressArg))
end

"""
    GDALContourGenerateEx(GDALRasterBandH hBand,
                          void * hLayer,
                          CSLConstList options,
                          GDALProgressFunc pfnProgress,
                          void * pProgressArg) -> CPLErr

Create vector contours from raster DEM.

### Parameters
* **hBand**: The band to read raster data from. The whole band will be processed.
* **hLayer**: The layer to which new contour vectors will be written. Each contour will have a LINESTRING geometry attached to it (or POLYGON if POLYGONIZE=YES). This is really of type OGRLayerH, but void * is used to avoid pulling the ogr_api.h file in here.
* **pfnProgress**: A GDALProgressFunc that may be used to report progress to the user, or to interrupt the algorithm. May be NULL if not required.
* **pProgressArg**: The callback data for the pfnProgress function.
* **options**: List of options

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function gdalcontourgenerateex(hBand, hLayer, options, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALContourGenerateEx, libgdal), CPLErr, (GDALRasterBandH, Ptr{Cvoid}, CSLConstList, GDALProgressFunc, Ptr{Cvoid}), hBand, hLayer, options, pfnProgress, pProgressArg))
end

"""
    GDALViewshedMode

Viewshed Modes 
"""
@cenum GDALViewshedMode::UInt32 begin
        GVM_Diagonal = 1
        GVM_Edge = 2
        GVM_Max = 3
        GVM_Min = 4
    end

"""
    GDALViewshedOutputType

Viewshed output types 
"""
@cenum GDALViewshedOutputType::UInt32 begin
        GVOT_NORMAL = 1
        GVOT_MIN_TARGET_HEIGHT_FROM_DEM = 2
        GVOT_MIN_TARGET_HEIGHT_FROM_GROUND = 3
    end

"""
    GDALViewshedGenerate(GDALRasterBandH hBand,
                         const char * pszDriverName,
                         const char * pszTargetRasterName,
                         CSLConstList papszCreationOptions,
                         double dfObserverX,
                         double dfObserverY,
                         double dfObserverHeight,
                         double dfTargetHeight,
                         double dfVisibleVal,
                         double dfInvisibleVal,
                         double dfOutOfRangeVal,
                         double dfNoDataVal,
                         double dfCurvCoeff,
                         GDALViewshedMode eMode,
                         double dfMaxDistance,
                         GDALProgressFunc pfnProgress,
                         void * pProgressArg,
                         GDALViewshedOutputType heightMode,
                         CSLConstList papszExtraOptions) -> GDALDatasetH

Create viewshed from raster DEM.

### Parameters
* **hBand**: The band to read the DEM data from. Only the part of the raster within the specified maxdistance around the observer point is processed.
* **pszDriverName**: Driver name (GTiff if set to NULL)
* **pszTargetRasterName**: The name of the target raster to be generated. Must not be NULL
* **papszCreationOptions**: creation options.
* **dfObserverX**: observer X value (in SRS units)
* **dfObserverY**: observer Y value (in SRS units)
* **dfObserverHeight**: The height of the observer above the DEM surface.
* **dfTargetHeight**: The height of the target above the DEM surface. (default 0)
* **dfVisibleVal**: pixel value for visibility (default 255)
* **dfInvisibleVal**: pixel value for invisibility (default 0)
* **dfOutOfRangeVal**: The value to be set for the cells that fall outside of the range specified by dfMaxDistance.
* **dfNoDataVal**: The value to be set for the cells that have no data. If set to a negative value, nodata is not set. Note: currently, no special processing of input cells at a nodata value is done (which may result in erroneous results).
* **dfCurvCoeff**: Coefficient to consider the effect of the curvature and refraction. The height of the DEM is corrected according to the following formula: [Height] -= dfCurvCoeff * [Target Distance]^2 / [Earth Diameter] For the effect of the atmospheric refraction we can use 0.85714‬.
* **eMode**: The mode of the viewshed calculation. Possible values GVM_Diagonal = 1, GVM_Edge = 2 (default), GVM_Max = 3, GVM_Min = 4.
* **dfMaxDistance**: maximum distance range to compute viewshed. It is also used to clamp the extent of the output raster. If set to 0, then unlimited range is assumed, that is to say the computation is performed on the extent of the whole raster.
* **pfnProgress**: A GDALProgressFunc that may be used to report progress to the user, or to interrupt the algorithm. May be NULL if not required.
* **pProgressArg**: The callback data for the pfnProgress function.
* **heightMode**: Type of information contained in output raster. Possible values GVOT_NORMAL = 1 (default), GVOT_MIN_TARGET_HEIGHT_FROM_DEM = 2, GVOT_MIN_TARGET_HEIGHT_FROM_GROUND = 3
* **papszExtraOptions**: Future extra options. Must be set to NULL currently.

### Returns
not NULL output dataset on success (to be closed with GDALClose()) or NULL if an error occurs.
"""
function gdalviewshedgenerate(hBand, pszDriverName, pszTargetRasterName, papszCreationOptions, dfObserverX, dfObserverY, dfObserverHeight, dfTargetHeight, dfVisibleVal, dfInvisibleVal, dfOutOfRangeVal, dfNoDataVal, dfCurvCoeff, eMode, dfMaxDistance, pfnProgress, pProgressArg, heightMode, papszExtraOptions)
    aftercare(ccall((:GDALViewshedGenerate, libgdal), GDALDatasetH, (GDALRasterBandH, Cstring, Cstring, CSLConstList, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, GDALViewshedMode, Cdouble, GDALProgressFunc, Ptr{Cvoid}, GDALViewshedOutputType, CSLConstList), hBand, pszDriverName, pszTargetRasterName, papszCreationOptions, dfObserverX, dfObserverY, dfObserverHeight, dfTargetHeight, dfVisibleVal, dfInvisibleVal, dfOutOfRangeVal, dfNoDataVal, dfCurvCoeff, eMode, dfMaxDistance, pfnProgress, pProgressArg, heightMode, papszExtraOptions))
end

"""
    gdalrasterizegeometries(hDS, nBandCount, panBandList, nGeomCount, pahGeometries, pfnTransformer, pTransformArg, padfGeomBurnValue, papszOptions, pfnProgress, pProgressArg)

*********************************************************************
"""
function gdalrasterizegeometries(hDS, nBandCount, panBandList, nGeomCount, pahGeometries, pfnTransformer, pTransformArg, padfGeomBurnValue, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALRasterizeGeometries, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{Cint}, Cint, Ptr{OGRGeometryH}, GDALTransformerFunc, Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hDS, nBandCount, panBandList, nGeomCount, pahGeometries, pfnTransformer, pTransformArg, padfGeomBurnValue, papszOptions, pfnProgress, pProgressArg))
end

"""
    GDALRasterizeLayers(GDALDatasetH hDS,
                        int nBandCount,
                        int * panBandList,
                        int nLayerCount,
                        OGRLayerH * pahLayers,
                        GDALTransformerFunc pfnTransformer,
                        void * pTransformArg,
                        double * padfLayerBurnValues,
                        char ** papszOptions,
                        GDALProgressFunc pfnProgress,
                        void * pProgressArg) -> CPLErr

Burn geometries from the specified list of layers into raster.

### Parameters
* **hDS**: output data, must be opened in update mode.
* **nBandCount**: the number of bands to be updated.
* **panBandList**: the list of bands to be updated.
* **nLayerCount**: the number of layers being passed in pahLayers array.
* **pahLayers**: the array of layers to burn in.
* **pfnTransformer**: transformation to apply to geometries to put into pixel/line coordinates on raster. If NULL a geotransform based one will be created internally.
* **pTransformArg**: callback data for transformer.
* **padfLayerBurnValues**: the array of values to burn into the raster. There should be nBandCount values for each layer.
* **papszOptions**: special options controlling rasterization: 

"ATTRIBUTE": Identifies an attribute field on the features to be used for a burn in value. The value will be burned into all output bands. If specified, padfLayerBurnValues will not be used and can be a NULL pointer. 


"CHUNKYSIZE": The height in lines of the chunk to operate on. The larger the chunk size the less times we need to make a pass through all the shapes. If it is not set or set to zero the default chunk size will be used. Default size will be estimated based on the GDAL cache buffer size using formula: cache_size_bytes/scanline_size_bytes, so the chunk will not exceed the cache. 


"ALL_TOUCHED": May be set to TRUE to set all pixels touched by the line or polygons, not just those whose center is within the polygon or that are selected by brezenhams line algorithm. Defaults to FALSE. 


"BURN_VALUE_FROM": May be set to "Z" to use the Z values of the geometries. The value from padfLayerBurnValues or the attribute field value is added to this before burning. In default case dfBurnValue is burned as it is. This is implemented properly only for points and lines for now. Polygons will be burned using the Z value from the first point. The M value may be supported in the future. 


"MERGE_ALG": May be REPLACE (the default) or ADD. REPLACE results in overwriting of value, while ADD adds the new value to the existing raster, suitable for heatmaps for instance.
* **pfnProgress**: the progress function to report completion.
* **pProgressArg**: callback data for progress function.

### Returns
CE_None on success or CE_Failure on error.
"""
function gdalrasterizelayers(hDS, nBandCount, panBandList, nLayerCount, pahLayers, pfnTransformer, pTransformArg, padfLayerBurnValues, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALRasterizeLayers, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{Cint}, Cint, Ptr{OGRLayerH}, GDALTransformerFunc, Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hDS, nBandCount, panBandList, nLayerCount, pahLayers, pfnTransformer, pTransformArg, padfLayerBurnValues, papszOptions, pfnProgress, pProgressArg))
end

"""
    GDALRasterizeLayersBuf(void * pData,
                           int nBufXSize,
                           int nBufYSize,
                           GDALDataType eBufType,
                           int nPixelSpace,
                           int nLineSpace,
                           int nLayerCount,
                           OGRLayerH * pahLayers,
                           const char * pszDstProjection,
                           double * padfDstGeoTransform,
                           GDALTransformerFunc pfnTransformer,
                           void * pTransformArg,
                           double dfBurnValue,
                           char ** papszOptions,
                           GDALProgressFunc pfnProgress,
                           void * pProgressArg) -> CPLErr

Burn geometries from the specified list of layer into raster.

### Parameters
* **pData**: pointer to the output data array.
* **nBufXSize**: width of the output data array in pixels.
* **nBufYSize**: height of the output data array in pixels.
* **eBufType**: data type of the output data array.
* **nPixelSpace**: The byte offset from the start of one pixel value in pData to the start of the next pixel value within a scanline. If defaulted (0) the size of the datatype eBufType is used.
* **nLineSpace**: The byte offset from the start of one scanline in pData to the start of the next. If defaulted the size of the datatype eBufType * nBufXSize is used.
* **nLayerCount**: the number of layers being passed in pahLayers array.
* **pahLayers**: the array of layers to burn in.
* **pszDstProjection**: WKT defining the coordinate system of the target raster.
* **padfDstGeoTransform**: geotransformation matrix of the target raster.
* **pfnTransformer**: transformation to apply to geometries to put into pixel/line coordinates on raster. If NULL a geotransform based one will be created internally.
* **pTransformArg**: callback data for transformer.
* **dfBurnValue**: the value to burn into the raster.
* **papszOptions**: special options controlling rasterization: 

"ATTRIBUTE": Identifies an attribute field on the features to be used for a burn in value. The value will be burned into all output bands. If specified, padfLayerBurnValues will not be used and can be a NULL pointer. 


"ALL_TOUCHED": May be set to TRUE to set all pixels touched by the line or polygons, not just those whose center is within the polygon or that are selected by brezenhams line algorithm. Defaults to FALSE. 


"BURN_VALUE_FROM": May be set to "Z" to use the Z values of the geometries. dfBurnValue or the attribute field value is added to this before burning. In default case dfBurnValue is burned as it is. This is implemented properly only for points and lines for now. Polygons will be burned using the Z value from the first point. The M value may be supported in the future. 


"MERGE_ALG": May be REPLACE (the default) or ADD. REPLACE results in overwriting of value, while ADD adds the new value to the existing raster, suitable for heatmaps for instance.
* **pfnProgress**: the progress function to report completion.
* **pProgressArg**: callback data for progress function.

### Returns
CE_None on success or CE_Failure on error.
"""
function gdalrasterizelayersbuf(pData, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nLayerCount, pahLayers, pszDstProjection, padfDstGeoTransform, pfnTransformer, pTransformArg, dfBurnValue, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALRasterizeLayersBuf, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Cint, Cint, Ptr{OGRLayerH}, Cstring, Ptr{Cdouble}, GDALTransformerFunc, Ptr{Cvoid}, Cdouble, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), pData, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nLayerCount, pahLayers, pszDstProjection, padfDstGeoTransform, pfnTransformer, pTransformArg, dfBurnValue, papszOptions, pfnProgress, pProgressArg))
end

"""
    GDALGridAlgorithm

Gridding Algorithms 

| Enumerator                                   | Note                                                                      |
| :------------------------------------------- | :------------------------------------------------------------------------ |
| GGA\\_InverseDistanceToAPower                | Inverse distance to a power                                               |
| GGA\\_MovingAverage                          | Moving Average                                                            |
| GGA\\_NearestNeighbor                        | Nearest Neighbor                                                          |
| GGA\\_MetricMinimum                          | Minimum Value (Data Metric)                                               |
| GGA\\_MetricMaximum                          | Maximum Value (Data Metric)                                               |
| GGA\\_MetricRange                            | Data Range (Data Metric)                                                  |
| GGA\\_MetricCount                            | Number of Points (Data Metric)                                            |
| GGA\\_MetricAverageDistance                  | Average Distance (Data Metric)                                            |
| GGA\\_MetricAverageDistancePts               | Average Distance Between Data Points (Data Metric)                        |
| GGA\\_Linear                                 | Linear interpolation (from Delaunay triangulation. Since GDAL 2.1         |
| GGA\\_InverseDistanceToAPowerNearestNeighbor | Inverse distance to a power with nearest neighbor search for max points   |
"""
@cenum GDALGridAlgorithm::UInt32 begin
        GGA_InverseDistanceToAPower = 1
        GGA_MovingAverage = 2
        GGA_NearestNeighbor = 3
        GGA_MetricMinimum = 4
        GGA_MetricMaximum = 5
        GGA_MetricRange = 6
        GGA_MetricCount = 7
        GGA_MetricAverageDistance = 8
        GGA_MetricAverageDistancePts = 9
        GGA_Linear = 10
        GGA_InverseDistanceToAPowerNearestNeighbor = 11
    end

"""
    GDALGridInverseDistanceToAPowerOptions

Inverse distance to a power method control options 

| Field             | Note                                                                                                                                                                                         |
| :---------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dfPower           | Weighting power.                                                                                                                                                                             |
| dfSmoothing       | Smoothing parameter.                                                                                                                                                                         |
| dfAnisotropyRatio | Reserved for future use.                                                                                                                                                                     |
| dfAnisotropyAngle |                                                                                                                                                                                              |
| dfRadius1         | The first radius (X axis if rotation angle is 0) of search ellipse.                                                                                                                          |
| dfRadius2         | The second radius (Y axis if rotation angle is 0) of search ellipse.                                                                                                                         |
| dfAngle           | Angle of ellipse rotation in degrees.  Ellipse rotated counter clockwise.                                                                                                                    |
| nMaxPoints        | Maximum number of data points to use.  Do not search for more points than this number. If less amount of points found the grid node considered empty and will be filled with NODATA marker.  |
| nMinPoints        | Minimum number of data points to use.  If less amount of points found the grid node considered empty and will be filled with NODATA marker.                                                  |
| dfNoDataValue     | No data marker to fill empty points.                                                                                                                                                         |
"""
struct GDALGridInverseDistanceToAPowerOptions
    dfPower::Cdouble
    dfSmoothing::Cdouble
    dfAnisotropyRatio::Cdouble
    dfAnisotropyAngle::Cdouble
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMaxPoints::GUInt32
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

"""
    GDALGridInverseDistanceToAPowerNearestNeighborOptions

Inverse distance to a power, with nearest neighbour search, control options 

| Field         | Note                                                                                                                                                                                         |
| :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dfPower       | Weighting power.                                                                                                                                                                             |
| dfRadius      | The radius of search circle.                                                                                                                                                                 |
| dfSmoothing   | Smoothing parameter.                                                                                                                                                                         |
| nMaxPoints    | Maximum number of data points to use.  Do not search for more points than this number. If less amount of points found the grid node considered empty and will be filled with NODATA marker.  |
| nMinPoints    | Minimum number of data points to use.  If less amount of points found the grid node considered empty and will be filled with NODATA marker.                                                  |
| dfNoDataValue | No data marker to fill empty points.                                                                                                                                                         |
"""
struct GDALGridInverseDistanceToAPowerNearestNeighborOptions
    dfPower::Cdouble
    dfRadius::Cdouble
    dfSmoothing::Cdouble
    nMaxPoints::GUInt32
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

"""
    GDALGridMovingAverageOptions

Moving average method control options 

| Field         | Note                                                                                                                                             |
| :------------ | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| dfRadius1     | The first radius (X axis if rotation angle is 0) of search ellipse.                                                                              |
| dfRadius2     | The second radius (Y axis if rotation angle is 0) of search ellipse.                                                                             |
| dfAngle       | Angle of ellipse rotation in degrees.  Ellipse rotated counter clockwise.                                                                        |
| nMinPoints    | Minimum number of data points to average.  If less amount of points found the grid node considered empty and will be filled with NODATA marker.  |
| dfNoDataValue | No data marker to fill empty points.                                                                                                             |
"""
struct GDALGridMovingAverageOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

"""
    GDALGridNearestNeighborOptions

Nearest neighbor method control options 

| Field         | Note                                                                       |
| :------------ | :------------------------------------------------------------------------- |
| dfRadius1     | The first radius (X axis if rotation angle is 0) of search ellipse.        |
| dfRadius2     | The second radius (Y axis if rotation angle is 0) of search ellipse.       |
| dfAngle       | Angle of ellipse rotation in degrees.  Ellipse rotated counter clockwise.  |
| dfNoDataValue | No data marker to fill empty points.                                       |
"""
struct GDALGridNearestNeighborOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    dfNoDataValue::Cdouble
end

"""
    GDALGridDataMetricsOptions

Data metrics method control options 

| Field         | Note                                                                                                                                             |
| :------------ | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| dfRadius1     | The first radius (X axis if rotation angle is 0) of search ellipse.                                                                              |
| dfRadius2     | The second radius (Y axis if rotation angle is 0) of search ellipse.                                                                             |
| dfAngle       | Angle of ellipse rotation in degrees.  Ellipse rotated counter clockwise.                                                                        |
| nMinPoints    | Minimum number of data points to average.  If less amount of points found the grid node considered empty and will be filled with NODATA marker.  |
| dfNoDataValue | No data marker to fill empty points.                                                                                                             |
"""
struct GDALGridDataMetricsOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

"""
    GDALGridLinearOptions

Linear method control options 

| Field         | Note                                                                                                                                                                                                                                                                              |
| :------------ | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dfRadius      | In case the point to be interpolated does not fit into a triangle of the Delaunay triangulation, use that maximum distance to search a nearest neighbour, or use nodata otherwise. If set to -1, the search distance is infinite. If set to 0, nodata value will be always used.  |
| dfNoDataValue | No data marker to fill empty points.                                                                                                                                                                                                                                              |
"""
struct GDALGridLinearOptions
    dfRadius::Cdouble
    dfNoDataValue::Cdouble
end

"""
    GDALGridCreate(GDALGridAlgorithm eAlgorithm,
                   const void * poOptions,
                   GUInt32 nPoints,
                   const double * padfX,
                   const double * padfY,
                   const double * padfZ,
                   double dfXMin,
                   double dfXMax,
                   double dfYMin,
                   double dfYMax,
                   GUInt32 nXSize,
                   GUInt32 nYSize,
                   GDALDataType eType,
                   void * pData,
                   GDALProgressFunc pfnProgress,
                   void * pProgressArg) -> CPLErr

Create regular grid from the scattered data.

### Parameters
* **eAlgorithm**: Gridding method.
* **poOptions**: Options to control chosen gridding method.
* **nPoints**: Number of elements in input arrays.
* **padfX**: Input array of X coordinates.
* **padfY**: Input array of Y coordinates.
* **padfZ**: Input array of Z values.
* **dfXMin**: Lowest X border of output grid.
* **dfXMax**: Highest X border of output grid.
* **dfYMin**: Lowest Y border of output grid.
* **dfYMax**: Highest Y border of output grid.
* **nXSize**: Number of columns in output grid.
* **nYSize**: Number of rows in output grid.
* **eType**: Data type of output array.
* **pData**: Pointer to array where the computed grid will be stored.
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
CE_None on success or CE_Failure if something goes wrong.
"""
function gdalgridcreate(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16)
    aftercare(ccall((:GDALGridCreate, libgdal), CPLErr, (GDALGridAlgorithm, Ptr{Cvoid}, GUInt32, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, Cdouble, Cdouble, GUInt32, GUInt32, GDALDataType, Ptr{Cvoid}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16))
end

mutable struct GDALGridContext
end

"""
    GDALGridContextCreate(GDALGridAlgorithm eAlgorithm,
                          const void * poOptions,
                          GUInt32 nPoints,
                          const double * padfX,
                          const double * padfY,
                          const double * padfZ,
                          int bCallerWillKeepPointArraysAlive) -> GDALGridContext *

Creates a context to do regular gridding from the scattered data.

### Parameters
* **eAlgorithm**: Gridding method.
* **poOptions**: Options to control chosen gridding method.
* **nPoints**: Number of elements in input arrays.
* **padfX**: Input array of X coordinates.
* **padfY**: Input array of Y coordinates.
* **padfZ**: Input array of Z values.
* **bCallerWillKeepPointArraysAlive**: Whether the provided padfX, padfY, padfZ arrays will still be "alive" during the calls to GDALGridContextProcess(). Setting to TRUE prevent them from being duplicated in the context. If unsure, set to FALSE.

### Returns
the context (to be freed with GDALGridContextFree()) or NULL in case or error.
"""
function gdalgridcontextcreate(eAlgorithm, poOptions, nPoints, padfX, padfY, padfZ, bCallerWillKeepPointArraysAlive)
    aftercare(ccall((:GDALGridContextCreate, libgdal), Ptr{GDALGridContext}, (GDALGridAlgorithm, Ptr{Cvoid}, GUInt32, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint), eAlgorithm, poOptions, nPoints, padfX, padfY, padfZ, bCallerWillKeepPointArraysAlive))
end

"""
    GDALGridContextFree(GDALGridContext * psContext) -> void

Free a context used created by GDALGridContextCreate()

### Parameters
* **psContext**: the context.
"""
function gdalgridcontextfree(psContext)
    aftercare(ccall((:GDALGridContextFree, libgdal), Cvoid, (Ptr{GDALGridContext},), psContext))
end

"""
    GDALGridContextProcess(GDALGridContext * psContext,
                           double dfXMin,
                           double dfXMax,
                           double dfYMin,
                           double dfYMax,
                           GUInt32 nXSize,
                           GUInt32 nYSize,
                           GDALDataType eType,
                           void * pData,
                           GDALProgressFunc pfnProgress,
                           void * pProgressArg) -> CPLErr

Do the gridding of a window of a raster.

### Parameters
* **psContext**: Gridding context.
* **dfXMin**: Lowest X border of output grid.
* **dfXMax**: Highest X border of output grid.
* **dfYMin**: Lowest Y border of output grid.
* **dfYMax**: Highest Y border of output grid.
* **nXSize**: Number of columns in output grid.
* **nYSize**: Number of rows in output grid.
* **eType**: Data type of output array.
* **pData**: Pointer to array where the computed grid will be stored.
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
CE_None on success or CE_Failure if something goes wrong.
"""
function gdalgridcontextprocess(psContext, dfXMin, dfXMax, dfYMin, dfYMax, nXSize, nYSize, eType, pData, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALGridContextProcess, libgdal), CPLErr, (Ptr{GDALGridContext}, Cdouble, Cdouble, Cdouble, Cdouble, GUInt32, GUInt32, GDALDataType, Ptr{Cvoid}, GDALProgressFunc, Ptr{Cvoid}), psContext, dfXMin, dfXMax, dfYMin, dfYMax, nXSize, nYSize, eType, pData, pfnProgress, pProgressArg))
end

"""
    GDALComputeMatchingPoints(GDALDatasetH hFirstImage,
                              GDALDatasetH hSecondImage,
                              char ** papszOptions,
                              int * pnGCPCount) -> GDAL_GCP *

GDALComputeMatchingPoints.
"""
function gdalcomputematchingpoints(hFirstImage, hSecondImage, papszOptions, pnGCPCount)
    aftercare(ccall((:GDALComputeMatchingPoints, libgdal), Ptr{GDAL_GCP}, (GDALDatasetH, GDALDatasetH, Ptr{Cstring}, Ptr{Cint}), hFirstImage, hSecondImage, papszOptions, pnGCPCount))
end

"""
    GDALTriFacet

Triangle fact 

| Field         | Note                                                  |
| :------------ | :---------------------------------------------------- |
| anVertexIdx   | index to the padfX/padfY arrays                       |
| anNeighborIdx | index to GDALDelaunayTriangulation.pasFacets, or -1   |
"""
struct GDALTriFacet
    anVertexIdx::NTuple{3, Cint}
    anNeighborIdx::NTuple{3, Cint}
end

"""
    GDALTriBarycentricCoefficients

Triangle barycentric coefficients.

Conversion from cartesian (x,y) to barycentric (l1,l2,l3) with : l1 = dfMul1X * (x - dfCxtX) + dfMul1Y * (y - dfCstY) l2 = dfMul2X * (x - dfCxtX) + dfMul2Y * (y - dfCstY) l3 = 1 - l1 - l2

| Field   | Note      |
| :------ | :-------- |
| dfMul1X | dfMul1X   |
| dfMul1Y | dfMul1Y   |
| dfMul2X | dfMul2X   |
| dfMul2Y | dfMul2Y   |
| dfCstX  | dfCstX    |
| dfCstY  | dfCstY    |
"""
struct GDALTriBarycentricCoefficients
    dfMul1X::Cdouble
    dfMul1Y::Cdouble
    dfMul2X::Cdouble
    dfMul2Y::Cdouble
    dfCstX::Cdouble
    dfCstY::Cdouble
end

"""
    GDALTriangulation

Triangulation structure 

| Field                | Note                                       |
| :------------------- | :----------------------------------------- |
| nFacets              | number of facets                           |
| pasFacets            | array of nFacets facets                    |
| pasFacetCoefficients | arra of nFacets barycentric coefficients   |
"""
struct GDALTriangulation
    nFacets::Cint
    pasFacets::Ptr{GDALTriFacet}
    pasFacetCoefficients::Ptr{GDALTriBarycentricCoefficients}
end

"""
    GDALHasTriangulation(void) -> int

Returns if GDAL is built with Delaunay triangulation support.

### Returns
TRUE if GDAL is built with Delaunay triangulation support.
"""
function gdalhastriangulation()
    aftercare(ccall((:GDALHasTriangulation, libgdal), Cint, ()))
end

"""
    GDALTriangulationCreateDelaunay(int nPoints,
                                    const double * padfX,
                                    const double * padfY) -> GDALTriangulation *

Computes a Delaunay triangulation of the passed points.

### Parameters
* **nPoints**: number of points
* **padfX**: x coordinates of the points.
* **padfY**: y coordinates of the points.

### Returns
triangulation that must be freed with GDALTriangulationFree(), or NULL in case of error.
"""
function gdaltriangulationcreatedelaunay(nPoints, padfX, padfY)
    aftercare(ccall((:GDALTriangulationCreateDelaunay, libgdal), Ptr{GDALTriangulation}, (Cint, Ptr{Cdouble}, Ptr{Cdouble}), nPoints, padfX, padfY))
end

"""
    GDALTriangulationComputeBarycentricCoefficients(GDALTriangulation * psDT,
                                                    const double * padfX,
                                                    const double * padfY) -> int

Computes barycentric coefficients for each triangles of the triangulation.

### Parameters
* **psDT**: triangulation.
* **padfX**: x coordinates of the points. Must be identical to the one passed to GDALTriangulationCreateDelaunay().
* **padfY**: y coordinates of the points. Must be identical to the one passed to GDALTriangulationCreateDelaunay().

### Returns
TRUE in case of success.
"""
function gdaltriangulationcomputebarycentriccoefficients(psDT, padfX, padfY)
    aftercare(ccall((:GDALTriangulationComputeBarycentricCoefficients, libgdal), Cint, (Ptr{GDALTriangulation}, Ptr{Cdouble}, Ptr{Cdouble}), psDT, padfX, padfY))
end

"""
    GDALTriangulationComputeBarycentricCoordinates(const GDALTriangulation * psDT,
                                                   int nFacetIdx,
                                                   double dfX,
                                                   double dfY,
                                                   double * pdfL1,
                                                   double * pdfL2,
                                                   double * pdfL3) -> int

Computes the barycentric coordinates of a point.

### Parameters
* **psDT**: triangulation.
* **nFacetIdx**: index of the triangle in the triangulation
* **dfX**: x coordinate of the point.
* **dfY**: y coordinate of the point.
* **pdfL1**: (output) pointer to the 1st barycentric coordinate.
* **pdfL2**: (output) pointer to the 2nd barycentric coordinate.
* **pdfL3**: (output) pointer to the 2nd barycentric coordinate.

### Returns
TRUE in case of success.
"""
function gdaltriangulationcomputebarycentriccoordinates(psDT, nFacetIdx, dfX, dfY, pdfL1, pdfL2, pdfL3)
    aftercare(ccall((:GDALTriangulationComputeBarycentricCoordinates, libgdal), Cint, (Ptr{GDALTriangulation}, Cint, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), psDT, nFacetIdx, dfX, dfY, pdfL1, pdfL2, pdfL3))
end

"""
    GDALTriangulationFindFacetBruteForce(const GDALTriangulation * psDT,
                                         double dfX,
                                         double dfY,
                                         int * panOutputFacetIdx) -> int

Returns the index of the triangle that contains the point by iterating over all triangles.

### Parameters
* **psDT**: triangulation.
* **dfX**: x coordinate of the point.
* **dfY**: y coordinate of the point.
* **panOutputFacetIdx**: (output) pointer to the index of the triangle, or -1 in case of failure.

### Returns
index >= 0 of the triangle in case of success, -1 otherwise.
"""
function gdaltriangulationfindfacetbruteforce(psDT, dfX, dfY, panOutputFacetIdx)
    aftercare(ccall((:GDALTriangulationFindFacetBruteForce, libgdal), Cint, (Ptr{GDALTriangulation}, Cdouble, Cdouble, Ptr{Cint}), psDT, dfX, dfY, panOutputFacetIdx))
end

"""
    GDALTriangulationFindFacetDirected(const GDALTriangulation * psDT,
                                       int nFacetIdx,
                                       double dfX,
                                       double dfY,
                                       int * panOutputFacetIdx) -> int

Returns the index of the triangle that contains the point by walking in the triangulation.

### Parameters
* **psDT**: triangulation.
* **nFacetIdx**: index of first triangle to start with. Must be >= 0 && < psDT->nFacets
* **dfX**: x coordinate of the point.
* **dfY**: y coordinate of the point.
* **panOutputFacetIdx**: (output) pointer to the index of the triangle, or -1 in case of failure.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function gdaltriangulationfindfacetdirected(psDT, nFacetIdx, dfX, dfY, panOutputFacetIdx)
    aftercare(ccall((:GDALTriangulationFindFacetDirected, libgdal), Cint, (Ptr{GDALTriangulation}, Cint, Cdouble, Cdouble, Ptr{Cint}), psDT, nFacetIdx, dfX, dfY, panOutputFacetIdx))
end

"""
    GDALTriangulationFree(GDALTriangulation * psDT) -> void

Free a triangulation.

### Parameters
* **psDT**: triangulation.
"""
function gdaltriangulationfree(psDT)
    aftercare(ccall((:GDALTriangulationFree, libgdal), Cvoid, (Ptr{GDALTriangulation},), psDT))
end

"""
    gdaltriangulationterminate()

Doxygen\\_Suppress 
"""
function gdaltriangulationterminate()
    aftercare(ccall((:GDALTriangulationTerminate, libgdal), Cvoid, ()))
end

"""
    GDALOpenVerticalShiftGrid(const char * pszProj4Geoidgrids,
                              int * pbError) -> GDALDatasetH

Load proj.4 geoidgrids as GDAL dataset.

### Parameters
* **pszProj4Geoidgrids**: Value of proj.4 geoidgrids parameter.
* **pbError**: If not NULL, the pointed value will be set to TRUE if an error occurred.

### Returns
a dataset. If not NULL, it must be closed with GDALClose().
"""
function gdalopenverticalshiftgrid(pszProj4Geoidgrids, pbError)
    aftercare(ccall((:GDALOpenVerticalShiftGrid, libgdal), GDALDatasetH, (Cstring, Ptr{Cint}), pszProj4Geoidgrids, pbError))
end

"""
    GDALApplyVerticalShiftGrid(GDALDatasetH hSrcDataset,
                               GDALDatasetH hGridDataset,
                               int bInverse,
                               double dfSrcUnitToMeter,
                               double dfDstUnitToMeter,
                               const char *const * papszOptions) -> GDALDatasetH

Apply a vertical shift grid to a source (DEM typically) dataset.

### Parameters
* **hSrcDataset**: source (DEM) dataset. Must not be NULL.
* **hGridDataset**: vertical grid shift dataset. Must not be NULL.
* **bInverse**: if set to FALSE, hGridDataset values will be added to hSrcDataset. If set to TRUE, they will be subtracted.
* **dfSrcUnitToMeter**: the factor to convert values from hSrcDataset to meters (1.0 if source values are in meter).
* **dfDstUnitToMeter**: the factor to convert shifted values from meter (1.0 if output values must be in meter).
* **papszOptions**: list of options, or NULL. Supported options are: 

RESAMPLING=NEAREST/BILINEAR/CUBIC. Defaults to BILINEAR. 


MAX_ERROR=val. Maximum error measured in input pixels that is allowed in approximating the transformation (0.0 for exact calculations). Defaults to 0.125 


DATATYPE=Byte/UInt16/Int16/Float32/Float64. Output data type. If not specified will be the same as the one of hSrcDataset. 


ERROR_ON_MISSING_VERT_SHIFT=YES/NO. Whether a missing/nodata value in hGridDataset should cause I/O requests to fail. Default is NO (in which case 0 will be used) 


SRC_SRS=srs_def. Override projection on hSrcDataset;

### Returns
a new dataset corresponding to hSrcDataset adjusted with hGridDataset, or NULL. If not NULL, it must be closed with GDALClose().
"""
function gdalapplyverticalshiftgrid(hSrcDataset, hGridDataset, bInverse, dfSrcUnitToMeter, dfDstUnitToMeter, papszOptions)
    aftercare(ccall((:GDALApplyVerticalShiftGrid, libgdal), GDALDatasetH, (GDALDatasetH, GDALDatasetH, Cint, Cdouble, Cdouble, Ptr{Cstring}), hSrcDataset, hGridDataset, bInverse, dfSrcUnitToMeter, dfDstUnitToMeter, papszOptions))
end

const CPLThreadFunc = Ptr{Cvoid}

"""
    CPLLockFile(const char * pszPath,
                double dfWaitInSeconds) -> void *
"""
function cpllockfile(pszPath, dfWaitInSeconds)
    aftercare(ccall((:CPLLockFile, libgdal), Ptr{Cvoid}, (Cstring, Cdouble), pszPath, dfWaitInSeconds))
end

"""
    CPLUnlockFile(void * hLock) -> void
"""
function cplunlockfile(hLock)
    aftercare(ccall((:CPLUnlockFile, libgdal), Cvoid, (Ptr{Cvoid},), hLock))
end

"""
    CPLCreateMutex() -> CPLMutex *
"""
function cplcreatemutex()
    aftercare(ccall((:CPLCreateMutex, libgdal), Ptr{Cvoid}, ()))
end

"""
    CPLCreateMutexEx(int nOptions) -> CPLMutex *
"""
function cplcreatemutexex(nOptions)
    aftercare(ccall((:CPLCreateMutexEx, libgdal), Ptr{Cvoid}, (Cint,), nOptions))
end

"""
    CPLCreateOrAcquireMutex(CPLMutex ** phMutex,
                            double dfWaitInSeconds) -> int
"""
function cplcreateoracquiremutex(arg1, dfWaitInSeconds)
    aftercare(ccall((:CPLCreateOrAcquireMutex, libgdal), Cint, (Ptr{Ptr{Cvoid}}, Cdouble), arg1, dfWaitInSeconds))
end

"""
    CPLCreateOrAcquireMutexEx(CPLMutex ** phMutex,
                              double dfWaitInSeconds,
                              int nOptions) -> int
"""
function cplcreateoracquiremutexex(arg1, dfWaitInSeconds, nOptions)
    aftercare(ccall((:CPLCreateOrAcquireMutexEx, libgdal), Cint, (Ptr{Ptr{Cvoid}}, Cdouble, Cint), arg1, dfWaitInSeconds, nOptions))
end

"""
    CPLAcquireMutex(CPLMutex * hMutexIn,
                    double) -> int
"""
function cplacquiremutex(hMutex, dfWaitInSeconds)
    aftercare(ccall((:CPLAcquireMutex, libgdal), Cint, (Ptr{Cvoid}, Cdouble), hMutex, dfWaitInSeconds))
end

"""
    CPLReleaseMutex(CPLMutex * hMutexIn) -> void
"""
function cplreleasemutex(hMutex)
    aftercare(ccall((:CPLReleaseMutex, libgdal), Cvoid, (Ptr{Cvoid},), hMutex))
end

"""
    CPLDestroyMutex(CPLMutex * hMutexIn) -> void
"""
function cpldestroymutex(hMutex)
    aftercare(ccall((:CPLDestroyMutex, libgdal), Cvoid, (Ptr{Cvoid},), hMutex))
end

"""
    CPLCleanupMasterMutex() -> void
"""
function cplcleanupmastermutex()
    aftercare(ccall((:CPLCleanupMasterMutex, libgdal), Cvoid, ()))
end

"""
    CPLCreateCond() -> CPLCond *
"""
function cplcreatecond()
    aftercare(ccall((:CPLCreateCond, libgdal), Ptr{Cvoid}, ()))
end

"""
    CPLCondWait(CPLCond * hCond,
                CPLMutex * hMutex) -> void
"""
function cplcondwait(hCond, hMutex)
    aftercare(ccall((:CPLCondWait, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), hCond, hMutex))
end

@cenum CPLCondTimedWaitReason::UInt32 begin
        COND_TIMED_WAIT_COND = 0
        COND_TIMED_WAIT_TIME_OUT = 1
        COND_TIMED_WAIT_OTHER = 2
    end

"""
    CPLCondTimedWait(CPLCond * hCond,
                     CPLMutex * hMutex,
                     double dfWaitInSeconds) -> CPLCondTimedWaitReason
"""
function cplcondtimedwait(hCond, hMutex, dfWaitInSeconds)
    aftercare(ccall((:CPLCondTimedWait, libgdal), CPLCondTimedWaitReason, (Ptr{Cvoid}, Ptr{Cvoid}, Cdouble), hCond, hMutex, dfWaitInSeconds))
end

"""
    CPLCondSignal(CPLCond * hCond) -> void
"""
function cplcondsignal(hCond)
    aftercare(ccall((:CPLCondSignal, libgdal), Cvoid, (Ptr{Cvoid},), hCond))
end

"""
    CPLCondBroadcast(CPLCond * hCond) -> void
"""
function cplcondbroadcast(hCond)
    aftercare(ccall((:CPLCondBroadcast, libgdal), Cvoid, (Ptr{Cvoid},), hCond))
end

"""
    CPLDestroyCond(CPLCond * hCond) -> void
"""
function cpldestroycond(hCond)
    aftercare(ccall((:CPLDestroyCond, libgdal), Cvoid, (Ptr{Cvoid},), hCond))
end

"""
    cplgetpid()

Contrary to what its name suggests, [`CPLGetPID`](@ref)() actually returns the thread id 
"""
function cplgetpid()
    aftercare(ccall((:CPLGetPID, libgdal), GIntBig, ()))
end

"""
    CPLGetCurrentProcessID() -> int
"""
function cplgetcurrentprocessid()
    aftercare(ccall((:CPLGetCurrentProcessID, libgdal), Cint, ()))
end

"""
    CPLCreateThread(CPLThreadFunc pfnMain,
                    void * pThreadArg) -> int
"""
function cplcreatethread(pfnMain, pArg)
    aftercare(ccall((:CPLCreateThread, libgdal), Cint, (CPLThreadFunc, Ptr{Cvoid}), pfnMain, pArg))
end

"""
    CPLCreateJoinableThread(CPLThreadFunc pfnMain,
                            void * pThreadArg) -> CPLJoinableThread *
"""
function cplcreatejoinablethread(pfnMain, pArg)
    aftercare(ccall((:CPLCreateJoinableThread, libgdal), Ptr{Cvoid}, (CPLThreadFunc, Ptr{Cvoid}), pfnMain, pArg))
end

"""
    CPLJoinThread(CPLJoinableThread * hJoinableThread) -> void
"""
function cpljointhread(hJoinableThread)
    aftercare(ccall((:CPLJoinThread, libgdal), Cvoid, (Ptr{Cvoid},), hJoinableThread))
end

"""
    CPLSleep(double dfWaitInSeconds) -> void
"""
function cplsleep(dfWaitInSeconds)
    aftercare(ccall((:CPLSleep, libgdal), Cvoid, (Cdouble,), dfWaitInSeconds))
end

"""
    CPLGetThreadingModel() -> const char *
"""
function cplgetthreadingmodel()
    aftercare(ccall((:CPLGetThreadingModel, libgdal), Cstring, ()), false)
end

"""
    CPLGetNumCPUs() -> int
"""
function cplgetnumcpus()
    aftercare(ccall((:CPLGetNumCPUs, libgdal), Cint, ()))
end

mutable struct _CPLLock
end

const CPLLock = _CPLLock

@cenum CPLLockType::UInt32 begin
        LOCK_RECURSIVE_MUTEX = 0
        LOCK_ADAPTIVE_MUTEX = 1
        LOCK_SPIN = 2
    end

"""
    CPLCreateLock(CPLLockType eType) -> CPLLock *
"""
function cplcreatelock(eType)
    aftercare(ccall((:CPLCreateLock, libgdal), Ptr{CPLLock}, (CPLLockType,), eType))
end

"""
    CPLCreateOrAcquireLock(CPLLock ** ppsLock,
                           CPLLockType eType) -> int
"""
function cplcreateoracquirelock(arg1, eType)
    aftercare(ccall((:CPLCreateOrAcquireLock, libgdal), Cint, (Ptr{Ptr{CPLLock}}, CPLLockType), arg1, eType))
end

"""
    CPLAcquireLock(CPLLock * psLock) -> int
"""
function cplacquirelock(arg1)
    aftercare(ccall((:CPLAcquireLock, libgdal), Cint, (Ptr{CPLLock},), arg1))
end

"""
    CPLReleaseLock(CPLLock * psLock) -> void
"""
function cplreleaselock(arg1)
    aftercare(ccall((:CPLReleaseLock, libgdal), Cvoid, (Ptr{CPLLock},), arg1))
end

"""
    CPLDestroyLock(CPLLock * psLock) -> void
"""
function cpldestroylock(arg1)
    aftercare(ccall((:CPLDestroyLock, libgdal), Cvoid, (Ptr{CPLLock},), arg1))
end

"""
    CPLLockSetDebugPerf(CPLLock *,
                        int bEnableIn) -> void
"""
function cpllocksetdebugperf(arg1, bEnableIn)
    aftercare(ccall((:CPLLockSetDebugPerf, libgdal), Cvoid, (Ptr{CPLLock}, Cint), arg1, bEnableIn))
end

"""
    CPLGetTLS(int nIndex) -> void *
"""
function cplgettls(nIndex)
    aftercare(ccall((:CPLGetTLS, libgdal), Ptr{Cvoid}, (Cint,), nIndex))
end

"""
    CPLGetTLSEx(int nIndex,
                int * pbMemoryErrorOccurred) -> void *
"""
function cplgettlsex(nIndex, pbMemoryErrorOccurred)
    aftercare(ccall((:CPLGetTLSEx, libgdal), Ptr{Cvoid}, (Cint, Ptr{Cint}), nIndex, pbMemoryErrorOccurred))
end

"""
    CPLSetTLS(int nIndex,
              void * pData,
              int bFreeOnExit) -> void
"""
function cplsettls(nIndex, pData, bFreeOnExit)
    aftercare(ccall((:CPLSetTLS, libgdal), Cvoid, (Cint, Ptr{Cvoid}, Cint), nIndex, pData, bFreeOnExit))
end

const CPLTLSFreeFunc = Ptr{Cvoid}

"""
    CPLSetTLSWithFreeFunc(int nIndex,
                          void * pData,
                          CPLTLSFreeFunc pfnFree) -> void
"""
function cplsettlswithfreefunc(nIndex, pData, pfnFree)
    aftercare(ccall((:CPLSetTLSWithFreeFunc, libgdal), Cvoid, (Cint, Ptr{Cvoid}, CPLTLSFreeFunc), nIndex, pData, pfnFree))
end

"""
    CPLSetTLSWithFreeFuncEx(int nIndex,
                            void * pData,
                            CPLTLSFreeFunc pfnFree,
                            int * pbMemoryErrorOccurred) -> void
"""
function cplsettlswithfreefuncex(nIndex, pData, pfnFree, pbMemoryErrorOccurred)
    aftercare(ccall((:CPLSetTLSWithFreeFuncEx, libgdal), Cvoid, (Cint, Ptr{Cvoid}, CPLTLSFreeFunc, Ptr{Cint}), nIndex, pData, pfnFree, pbMemoryErrorOccurred))
end

"""
    CPLCleanupTLS() -> void
"""
function cplcleanuptls()
    aftercare(ccall((:CPLCleanupTLS, libgdal), Cvoid, ()))
end

"""
    GDALResampleAlg

Warp Resampling Algorithm 

| Enumerator             | Note                                                                                      |
| :--------------------- | :---------------------------------------------------------------------------------------- |
| GRA\\_NearestNeighbour | Nearest neighbour (select on one input pixel)                                             |
| GRA\\_Bilinear         | Bilinear (2x2 kernel)                                                                     |
| GRA\\_Cubic            | Cubic Convolution Approximation (4x4 kernel)                                              |
| GRA\\_CubicSpline      | Cubic B-Spline Approximation (4x4 kernel)                                                 |
| GRA\\_Lanczos          | Lanczos windowed sinc interpolation (6x6 kernel)                                          |
| GRA\\_Average          | Average (computes the weighted average of all non-NODATA contributing pixels)             |
| GRA\\_Mode             | Mode (selects the value which appears most often of all the sampled points)               |
| GRA\\_Max              | Max (selects maximum of all non-NODATA contributing pixels)                               |
| GRA\\_Min              | Min (selects minimum of all non-NODATA contributing pixels)                               |
| GRA\\_Med              | Med (selects median of all non-NODATA contributing pixels)                                |
| GRA\\_Q1               | Q1 (selects first quartile of all non-NODATA contributing pixels)                         |
| GRA\\_Q3               | Q3 (selects third quartile of all non-NODATA contributing pixels)                         |
| GRA\\_Sum              | Sum (computes the weighed sum of all non-NODATA contributing pixels). Added in GDAL 3.1   |
"""
@cenum GDALResampleAlg::UInt32 begin
        GRA_NearestNeighbour = 0
        GRA_Bilinear = 1
        GRA_Cubic = 2
        GRA_CubicSpline = 3
        GRA_Lanczos = 4
        GRA_Average = 5
        GRA_Mode = 6
        GRA_Max = 8
        GRA_Min = 9
        GRA_Med = 10
        GRA_Q1 = 11
        GRA_Q3 = 12
        GRA_Sum = 13
    end

"""
    GWKAverageOrModeAlg

GWKAverageOrMode Algorithm 

| Enumerator       | Note                                               |
| :--------------- | :------------------------------------------------- |
| GWKAOM\\_Average | Average                                            |
| GWKAOM\\_Fmode   | Mode                                               |
| GWKAOM\\_Imode   | Mode of GDT\\_Byte, GDT\\_UInt16, or GDT\\_Int16   |
| GWKAOM\\_Max     | Maximum                                            |
| GWKAOM\\_Min     | Minimum                                            |
| GWKAOM\\_Quant   | Quantile                                           |
| GWKAOM\\_Sum     | Sum                                                |
"""
@cenum GWKAverageOrModeAlg::UInt32 begin
        GWKAOM_Average = 1
        GWKAOM_Fmode = 2
        GWKAOM_Imode = 3
        GWKAOM_Max = 4
        GWKAOM_Min = 5
        GWKAOM_Quant = 6
        GWKAOM_Sum = 7
    end

"Doxygen\\\\_Suppress "
const GDALMaskFunc = Ptr{Cvoid}

"""
    GDALWarpNoDataMasker(void * pMaskFuncArg,
                         int nBandCount,
                         GDALDataType eType,
                         int,
                         int,
                         int nXSize,
                         int nYSize,
                         GByte ** ppImageData,
                         int bMaskIsFloat,
                         void * pValidityMask,
                         int * pbOutAllValid) -> CPLErr
"""
function gdalwarpnodatamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, papabyImageData, bMaskIsFloat, pValidityMask, pbOutAllValid)
    aftercare(ccall((:GDALWarpNoDataMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}, Ptr{Cint}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, papabyImageData, bMaskIsFloat, pValidityMask, pbOutAllValid))
end

"""
    GDALWarpDstAlphaMasker(void * pMaskFuncArg,
                           int nBandCount,
                           GDALDataType,
                           int nXOff,
                           int nYOff,
                           int nXSize,
                           int nYSize,
                           GByte **,
                           int bMaskIsFloat,
                           void * pValidityMask) -> CPLErr
"""
function gdalwarpdstalphamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpDstAlphaMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask))
end

"""
    GDALWarpSrcAlphaMasker(void * pMaskFuncArg,
                           int,
                           GDALDataType,
                           int nXOff,
                           int nYOff,
                           int nXSize,
                           int nYSize,
                           GByte **,
                           int bMaskIsFloat,
                           void * pValidityMask,
                           int * pbOutAllOpaque) -> CPLErr
"""
function gdalwarpsrcalphamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask, pbOutAllOpaque)
    aftercare(ccall((:GDALWarpSrcAlphaMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}, Ptr{Cint}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask, pbOutAllOpaque))
end

"""
    GDALWarpSrcMaskMasker(void * pMaskFuncArg,
                          int,
                          GDALDataType,
                          int nXOff,
                          int nYOff,
                          int nXSize,
                          int nYSize,
                          GByte **,
                          int bMaskIsFloat,
                          void * pValidityMask) -> CPLErr
"""
function gdalwarpsrcmaskmasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpSrcMaskMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask))
end

"""
    GDALWarpCutlineMasker(void * pMaskFuncArg,
                          int,
                          GDALDataType,
                          int nXOff,
                          int nYOff,
                          int nXSize,
                          int nYSize,
                          GByte **,
                          int bMaskIsFloat,
                          void * pValidityMask) -> CPLErr
"""
function gdalwarpcutlinemasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpCutlineMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask))
end

"""
    GDALWarpOptions

Warp control options for use with GDALWarpOperation::Initialize() 

| Field                            | Note                                                                                                                                                                       |
| :------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dfWarpMemoryLimit                | In bytes, 0.0 for internal default                                                                                                                                         |
| eResampleAlg                     | Resampling algorithm to use                                                                                                                                                |
| eWorkingDataType                 | data type to use during warp operation, GDT\\_Unknown lets the algorithm select the type                                                                                   |
| hSrcDS                           | Source image dataset.                                                                                                                                                      |
| hDstDS                           | Destination image dataset - may be NULL if only using GDALWarpOperation::WarpRegionToBuffer().                                                                             |
| nBandCount                       | Number of bands to process, may be 0 to select all bands.                                                                                                                  |
| panSrcBands                      | The band numbers for the source bands to process (1 based)                                                                                                                 |
| panDstBands                      | The band numbers for the destination bands to process (1 based)                                                                                                            |
| nSrcAlphaBand                    | The source band so use as an alpha (transparency) value, 0=disabled                                                                                                        |
| nDstAlphaBand                    | The dest. band so use as an alpha (transparency) value, 0=disabled                                                                                                         |
| padfSrcNoDataReal                | The "nodata" value real component for each input band, if NULL there isn't one                                                                                             |
| padfSrcNoDataImag                | The "nodata" value imaginary component - may be NULL even if real component is provided. This value is not used to flag invalid values. Only the real component is used.   |
| padfDstNoDataReal                | The "nodata" value real component for each output band, if NULL there isn't one                                                                                            |
| padfDstNoDataImag                | The "nodata" value imaginary component - may be NULL even if real component is provided. Note that warp operations only use real component for flagging invalid data.      |
| pfnProgress                      | [`GDALProgressFunc`](@ref)() compatible progress reporting function, or NULL if there isn't one.                                                                           |
| pProgressArg                     | Callback argument to be passed to pfnProgress.                                                                                                                             |
| pfnTransformer                   | Type of spatial point transformer function                                                                                                                                 |
| pTransformerArg                  | Handle to image transformer setup structure                                                                                                                                |
| papfnSrcPerBandValidityMaskFunc  | Unused. Must be NULL                                                                                                                                                       |
| papSrcPerBandValidityMaskFuncArg |                                                                                                                                                                            |
| pfnSrcValidityMaskFunc           |                                                                                                                                                                            |
| pSrcValidityMaskFuncArg          |                                                                                                                                                                            |
| pfnSrcDensityMaskFunc            |                                                                                                                                                                            |
| pSrcDensityMaskFuncArg           |                                                                                                                                                                            |
| pfnDstDensityMaskFunc            |                                                                                                                                                                            |
| pDstDensityMaskFuncArg           |                                                                                                                                                                            |
| pfnDstValidityMaskFunc           |                                                                                                                                                                            |
| pDstValidityMaskFuncArg          |                                                                                                                                                                            |
| pfnPreWarpChunkProcessor         |                                                                                                                                                                            |
| pPreWarpProcessorArg             |                                                                                                                                                                            |
| pfnPostWarpChunkProcessor        |                                                                                                                                                                            |
| pPostWarpProcessorArg            |                                                                                                                                                                            |
| hCutline                         | Optional OGRPolygonH for a masking cutline.                                                                                                                                |
| dfCutlineBlendDist               | Optional blending distance to apply across cutline in pixels, default is zero.                                                                                             |
"""
struct GDALWarpOptions
    papszWarpOptions::Ptr{Cstring}
    dfWarpMemoryLimit::Cdouble
    eResampleAlg::GDALResampleAlg
    eWorkingDataType::GDALDataType
    hSrcDS::GDALDatasetH
    hDstDS::GDALDatasetH
    nBandCount::Cint
    panSrcBands::Ptr{Cint}
    panDstBands::Ptr{Cint}
    nSrcAlphaBand::Cint
    nDstAlphaBand::Cint
    padfSrcNoDataReal::Ptr{Cdouble}
    padfSrcNoDataImag::Ptr{Cdouble}
    padfDstNoDataReal::Ptr{Cdouble}
    padfDstNoDataImag::Ptr{Cdouble}
    pfnProgress::GDALProgressFunc
    pProgressArg::Ptr{Cvoid}
    pfnTransformer::GDALTransformerFunc
    pTransformerArg::Ptr{Cvoid}
    papfnSrcPerBandValidityMaskFunc::Ptr{GDALMaskFunc}
    papSrcPerBandValidityMaskFuncArg::Ptr{Ptr{Cvoid}}
    pfnSrcValidityMaskFunc::GDALMaskFunc
    pSrcValidityMaskFuncArg::Ptr{Cvoid}
    pfnSrcDensityMaskFunc::GDALMaskFunc
    pSrcDensityMaskFuncArg::Ptr{Cvoid}
    pfnDstDensityMaskFunc::GDALMaskFunc
    pDstDensityMaskFuncArg::Ptr{Cvoid}
    pfnDstValidityMaskFunc::GDALMaskFunc
    pDstValidityMaskFuncArg::Ptr{Cvoid}
    pfnPreWarpChunkProcessor::Ptr{Cvoid}
    pPreWarpProcessorArg::Ptr{Cvoid}
    pfnPostWarpChunkProcessor::Ptr{Cvoid}
    pPostWarpProcessorArg::Ptr{Cvoid}
    hCutline::Ptr{Cvoid}
    dfCutlineBlendDist::Cdouble
end

"""
    GDALCreateWarpOptions() -> GDALWarpOptions *

Create a warp options structure.
"""
function gdalcreatewarpoptions()
    aftercare(ccall((:GDALCreateWarpOptions, libgdal), Ptr{GDALWarpOptions}, ()))
end

"""
    GDALDestroyWarpOptions(GDALWarpOptions * psOptions) -> void

Destroy a warp options structure.
"""
function gdaldestroywarpoptions(arg1)
    aftercare(ccall((:GDALDestroyWarpOptions, libgdal), Cvoid, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALCloneWarpOptions(const GDALWarpOptions * psSrcOptions) -> GDALWarpOptions *

Clone a warp options structure.
"""
function gdalclonewarpoptions(arg1)
    aftercare(ccall((:GDALCloneWarpOptions, libgdal), Ptr{GDALWarpOptions}, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALWarpInitDstNoDataReal(GDALWarpOptions * psOptionsIn,
                              double dNoDataReal) -> void

Initialize padfDstNoDataReal with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataReal**: value to initialize to.
"""
function gdalwarpinitdstnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitDstNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

"""
    GDALWarpInitSrcNoDataReal(GDALWarpOptions * psOptionsIn,
                              double dNoDataReal) -> void

Initialize padfSrcNoDataReal with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataReal**: value to initialize to.
"""
function gdalwarpinitsrcnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitSrcNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

"""
    GDALWarpInitNoDataReal(GDALWarpOptions * psOptionsIn,
                           double dNoDataReal) -> void

Initialize padfSrcNoDataReal and padfDstNoDataReal with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataReal**: value to initialize to.
"""
function gdalwarpinitnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

"""
    GDALWarpInitDstNoDataImag(GDALWarpOptions * psOptionsIn,
                              double dNoDataImag) -> void

Initialize padfDstNoDataImag with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataImag**: value to initialize to.
"""
function gdalwarpinitdstnodataimag(arg1, dNoDataImag)
    aftercare(ccall((:GDALWarpInitDstNoDataImag, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataImag))
end

"""
    GDALWarpInitSrcNoDataImag(GDALWarpOptions * psOptionsIn,
                              double dNoDataImag) -> void

Initialize padfSrcNoDataImag with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataImag**: value to initialize to.
"""
function gdalwarpinitsrcnodataimag(arg1, dNoDataImag)
    aftercare(ccall((:GDALWarpInitSrcNoDataImag, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataImag))
end

"""
    GDALWarpResolveWorkingDataType(GDALWarpOptions * psOptions) -> void

If the working data type is unknown, this method will determine a valid working data type to support the data in the src and dest data sets and any noData values.

### Parameters
* **psOptions**: options to initialize.
"""
function gdalwarpresolveworkingdatatype(arg1)
    aftercare(ccall((:GDALWarpResolveWorkingDataType, libgdal), Cvoid, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALWarpInitDefaultBandMapping(GDALWarpOptions * psOptionsIn,
                                   int nBandCount) -> void

Init src and dst band mappings such that Bands[i] = i+1 for nBandCount Does nothing if psOptionsIn->nBandCount is non-zero.

### Parameters
* **psOptionsIn**: options to initialize.
* **nBandCount**: bands to initialize for.
"""
function gdalwarpinitdefaultbandmapping(arg1, nBandCount)
    aftercare(ccall((:GDALWarpInitDefaultBandMapping, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cint), arg1, nBandCount))
end

"""
    gdalserializewarpoptions(arg1)

Doxygen\\_Suppress 
"""
function gdalserializewarpoptions(arg1)
    aftercare(ccall((:GDALSerializeWarpOptions, libgdal), Ptr{CPLXMLNode}, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALDeserializeWarpOptions(CPLXMLNode * psTree) -> GDALWarpOptions *
"""
function gdaldeserializewarpoptions(arg1)
    aftercare(ccall((:GDALDeserializeWarpOptions, libgdal), Ptr{GDALWarpOptions}, (Ptr{CPLXMLNode},), arg1))
end

"""
    gdalreprojectimage(hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions)

*********************************************************************
"""
function gdalreprojectimage(hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions)
    aftercare(ccall((:GDALReprojectImage, libgdal), CPLErr, (GDALDatasetH, Cstring, GDALDatasetH, Cstring, GDALResampleAlg, Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions))
end

"""
    GDALCreateAndReprojectImage(GDALDatasetH hSrcDS,
                                const char * pszSrcWKT,
                                const char * pszDstFilename,
                                const char * pszDstWKT,
                                GDALDriverH hDstDriver,
                                char ** papszCreateOptions,
                                GDALResampleAlg eResampleAlg,
                                double dfWarpMemoryLimit,
                                double dfMaxError,
                                GDALProgressFunc pfnProgress,
                                void * pProgressArg,
                                GDALWarpOptions * psOptions) -> CPLErr

Reproject an image and create the target reprojected image.
"""
function gdalcreateandreprojectimage(hSrcDS, pszSrcWKT, pszDstFilename, pszDstWKT, hDstDriver, papszCreateOptions, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions)
    aftercare(ccall((:GDALCreateAndReprojectImage, libgdal), CPLErr, (GDALDatasetH, Cstring, Cstring, Cstring, GDALDriverH, Ptr{Cstring}, GDALResampleAlg, Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, pszDstFilename, pszDstWKT, hDstDriver, papszCreateOptions, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions))
end

"""
    gdalautocreatewarpedvrt(hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions)

*********************************************************************
"""
function gdalautocreatewarpedvrt(hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions)
    aftercare(ccall((:GDALAutoCreateWarpedVRT, libgdal), GDALDatasetH, (GDALDatasetH, Cstring, Cstring, GDALResampleAlg, Cdouble, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions))
end

"""
    GDALAutoCreateWarpedVRTEx(GDALDatasetH hSrcDS,
                              const char * pszSrcWKT,
                              const char * pszDstWKT,
                              GDALResampleAlg eResampleAlg,
                              double dfMaxError,
                              const GDALWarpOptions * psOptionsIn,
                              CSLConstList papszTransformerOptions) -> GDALDatasetH

Create virtual warped dataset automatically.
"""
function gdalautocreatewarpedvrtex(hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions, papszTransformerOptions)
    aftercare(ccall((:GDALAutoCreateWarpedVRTEx, libgdal), GDALDatasetH, (GDALDatasetH, Cstring, Cstring, GDALResampleAlg, Cdouble, Ptr{GDALWarpOptions}, CSLConstList), hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions, papszTransformerOptions))
end

"""
    GDALCreateWarpedVRT(GDALDatasetH hSrcDS,
                        int nPixels,
                        int nLines,
                        double * padfGeoTransform,
                        GDALWarpOptions * psOptions) -> GDALDatasetH

Create virtual warped dataset.

### Parameters
* **hSrcDS**: The source dataset.
* **nPixels**: Width of the virtual warped dataset to create
* **nLines**: Height of the virtual warped dataset to create
* **padfGeoTransform**: Geotransform matrix of the virtual warped dataset to create
* **psOptions**: Warp options. Must be different from NULL.

### Returns
NULL on failure, or a new virtual dataset handle on success.
"""
function gdalcreatewarpedvrt(hSrcDS, nPixels, nLines, padfGeoTransform, psOptions)
    aftercare(ccall((:GDALCreateWarpedVRT, libgdal), GDALDatasetH, (GDALDatasetH, Cint, Cint, Ptr{Cdouble}, Ptr{GDALWarpOptions}), hSrcDS, nPixels, nLines, padfGeoTransform, psOptions))
end

"""
    GDALInitializeWarpedVRT(GDALDatasetH hDS,
                            GDALWarpOptions * psWO) -> CPLErr

Set warp info on virtual warped dataset.

### Parameters
* **hDS**: dataset previously created with the VRT driver, and a SUBCLASS of "VRTWarpedDataset".
* **psWO**: the warp options to apply. Note that ownership of the transformation information is taken over by the function though everything else remains the property of the caller.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function gdalinitializewarpedvrt(hDS, psWO)
    aftercare(ccall((:GDALInitializeWarpedVRT, libgdal), CPLErr, (GDALDatasetH, Ptr{GDALWarpOptions}), hDS, psWO))
end

"Opaque type representing a GDALWarpOperation object "
const GDALWarpOperationH = Ptr{Cvoid}

"""
    GDALCreateWarpOperation(const GDALWarpOptions * psNewOptions) -> GDALWarpOperationH
"""
function gdalcreatewarpoperation(arg1)
    aftercare(ccall((:GDALCreateWarpOperation, libgdal), GDALWarpOperationH, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALDestroyWarpOperation(GDALWarpOperationH hOperation) -> void
"""
function gdaldestroywarpoperation(arg1)
    aftercare(ccall((:GDALDestroyWarpOperation, libgdal), Cvoid, (GDALWarpOperationH,), arg1))
end

"""
    GDALChunkAndWarpImage(GDALWarpOperationH hOperation,
                          int nDstXOff,
                          int nDstYOff,
                          int nDstXSize,
                          int nDstYSize) -> CPLErr
"""
function gdalchunkandwarpimage(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALChunkAndWarpImage, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALChunkAndWarpMulti(GDALWarpOperationH hOperation,
                          int nDstXOff,
                          int nDstYOff,
                          int nDstXSize,
                          int nDstYSize) -> CPLErr
"""
function gdalchunkandwarpmulti(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALChunkAndWarpMulti, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALWarpRegion(GDALWarpOperationH hOperation,
                   int nDstXOff,
                   int nDstYOff,
                   int nDstXSize,
                   int nDstYSize,
                   int nSrcXOff,
                   int nSrcYOff,
                   int nSrcXSize,
                   int nSrcYSize) -> CPLErr
"""
function gdalwarpregion(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:GDALWarpRegion, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

"""
    GDALWarpRegionToBuffer(GDALWarpOperationH hOperation,
                           int nDstXOff,
                           int nDstYOff,
                           int nDstXSize,
                           int nDstYSize,
                           void * pDataBuf,
                           GDALDataType eBufDataType,
                           int nSrcXOff,
                           int nSrcYOff,
                           int nSrcXSize,
                           int nSrcYSize) -> CPLErr
"""
function gdalwarpregiontobuffer(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
    aftercare(ccall((:GDALWarpRegionToBuffer, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint, Ptr{Cvoid}, GDALDataType, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11))
end

"""
    gwkgetfilterradius(eResampleAlg)

Doxygen\\_Suppress 
"""
function gwkgetfilterradius(eResampleAlg)
    aftercare(ccall((:GWKGetFilterRadius, libgdal), Cint, (GDALResampleAlg,), eResampleAlg))
end

const FilterFuncType = Ptr{Cvoid}

"""
    GWKGetFilterFunc(GDALResampleAlg eResampleAlg) -> FilterFuncType
"""
function gwkgetfilterfunc(eResampleAlg)
    aftercare(ccall((:GWKGetFilterFunc, libgdal), FilterFuncType, (GDALResampleAlg,), eResampleAlg))
end

const FilterFunc4ValuesType = Ptr{Cvoid}

"""
    GWKGetFilterFunc4Values(GDALResampleAlg eResampleAlg) -> FilterFunc4ValuesType
"""
function gwkgetfilterfunc4values(eResampleAlg)
    aftercare(ccall((:GWKGetFilterFunc4Values, libgdal), FilterFunc4ValuesType, (GDALResampleAlg,), eResampleAlg))
end

"Type for a function that returns the pixel data in a provided window "
const VRTImageReadFunc = Ptr{Cvoid}

"Doxygen\\\\_Suppress "
const VRTAveragedSourceH = Ptr{Cvoid}

const VRTAverageFilteredSourceH = Ptr{Cvoid}

const VRTComplexSourceH = Ptr{Cvoid}

const VRTDerivedRasterBandH = Ptr{Cvoid}

const VRTDriverH = Ptr{Cvoid}

const VRTFilteredSourceH = Ptr{Cvoid}

const VRTFuncSourceH = Ptr{Cvoid}

const VRTKernelFilteredSourceH = Ptr{Cvoid}

const VRTRasterBandH = Ptr{Cvoid}

const VRTRawRasterBandH = Ptr{Cvoid}

const VRTSimpleSourceH = Ptr{Cvoid}

const VRTSourceH = Ptr{Cvoid}

const VRTWarpedDatasetH = Ptr{Cvoid}

const VRTWarpedRasterBandH = Ptr{Cvoid}

"Opaque type for a VRT dataset "
const VRTDatasetH = Ptr{Cvoid}

"Opaque type for a VRT sourced raster band "
const VRTSourcedRasterBandH = Ptr{Cvoid}

"""
    VRTCreate(int nXSize,
              int nYSize) -> VRTDatasetH
"""
function vrtcreate(arg1, arg2)
    aftercare(ccall((:VRTCreate, libgdal), VRTDatasetH, (Cint, Cint), arg1, arg2))
end

"""
    VRTFlushCache(VRTDatasetH hDataset) -> void
"""
function vrtflushcache(arg1)
    aftercare(ccall((:VRTFlushCache, libgdal), Cvoid, (VRTDatasetH,), arg1))
end

"""
    VRTSerializeToXML(VRTDatasetH hDataset,
                      const char * pszVRTPath) -> CPLXMLNode *
"""
function vrtserializetoxml(arg1, arg2)
    aftercare(ccall((:VRTSerializeToXML, libgdal), Ptr{CPLXMLNode}, (VRTDatasetH, Cstring), arg1, arg2))
end

"""
    VRTAddBand(VRTDatasetH hDataset,
               GDALDataType eType,
               char ** papszOptions) -> int
"""
function vrtaddband(arg1, arg2, arg3)
    aftercare(ccall((:VRTAddBand, libgdal), Cint, (VRTDatasetH, GDALDataType, Ptr{Cstring}), arg1, arg2, arg3))
end

"""
    VRTAddSource(VRTSourcedRasterBandH hVRTBand,
                 VRTSourceH hNewSource) -> CPLErr
"""
function vrtaddsource(arg1, arg2)
    aftercare(ccall((:VRTAddSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTSourceH), arg1, arg2))
end

"""
    VRTAddSimpleSource(VRTSourcedRasterBandH hVRTBand,
                       GDALRasterBandH hSrcBand,
                       int nSrcXOff,
                       int nSrcYOff,
                       int nSrcXSize,
                       int nSrcYSize,
                       int nDstXOff,
                       int nDstYOff,
                       int nDstXSize,
                       int nDstYSize,
                       const char * pszResampling,
                       double dfNoDataValue) -> CPLErr
"""
function vrtaddsimplesource(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
    aftercare(ccall((:VRTAddSimpleSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cstring, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12))
end

"""
    VRTAddComplexSource(VRTSourcedRasterBandH hVRTBand,
                        GDALRasterBandH hSrcBand,
                        int nSrcXOff,
                        int nSrcYOff,
                        int nSrcXSize,
                        int nSrcYSize,
                        int nDstXOff,
                        int nDstYOff,
                        int nDstXSize,
                        int nDstYSize,
                        double dfScaleOff,
                        double dfScaleRatio,
                        double dfNoDataValue) -> CPLErr
"""
function vrtaddcomplexsource(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
    aftercare(ccall((:VRTAddComplexSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13))
end

"""
    VRTAddFuncSource(VRTSourcedRasterBandH hVRTBand,
                     VRTImageReadFunc pfnReadFunc,
                     void * pCBData,
                     double dfNoDataValue) -> CPLErr
"""
function vrtaddfuncsource(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VRTAddFuncSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTImageReadFunc, Ptr{Cvoid}, Cdouble), arg1, arg2, arg3, arg4))
end

mutable struct GDALInfoOptions
end

mutable struct GDALInfoOptionsForBinary
end

"""
    GDALInfoOptionsNew(char ** papszArgv,
                       GDALInfoOptionsForBinary * psOptionsForBinary) -> GDALInfoOptions *

Allocates a GDALInfoOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdalinfo utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdalinfo_bin.cpp use case) must be allocated with GDALInfoOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options, subdataset number...

### Returns
pointer to the allocated GDALInfoOptions struct. Must be freed with GDALInfoOptionsFree().
"""
function gdalinfooptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALInfoOptionsNew, libgdal), Ptr{GDALInfoOptions}, (Ptr{Cstring}, Ptr{GDALInfoOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALInfoOptionsFree(GDALInfoOptions * psOptions) -> void

Frees the GDALInfoOptions struct.

### Parameters
* **psOptions**: the options struct for GDALInfo().
"""
function gdalinfooptionsfree(psOptions)
    aftercare(ccall((:GDALInfoOptionsFree, libgdal), Cvoid, (Ptr{GDALInfoOptions},), psOptions))
end

"""
    GDALInfo(GDALDatasetH hDataset,
             const GDALInfoOptions * psOptions) -> char *

Lists various information about a GDAL supported raster dataset.

### Parameters
* **hDataset**: the dataset handle.
* **psOptions**: the options structure returned by GDALInfoOptionsNew() or NULL.

### Returns
string corresponding to the information about the raster dataset (must be freed with CPLFree()), or NULL in case of error.
"""
function gdalinfo(hDataset, psOptions)
    aftercare(ccall((:GDALInfo, libgdal), Cstring, (GDALDatasetH, Ptr{GDALInfoOptions}), hDataset, psOptions), true)
end

mutable struct GDALTranslateOptions
end

mutable struct GDALTranslateOptionsForBinary
end

"""
    GDALTranslateOptionsNew(char ** papszArgv,
                            GDALTranslateOptionsForBinary * psOptionsForBinary) -> GDALTranslateOptions *

Allocates a GDALTranslateOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdal_translate utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALTranslateOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALTranslateOptions struct. Must be freed with GDALTranslateOptionsFree().
"""
function gdaltranslateoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALTranslateOptionsNew, libgdal), Ptr{GDALTranslateOptions}, (Ptr{Cstring}, Ptr{GDALTranslateOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALTranslateOptionsFree(GDALTranslateOptions * psOptions) -> void

Frees the GDALTranslateOptions struct.

### Parameters
* **psOptions**: the options struct for GDALTranslate().
"""
function gdaltranslateoptionsfree(psOptions)
    aftercare(ccall((:GDALTranslateOptionsFree, libgdal), Cvoid, (Ptr{GDALTranslateOptions},), psOptions))
end

"""
    GDALTranslateOptionsSetProgress(GDALTranslateOptions * psOptions,
                                    GDALProgressFunc pfnProgress,
                                    void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALTranslate().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdaltranslateoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALTranslateOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALTranslateOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALTranslate(const char * pszDest,
                  GDALDatasetH hSrcDataset,
                  const GDALTranslateOptions * psOptionsIn,
                  int * pbUsageError) -> GDALDatasetH

Converts raster data between different formats.

### Parameters
* **pszDest**: the destination dataset path.
* **hSrcDataset**: the source dataset handle.
* **psOptionsIn**: the options struct returned by GDALTranslateOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose()) or NULL in case of error.
"""
function gdaltranslate(pszDestFilename, hSrcDataset, psOptions, pbUsageError)
    aftercare(ccall((:GDALTranslate, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Ptr{GDALTranslateOptions}, Ptr{Cint}), pszDestFilename, hSrcDataset, psOptions, pbUsageError))
end

mutable struct GDALWarpAppOptions
end

mutable struct GDALWarpAppOptionsForBinary
end

"""
    GDALWarpAppOptionsNew(char ** papszArgv,
                          GDALWarpAppOptionsForBinary * psOptionsForBinary) -> GDALWarpAppOptions *

Allocates a GDALWarpAppOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdalwarp utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALWarpAppOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALWarpAppOptions struct. Must be freed with GDALWarpAppOptionsFree().
"""
function gdalwarpappoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALWarpAppOptionsNew, libgdal), Ptr{GDALWarpAppOptions}, (Ptr{Cstring}, Ptr{GDALWarpAppOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALWarpAppOptionsFree(GDALWarpAppOptions * psOptions) -> void

Frees the GDALWarpAppOptions struct.

### Parameters
* **psOptions**: the options struct for GDALWarp().
"""
function gdalwarpappoptionsfree(psOptions)
    aftercare(ccall((:GDALWarpAppOptionsFree, libgdal), Cvoid, (Ptr{GDALWarpAppOptions},), psOptions))
end

"""
    GDALWarpAppOptionsSetProgress(GDALWarpAppOptions * psOptions,
                                  GDALProgressFunc pfnProgress,
                                  void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALWarp().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalwarpappoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALWarpAppOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALWarpAppOptionsSetQuiet(GDALWarpAppOptions * psOptions,
                               int bQuiet) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALWarp().
* **bQuiet**: whether GDALWarp() should emit messages on stdout.
"""
function gdalwarpappoptionssetquiet(psOptions, bQuiet)
    aftercare(ccall((:GDALWarpAppOptionsSetQuiet, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, Cint), psOptions, bQuiet))
end

"""
    GDALWarpAppOptionsSetWarpOption(GDALWarpAppOptions * psOptions,
                                    const char * pszKey,
                                    const char * pszValue) -> void

Set a warp option.

### Parameters
* **psOptions**: the options struct for GDALWarp().
* **pszKey**: key.
* **pszValue**: value.
"""
function gdalwarpappoptionssetwarpoption(psOptions, pszKey, pszValue)
    aftercare(ccall((:GDALWarpAppOptionsSetWarpOption, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, Cstring, Cstring), psOptions, pszKey, pszValue))
end

"""
    GDALWarp(const char * pszDest,
             GDALDatasetH hDstDS,
             int nSrcCount,
             GDALDatasetH * pahSrcDS,
             const GDALWarpAppOptions * psOptionsIn,
             int * pbUsageError) -> GDALDatasetH

Image reprojection and warping function.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL.
* **nSrcCount**: the number of input datasets.
* **pahSrcDS**: the list of input datasets.
* **psOptionsIn**: the options struct returned by GDALWarpAppOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred, or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS if not NULL) or NULL in case of error.
"""
function gdalwarp(pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALWarp, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cint, Ptr{GDALDatasetH}, Ptr{GDALWarpAppOptions}, Ptr{Cint}), pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError))
end

mutable struct GDALVectorTranslateOptions
end

mutable struct GDALVectorTranslateOptionsForBinary
end

"""
    GDALVectorTranslateOptionsNew(char ** papszArgv,
                                  GDALVectorTranslateOptionsForBinary * psOptionsForBinary) -> GDALVectorTranslateOptions *

allocates a GDALVectorTranslateOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the ogr2ogr utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALVectorTranslateOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALVectorTranslateOptions struct. Must be freed with GDALVectorTranslateOptionsFree().
"""
function gdalvectortranslateoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALVectorTranslateOptionsNew, libgdal), Ptr{GDALVectorTranslateOptions}, (Ptr{Cstring}, Ptr{GDALVectorTranslateOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALVectorTranslateOptionsFree(GDALVectorTranslateOptions * psOptions) -> void

Frees the GDALVectorTranslateOptions struct.

### Parameters
* **psOptions**: the options struct for GDALVectorTranslate().
"""
function gdalvectortranslateoptionsfree(psOptions)
    aftercare(ccall((:GDALVectorTranslateOptionsFree, libgdal), Cvoid, (Ptr{GDALVectorTranslateOptions},), psOptions))
end

"""
    GDALVectorTranslateOptionsSetProgress(GDALVectorTranslateOptions * psOptions,
                                          GDALProgressFunc pfnProgress,
                                          void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALVectorTranslate().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalvectortranslateoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALVectorTranslateOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALVectorTranslateOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALVectorTranslate(const char * pszDest,
                        GDALDatasetH hDstDS,
                        int nSrcCount,
                        GDALDatasetH * pahSrcDS,
                        const GDALVectorTranslateOptions * psOptionsIn,
                        int * pbUsageError) -> GDALDatasetH

Converts vector data between file formats.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL.
* **nSrcCount**: the number of input datasets (only 1 supported currently)
* **pahSrcDS**: the list of input datasets.
* **psOptionsIn**: the options struct returned by GDALVectorTranslateOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred, or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS is not NULL) or NULL in case of error.
"""
function gdalvectortranslate(pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALVectorTranslate, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cint, Ptr{GDALDatasetH}, Ptr{GDALVectorTranslateOptions}, Ptr{Cint}), pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError))
end

mutable struct GDALDEMProcessingOptions
end

mutable struct GDALDEMProcessingOptionsForBinary
end

"""
    GDALDEMProcessingOptionsNew(char ** papszArgv,
                                GDALDEMProcessingOptionsForBinary * psOptionsForBinary) -> GDALDEMProcessingOptions *

Allocates a GDALDEMProcessingOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdaldem utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALDEMProcessingOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALDEMProcessingOptions struct. Must be freed with GDALDEMProcessingOptionsFree().
"""
function gdaldemprocessingoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALDEMProcessingOptionsNew, libgdal), Ptr{GDALDEMProcessingOptions}, (Ptr{Cstring}, Ptr{GDALDEMProcessingOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALDEMProcessingOptionsFree(GDALDEMProcessingOptions * psOptions) -> void

Frees the GDALDEMProcessingOptions struct.

### Parameters
* **psOptions**: the options struct for GDALDEMProcessing().
"""
function gdaldemprocessingoptionsfree(psOptions)
    aftercare(ccall((:GDALDEMProcessingOptionsFree, libgdal), Cvoid, (Ptr{GDALDEMProcessingOptions},), psOptions))
end

"""
    GDALDEMProcessingOptionsSetProgress(GDALDEMProcessingOptions * psOptions,
                                        GDALProgressFunc pfnProgress,
                                        void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALDEMProcessing().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdaldemprocessingoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDEMProcessingOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALDEMProcessingOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALDEMProcessing(const char * pszDest,
                      GDALDatasetH hSrcDataset,
                      const char * pszProcessing,
                      const char * pszColorFilename,
                      const GDALDEMProcessingOptions * psOptionsIn,
                      int * pbUsageError) -> GDALDatasetH

Apply a DEM processing.

### Parameters
* **pszDest**: the destination dataset path.
* **hSrcDataset**: the source dataset handle.
* **pszProcessing**: the processing to apply (one of "hillshade", "slope", "aspect", "color-relief", "TRI", "TPI", "Roughness")
* **pszColorFilename**: color file (mandatory for "color-relief" processing, should be NULL otherwise)
* **psOptionsIn**: the options struct returned by GDALDEMProcessingOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose()) or NULL in case of error.
"""
function gdaldemprocessing(pszDestFilename, hSrcDataset, pszProcessing, pszColorFilename, psOptions, pbUsageError)
    aftercare(ccall((:GDALDEMProcessing, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cstring, Cstring, Ptr{GDALDEMProcessingOptions}, Ptr{Cint}), pszDestFilename, hSrcDataset, pszProcessing, pszColorFilename, psOptions, pbUsageError))
end

mutable struct GDALNearblackOptions
end

mutable struct GDALNearblackOptionsForBinary
end

"""
    GDALNearblackOptionsNew(char ** papszArgv,
                            GDALNearblackOptionsForBinary * psOptionsForBinary) -> GDALNearblackOptions *

Allocates a GDALNearblackOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the nearblack utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALNearblackOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALNearblackOptions struct. Must be freed with GDALNearblackOptionsFree().
"""
function gdalnearblackoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALNearblackOptionsNew, libgdal), Ptr{GDALNearblackOptions}, (Ptr{Cstring}, Ptr{GDALNearblackOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALNearblackOptionsFree(GDALNearblackOptions * psOptions) -> void

Frees the GDALNearblackOptions struct.

### Parameters
* **psOptions**: the options struct for GDALNearblack().
"""
function gdalnearblackoptionsfree(psOptions)
    aftercare(ccall((:GDALNearblackOptionsFree, libgdal), Cvoid, (Ptr{GDALNearblackOptions},), psOptions))
end

"""
    GDALNearblackOptionsSetProgress(GDALNearblackOptions * psOptions,
                                    GDALProgressFunc pfnProgress,
                                    void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALNearblack().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalnearblackoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALNearblackOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALNearblackOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALNearblack(const char * pszDest,
                  GDALDatasetH hDstDS,
                  GDALDatasetH hSrcDataset,
                  const GDALNearblackOptions * psOptionsIn,
                  int * pbUsageError) -> GDALDatasetH

Convert nearly black/white borders to exact value.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL. Might be equal to hSrcDataset.
* **hSrcDataset**: the source dataset handle.
* **psOptionsIn**: the options struct returned by GDALNearblackOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS is not NULL) or NULL in case of error.
"""
function gdalnearblack(pszDest, hDstDS, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALNearblack, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, GDALDatasetH, Ptr{GDALNearblackOptions}, Ptr{Cint}), pszDest, hDstDS, hSrcDS, psOptions, pbUsageError))
end

mutable struct GDALGridOptions
end

mutable struct GDALGridOptionsForBinary
end

"""
    GDALGridOptionsNew(char ** papszArgv,
                       GDALGridOptionsForBinary * psOptionsForBinary) -> GDALGridOptions *

Allocates a GDALGridOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdal_translate utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALGridOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALGridOptions struct. Must be freed with GDALGridOptionsFree().
"""
function gdalgridoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALGridOptionsNew, libgdal), Ptr{GDALGridOptions}, (Ptr{Cstring}, Ptr{GDALGridOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALGridOptionsFree(GDALGridOptions * psOptions) -> void

Frees the GDALGridOptions struct.

### Parameters
* **psOptions**: the options struct for GDALGrid().
"""
function gdalgridoptionsfree(psOptions)
    aftercare(ccall((:GDALGridOptionsFree, libgdal), Cvoid, (Ptr{GDALGridOptions},), psOptions))
end

"""
    GDALGridOptionsSetProgress(GDALGridOptions * psOptions,
                               GDALProgressFunc pfnProgress,
                               void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALGrid().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalgridoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGridOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALGridOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALGrid(const char * pszDest,
             GDALDatasetH hSrcDataset,
             const GDALGridOptions * psOptionsIn,
             int * pbUsageError) -> GDALDatasetH

Create raster from the scattered data.

### Parameters
* **pszDest**: the destination dataset path.
* **hSrcDataset**: the source dataset handle.
* **psOptionsIn**: the options struct returned by GDALGridOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose()) or NULL in case of error.
"""
function gdalgrid(pszDest, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALGrid, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Ptr{GDALGridOptions}, Ptr{Cint}), pszDest, hSrcDS, psOptions, pbUsageError))
end

mutable struct GDALRasterizeOptions
end

mutable struct GDALRasterizeOptionsForBinary
end

"""
    GDALRasterizeOptionsNew(char ** papszArgv,
                            GDALRasterizeOptionsForBinary * psOptionsForBinary) -> GDALRasterizeOptions *

Allocates a GDALRasterizeOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdal_rasterize utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALRasterizeOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALRasterizeOptions struct. Must be freed with GDALRasterizeOptionsFree().
"""
function gdalrasterizeoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALRasterizeOptionsNew, libgdal), Ptr{GDALRasterizeOptions}, (Ptr{Cstring}, Ptr{GDALRasterizeOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALRasterizeOptionsFree(GDALRasterizeOptions * psOptions) -> void

Frees the GDALRasterizeOptions struct.

### Parameters
* **psOptions**: the options struct for GDALRasterize().
"""
function gdalrasterizeoptionsfree(psOptions)
    aftercare(ccall((:GDALRasterizeOptionsFree, libgdal), Cvoid, (Ptr{GDALRasterizeOptions},), psOptions))
end

"""
    GDALRasterizeOptionsSetProgress(GDALRasterizeOptions * psOptions,
                                    GDALProgressFunc pfnProgress,
                                    void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALRasterize().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalrasterizeoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRasterizeOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALRasterizeOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALRasterize(const char * pszDest,
                  GDALDatasetH hDstDS,
                  GDALDatasetH hSrcDataset,
                  const GDALRasterizeOptions * psOptionsIn,
                  int * pbUsageError) -> GDALDatasetH

Burns vector geometries into a raster.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL.
* **hSrcDataset**: the source dataset handle.
* **psOptionsIn**: the options struct returned by GDALRasterizeOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS is not NULL) or NULL in case of error.
"""
function gdalrasterize(pszDest, hDstDS, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALRasterize, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, GDALDatasetH, Ptr{GDALRasterizeOptions}, Ptr{Cint}), pszDest, hDstDS, hSrcDS, psOptions, pbUsageError))
end

mutable struct GDALBuildVRTOptions
end

mutable struct GDALBuildVRTOptionsForBinary
end

"""
    GDALBuildVRTOptionsNew(char ** papszArgv,
                           GDALBuildVRTOptionsForBinary * psOptionsForBinary) -> GDALBuildVRTOptions *

Allocates a GDALBuildVRTOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdalbuildvrt utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALBuildVRTOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALBuildVRTOptions struct. Must be freed with GDALBuildVRTOptionsFree().
"""
function gdalbuildvrtoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALBuildVRTOptionsNew, libgdal), Ptr{GDALBuildVRTOptions}, (Ptr{Cstring}, Ptr{GDALBuildVRTOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALBuildVRTOptionsFree(GDALBuildVRTOptions * psOptions) -> void

Frees the GDALBuildVRTOptions struct.

### Parameters
* **psOptions**: the options struct for GDALBuildVRT().
"""
function gdalbuildvrtoptionsfree(psOptions)
    aftercare(ccall((:GDALBuildVRTOptionsFree, libgdal), Cvoid, (Ptr{GDALBuildVRTOptions},), psOptions))
end

"""
    GDALBuildVRTOptionsSetProgress(GDALBuildVRTOptions * psOptions,
                                   GDALProgressFunc pfnProgress,
                                   void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALBuildVRT().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalbuildvrtoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALBuildVRTOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALBuildVRTOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALBuildVRT(const char * pszDest,
                 int nSrcCount,
                 GDALDatasetH * pahSrcDS,
                 const char *const * papszSrcDSNames,
                 const GDALBuildVRTOptions * psOptionsIn,
                 int * pbUsageError) -> GDALDatasetH

Build a VRT from a list of datasets.

### Parameters
* **pszDest**: the destination dataset path.
* **nSrcCount**: the number of input datasets.
* **pahSrcDS**: the list of input datasets (or NULL, exclusive with papszSrcDSNames)
* **papszSrcDSNames**: the list of input dataset names (or NULL, exclusive with pahSrcDS)
* **psOptionsIn**: the options struct returned by GDALBuildVRTOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred.

### Returns
the output dataset (new dataset that must be closed using GDALClose()) or NULL in case of error.
"""
function gdalbuildvrt(pszDest, nSrcCount, pahSrcDS, papszSrcDSNames, psOptions, pbUsageError)
    aftercare(ccall((:GDALBuildVRT, libgdal), GDALDatasetH, (Cstring, Cint, Ptr{GDALDatasetH}, Ptr{Cstring}, Ptr{GDALBuildVRTOptions}, Ptr{Cint}), pszDest, nSrcCount, pahSrcDS, papszSrcDSNames, psOptions, pbUsageError))
end

mutable struct GDALMultiDimInfoOptions
end

mutable struct GDALMultiDimInfoOptionsForBinary
end

"""
    GDALMultiDimInfoOptionsNew(char ** papszArgv,
                               GDALMultiDimInfoOptionsForBinary * psOptionsForBinary) -> GDALMultiDimInfoOptions *

Allocates a GDALMultiDimInfo struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdalmdiminfo utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdalmultidiminfo_bin.cpp use case) must be allocated with GDALMultiDimInfoOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options, subdataset number...

### Returns
pointer to the allocated GDALMultiDimInfoOptions struct. Must be freed with GDALMultiDimInfoOptionsFree().
"""
function gdalmultidiminfooptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALMultiDimInfoOptionsNew, libgdal), Ptr{GDALMultiDimInfoOptions}, (Ptr{Cstring}, Ptr{GDALMultiDimInfoOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALMultiDimInfoOptionsFree(GDALMultiDimInfoOptions * psOptions) -> void

Frees the GDALMultiDimInfoOptions struct.

### Parameters
* **psOptions**: the options struct for GDALMultiDimInfo().
"""
function gdalmultidiminfooptionsfree(psOptions)
    aftercare(ccall((:GDALMultiDimInfoOptionsFree, libgdal), Cvoid, (Ptr{GDALMultiDimInfoOptions},), psOptions))
end

"""
    GDALMultiDimInfo(GDALDatasetH hDataset,
                     const GDALMultiDimInfoOptions * psOptionsIn) -> char *

Lists various information about a GDAL multidimensional dataset.

### Parameters
* **hDataset**: the dataset handle.
* **psOptionsIn**: the options structure returned by GDALMultiDimInfoOptionsNew() or NULL.

### Returns
string corresponding to the information about the raster dataset (must be freed with CPLFree()), or NULL in case of error.
"""
function gdalmultidiminfo(hDataset, psOptions)
    aftercare(ccall((:GDALMultiDimInfo, libgdal), Cstring, (GDALDatasetH, Ptr{GDALMultiDimInfoOptions}), hDataset, psOptions), false)
end

mutable struct GDALMultiDimTranslateOptions
end

mutable struct GDALMultiDimTranslateOptionsForBinary
end

"""
    GDALMultiDimTranslateOptionsNew(char ** papszArgv,
                                    GDALMultiDimTranslateOptionsForBinary * psOptionsForBinary) -> GDALMultiDimTranslateOptions *

Allocates a GDALMultiDimTranslateOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdalmdimtranslate utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdalmultidimtranslate_bin.cpp use case) must be allocated with GDALTranslateOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALMultiDimTranslateOptions struct. Must be freed with GDALMultiDimTranslateOptionsFree().
"""
function gdalmultidimtranslateoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALMultiDimTranslateOptionsNew, libgdal), Ptr{GDALMultiDimTranslateOptions}, (Ptr{Cstring}, Ptr{GDALMultiDimTranslateOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALMultiDimTranslateOptionsFree(GDALMultiDimTranslateOptions * psOptions) -> void

Frees the GDALMultiDimTranslateOptions struct.

### Parameters
* **psOptions**: the options struct for GDALMultiDimTranslate().
"""
function gdalmultidimtranslateoptionsfree(psOptions)
    aftercare(ccall((:GDALMultiDimTranslateOptionsFree, libgdal), Cvoid, (Ptr{GDALMultiDimTranslateOptions},), psOptions))
end

"""
    GDALMultiDimTranslateOptionsSetProgress(GDALMultiDimTranslateOptions * psOptions,
                                            GDALProgressFunc pfnProgress,
                                            void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALMultiDimTranslate().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalmultidimtranslateoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALMultiDimTranslateOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALMultiDimTranslateOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALMultiDimTranslate(const char * pszDest,
                          GDALDatasetH hDstDS,
                          int nSrcCount,
                          GDALDatasetH * pahSrcDS,
                          const GDALMultiDimTranslateOptions * psOptions,
                          int * pbUsageError) -> GDALDatasetH

Converts raster data between different formats.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL.
* **nSrcCount**: the number of input datasets.
* **pahSrcDS**: the list of input datasets.
* **psOptions**: the options struct returned by GDALMultiDimTranslateOptionsNew() or NULL.
* **pbUsageError**: pointer to a integer output variable to store if any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS is not NULL) or NULL in case of error.
"""
function gdalmultidimtranslate(pszDest, hDstDataset, nSrcCount, pahSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALMultiDimTranslate, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cint, Ptr{GDALDatasetH}, Ptr{GDALMultiDimTranslateOptions}, Ptr{Cint}), pszDest, hDstDataset, nSrcCount, pahSrcDS, psOptions, pbUsageError))
end

"Opaque type for a coordinate transformation object "
const OGRCoordinateTransformationH = Ptr{Cvoid}

mutable struct _CPLXMLNode
end

"""
    OGR_G_CreateFromWkb(const void * pabyData,
                        OGRSpatialReferenceH hSRS,
                        OGRGeometryH * phGeometry,
                        int nBytes) -> OGRErr

Create a geometry object of the appropriate type from its well known binary representation.

### Parameters
* **pabyData**: pointer to the input BLOB data.
* **hSRS**: handle to the spatial reference to be assigned to the created geometry object. This may be NULL.
* **phGeometry**: the newly created geometry object will be assigned to the indicated handle on return. This will be NULL in case of failure. If not NULL, *phGeometry should be freed with OGR_G_DestroyGeometry() after use.
* **nBytes**: the number of bytes of data available in pabyData, or -1 if it is not known, but assumed to be sufficient.

### Returns
OGRERR_NONE if all goes well, otherwise any of OGRERR_NOT_ENOUGH_DATA, OGRERR_UNSUPPORTED_GEOMETRY_TYPE, or OGRERR_CORRUPT_DATA may be returned.
"""
function ogr_g_createfromwkb(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_G_CreateFromWkb, libgdal), OGRErr, (Ptr{Cvoid}, OGRSpatialReferenceH, Ptr{OGRGeometryH}, Cint), arg1, arg2, arg3, arg4))
end

"""
    OGR_G_CreateFromWkt(char ** ppszData,
                        OGRSpatialReferenceH hSRS,
                        OGRGeometryH * phGeometry) -> OGRErr

Create a geometry object of the appropriate type from its well known text representation.

### Parameters
* **ppszData**: input zero terminated string containing well known text representation of the geometry to be created. The pointer is updated to point just beyond that last character consumed.
* **hSRS**: handle to the spatial reference to be assigned to the created geometry object. This may be NULL.
* **phGeometry**: the newly created geometry object will be assigned to the indicated handle on return. This will be NULL if the method fails. If not NULL, *phGeometry should be freed with OGR_G_DestroyGeometry() after use.

### Returns
OGRERR_NONE if all goes well, otherwise any of OGRERR_NOT_ENOUGH_DATA, OGRERR_UNSUPPORTED_GEOMETRY_TYPE, or OGRERR_CORRUPT_DATA may be returned.
"""
function ogr_g_createfromwkt(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_CreateFromWkt, libgdal), OGRErr, (Ptr{Cstring}, OGRSpatialReferenceH, Ptr{OGRGeometryH}), arg1, arg2, arg3))
end

"""
    OGR_G_CreateFromFgf(const void * pabyData,
                        OGRSpatialReferenceH hSRS,
                        OGRGeometryH * phGeometry,
                        int nBytes,
                        int * pnBytesConsumed) -> OGRErr

Create a geometry object of the appropriate type from its FGF (FDO Geometry Format) binary representation.
"""
function ogr_g_createfromfgf(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_CreateFromFgf, libgdal), OGRErr, (Ptr{Cvoid}, OGRSpatialReferenceH, Ptr{OGRGeometryH}, Cint, Ptr{Cint}), arg1, arg2, arg3, arg4, arg5))
end

"""
    OGR_G_DestroyGeometry(OGRGeometryH hGeom) -> void

Destroy geometry object.

### Parameters
* **hGeom**: handle to the geometry to delete.
"""
function ogr_g_destroygeometry(arg1)
    aftercare(ccall((:OGR_G_DestroyGeometry, libgdal), Cvoid, (OGRGeometryH,), arg1))
end

"""
    OGR_G_CreateGeometry(OGRwkbGeometryType eGeometryType) -> OGRGeometryH

Create an empty geometry of desired type.

### Parameters
* **eGeometryType**: the type code of the geometry to be created.

### Returns
handle to the newly create geometry or NULL on failure. Should be freed with OGR_G_DestroyGeometry() after use.
"""
function ogr_g_creategeometry(arg1)
    aftercare(ccall((:OGR_G_CreateGeometry, libgdal), OGRGeometryH, (OGRwkbGeometryType,), arg1))
end

"""
    OGR_G_ApproximateArcAngles(double dfCenterX,
                               double dfCenterY,
                               double dfZ,
                               double dfPrimaryRadius,
                               double dfSecondaryRadius,
                               double dfRotation,
                               double dfStartAngle,
                               double dfEndAngle,
                               double dfMaxAngleStepSizeDegrees) -> OGRGeometryH

Stroke arc to linestring.

### Parameters
* **dfCenterX**: center X
* **dfCenterY**: center Y
* **dfZ**: center Z
* **dfPrimaryRadius**: X radius of ellipse.
* **dfSecondaryRadius**: Y radius of ellipse.
* **dfRotation**: rotation of the ellipse clockwise.
* **dfStartAngle**: angle to first point on arc (clockwise of X-positive)
* **dfEndAngle**: angle to last point on arc (clockwise of X-positive)
* **dfMaxAngleStepSizeDegrees**: the largest step in degrees along the arc, zero to use the default setting.

### Returns
OGRLineString geometry representing an approximation of the arc.
"""
function ogr_g_approximatearcangles(dfCenterX, dfCenterY, dfZ, dfPrimaryRadius, dfSecondaryAxis, dfRotation, dfStartAngle, dfEndAngle, dfMaxAngleStepSizeDegrees)
    aftercare(ccall((:OGR_G_ApproximateArcAngles, libgdal), OGRGeometryH, (Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), dfCenterX, dfCenterY, dfZ, dfPrimaryRadius, dfSecondaryAxis, dfRotation, dfStartAngle, dfEndAngle, dfMaxAngleStepSizeDegrees))
end

"""
    OGR_G_ForceToPolygon(OGRGeometryH hGeom) -> OGRGeometryH

Convert to polygon.

### Parameters
* **hGeom**: handle to the geometry to convert (ownership surrendered).

### Returns
the converted geometry (ownership to caller).
"""
function ogr_g_forcetopolygon(arg1)
    aftercare(ccall((:OGR_G_ForceToPolygon, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_ForceToLineString(OGRGeometryH hGeom) -> OGRGeometryH

Convert to line string.

### Parameters
* **hGeom**: handle to the geometry to convert (ownership surrendered).

### Returns
the converted geometry (ownership to caller).
"""
function ogr_g_forcetolinestring(arg1)
    aftercare(ccall((:OGR_G_ForceToLineString, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_ForceToMultiPolygon(OGRGeometryH hGeom) -> OGRGeometryH

Convert to multipolygon.

### Parameters
* **hGeom**: handle to the geometry to convert (ownership surrendered).

### Returns
the converted geometry (ownership to caller).
"""
function ogr_g_forcetomultipolygon(arg1)
    aftercare(ccall((:OGR_G_ForceToMultiPolygon, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_ForceToMultiPoint(OGRGeometryH hGeom) -> OGRGeometryH

Convert to multipoint.

### Parameters
* **hGeom**: handle to the geometry to convert (ownership surrendered).

### Returns
the converted geometry (ownership to caller).
"""
function ogr_g_forcetomultipoint(arg1)
    aftercare(ccall((:OGR_G_ForceToMultiPoint, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_ForceToMultiLineString(OGRGeometryH hGeom) -> OGRGeometryH

Convert to multilinestring.

### Parameters
* **hGeom**: handle to the geometry to convert (ownership surrendered).

### Returns
the converted geometry (ownership to caller).
"""
function ogr_g_forcetomultilinestring(arg1)
    aftercare(ccall((:OGR_G_ForceToMultiLineString, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_ForceTo(OGRGeometryH hGeom,
                  OGRwkbGeometryType eTargetType,
                  char ** papszOptions) -> OGRGeometryH

Convert to another geometry type.

### Parameters
* **hGeom**: the input geometry - ownership is passed to the method.
* **eTargetType**: target output geometry type.
* **papszOptions**: options as a null-terminated list of strings or NULL.

### Returns
new geometry.
"""
function ogr_g_forceto(hGeom, eTargetType, papszOptions)
    aftercare(ccall((:OGR_G_ForceTo, libgdal), OGRGeometryH, (OGRGeometryH, OGRwkbGeometryType, Ptr{Cstring}), hGeom, eTargetType, papszOptions))
end

"""
    OGR_G_RemoveLowerDimensionSubGeoms(const OGRGeometryH hGeom) -> OGRGeometryH

Remove sub-geometries from a geometry collection that do not have the maximum topological dimensionality of the collection.

### Parameters
* **hGeom**: handle to the geometry to convert

### Returns
a new geometry.
"""
function ogr_g_removelowerdimensionsubgeoms(hGeom)
    aftercare(ccall((:OGR_G_RemoveLowerDimensionSubGeoms, libgdal), OGRGeometryH, (OGRGeometryH,), hGeom))
end

"""
    OGR_G_GetDimension(OGRGeometryH hGeom) -> int

Get the dimension of this geometry.

### Parameters
* **hGeom**: handle on the geometry to get the dimension from.

### Returns
0 for points, 1 for lines and 2 for surfaces.
"""
function ogr_g_getdimension(arg1)
    aftercare(ccall((:OGR_G_GetDimension, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_GetCoordinateDimension(OGRGeometryH hGeom) -> int

Get the dimension of the coordinates in this geometry.

### Parameters
* **hGeom**: handle on the geometry to get the dimension of the coordinates from.

### Returns
this will return 2 or 3.
"""
function ogr_g_getcoordinatedimension(arg1)
    aftercare(ccall((:OGR_G_GetCoordinateDimension, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_CoordinateDimension(OGRGeometryH hGeom) -> int

Get the dimension of the coordinates in this geometry.

### Parameters
* **hGeom**: handle on the geometry to get the dimension of the coordinates from.

### Returns
this will return 2 for XY, 3 for XYZ and XYM, and 4 for XYZM data.
"""
function ogr_g_coordinatedimension(arg1)
    aftercare(ccall((:OGR_G_CoordinateDimension, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_SetCoordinateDimension(OGRGeometryH hGeom,
                                 int nNewDimension) -> void

Set the coordinate dimension.

### Parameters
* **hGeom**: handle on the geometry to set the dimension of the coordinates.
* **nNewDimension**: New coordinate dimension value, either 2 or 3.
"""
function ogr_g_setcoordinatedimension(arg1, arg2)
    aftercare(ccall((:OGR_G_SetCoordinateDimension, libgdal), Cvoid, (OGRGeometryH, Cint), arg1, arg2))
end

"""
    OGR_G_Is3D(OGRGeometryH hGeom) -> int

See whether this geometry has Z coordinates.

### Parameters
* **hGeom**: handle on the geometry to check whether it has Z coordinates.

### Returns
TRUE if the geometry has Z coordinates.
"""
function ogr_g_is3d(arg1)
    aftercare(ccall((:OGR_G_Is3D, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_IsMeasured(OGRGeometryH hGeom) -> int

See whether this geometry is measured.

### Parameters
* **hGeom**: handle on the geometry to check whether it is measured.

### Returns
TRUE if the geometry has M coordinates.
"""
function ogr_g_ismeasured(arg1)
    aftercare(ccall((:OGR_G_IsMeasured, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_Set3D(OGRGeometryH hGeom,
                int bIs3D) -> void

Add or remove the Z coordinate dimension.

### Parameters
* **hGeom**: handle on the geometry to set or unset the Z dimension.
* **bIs3D**: Should the geometry have a Z dimension, either TRUE or FALSE.
"""
function ogr_g_set3d(arg1, arg2)
    aftercare(ccall((:OGR_G_Set3D, libgdal), Cvoid, (OGRGeometryH, Cint), arg1, arg2))
end

"""
    OGR_G_SetMeasured(OGRGeometryH hGeom,
                      int bIsMeasured) -> void

Add or remove the M coordinate dimension.

### Parameters
* **hGeom**: handle on the geometry to set or unset the M dimension.
* **bIsMeasured**: Should the geometry have a M dimension, either TRUE or FALSE.
"""
function ogr_g_setmeasured(arg1, arg2)
    aftercare(ccall((:OGR_G_SetMeasured, libgdal), Cvoid, (OGRGeometryH, Cint), arg1, arg2))
end

"""
    OGR_G_Clone(OGRGeometryH hGeom) -> OGRGeometryH

Make a copy of this object.

### Parameters
* **hGeom**: handle on the geometry to clone from.

### Returns
a handle on the copy of the geometry with the spatial reference system as the original.
"""
function ogr_g_clone(arg1)
    aftercare(ccall((:OGR_G_Clone, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

struct OGREnvelope
    MinX::Cdouble
    MaxX::Cdouble
    MinY::Cdouble
    MaxY::Cdouble
end

"""
    OGR_G_GetEnvelope(OGRGeometryH hGeom,
                      OGREnvelope * psEnvelope) -> void

Computes and returns the bounding envelope for this geometry in the passed psEnvelope structure.

### Parameters
* **hGeom**: handle of the geometry to get envelope from.
* **psEnvelope**: the structure in which to place the results.
"""
function ogr_g_getenvelope(arg1, arg2)
    aftercare(ccall((:OGR_G_GetEnvelope, libgdal), Cvoid, (OGRGeometryH, Ptr{OGREnvelope}), arg1, arg2))
end

struct OGREnvelope3D
    MinX::Cdouble
    MaxX::Cdouble
    MinY::Cdouble
    MaxY::Cdouble
    MinZ::Cdouble
    MaxZ::Cdouble
end

"""
    OGR_G_GetEnvelope3D(OGRGeometryH hGeom,
                        OGREnvelope3D * psEnvelope) -> void

Computes and returns the bounding envelope (3D) for this geometry in the passed psEnvelope structure.

### Parameters
* **hGeom**: handle of the geometry to get envelope from.
* **psEnvelope**: the structure in which to place the results.
"""
function ogr_g_getenvelope3d(arg1, arg2)
    aftercare(ccall((:OGR_G_GetEnvelope3D, libgdal), Cvoid, (OGRGeometryH, Ptr{OGREnvelope3D}), arg1, arg2))
end

"""
    OGR_G_ImportFromWkb(OGRGeometryH hGeom,
                        const void * pabyData,
                        int nSize) -> OGRErr

Assign geometry from well known binary data.

### Parameters
* **hGeom**: handle on the geometry to assign the well know binary data to.
* **pabyData**: the binary input data.
* **nSize**: the size of pabyData in bytes, or -1 if not known.

### Returns
OGRERR_NONE if all goes well, otherwise any of OGRERR_NOT_ENOUGH_DATA, OGRERR_UNSUPPORTED_GEOMETRY_TYPE, or OGRERR_CORRUPT_DATA may be returned.
"""
function ogr_g_importfromwkb(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_ImportFromWkb, libgdal), OGRErr, (OGRGeometryH, Ptr{Cvoid}, Cint), arg1, arg2, arg3))
end

"""
    OGRwkbByteOrder

Enumeration to describe byte order 

| Enumerator | Note                                             |
| :--------- | :----------------------------------------------- |
| wkbXDR     | MSB/Sun/Motoroloa: Most Significant Byte First   |
| wkbNDR     | LSB/Intel/Vax: Least Significant Byte First      |
"""
@cenum OGRwkbByteOrder::UInt32 begin
        wkbXDR = 0
        wkbNDR = 1
    end

"""
    OGR_G_ExportToWkb(OGRGeometryH hGeom,
                      OGRwkbByteOrder eOrder,
                      unsigned char * pabyDstBuffer) -> OGRErr

Convert a geometry well known binary format.

### Parameters
* **hGeom**: handle on the geometry to convert to a well know binary data from.
* **eOrder**: One of wkbXDR or wkbNDR indicating MSB or LSB byte order respectively.
* **pabyDstBuffer**: a buffer into which the binary representation is written. This buffer must be at least OGR_G_WkbSize() byte in size.

### Returns
Currently OGRERR_NONE is always returned.
"""
function ogr_g_exporttowkb(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_ExportToWkb, libgdal), OGRErr, (OGRGeometryH, OGRwkbByteOrder, Ptr{Cuchar}), arg1, arg2, arg3))
end

"""
    OGR_G_ExportToIsoWkb(OGRGeometryH hGeom,
                         OGRwkbByteOrder eOrder,
                         unsigned char * pabyDstBuffer) -> OGRErr

Convert a geometry into SFSQL 1.2 / ISO SQL/MM Part 3 well known binary format.

### Parameters
* **hGeom**: handle on the geometry to convert to a well know binary data from.
* **eOrder**: One of wkbXDR or wkbNDR indicating MSB or LSB byte order respectively.
* **pabyDstBuffer**: a buffer into which the binary representation is written. This buffer must be at least OGR_G_WkbSize() byte in size.

### Returns
Currently OGRERR_NONE is always returned.
"""
function ogr_g_exporttoisowkb(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_ExportToIsoWkb, libgdal), OGRErr, (OGRGeometryH, OGRwkbByteOrder, Ptr{Cuchar}), arg1, arg2, arg3))
end

"""
    OGR_G_WkbSize(OGRGeometryH hGeom) -> int

Returns size of related binary representation.

### Parameters
* **hGeom**: handle on the geometry to get the binary size from.

### Returns
size of binary representation in bytes.
"""
function ogr_g_wkbsize(hGeom)
    aftercare(ccall((:OGR_G_WkbSize, libgdal), Cint, (OGRGeometryH,), hGeom))
end

"""
    OGR_G_ImportFromWkt(OGRGeometryH hGeom,
                        char ** ppszSrcText) -> OGRErr

Assign geometry from well known text data.

### Parameters
* **hGeom**: handle on the geometry to assign well know text data to.
* **ppszSrcText**: pointer to a pointer to the source text. The pointer is updated to pointer after the consumed text.

### Returns
OGRERR_NONE if all goes well, otherwise any of OGRERR_NOT_ENOUGH_DATA, OGRERR_UNSUPPORTED_GEOMETRY_TYPE, or OGRERR_CORRUPT_DATA may be returned.
"""
function ogr_g_importfromwkt(arg1, arg2)
    aftercare(ccall((:OGR_G_ImportFromWkt, libgdal), OGRErr, (OGRGeometryH, Ptr{Cstring}), arg1, arg2))
end

"""
    OGR_G_ExportToWkt(OGRGeometryH hGeom,
                      char ** ppszSrcText) -> OGRErr

Convert a geometry into well known text format.

### Parameters
* **hGeom**: handle on the geometry to convert to a text format from.
* **ppszSrcText**: a text buffer is allocated by the program, and assigned to the passed pointer. After use, *ppszDstText should be freed with CPLFree().

### Returns
Currently OGRERR_NONE is always returned.
"""
function ogr_g_exporttowkt(arg1, arg2)
    aftercare(ccall((:OGR_G_ExportToWkt, libgdal), OGRErr, (OGRGeometryH, Ptr{Cstring}), arg1, arg2))
end

"""
    OGR_G_ExportToIsoWkt(OGRGeometryH hGeom,
                         char ** ppszSrcText) -> OGRErr

Convert a geometry into SFSQL 1.2 / ISO SQL/MM Part 3 well known text format.

### Parameters
* **hGeom**: handle on the geometry to convert to a text format from.
* **ppszSrcText**: a text buffer is allocated by the program, and assigned to the passed pointer. After use, *ppszDstText should be freed with CPLFree().

### Returns
Currently OGRERR_NONE is always returned.
"""
function ogr_g_exporttoisowkt(arg1, arg2)
    aftercare(ccall((:OGR_G_ExportToIsoWkt, libgdal), OGRErr, (OGRGeometryH, Ptr{Cstring}), arg1, arg2))
end

"""
    OGR_G_GetGeometryType(OGRGeometryH hGeom) -> OGRwkbGeometryType

Fetch geometry type.

### Parameters
* **hGeom**: handle on the geometry to get type from.

### Returns
the geometry type code.
"""
function ogr_g_getgeometrytype(arg1)
    aftercare(ccall((:OGR_G_GetGeometryType, libgdal), OGRwkbGeometryType, (OGRGeometryH,), arg1))
end

"""
    OGR_G_GetGeometryName(OGRGeometryH hGeom) -> const char *

Fetch WKT name for geometry type.

### Parameters
* **hGeom**: handle on the geometry to get name from.

### Returns
name used for this geometry type in well known text format.
"""
function ogr_g_getgeometryname(arg1)
    aftercare(ccall((:OGR_G_GetGeometryName, libgdal), Cstring, (OGRGeometryH,), arg1), false)
end

"""
    OGR_G_DumpReadable(OGRGeometryH hGeom,
                       FILE * fp,
                       const char * pszPrefix) -> void

Dump geometry in well known text format to indicated output file.

### Parameters
* **hGeom**: handle on the geometry to dump.
* **fp**: the text file to write the geometry to.
* **pszPrefix**: the prefix to put on each line of output.
"""
function ogr_g_dumpreadable(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_DumpReadable, libgdal), Cvoid, (OGRGeometryH, Ptr{Libc.FILE}, Cstring), arg1, arg2, arg3))
end

"""
    OGR_G_FlattenTo2D(OGRGeometryH hGeom) -> void

Convert geometry to strictly 2D.

### Parameters
* **hGeom**: handle on the geometry to convert.
"""
function ogr_g_flattento2d(arg1)
    aftercare(ccall((:OGR_G_FlattenTo2D, libgdal), Cvoid, (OGRGeometryH,), arg1))
end

"""
    OGR_G_CloseRings(OGRGeometryH hGeom) -> void

Force rings to be closed.

### Parameters
* **hGeom**: handle to the geometry.
"""
function ogr_g_closerings(arg1)
    aftercare(ccall((:OGR_G_CloseRings, libgdal), Cvoid, (OGRGeometryH,), arg1))
end

"""
    OGR_G_CreateFromGML(const char * pszGML) -> OGRGeometryH

Create geometry from GML.

### Parameters
* **pszGML**: The GML fragment for the geometry.

### Returns
a geometry on success, or NULL on error.
"""
function ogr_g_createfromgml(arg1)
    aftercare(ccall((:OGR_G_CreateFromGML, libgdal), OGRGeometryH, (Cstring,), arg1))
end

"""
    OGR_G_ExportToGML(OGRGeometryH hGeometry) -> char *

Convert a geometry into GML format.

### Parameters
* **hGeometry**: handle to the geometry.

### Returns
A GML fragment or NULL in case of error.
"""
function ogr_g_exporttogml(arg1)
    aftercare(ccall((:OGR_G_ExportToGML, libgdal), Cstring, (OGRGeometryH,), arg1), false)
end

"""
    OGR_G_ExportToGMLEx(OGRGeometryH hGeometry,
                        char ** papszOptions) -> char *

Convert a geometry into GML format.

### Parameters
* **hGeometry**: handle to the geometry.
* **papszOptions**: NULL-terminated list of options.

### Returns
A GML fragment or NULL in case of error.
"""
function ogr_g_exporttogmlex(arg1, papszOptions)
    aftercare(ccall((:OGR_G_ExportToGMLEx, libgdal), Cstring, (OGRGeometryH, Ptr{Cstring}), arg1, papszOptions), false)
end

"""
    OGR_G_CreateFromGMLTree(const CPLXMLNode * psTree) -> OGRGeometryH

Create geometry from GML.
"""
function ogr_g_createfromgmltree(arg1)
    aftercare(ccall((:OGR_G_CreateFromGMLTree, libgdal), OGRGeometryH, (Ptr{CPLXMLNode},), arg1))
end

"""
    OGR_G_ExportToGMLTree(OGRGeometryH hGeometry) -> CPLXMLNode *

Convert a geometry into GML format.
"""
function ogr_g_exporttogmltree(arg1)
    aftercare(ccall((:OGR_G_ExportToGMLTree, libgdal), Ptr{CPLXMLNode}, (OGRGeometryH,), arg1))
end

"""
    OGR_G_ExportEnvelopeToGMLTree(OGRGeometryH hGeometry) -> CPLXMLNode *

Export the envelope of a geometry as a gml:Box.
"""
function ogr_g_exportenvelopetogmltree(arg1)
    aftercare(ccall((:OGR_G_ExportEnvelopeToGMLTree, libgdal), Ptr{CPLXMLNode}, (OGRGeometryH,), arg1))
end

"""
    OGR_G_ExportToKML(OGRGeometryH hGeometry,
                      const char * pszAltitudeMode) -> char *

Convert a geometry into KML format.

### Parameters
* **hGeometry**: handle to the geometry.
* **pszAltitudeMode**: value to write in altitudeMode element, or NULL.

### Returns
A KML fragment or NULL in case of error.
"""
function ogr_g_exporttokml(arg1, pszAltitudeMode)
    aftercare(ccall((:OGR_G_ExportToKML, libgdal), Cstring, (OGRGeometryH, Cstring), arg1, pszAltitudeMode), false)
end

"""
    OGR_G_ExportToJson(OGRGeometryH hGeometry) -> char *

Convert a geometry into GeoJSON format.

### Parameters
* **hGeometry**: handle to the geometry.

### Returns
A GeoJSON fragment or NULL in case of error.
"""
function ogr_g_exporttojson(arg1)
    aftercare(ccall((:OGR_G_ExportToJson, libgdal), Cstring, (OGRGeometryH,), arg1), false)
end

"""
    OGR_G_ExportToJsonEx(OGRGeometryH hGeometry,
                         char ** papszOptions) -> char *

Convert a geometry into GeoJSON format.

### Parameters
* **hGeometry**: handle to the geometry.
* **papszOptions**: a null terminated list of options.

### Returns
A GeoJSON fragment or NULL in case of error.
"""
function ogr_g_exporttojsonex(arg1, papszOptions)
    aftercare(ccall((:OGR_G_ExportToJsonEx, libgdal), Cstring, (OGRGeometryH, Ptr{Cstring}), arg1, papszOptions), false)
end

"""
    ogr_g_creategeometryfromjson(arg1)

Create a OGR geometry from a GeoJSON geometry object 
"""
function ogr_g_creategeometryfromjson(arg1)
    aftercare(ccall((:OGR_G_CreateGeometryFromJson, libgdal), OGRGeometryH, (Cstring,), arg1))
end

"""
    ogr_g_creategeometryfromesrijson(arg1)

Create a OGR geometry from a ESRI JSON geometry object 
"""
function ogr_g_creategeometryfromesrijson(arg1)
    aftercare(ccall((:OGR_G_CreateGeometryFromEsriJson, libgdal), OGRGeometryH, (Cstring,), arg1))
end

"""
    OGR_G_AssignSpatialReference(OGRGeometryH hGeom,
                                 OGRSpatialReferenceH hSRS) -> void

Assign spatial reference to this object.

### Parameters
* **hGeom**: handle on the geometry to apply the new spatial reference system.
* **hSRS**: handle on the new spatial reference system to apply.
"""
function ogr_g_assignspatialreference(arg1, arg2)
    aftercare(ccall((:OGR_G_AssignSpatialReference, libgdal), Cvoid, (OGRGeometryH, OGRSpatialReferenceH), arg1, arg2))
end

"""
    OGR_G_GetSpatialReference(OGRGeometryH hGeom) -> OGRSpatialReferenceH

Returns spatial reference system for geometry.

### Parameters
* **hGeom**: handle on the geometry to get spatial reference from.

### Returns
a reference to the spatial reference geometry.
"""
function ogr_g_getspatialreference(arg1)
    aftercare(ccall((:OGR_G_GetSpatialReference, libgdal), OGRSpatialReferenceH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_Transform(OGRGeometryH hGeom,
                    OGRCoordinateTransformationH hTransform) -> OGRErr

Apply arbitrary coordinate transformation to geometry.

### Parameters
* **hGeom**: handle on the geometry to apply the transform to.
* **hTransform**: handle on the transformation to apply.

### Returns
OGRERR_NONE on success or an error code.
"""
function ogr_g_transform(arg1, arg2)
    aftercare(ccall((:OGR_G_Transform, libgdal), OGRErr, (OGRGeometryH, OGRCoordinateTransformationH), arg1, arg2))
end

"""
    OGR_G_TransformTo(OGRGeometryH hGeom,
                      OGRSpatialReferenceH hSRS) -> OGRErr

Transform geometry to new spatial reference system.

### Parameters
* **hGeom**: handle on the geometry to apply the transform to.
* **hSRS**: handle on the spatial reference system to apply.

### Returns
OGRERR_NONE on success, or an error code.
"""
function ogr_g_transformto(arg1, arg2)
    aftercare(ccall((:OGR_G_TransformTo, libgdal), OGRErr, (OGRGeometryH, OGRSpatialReferenceH), arg1, arg2))
end

mutable struct OGRGeomTransformer
end

"Opaque type for a geometry transformer. "
const OGRGeomTransformerH = Ptr{OGRGeomTransformer}

"""
    OGR_GeomTransformer_Create(OGRCoordinateTransformationH hCT,
                               CSLConstList papszOptions) -> OGRGeomTransformerH

Create a geometry transformer.

### Parameters
* **hCT**: Coordinate transformation object (will be cloned) or NULL.
* **papszOptions**: NULL terminated list of options, or NULL. Supported options are: 

WRAPDATELINE=YES 


DATELINEOFFSET=longitude_gap_in_degree. Defaults to 10.

### Returns
transformer object to free with OGR_GeomTransformer_Destroy()
"""
function ogr_geomtransformer_create(arg1, papszOptions)
    aftercare(ccall((:OGR_GeomTransformer_Create, libgdal), OGRGeomTransformerH, (OGRCoordinateTransformationH, CSLConstList), arg1, papszOptions))
end

"""
    OGR_GeomTransformer_Transform(OGRGeomTransformerH hTransformer,
                                  OGRGeometryH hGeom) -> OGRGeometryH

Transforms a geometry.

### Parameters
* **hTransformer**: transformer object.
* **hGeom**: Source geometry.

### Returns
a new geometry (or NULL) to destroy with OGR_G_DestroyGeometry()
"""
function ogr_geomtransformer_transform(hTransformer, hGeom)
    aftercare(ccall((:OGR_GeomTransformer_Transform, libgdal), OGRGeometryH, (OGRGeomTransformerH, OGRGeometryH), hTransformer, hGeom))
end

"""
    OGR_GeomTransformer_Destroy(OGRGeomTransformerH hTransformer) -> void

Destroy a geometry transformer allocated with OGR_GeomTransformer_Create()

### Parameters
* **hTransformer**: transformer object.
"""
function ogr_geomtransformer_destroy(hTransformer)
    aftercare(ccall((:OGR_GeomTransformer_Destroy, libgdal), Cvoid, (OGRGeomTransformerH,), hTransformer))
end

"""
    OGR_G_Simplify(OGRGeometryH hThis,
                   double dTolerance) -> OGRGeometryH

Compute a simplified geometry.

### Parameters
* **hThis**: the geometry.
* **dTolerance**: the distance tolerance for the simplification.

### Returns
the simplified geometry or NULL if an error occurs.
"""
function ogr_g_simplify(hThis, tolerance)
    aftercare(ccall((:OGR_G_Simplify, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble), hThis, tolerance))
end

"""
    OGR_G_SimplifyPreserveTopology(OGRGeometryH hThis,
                                   double dTolerance) -> OGRGeometryH

Simplify the geometry while preserving topology.

### Parameters
* **hThis**: the geometry.
* **dTolerance**: the distance tolerance for the simplification.

### Returns
the simplified geometry or NULL if an error occurs.
"""
function ogr_g_simplifypreservetopology(hThis, tolerance)
    aftercare(ccall((:OGR_G_SimplifyPreserveTopology, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble), hThis, tolerance))
end

"""
    OGR_G_DelaunayTriangulation(OGRGeometryH hThis,
                                double dfTolerance,
                                int bOnlyEdges) -> OGRGeometryH

Return a Delaunay triangulation of the vertices of the geometry.

### Parameters
* **hThis**: the geometry.
* **dfTolerance**: optional snapping tolerance to use for improved robustness
* **bOnlyEdges**: if TRUE, will return a MULTILINESTRING, otherwise it will return a GEOMETRYCOLLECTION containing triangular POLYGONs.

### Returns
the geometry resulting from the Delaunay triangulation or NULL if an error occurs.
"""
function ogr_g_delaunaytriangulation(hThis, dfTolerance, bOnlyEdges)
    aftercare(ccall((:OGR_G_DelaunayTriangulation, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble, Cint), hThis, dfTolerance, bOnlyEdges))
end

"""
    OGR_G_Segmentize(OGRGeometryH hGeom,
                     double dfMaxLength) -> void

Modify the geometry such it has no segment longer then the given distance.

### Parameters
* **hGeom**: handle on the geometry to segmentize
* **dfMaxLength**: the maximum distance between 2 points after segmentization
"""
function ogr_g_segmentize(hGeom, dfMaxLength)
    aftercare(ccall((:OGR_G_Segmentize, libgdal), Cvoid, (OGRGeometryH, Cdouble), hGeom, dfMaxLength))
end

"""
    OGR_G_Intersects(OGRGeometryH hGeom,
                     OGRGeometryH hOtherGeom) -> int

Do these features intersect?

### Parameters
* **hGeom**: handle on the first geometry.
* **hOtherGeom**: handle on the other geometry to test against.

### Returns
TRUE if the geometries intersect, otherwise FALSE.
"""
function ogr_g_intersects(arg1, arg2)
    aftercare(ccall((:OGR_G_Intersects, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Equals(OGRGeometryH hGeom,
                 OGRGeometryH hOther) -> int

Returns TRUE if two geometries are equivalent.

### Parameters
* **hGeom**: handle on the first geometry.
* **hOther**: handle on the other geometry to test against.

### Returns
TRUE if equivalent or FALSE otherwise.
"""
function ogr_g_equals(arg1, arg2)
    aftercare(ccall((:OGR_G_Equals, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Disjoint(OGRGeometryH hThis,
                   OGRGeometryH hOther) -> int

Test for disjointness.

### Parameters
* **hThis**: the geometry to compare.
* **hOther**: the other geometry to compare.

### Returns
TRUE if they are disjoint, otherwise FALSE.
"""
function ogr_g_disjoint(arg1, arg2)
    aftercare(ccall((:OGR_G_Disjoint, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Touches(OGRGeometryH hThis,
                  OGRGeometryH hOther) -> int

Test for touching.

### Parameters
* **hThis**: the geometry to compare.
* **hOther**: the other geometry to compare.

### Returns
TRUE if they are touching, otherwise FALSE.
"""
function ogr_g_touches(arg1, arg2)
    aftercare(ccall((:OGR_G_Touches, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Crosses(OGRGeometryH hThis,
                  OGRGeometryH hOther) -> int

Test for crossing.

### Parameters
* **hThis**: the geometry to compare.
* **hOther**: the other geometry to compare.

### Returns
TRUE if they are crossing, otherwise FALSE.
"""
function ogr_g_crosses(arg1, arg2)
    aftercare(ccall((:OGR_G_Crosses, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Within(OGRGeometryH hThis,
                 OGRGeometryH hOther) -> int

Test for containment.

### Parameters
* **hThis**: the geometry to compare.
* **hOther**: the other geometry to compare.

### Returns
TRUE if hThis is within hOther, otherwise FALSE.
"""
function ogr_g_within(arg1, arg2)
    aftercare(ccall((:OGR_G_Within, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Contains(OGRGeometryH hThis,
                   OGRGeometryH hOther) -> int

Test for containment.

### Parameters
* **hThis**: the geometry to compare.
* **hOther**: the other geometry to compare.

### Returns
TRUE if hThis contains hOther geometry, otherwise FALSE.
"""
function ogr_g_contains(arg1, arg2)
    aftercare(ccall((:OGR_G_Contains, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Overlaps(OGRGeometryH hThis,
                   OGRGeometryH hOther) -> int

Test for overlap.

### Parameters
* **hThis**: the geometry to compare.
* **hOther**: the other geometry to compare.

### Returns
TRUE if they are overlapping, otherwise FALSE.
"""
function ogr_g_overlaps(arg1, arg2)
    aftercare(ccall((:OGR_G_Overlaps, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Boundary(OGRGeometryH hTarget) -> OGRGeometryH

Compute boundary.

### Parameters
* **hTarget**: The Geometry to calculate the boundary of.

### Returns
a handle to a newly allocated geometry now owned by the caller, or NULL on failure.
"""
function ogr_g_boundary(arg1)
    aftercare(ccall((:OGR_G_Boundary, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_ConvexHull(OGRGeometryH hTarget) -> OGRGeometryH

Compute convex hull.

### Parameters
* **hTarget**: The Geometry to calculate the convex hull of.

### Returns
a handle to a newly allocated geometry now owned by the caller, or NULL on failure.
"""
function ogr_g_convexhull(arg1)
    aftercare(ccall((:OGR_G_ConvexHull, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_Buffer(OGRGeometryH hTarget,
                 double dfDist,
                 int nQuadSegs) -> OGRGeometryH

Compute buffer of geometry.

### Parameters
* **hTarget**: the geometry.
* **dfDist**: the buffer distance to be applied. Should be expressed into the same unit as the coordinates of the geometry.
* **nQuadSegs**: the number of segments used to approximate a 90 degree (quadrant) of curvature.

### Returns
the newly created geometry, or NULL if an error occurs.
"""
function ogr_g_buffer(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_Buffer, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble, Cint), arg1, arg2, arg3))
end

"""
    OGR_G_Intersection(OGRGeometryH hThis,
                       OGRGeometryH hOther) -> OGRGeometryH

Compute intersection.

### Parameters
* **hThis**: the geometry.
* **hOther**: the other geometry.

### Returns
a new geometry representing the intersection or NULL if there is no intersection or an error occurs.
"""
function ogr_g_intersection(arg1, arg2)
    aftercare(ccall((:OGR_G_Intersection, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Union(OGRGeometryH hThis,
                OGRGeometryH hOther) -> OGRGeometryH

Compute union.

### Parameters
* **hThis**: the geometry.
* **hOther**: the other geometry.

### Returns
a new geometry representing the union or NULL if an error occurs.
"""
function ogr_g_union(arg1, arg2)
    aftercare(ccall((:OGR_G_Union, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_UnionCascaded(OGRGeometryH hThis) -> OGRGeometryH

Compute union using cascading.

### Parameters
* **hThis**: the geometry.

### Returns
a new geometry representing the union or NULL if an error occurs.
"""
function ogr_g_unioncascaded(arg1)
    aftercare(ccall((:OGR_G_UnionCascaded, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_PointOnSurface(OGRGeometryH hGeom) -> OGRGeometryH

Returns a point guaranteed to lie on the surface.

### Parameters
* **hGeom**: the geometry to operate on.

### Returns
a point guaranteed to lie on the surface or NULL if an error occurred.
"""
function ogr_g_pointonsurface(arg1)
    aftercare(ccall((:OGR_G_PointOnSurface, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_Difference(OGRGeometryH hThis,
                     OGRGeometryH hOther) -> OGRGeometryH

Compute difference.

### Parameters
* **hThis**: the geometry.
* **hOther**: the other geometry.

### Returns
a new geometry representing the difference or NULL if the difference is empty or an error occurs.
"""
function ogr_g_difference(arg1, arg2)
    aftercare(ccall((:OGR_G_Difference, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_SymDifference(OGRGeometryH hThis,
                        OGRGeometryH hOther) -> OGRGeometryH

Compute symmetric difference.

### Parameters
* **hThis**: the geometry.
* **hOther**: the other geometry.

### Returns
a new geometry representing the symmetric difference or NULL if the difference is empty or an error occurs.
"""
function ogr_g_symdifference(arg1, arg2)
    aftercare(ccall((:OGR_G_SymDifference, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Distance(OGRGeometryH hFirst,
                   OGRGeometryH hOther) -> double

Compute distance between two geometries.

### Parameters
* **hFirst**: the first geometry to compare against.
* **hOther**: the other geometry to compare against.

### Returns
the distance between the geometries or -1 if an error occurs.
"""
function ogr_g_distance(arg1, arg2)
    aftercare(ccall((:OGR_G_Distance, libgdal), Cdouble, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Distance3D(OGRGeometryH hFirst,
                     OGRGeometryH hOther) -> double

Returns the 3D distance between two geometries.

### Parameters
* **hFirst**: the first geometry to compare against.
* **hOther**: the other geometry to compare against.

### Returns
distance between the two geometries
"""
function ogr_g_distance3d(arg1, arg2)
    aftercare(ccall((:OGR_G_Distance3D, libgdal), Cdouble, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Length(OGRGeometryH hGeom) -> double

Compute length of a geometry.

### Parameters
* **hGeom**: the geometry to operate on.

### Returns
the length or 0.0 for unsupported geometry types.
"""
function ogr_g_length(arg1)
    aftercare(ccall((:OGR_G_Length, libgdal), Cdouble, (OGRGeometryH,), arg1))
end

"""
    OGR_G_Area(OGRGeometryH hGeom) -> double

Compute geometry area.

### Parameters
* **hGeom**: the geometry to operate on.

### Returns
the area or 0.0 for unsupported geometry types.
"""
function ogr_g_area(arg1)
    aftercare(ccall((:OGR_G_Area, libgdal), Cdouble, (OGRGeometryH,), arg1))
end

"""
    OGR_G_Centroid(OGRGeometryH hGeom,
                   OGRGeometryH hCentroidPoint) -> int

Compute the geometry centroid.

### Returns
OGRERR_NONE on success or OGRERR_FAILURE on error.
"""
function ogr_g_centroid(arg1, arg2)
    aftercare(ccall((:OGR_G_Centroid, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_Value(OGRGeometryH hGeom,
                double dfDistance) -> OGRGeometryH

Fetch point at given distance along curve.

### Parameters
* **hGeom**: curve geometry.
* **dfDistance**: distance along the curve at which to sample position. This distance should be between zero and get_Length() for this curve.

### Returns
a point or NULL.
"""
function ogr_g_value(arg1, dfDistance)
    aftercare(ccall((:OGR_G_Value, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble), arg1, dfDistance))
end

"""
    OGR_G_Empty(OGRGeometryH hGeom) -> void

Clear geometry information.

### Parameters
* **hGeom**: handle on the geometry to empty.
"""
function ogr_g_empty(arg1)
    aftercare(ccall((:OGR_G_Empty, libgdal), Cvoid, (OGRGeometryH,), arg1))
end

"""
    OGR_G_IsEmpty(OGRGeometryH hGeom) -> int

Test if the geometry is empty.

### Parameters
* **hGeom**: The Geometry to test.

### Returns
TRUE if the geometry has no points, otherwise FALSE.
"""
function ogr_g_isempty(arg1)
    aftercare(ccall((:OGR_G_IsEmpty, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_IsValid(OGRGeometryH hGeom) -> int

Test if the geometry is valid.

### Parameters
* **hGeom**: The Geometry to test.

### Returns
TRUE if the geometry has no points, otherwise FALSE.
"""
function ogr_g_isvalid(arg1)
    aftercare(ccall((:OGR_G_IsValid, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_MakeValid(OGRGeometryH hGeom) -> OGRGeometryH

Attempts to make an invalid geometry valid without losing vertices.

### Parameters
* **hGeom**: The Geometry to make valid.

### Returns
a newly allocated geometry now owned by the caller, or NULL on failure.
"""
function ogr_g_makevalid(arg1)
    aftercare(ccall((:OGR_G_MakeValid, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_IsSimple(OGRGeometryH hGeom) -> int

Returns TRUE if the geometry is simple.

### Parameters
* **hGeom**: The Geometry to test.

### Returns
TRUE if object is simple, otherwise FALSE.
"""
function ogr_g_issimple(arg1)
    aftercare(ccall((:OGR_G_IsSimple, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_IsRing(OGRGeometryH hGeom) -> int

Test if the geometry is a ring.

### Parameters
* **hGeom**: The Geometry to test.

### Returns
TRUE if the geometry has no points, otherwise FALSE.
"""
function ogr_g_isring(arg1)
    aftercare(ccall((:OGR_G_IsRing, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_Polygonize(OGRGeometryH hTarget) -> OGRGeometryH

Polygonizes a set of sparse edges.

### Parameters
* **hTarget**: The Geometry to be polygonized.

### Returns
a handle to a newly allocated geometry now owned by the caller, or NULL on failure.
"""
function ogr_g_polygonize(arg1)
    aftercare(ccall((:OGR_G_Polygonize, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    ogr_g_intersect(arg1, arg2)

Doxygen\\_Suppress 
"""
function ogr_g_intersect(arg1, arg2)
    aftercare(ccall((:OGR_G_Intersect, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_equal(arg1, arg2)
    aftercare(ccall((:OGR_G_Equal, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_SymmetricDifference(OGRGeometryH hThis,
                              OGRGeometryH hOther) -> OGRGeometryH

Compute symmetric difference (deprecated)
"""
function ogr_g_symmetricdifference(arg1, arg2)
    aftercare(ccall((:OGR_G_SymmetricDifference, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_GetArea(OGRGeometryH hGeom) -> double

Compute geometry area (deprecated)
"""
function ogr_g_getarea(arg1)
    aftercare(ccall((:OGR_G_GetArea, libgdal), Cdouble, (OGRGeometryH,), arg1))
end

"""
    OGR_G_GetBoundary(OGRGeometryH hTarget) -> OGRGeometryH

Compute boundary (deprecated)
"""
function ogr_g_getboundary(arg1)
    aftercare(ccall((:OGR_G_GetBoundary, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    OGR_G_GetPointCount(OGRGeometryH hGeom) -> int

Fetch number of points from a Point or a LineString/LinearRing geometry.

### Parameters
* **hGeom**: handle to the geometry from which to get the number of points.

### Returns
the number of points.
"""
function ogr_g_getpointcount(arg1)
    aftercare(ccall((:OGR_G_GetPointCount, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_GetPoints(OGRGeometryH hGeom,
                    void * pabyX,
                    int nXStride,
                    void * pabyY,
                    int nYStride,
                    void * pabyZ,
                    int nZStride) -> int

Returns all points of line string.

### Parameters
* **hGeom**: handle to the geometry from which to get the coordinates.
* **pabyX**: a buffer of at least (sizeof(double) * nXStride * nPointCount) bytes, may be NULL.
* **nXStride**: the number of bytes between 2 elements of pabyX.
* **pabyY**: a buffer of at least (sizeof(double) * nYStride * nPointCount) bytes, may be NULL.
* **nYStride**: the number of bytes between 2 elements of pabyY.
* **pabyZ**: a buffer of at last size (sizeof(double) * nZStride * nPointCount) bytes, may be NULL.
* **nZStride**: the number of bytes between 2 elements of pabyZ.

### Returns
the number of points
"""
function ogr_g_getpoints(hGeom, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride)
    aftercare(ccall((:OGR_G_GetPoints, libgdal), Cint, (OGRGeometryH, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint), hGeom, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride))
end

"""
    OGR_G_GetPointsZM(OGRGeometryH hGeom,
                      void * pabyX,
                      int nXStride,
                      void * pabyY,
                      int nYStride,
                      void * pabyZ,
                      int nZStride,
                      void * pabyM,
                      int nMStride) -> int

Returns all points of line string.

### Parameters
* **hGeom**: handle to the geometry from which to get the coordinates.
* **pabyX**: a buffer of at least (nXStride * nPointCount) bytes, may be NULL.
* **nXStride**: the number of bytes between 2 elements of pabyX.
* **pabyY**: a buffer of at least (nYStride * nPointCount) bytes, may be NULL.
* **nYStride**: the number of bytes between 2 elements of pabyY.
* **pabyZ**: a buffer of at last size (nZStride * nPointCount) bytes, may be NULL.
* **nZStride**: the number of bytes between 2 elements of pabyZ.
* **pabyM**: a buffer of at last size (nMStride * nPointCount) bytes, may be NULL.
* **nMStride**: the number of bytes between 2 elements of pabyM.

### Returns
the number of points
"""
function ogr_g_getpointszm(hGeom, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride, pabyM, nMStride)
    aftercare(ccall((:OGR_G_GetPointsZM, libgdal), Cint, (OGRGeometryH, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint), hGeom, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride, pabyM, nMStride))
end

"""
    OGR_G_GetX(OGRGeometryH hGeom,
               int i) -> double

Fetch the x coordinate of a point from a Point or a LineString/LinearRing geometry.

### Parameters
* **hGeom**: handle to the geometry from which to get the x coordinate.
* **i**: point to get the x coordinate.

### Returns
the X coordinate of this point.
"""
function ogr_g_getx(arg1, arg2)
    aftercare(ccall((:OGR_G_GetX, libgdal), Cdouble, (OGRGeometryH, Cint), arg1, arg2))
end

"""
    OGR_G_GetY(OGRGeometryH hGeom,
               int i) -> double

Fetch the x coordinate of a point from a Point or a LineString/LinearRing geometry.

### Parameters
* **hGeom**: handle to the geometry from which to get the y coordinate.
* **i**: point to get the Y coordinate.

### Returns
the Y coordinate of this point.
"""
function ogr_g_gety(arg1, arg2)
    aftercare(ccall((:OGR_G_GetY, libgdal), Cdouble, (OGRGeometryH, Cint), arg1, arg2))
end

"""
    OGR_G_GetZ(OGRGeometryH hGeom,
               int i) -> double

Fetch the z coordinate of a point from a Point or a LineString/LinearRing geometry.

### Parameters
* **hGeom**: handle to the geometry from which to get the Z coordinate.
* **i**: point to get the Z coordinate.

### Returns
the Z coordinate of this point.
"""
function ogr_g_getz(arg1, arg2)
    aftercare(ccall((:OGR_G_GetZ, libgdal), Cdouble, (OGRGeometryH, Cint), arg1, arg2))
end

"""
    OGR_G_GetM(OGRGeometryH hGeom,
               int i) -> double

Fetch the m coordinate of a point from a geometry.

### Parameters
* **hGeom**: handle to the geometry from which to get the M coordinate.
* **i**: point to get the M coordinate.

### Returns
the M coordinate of this point.
"""
function ogr_g_getm(arg1, arg2)
    aftercare(ccall((:OGR_G_GetM, libgdal), Cdouble, (OGRGeometryH, Cint), arg1, arg2))
end

"""
    OGR_G_GetPoint(OGRGeometryH hGeom,
                   int i,
                   double * pdfX,
                   double * pdfY,
                   double * pdfZ) -> void

Fetch a point in line string or a point geometry.

### Parameters
* **hGeom**: handle to the geometry from which to get the coordinates.
* **i**: the vertex to fetch, from 0 to getNumPoints()-1, zero for a point.
* **pdfX**: value of x coordinate.
* **pdfY**: value of y coordinate.
* **pdfZ**: value of z coordinate.
"""
function ogr_g_getpoint(arg1, iPoint, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_GetPoint, libgdal), Cvoid, (OGRGeometryH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, iPoint, arg3, arg4, arg5))
end

"""
    OGR_G_GetPointZM(OGRGeometryH hGeom,
                     int i,
                     double * pdfX,
                     double * pdfY,
                     double * pdfZ,
                     double * pdfM) -> void

Fetch a point in line string or a point geometry.

### Parameters
* **hGeom**: handle to the geometry from which to get the coordinates.
* **i**: the vertex to fetch, from 0 to getNumPoints()-1, zero for a point.
* **pdfX**: value of x coordinate.
* **pdfY**: value of y coordinate.
* **pdfZ**: value of z coordinate.
* **pdfM**: value of m coordinate.
"""
function ogr_g_getpointzm(arg1, iPoint, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_G_GetPointZM, libgdal), Cvoid, (OGRGeometryH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, iPoint, arg3, arg4, arg5, arg6))
end

"""
    OGR_G_SetPointCount(OGRGeometryH hGeom,
                        int nNewPointCount) -> void

Set number of points in a geometry.

### Parameters
* **hGeom**: handle to the geometry.
* **nNewPointCount**: the new number of points for geometry.
"""
function ogr_g_setpointcount(hGeom, nNewPointCount)
    aftercare(ccall((:OGR_G_SetPointCount, libgdal), Cvoid, (OGRGeometryH, Cint), hGeom, nNewPointCount))
end

"""
    OGR_G_SetPoint(OGRGeometryH hGeom,
                   int i,
                   double dfX,
                   double dfY,
                   double dfZ) -> void

Set the location of a vertex in a point or linestring geometry.

### Parameters
* **hGeom**: handle to the geometry to add a vertex to.
* **i**: the index of the vertex to assign (zero based) or zero for a point.
* **dfX**: input X coordinate to assign.
* **dfY**: input Y coordinate to assign.
* **dfZ**: input Z coordinate to assign (defaults to zero).
"""
function ogr_g_setpoint(arg1, iPoint, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_SetPoint, libgdal), Cvoid, (OGRGeometryH, Cint, Cdouble, Cdouble, Cdouble), arg1, iPoint, arg3, arg4, arg5))
end

"""
    OGR_G_SetPoint_2D(OGRGeometryH hGeom,
                      int i,
                      double dfX,
                      double dfY) -> void

Set the location of a vertex in a point or linestring geometry.

### Parameters
* **hGeom**: handle to the geometry to add a vertex to.
* **i**: the index of the vertex to assign (zero based) or zero for a point.
* **dfX**: input X coordinate to assign.
* **dfY**: input Y coordinate to assign.
"""
function ogr_g_setpoint_2d(arg1, iPoint, arg3, arg4)
    aftercare(ccall((:OGR_G_SetPoint_2D, libgdal), Cvoid, (OGRGeometryH, Cint, Cdouble, Cdouble), arg1, iPoint, arg3, arg4))
end

"""
    OGR_G_SetPointM(OGRGeometryH hGeom,
                    int i,
                    double dfX,
                    double dfY,
                    double dfM) -> void

Set the location of a vertex in a point or linestring geometry.

### Parameters
* **hGeom**: handle to the geometry to add a vertex to.
* **i**: the index of the vertex to assign (zero based) or zero for a point.
* **dfX**: input X coordinate to assign.
* **dfY**: input Y coordinate to assign.
* **dfM**: input M coordinate to assign.
"""
function ogr_g_setpointm(arg1, iPoint, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_SetPointM, libgdal), Cvoid, (OGRGeometryH, Cint, Cdouble, Cdouble, Cdouble), arg1, iPoint, arg3, arg4, arg5))
end

"""
    OGR_G_SetPointZM(OGRGeometryH hGeom,
                     int i,
                     double dfX,
                     double dfY,
                     double dfZ,
                     double dfM) -> void

Set the location of a vertex in a point or linestring geometry.

### Parameters
* **hGeom**: handle to the geometry to add a vertex to.
* **i**: the index of the vertex to assign (zero based) or zero for a point.
* **dfX**: input X coordinate to assign.
* **dfY**: input Y coordinate to assign.
* **dfZ**: input Z coordinate to assign.
* **dfM**: input M coordinate to assign.
"""
function ogr_g_setpointzm(arg1, iPoint, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_G_SetPointZM, libgdal), Cvoid, (OGRGeometryH, Cint, Cdouble, Cdouble, Cdouble, Cdouble), arg1, iPoint, arg3, arg4, arg5, arg6))
end

"""
    OGR_G_AddPoint(OGRGeometryH hGeom,
                   double dfX,
                   double dfY,
                   double dfZ) -> void

Add a point to a geometry (line string or point).

### Parameters
* **hGeom**: handle to the geometry to add a point to.
* **dfX**: x coordinate of point to add.
* **dfY**: y coordinate of point to add.
* **dfZ**: z coordinate of point to add.
"""
function ogr_g_addpoint(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_G_AddPoint, libgdal), Cvoid, (OGRGeometryH, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4))
end

"""
    OGR_G_AddPoint_2D(OGRGeometryH hGeom,
                      double dfX,
                      double dfY) -> void

Add a point to a geometry (line string or point).

### Parameters
* **hGeom**: handle to the geometry to add a point to.
* **dfX**: x coordinate of point to add.
* **dfY**: y coordinate of point to add.
"""
function ogr_g_addpoint_2d(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_AddPoint_2D, libgdal), Cvoid, (OGRGeometryH, Cdouble, Cdouble), arg1, arg2, arg3))
end

"""
    OGR_G_AddPointM(OGRGeometryH hGeom,
                    double dfX,
                    double dfY,
                    double dfM) -> void

Add a point to a geometry (line string or point).

### Parameters
* **hGeom**: handle to the geometry to add a point to.
* **dfX**: x coordinate of point to add.
* **dfY**: y coordinate of point to add.
* **dfM**: m coordinate of point to add.
"""
function ogr_g_addpointm(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_G_AddPointM, libgdal), Cvoid, (OGRGeometryH, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4))
end

"""
    OGR_G_AddPointZM(OGRGeometryH hGeom,
                     double dfX,
                     double dfY,
                     double dfZ,
                     double dfM) -> void

Add a point to a geometry (line string or point).

### Parameters
* **hGeom**: handle to the geometry to add a point to.
* **dfX**: x coordinate of point to add.
* **dfY**: y coordinate of point to add.
* **dfZ**: z coordinate of point to add.
* **dfM**: m coordinate of point to add.
"""
function ogr_g_addpointzm(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_AddPointZM, libgdal), Cvoid, (OGRGeometryH, Cdouble, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5))
end

"""
    OGR_G_SetPoints(OGRGeometryH hGeom,
                    int nPointsIn,
                    const void * pabyX,
                    int nXStride,
                    const void * pabyY,
                    int nYStride,
                    const void * pabyZ,
                    int nZStride) -> void

Assign all points in a point or a line string geometry.

### Parameters
* **hGeom**: handle to the geometry to set the coordinates.
* **nPointsIn**: number of points being passed in padfX and padfY.
* **pabyX**: list of X coordinates (double values) of points being assigned.
* **nXStride**: the number of bytes between 2 elements of pabyX.
* **pabyY**: list of Y coordinates (double values) of points being assigned.
* **nYStride**: the number of bytes between 2 elements of pabyY.
* **pabyZ**: list of Z coordinates (double values) of points being assigned (defaults to NULL for 2D objects).
* **nZStride**: the number of bytes between 2 elements of pabyZ.
"""
function ogr_g_setpoints(hGeom, nPointsIn, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride)
    aftercare(ccall((:OGR_G_SetPoints, libgdal), Cvoid, (OGRGeometryH, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint), hGeom, nPointsIn, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride))
end

"""
    OGR_G_SetPointsZM(OGRGeometryH hGeom,
                      int nPointsIn,
                      const void * pX,
                      int nXStride,
                      const void * pY,
                      int nYStride,
                      const void * pZ,
                      int nZStride,
                      const void * pM,
                      int nMStride) -> void

Assign all points in a point or a line string geometry.

### Parameters
* **hGeom**: handle to the geometry to set the coordinates.
* **nPointsIn**: number of points being passed in padfX and padfY.
* **pX**: list of X coordinates (double values) of points being assigned.
* **nXStride**: the number of bytes between 2 elements of pX.
* **pY**: list of Y coordinates (double values) of points being assigned.
* **nYStride**: the number of bytes between 2 elements of pY.
* **pZ**: list of Z coordinates (double values) of points being assigned (if not NULL, upgrades the geometry to have Z coordinate).
* **nZStride**: the number of bytes between 2 elements of pZ.
* **pM**: list of M coordinates (double values) of points being assigned (if not NULL, upgrades the geometry to have M coordinate).
* **nMStride**: the number of bytes between 2 elements of pM.
"""
function ogr_g_setpointszm(hGeom, nPointsIn, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride, pabyM, nMStride)
    aftercare(ccall((:OGR_G_SetPointsZM, libgdal), Cvoid, (OGRGeometryH, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint), hGeom, nPointsIn, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride, pabyM, nMStride))
end

"""
    OGR_G_SwapXY(OGRGeometryH hGeom) -> void

Swap x and y coordinates.

### Parameters
* **hGeom**: geometry.
"""
function ogr_g_swapxy(hGeom)
    aftercare(ccall((:OGR_G_SwapXY, libgdal), Cvoid, (OGRGeometryH,), hGeom))
end

"""
    OGR_G_GetGeometryCount(OGRGeometryH hGeom) -> int

Fetch the number of elements in a geometry or number of geometries in container.

### Parameters
* **hGeom**: single geometry or geometry container from which to get the number of elements.

### Returns
the number of elements.
"""
function ogr_g_getgeometrycount(arg1)
    aftercare(ccall((:OGR_G_GetGeometryCount, libgdal), Cint, (OGRGeometryH,), arg1))
end

"""
    OGR_G_GetGeometryRef(OGRGeometryH hGeom,
                         int iSubGeom) -> OGRGeometryH

Fetch geometry from a geometry container.

### Parameters
* **hGeom**: handle to the geometry container from which to get a geometry from.
* **iSubGeom**: the index of the geometry to fetch, between 0 and getNumGeometries() - 1.

### Returns
handle to the requested geometry.
"""
function ogr_g_getgeometryref(arg1, arg2)
    aftercare(ccall((:OGR_G_GetGeometryRef, libgdal), OGRGeometryH, (OGRGeometryH, Cint), arg1, arg2))
end

"""
    OGR_G_AddGeometry(OGRGeometryH hGeom,
                      OGRGeometryH hNewSubGeom) -> OGRErr

Add a geometry to a geometry container.

### Parameters
* **hGeom**: existing geometry container.
* **hNewSubGeom**: geometry to add to the container.

### Returns
OGRERR_NONE if successful, or OGRERR_UNSUPPORTED_GEOMETRY_TYPE if the geometry type is illegal for the type of existing geometry.
"""
function ogr_g_addgeometry(arg1, arg2)
    aftercare(ccall((:OGR_G_AddGeometry, libgdal), OGRErr, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_AddGeometryDirectly(OGRGeometryH hGeom,
                              OGRGeometryH hNewSubGeom) -> OGRErr

Add a geometry directly to an existing geometry container.

### Parameters
* **hGeom**: existing geometry.
* **hNewSubGeom**: geometry to add to the existing geometry.

### Returns
OGRERR_NONE if successful, or OGRERR_UNSUPPORTED_GEOMETRY_TYPE if the geometry type is illegal for the type of geometry container.
"""
function ogr_g_addgeometrydirectly(arg1, arg2)
    aftercare(ccall((:OGR_G_AddGeometryDirectly, libgdal), OGRErr, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_G_RemoveGeometry(OGRGeometryH hGeom,
                         int iGeom,
                         int bDelete) -> OGRErr

Remove a geometry from an exiting geometry container.

### Parameters
* **hGeom**: the existing geometry to delete from.
* **iGeom**: the index of the geometry to delete. A value of -1 is a special flag meaning that all geometries should be removed.
* **bDelete**: if TRUE the geometry will be destroyed, otherwise it will not. The default is TRUE as the existing geometry is considered to own the geometries in it.

### Returns
OGRERR_NONE if successful, or OGRERR_FAILURE if the index is out of range.
"""
function ogr_g_removegeometry(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_RemoveGeometry, libgdal), OGRErr, (OGRGeometryH, Cint, Cint), arg1, arg2, arg3))
end

"""
    OGR_G_HasCurveGeometry(OGRGeometryH hGeom,
                           int bLookForNonLinear) -> int

Returns if this geometry is or has curve geometry.

### Parameters
* **hGeom**: the geometry to operate on.
* **bLookForNonLinear**: set it to TRUE to check if the geometry is or contains a CIRCULARSTRING.

### Returns
TRUE if this geometry is or has curve geometry.
"""
function ogr_g_hascurvegeometry(arg1, bLookForNonLinear)
    aftercare(ccall((:OGR_G_HasCurveGeometry, libgdal), Cint, (OGRGeometryH, Cint), arg1, bLookForNonLinear))
end

"""
    OGR_G_GetLinearGeometry(OGRGeometryH hGeom,
                            double dfMaxAngleStepSizeDegrees,
                            char ** papszOptions) -> OGRGeometryH

Return, possibly approximate, linear version of this geometry.

### Parameters
* **hGeom**: the geometry to operate on.
* **dfMaxAngleStepSizeDegrees**: the largest step in degrees along the arc, zero to use the default setting.
* **papszOptions**: options as a null-terminated list of strings or NULL. See OGRGeometryFactory::curveToLineString() for valid options.

### Returns
a new geometry.
"""
function ogr_g_getlineargeometry(hGeom, dfMaxAngleStepSizeDegrees, papszOptions)
    aftercare(ccall((:OGR_G_GetLinearGeometry, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble, Ptr{Cstring}), hGeom, dfMaxAngleStepSizeDegrees, papszOptions))
end

"""
    OGR_G_GetCurveGeometry(OGRGeometryH hGeom,
                           char ** papszOptions) -> OGRGeometryH

Return curve version of this geometry.

### Parameters
* **hGeom**: the geometry to operate on.
* **papszOptions**: options as a null-terminated list of strings. Unused for now. Must be set to NULL.

### Returns
a new geometry.
"""
function ogr_g_getcurvegeometry(hGeom, papszOptions)
    aftercare(ccall((:OGR_G_GetCurveGeometry, libgdal), OGRGeometryH, (OGRGeometryH, Ptr{Cstring}), hGeom, papszOptions))
end

"""
    OGRBuildPolygonFromEdges(OGRGeometryH hLines,
                             int bBestEffort,
                             int bAutoClose,
                             double dfTolerance,
                             OGRErr * peErr) -> OGRGeometryH

Build a ring from a bunch of arcs.

### Parameters
* **hLines**: handle to an OGRGeometryCollection (or OGRMultiLineString) containing the line string geometries to be built into rings.
* **bBestEffort**: not yet implemented???.
* **bAutoClose**: indicates if the ring should be close when first and last points of the ring are the same.
* **dfTolerance**: tolerance into which two arcs are considered close enough to be joined.
* **peErr**: OGRERR_NONE on success, or OGRERR_FAILURE on failure.

### Returns
a handle to the new geometry, a polygon.
"""
function ogrbuildpolygonfromedges(hLinesAsCollection, bBestEffort, bAutoClose, dfTolerance, peErr)
    aftercare(ccall((:OGRBuildPolygonFromEdges, libgdal), OGRGeometryH, (OGRGeometryH, Cint, Cint, Cdouble, Ptr{OGRErr}), hLinesAsCollection, bBestEffort, bAutoClose, dfTolerance, peErr))
end

"""
    ogrsetgenerate_db2_v72_byte_order(bGenerate_DB2_V72_BYTE_ORDER)

Doxygen\\_Suppress 
"""
function ogrsetgenerate_db2_v72_byte_order(bGenerate_DB2_V72_BYTE_ORDER)
    aftercare(ccall((:OGRSetGenerate_DB2_V72_BYTE_ORDER, libgdal), OGRErr, (Cint,), bGenerate_DB2_V72_BYTE_ORDER))
end

"""
    OGRGetGenerate_DB2_V72_BYTE_ORDER() -> int
"""
function ogrgetgenerate_db2_v72_byte_order()
    aftercare(ccall((:OGRGetGenerate_DB2_V72_BYTE_ORDER, libgdal), Cint, ()))
end

"""
    OGRSetNonLinearGeometriesEnabledFlag(int bFlag) -> void

Set flag to enable/disable returning non-linear geometries in the C API.

### Parameters
* **bFlag**: TRUE if non-linear geometries might be returned (default value). FALSE to ask for non-linear geometries to be approximated as linear geometries.
"""
function ogrsetnonlineargeometriesenabledflag(bFlag)
    aftercare(ccall((:OGRSetNonLinearGeometriesEnabledFlag, libgdal), Cvoid, (Cint,), bFlag))
end

"""
    OGRGetNonLinearGeometriesEnabledFlag(void) -> int

Get flag to enable/disable returning non-linear geometries in the C API.
"""
function ogrgetnonlineargeometriesenabledflag()
    aftercare(ccall((:OGRGetNonLinearGeometriesEnabledFlag, libgdal), Cint, ()))
end

"Opaque type for a field definition (OGRFieldDefn) "
const OGRFieldDefnH = Ptr{Cvoid}

"Opaque type for a feature definition (OGRFeatureDefn) "
const OGRFeatureDefnH = Ptr{Cvoid}

mutable struct OGRGeomFieldDefnHS
end

"Opaque type for a geometry field definition (OGRGeomFieldDefn) "
const OGRGeomFieldDefnH = Ptr{OGRGeomFieldDefnHS}

"""
    OGRFieldType

List of feature field types. This list is likely to be extended in the future ... avoid coding applications based on the assumption that all field types can be known.

| Enumerator        | Note                              |
| :---------------- | :-------------------------------- |
| OFTInteger        | Simple 32bit integer              |
| OFTIntegerList    | List of 32bit integers            |
| OFTReal           | Double Precision floating point   |
| OFTRealList       | List of doubles                   |
| OFTString         | String of ASCII chars             |
| OFTStringList     | Array of strings                  |
| OFTWideString     | deprecated                        |
| OFTWideStringList |                                   |
| OFTBinary         | Raw Binary data                   |
| OFTDate           | Date                              |
| OFTTime           | Time                              |
| OFTDateTime       | Date and Time                     |
| OFTInteger64      | Single 64bit integer              |
| OFTInteger64List  | List of 64bit integers            |
| OFTMaxType        |                                   |
"""
@cenum OGRFieldType::UInt32 begin
        OFTInteger = 0
        OFTIntegerList = 1
        OFTReal = 2
        OFTRealList = 3
        OFTString = 4
        OFTStringList = 5
        OFTWideString = 6
        OFTWideStringList = 7
        OFTBinary = 8
        OFTDate = 9
        OFTTime = 10
        OFTDateTime = 11
        OFTInteger64 = 12
        OFTInteger64List = 13
        OFTMaxType = 13
    end

"""
    OGR_Fld_Create(const char * pszName,
                   OGRFieldType eType) -> OGRFieldDefnH

Create a new field definition.

### Parameters
* **pszName**: the name of the new field definition.
* **eType**: the type of the new field definition.

### Returns
handle to the new field definition.
"""
function ogr_fld_create(arg1, arg2)
    aftercare(ccall((:OGR_Fld_Create, libgdal), OGRFieldDefnH, (Cstring, OGRFieldType), arg1, arg2))
end

"""
    OGR_Fld_Destroy(OGRFieldDefnH hDefn) -> void

Destroy a field definition.

### Parameters
* **hDefn**: handle to the field definition to destroy.
"""
function ogr_fld_destroy(arg1)
    aftercare(ccall((:OGR_Fld_Destroy, libgdal), Cvoid, (OGRFieldDefnH,), arg1))
end

"""
    OGR_Fld_SetName(OGRFieldDefnH hDefn,
                    const char * pszName) -> void

Reset the name of this field.

### Parameters
* **hDefn**: handle to the field definition to apply the new name to.
* **pszName**: the new name to apply.
"""
function ogr_fld_setname(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetName, libgdal), Cvoid, (OGRFieldDefnH, Cstring), arg1, arg2))
end

"""
    OGR_Fld_GetNameRef(OGRFieldDefnH hDefn) -> const char *

Fetch name of this field.

### Parameters
* **hDefn**: handle to the field definition.

### Returns
the name of the field definition.
"""
function ogr_fld_getnameref(arg1)
    aftercare(ccall((:OGR_Fld_GetNameRef, libgdal), Cstring, (OGRFieldDefnH,), arg1), false)
end

"""
    OGR_Fld_SetAlternativeName(OGRFieldDefnH hDefn,
                               const char * pszAlternativeName) -> void

Reset the alternative name (or "alias") for this field.

### Parameters
* **hDefn**: handle to the field definition to apply the new alternative name to.
* **pszAlternativeName**: the new alternative name to apply.
"""
function ogr_fld_setalternativename(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetAlternativeName, libgdal), Cvoid, (OGRFieldDefnH, Cstring), arg1, arg2))
end

"""
    OGR_Fld_GetAlternativeNameRef(OGRFieldDefnH hDefn) -> const char *

Fetch the alternative name (or "alias") for this field.

### Parameters
* **hDefn**: handle to the field definition.

### Returns
the alternative name of the field definition.
"""
function ogr_fld_getalternativenameref(arg1)
    aftercare(ccall((:OGR_Fld_GetAlternativeNameRef, libgdal), Cstring, (OGRFieldDefnH,), arg1), false)
end

"""
    OGR_Fld_GetType(OGRFieldDefnH hDefn) -> OGRFieldType

Fetch type of this field.

### Parameters
* **hDefn**: handle to the field definition to get type from.

### Returns
field type.
"""
function ogr_fld_gettype(arg1)
    aftercare(ccall((:OGR_Fld_GetType, libgdal), OGRFieldType, (OGRFieldDefnH,), arg1))
end

"""
    OGR_Fld_SetType(OGRFieldDefnH hDefn,
                    OGRFieldType eType) -> void

Set the type of this field.

### Parameters
* **hDefn**: handle to the field definition to set type to.
* **eType**: the new field type.
"""
function ogr_fld_settype(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetType, libgdal), Cvoid, (OGRFieldDefnH, OGRFieldType), arg1, arg2))
end

"""
    OGRFieldSubType

List of field subtypes. A subtype represents a hint, a restriction of the main type, that is not strictly necessary to consult. This list is likely to be extended in the future ... avoid coding applications based on the assumption that all field types can be known. Most subtypes only make sense for a restricted set of main types. 

\\since GDAL 2.0

| Enumerator     | Note                                                                                |
| :------------- | :---------------------------------------------------------------------------------- |
| OFSTNone       | No subtype. This is the default value                                               |
| OFSTBoolean    | Boolean integer. Only valid for OFTInteger and OFTIntegerList.                      |
| OFSTInt16      | Signed 16-bit integer. Only valid for OFTInteger and OFTIntegerList.                |
| OFSTFloat32    | Single precision (32 bit) floating point. Only valid for OFTReal and OFTRealList.   |
| OFSTJSON       | JSON content. Only valid for OFTString.   \\since GDAL 2.4                          |
| OFSTMaxSubType |                                                                                     |
"""
@cenum OGRFieldSubType::UInt32 begin
        OFSTNone = 0
        OFSTBoolean = 1
        OFSTInt16 = 2
        OFSTFloat32 = 3
        OFSTJSON = 4
        OFSTMaxSubType = 4
    end

"""
    OGR_Fld_GetSubType(OGRFieldDefnH hDefn) -> OGRFieldSubType

Fetch subtype of this field.

### Parameters
* **hDefn**: handle to the field definition to get subtype from.

### Returns
field subtype.
"""
function ogr_fld_getsubtype(arg1)
    aftercare(ccall((:OGR_Fld_GetSubType, libgdal), OGRFieldSubType, (OGRFieldDefnH,), arg1))
end

"""
    OGR_Fld_SetSubType(OGRFieldDefnH hDefn,
                       OGRFieldSubType eSubType) -> void

Set the subtype of this field.

### Parameters
* **hDefn**: handle to the field definition to set type to.
* **eSubType**: the new field subtype.
"""
function ogr_fld_setsubtype(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetSubType, libgdal), Cvoid, (OGRFieldDefnH, OGRFieldSubType), arg1, arg2))
end

"""
    OGRJustification

Display justification for field values.
"""
@cenum OGRJustification::UInt32 begin
        OJUndefined = 0
        OJLeft = 1
        OJRight = 2
    end

"""
    OGR_Fld_GetJustify(OGRFieldDefnH hDefn) -> OGRJustification

Get the justification for this field.

### Parameters
* **hDefn**: handle to the field definition to get justification from.

### Returns
the justification.
"""
function ogr_fld_getjustify(arg1)
    aftercare(ccall((:OGR_Fld_GetJustify, libgdal), OGRJustification, (OGRFieldDefnH,), arg1))
end

"""
    OGR_Fld_SetJustify(OGRFieldDefnH hDefn,
                       OGRJustification eJustify) -> void

Set the justification for this field.

### Parameters
* **hDefn**: handle to the field definition to set justification to.
* **eJustify**: the new justification.
"""
function ogr_fld_setjustify(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetJustify, libgdal), Cvoid, (OGRFieldDefnH, OGRJustification), arg1, arg2))
end

"""
    OGR_Fld_GetWidth(OGRFieldDefnH hDefn) -> int

Get the formatting width for this field.

### Parameters
* **hDefn**: handle to the field definition to get width from.

### Returns
the width, zero means no specified width.
"""
function ogr_fld_getwidth(arg1)
    aftercare(ccall((:OGR_Fld_GetWidth, libgdal), Cint, (OGRFieldDefnH,), arg1))
end

"""
    OGR_Fld_SetWidth(OGRFieldDefnH hDefn,
                     int nNewWidth) -> void

Set the formatting width for this field in characters.

### Parameters
* **hDefn**: handle to the field definition to set width to.
* **nNewWidth**: the new width.
"""
function ogr_fld_setwidth(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetWidth, libgdal), Cvoid, (OGRFieldDefnH, Cint), arg1, arg2))
end

"""
    OGR_Fld_GetPrecision(OGRFieldDefnH hDefn) -> int

Get the formatting precision for this field.

### Parameters
* **hDefn**: handle to the field definition to get precision from.

### Returns
the precision.
"""
function ogr_fld_getprecision(arg1)
    aftercare(ccall((:OGR_Fld_GetPrecision, libgdal), Cint, (OGRFieldDefnH,), arg1))
end

"""
    OGR_Fld_SetPrecision(OGRFieldDefnH hDefn,
                         int nPrecision) -> void

Set the formatting precision for this field in characters.

### Parameters
* **hDefn**: handle to the field definition to set precision to.
* **nPrecision**: the new precision.
"""
function ogr_fld_setprecision(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetPrecision, libgdal), Cvoid, (OGRFieldDefnH, Cint), arg1, arg2))
end

"""
    OGR_Fld_Set(OGRFieldDefnH hDefn,
                const char * pszNameIn,
                OGRFieldType eTypeIn,
                int nWidthIn,
                int nPrecisionIn,
                OGRJustification eJustifyIn) -> void

Set defining parameters for a field in one call.

### Parameters
* **hDefn**: handle to the field definition to set to.
* **pszNameIn**: the new name to assign.
* **eTypeIn**: the new type (one of the OFT values like OFTInteger).
* **nWidthIn**: the preferred formatting width. Defaults to zero indicating undefined.
* **nPrecisionIn**: number of decimals places for formatting, defaults to zero indicating undefined.
* **eJustifyIn**: the formatting justification (OJLeft or OJRight), defaults to OJUndefined.
"""
function ogr_fld_set(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_Fld_Set, libgdal), Cvoid, (OGRFieldDefnH, Cstring, OGRFieldType, Cint, Cint, OGRJustification), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OGR_Fld_IsIgnored(OGRFieldDefnH hDefn) -> int

Return whether this field should be omitted when fetching features.

### Parameters
* **hDefn**: handle to the field definition

### Returns
ignore state
"""
function ogr_fld_isignored(hDefn)
    aftercare(ccall((:OGR_Fld_IsIgnored, libgdal), Cint, (OGRFieldDefnH,), hDefn))
end

"""
    OGR_Fld_SetIgnored(OGRFieldDefnH hDefn,
                       int ignore) -> void

Set whether this field should be omitted when fetching features.

### Parameters
* **hDefn**: handle to the field definition
* **ignore**: ignore state
"""
function ogr_fld_setignored(hDefn, arg2)
    aftercare(ccall((:OGR_Fld_SetIgnored, libgdal), Cvoid, (OGRFieldDefnH, Cint), hDefn, arg2))
end

"""
    OGR_Fld_IsNullable(OGRFieldDefnH hDefn) -> int

Return whether this field can receive null values.

### Parameters
* **hDefn**: handle to the field definition

### Returns
TRUE if the field is authorized to be null.
"""
function ogr_fld_isnullable(hDefn)
    aftercare(ccall((:OGR_Fld_IsNullable, libgdal), Cint, (OGRFieldDefnH,), hDefn))
end

"""
    OGR_Fld_SetNullable(OGRFieldDefnH hDefn,
                        int bNullableIn) -> void

Set whether this field can receive null values.

### Parameters
* **hDefn**: handle to the field definition
* **bNullableIn**: FALSE if the field must have a not-null constraint.
"""
function ogr_fld_setnullable(hDefn, arg2)
    aftercare(ccall((:OGR_Fld_SetNullable, libgdal), Cvoid, (OGRFieldDefnH, Cint), hDefn, arg2))
end

"""
    OGR_Fld_IsUnique(OGRFieldDefnH hDefn) -> int

Return whether this field has a unique constraint.

### Parameters
* **hDefn**: handle to the field definition

### Returns
TRUE if the field has a unique constraint.
"""
function ogr_fld_isunique(hDefn)
    aftercare(ccall((:OGR_Fld_IsUnique, libgdal), Cint, (OGRFieldDefnH,), hDefn))
end

"""
    OGR_Fld_SetUnique(OGRFieldDefnH hDefn,
                      int bUniqueIn) -> void

Set whether this field has a unique constraint.

### Parameters
* **hDefn**: handle to the field definition
* **bUniqueIn**: TRUE if the field must have a unique constraint.
"""
function ogr_fld_setunique(hDefn, arg2)
    aftercare(ccall((:OGR_Fld_SetUnique, libgdal), Cvoid, (OGRFieldDefnH, Cint), hDefn, arg2))
end

"""
    OGR_Fld_GetDefault(OGRFieldDefnH hDefn) -> const char *

Get default field value.

### Parameters
* **hDefn**: handle to the field definition.

### Returns
default field value or NULL.
"""
function ogr_fld_getdefault(hDefn)
    aftercare(ccall((:OGR_Fld_GetDefault, libgdal), Cstring, (OGRFieldDefnH,), hDefn), false)
end

"""
    OGR_Fld_SetDefault(OGRFieldDefnH hDefn,
                       const char * pszDefault) -> void

Set default field value.

### Parameters
* **hDefn**: handle to the field definition.
* **pszDefault**: new default field value or NULL pointer.
"""
function ogr_fld_setdefault(hDefn, arg2)
    aftercare(ccall((:OGR_Fld_SetDefault, libgdal), Cvoid, (OGRFieldDefnH, Cstring), hDefn, arg2))
end

"""
    OGR_Fld_IsDefaultDriverSpecific(OGRFieldDefnH hDefn) -> int

Returns whether the default value is driver specific.

### Parameters
* **hDefn**: handle to the field definition

### Returns
TRUE if the default value is driver specific.
"""
function ogr_fld_isdefaultdriverspecific(hDefn)
    aftercare(ccall((:OGR_Fld_IsDefaultDriverSpecific, libgdal), Cint, (OGRFieldDefnH,), hDefn))
end

"""
    OGR_GetFieldTypeName(OGRFieldType eType) -> const char *

Fetch human readable name for a field type.

### Parameters
* **eType**: the field type to get name for.

### Returns
the name.
"""
function ogr_getfieldtypename(arg1)
    aftercare(ccall((:OGR_GetFieldTypeName, libgdal), Cstring, (OGRFieldType,), arg1), false)
end

"""
    OGR_GetFieldSubTypeName(OGRFieldSubType eSubType) -> const char *

Fetch human readable name for a field subtype.

### Parameters
* **eSubType**: the field subtype to get name for.

### Returns
the name.
"""
function ogr_getfieldsubtypename(arg1)
    aftercare(ccall((:OGR_GetFieldSubTypeName, libgdal), Cstring, (OGRFieldSubType,), arg1), false)
end

"""
    OGR_AreTypeSubTypeCompatible(OGRFieldType eType,
                                 OGRFieldSubType eSubType) -> int

Return if type and subtype are compatible.

### Parameters
* **eType**: the field type.
* **eSubType**: the field subtype.

### Returns
TRUE if type and subtype are compatible
"""
function ogr_aretypesubtypecompatible(eType, eSubType)
    aftercare(ccall((:OGR_AreTypeSubTypeCompatible, libgdal), Cint, (OGRFieldType, OGRFieldSubType), eType, eSubType))
end

"""
    OGR_GFld_Create(const char * pszName,
                    OGRwkbGeometryType eType) -> OGRGeomFieldDefnH

Create a new field geometry definition.

### Parameters
* **pszName**: the name of the new field definition.
* **eType**: the type of the new field definition.

### Returns
handle to the new field definition.
"""
function ogr_gfld_create(arg1, arg2)
    aftercare(ccall((:OGR_GFld_Create, libgdal), OGRGeomFieldDefnH, (Cstring, OGRwkbGeometryType), arg1, arg2))
end

"""
    OGR_GFld_Destroy(OGRGeomFieldDefnH hDefn) -> void

Destroy a geometry field definition.

### Parameters
* **hDefn**: handle to the geometry field definition to destroy.
"""
function ogr_gfld_destroy(arg1)
    aftercare(ccall((:OGR_GFld_Destroy, libgdal), Cvoid, (OGRGeomFieldDefnH,), arg1))
end

"""
    OGR_GFld_SetName(OGRGeomFieldDefnH hDefn,
                     const char * pszName) -> void

Reset the name of this field.

### Parameters
* **hDefn**: handle to the geometry field definition to apply the new name to.
* **pszName**: the new name to apply.
"""
function ogr_gfld_setname(arg1, arg2)
    aftercare(ccall((:OGR_GFld_SetName, libgdal), Cvoid, (OGRGeomFieldDefnH, Cstring), arg1, arg2))
end

"""
    OGR_GFld_GetNameRef(OGRGeomFieldDefnH hDefn) -> const char *

Fetch name of this field.

### Parameters
* **hDefn**: handle to the geometry field definition.

### Returns
the name of the geometry field definition.
"""
function ogr_gfld_getnameref(arg1)
    aftercare(ccall((:OGR_GFld_GetNameRef, libgdal), Cstring, (OGRGeomFieldDefnH,), arg1), false)
end

"""
    OGR_GFld_GetType(OGRGeomFieldDefnH hDefn) -> OGRwkbGeometryType

Fetch geometry type of this field.

### Parameters
* **hDefn**: handle to the geometry field definition to get type from.

### Returns
field geometry type.
"""
function ogr_gfld_gettype(arg1)
    aftercare(ccall((:OGR_GFld_GetType, libgdal), OGRwkbGeometryType, (OGRGeomFieldDefnH,), arg1))
end

"""
    OGR_GFld_SetType(OGRGeomFieldDefnH hDefn,
                     OGRwkbGeometryType eType) -> void

Set the geometry type of this field.

### Parameters
* **hDefn**: handle to the geometry field definition to set type to.
* **eType**: the new field geometry type.
"""
function ogr_gfld_settype(arg1, arg2)
    aftercare(ccall((:OGR_GFld_SetType, libgdal), Cvoid, (OGRGeomFieldDefnH, OGRwkbGeometryType), arg1, arg2))
end

"""
    OGR_GFld_GetSpatialRef(OGRGeomFieldDefnH hDefn) -> OGRSpatialReferenceH

Fetch spatial reference system of this field.

### Parameters
* **hDefn**: handle to the geometry field definition

### Returns
field spatial reference system.
"""
function ogr_gfld_getspatialref(arg1)
    aftercare(ccall((:OGR_GFld_GetSpatialRef, libgdal), OGRSpatialReferenceH, (OGRGeomFieldDefnH,), arg1))
end

"""
    OGR_GFld_SetSpatialRef(OGRGeomFieldDefnH hDefn,
                           OGRSpatialReferenceH hSRS) -> void

Set the spatial reference of this field.

### Parameters
* **hDefn**: handle to the geometry field definition
* **hSRS**: the new SRS to apply.
"""
function ogr_gfld_setspatialref(arg1, hSRS)
    aftercare(ccall((:OGR_GFld_SetSpatialRef, libgdal), Cvoid, (OGRGeomFieldDefnH, OGRSpatialReferenceH), arg1, hSRS))
end

"""
    OGR_GFld_IsNullable(OGRGeomFieldDefnH hDefn) -> int

Return whether this geometry field can receive null values.

### Parameters
* **hDefn**: handle to the field definition

### Returns
TRUE if the field is authorized to be null.
"""
function ogr_gfld_isnullable(hDefn)
    aftercare(ccall((:OGR_GFld_IsNullable, libgdal), Cint, (OGRGeomFieldDefnH,), hDefn))
end

"""
    OGR_GFld_SetNullable(OGRGeomFieldDefnH hDefn,
                         int bNullableIn) -> void

Set whether this geometry field can receive null values.

### Parameters
* **hDefn**: handle to the field definition
* **bNullableIn**: FALSE if the field must have a not-null constraint.
"""
function ogr_gfld_setnullable(hDefn, arg2)
    aftercare(ccall((:OGR_GFld_SetNullable, libgdal), Cvoid, (OGRGeomFieldDefnH, Cint), hDefn, arg2))
end

"""
    OGR_GFld_IsIgnored(OGRGeomFieldDefnH hDefn) -> int

Return whether this field should be omitted when fetching features.

### Parameters
* **hDefn**: handle to the geometry field definition

### Returns
ignore state
"""
function ogr_gfld_isignored(hDefn)
    aftercare(ccall((:OGR_GFld_IsIgnored, libgdal), Cint, (OGRGeomFieldDefnH,), hDefn))
end

"""
    OGR_GFld_SetIgnored(OGRGeomFieldDefnH hDefn,
                        int ignore) -> void

Set whether this field should be omitted when fetching features.

### Parameters
* **hDefn**: handle to the geometry field definition
* **ignore**: ignore state
"""
function ogr_gfld_setignored(hDefn, arg2)
    aftercare(ccall((:OGR_GFld_SetIgnored, libgdal), Cvoid, (OGRGeomFieldDefnH, Cint), hDefn, arg2))
end

"""
    OGR_FD_Create(const char * pszName) -> OGRFeatureDefnH

Create a new feature definition object to hold the field definitions.

### Parameters
* **pszName**: the name to be assigned to this layer/class. It does not need to be unique.

### Returns
handle to the newly created feature definition.
"""
function ogr_fd_create(arg1)
    aftercare(ccall((:OGR_FD_Create, libgdal), OGRFeatureDefnH, (Cstring,), arg1))
end

"""
    OGR_FD_Destroy(OGRFeatureDefnH hDefn) -> void

Destroy a feature definition object and release all memory associated with it.

### Parameters
* **hDefn**: handle to the feature definition to be destroyed.
"""
function ogr_fd_destroy(arg1)
    aftercare(ccall((:OGR_FD_Destroy, libgdal), Cvoid, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_Release(OGRFeatureDefnH hDefn) -> void

Drop a reference, and destroy if unreferenced.

### Parameters
* **hDefn**: handle to the feature definition to be released.
"""
function ogr_fd_release(arg1)
    aftercare(ccall((:OGR_FD_Release, libgdal), Cvoid, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_GetName(OGRFeatureDefnH hDefn) -> const char *

Get name of the OGRFeatureDefn passed as an argument.

### Parameters
* **hDefn**: handle to the feature definition to get the name from.

### Returns
the name. This name is internal and should not be modified, or freed.
"""
function ogr_fd_getname(arg1)
    aftercare(ccall((:OGR_FD_GetName, libgdal), Cstring, (OGRFeatureDefnH,), arg1), false)
end

"""
    OGR_FD_GetFieldCount(OGRFeatureDefnH hDefn) -> int

Fetch number of fields on the passed feature definition.

### Parameters
* **hDefn**: handle to the feature definition to get the fields count from.

### Returns
count of fields.
"""
function ogr_fd_getfieldcount(arg1)
    aftercare(ccall((:OGR_FD_GetFieldCount, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_GetFieldDefn(OGRFeatureDefnH hDefn,
                        int iField) -> OGRFieldDefnH

Fetch field definition of the passed feature definition.

### Parameters
* **hDefn**: handle to the feature definition to get the field definition from.
* **iField**: the field to fetch, between 0 and GetFieldCount()-1.

### Returns
a handle to an internal field definition object or NULL if invalid index. This object should not be modified or freed by the application.
"""
function ogr_fd_getfielddefn(arg1, arg2)
    aftercare(ccall((:OGR_FD_GetFieldDefn, libgdal), OGRFieldDefnH, (OGRFeatureDefnH, Cint), arg1, arg2))
end

"""
    OGR_FD_GetFieldIndex(OGRFeatureDefnH hDefn,
                         const char * pszFieldName) -> int

Find field by name.

### Parameters
* **hDefn**: handle to the feature definition to get field index from.
* **pszFieldName**: the field name to search for.

### Returns
the field index, or -1 if no match found.
"""
function ogr_fd_getfieldindex(arg1, arg2)
    aftercare(ccall((:OGR_FD_GetFieldIndex, libgdal), Cint, (OGRFeatureDefnH, Cstring), arg1, arg2))
end

"""
    OGR_FD_AddFieldDefn(OGRFeatureDefnH hDefn,
                        OGRFieldDefnH hNewField) -> void

Add a new field definition to the passed feature definition.

### Parameters
* **hDefn**: handle to the feature definition to add the field definition to.
* **hNewField**: handle to the new field definition.
"""
function ogr_fd_addfielddefn(arg1, arg2)
    aftercare(ccall((:OGR_FD_AddFieldDefn, libgdal), Cvoid, (OGRFeatureDefnH, OGRFieldDefnH), arg1, arg2))
end

"""
    OGR_FD_DeleteFieldDefn(OGRFeatureDefnH hDefn,
                           int iField) -> OGRErr

Delete an existing field definition.

### Parameters
* **hDefn**: handle to the feature definition.
* **iField**: the index of the field definition.

### Returns
OGRERR_NONE in case of success.
"""
function ogr_fd_deletefielddefn(hDefn, iField)
    aftercare(ccall((:OGR_FD_DeleteFieldDefn, libgdal), OGRErr, (OGRFeatureDefnH, Cint), hDefn, iField))
end

"""
    OGR_FD_ReorderFieldDefns(OGRFeatureDefnH hDefn,
                             int * panMap) -> OGRErr

Reorder the field definitions in the array of the feature definition.

### Parameters
* **hDefn**: handle to the feature definition.
* **panMap**: an array of GetFieldCount() elements which is a permutation of [0, GetFieldCount()-1]. panMap is such that, for each field definition at position i after reordering, its position before reordering was panMap[i].

### Returns
OGRERR_NONE in case of success.
"""
function ogr_fd_reorderfielddefns(hDefn, panMap)
    aftercare(ccall((:OGR_FD_ReorderFieldDefns, libgdal), OGRErr, (OGRFeatureDefnH, Ptr{Cint}), hDefn, panMap))
end

"""
    OGR_FD_GetGeomType(OGRFeatureDefnH hDefn) -> OGRwkbGeometryType

Fetch the geometry base type of the passed feature definition.

### Parameters
* **hDefn**: handle to the feature definition to get the geometry type from.

### Returns
the base type for all geometry related to this definition.
"""
function ogr_fd_getgeomtype(arg1)
    aftercare(ccall((:OGR_FD_GetGeomType, libgdal), OGRwkbGeometryType, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_SetGeomType(OGRFeatureDefnH hDefn,
                       OGRwkbGeometryType eType) -> void

Assign the base geometry type for the passed layer (the same as the feature definition).

### Parameters
* **hDefn**: handle to the layer or feature definition to set the geometry type to.
* **eType**: the new type to assign.
"""
function ogr_fd_setgeomtype(arg1, arg2)
    aftercare(ccall((:OGR_FD_SetGeomType, libgdal), Cvoid, (OGRFeatureDefnH, OGRwkbGeometryType), arg1, arg2))
end

"""
    OGR_FD_IsGeometryIgnored(OGRFeatureDefnH hDefn) -> int

Determine whether the geometry can be omitted when fetching features.

### Parameters
* **hDefn**: handle to the feature definition on witch OGRFeature are based on.

### Returns
ignore state
"""
function ogr_fd_isgeometryignored(arg1)
    aftercare(ccall((:OGR_FD_IsGeometryIgnored, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_SetGeometryIgnored(OGRFeatureDefnH hDefn,
                              int bIgnore) -> void

Set whether the geometry can be omitted when fetching features.

### Parameters
* **hDefn**: handle to the feature definition on witch OGRFeature are based on.
* **bIgnore**: ignore state
"""
function ogr_fd_setgeometryignored(arg1, arg2)
    aftercare(ccall((:OGR_FD_SetGeometryIgnored, libgdal), Cvoid, (OGRFeatureDefnH, Cint), arg1, arg2))
end

"""
    OGR_FD_IsStyleIgnored(OGRFeatureDefnH hDefn) -> int

Determine whether the style can be omitted when fetching features.

### Parameters
* **hDefn**: handle to the feature definition on which OGRFeature are based on.

### Returns
ignore state
"""
function ogr_fd_isstyleignored(arg1)
    aftercare(ccall((:OGR_FD_IsStyleIgnored, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_SetStyleIgnored(OGRFeatureDefnH hDefn,
                           int bIgnore) -> void

Set whether the style can be omitted when fetching features.

### Parameters
* **hDefn**: handle to the feature definition on witch OGRFeature are based on.
* **bIgnore**: ignore state
"""
function ogr_fd_setstyleignored(arg1, arg2)
    aftercare(ccall((:OGR_FD_SetStyleIgnored, libgdal), Cvoid, (OGRFeatureDefnH, Cint), arg1, arg2))
end

"""
    OGR_FD_Reference(OGRFeatureDefnH hDefn) -> int

Increments the reference count by one.

### Parameters
* **hDefn**: handle to the feature definition on witch OGRFeature are based on.

### Returns
the updated reference count.
"""
function ogr_fd_reference(arg1)
    aftercare(ccall((:OGR_FD_Reference, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_Dereference(OGRFeatureDefnH hDefn) -> int

Decrements the reference count by one.

### Parameters
* **hDefn**: handle to the feature definition on witch OGRFeature are based on.

### Returns
the updated reference count.
"""
function ogr_fd_dereference(arg1)
    aftercare(ccall((:OGR_FD_Dereference, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_GetReferenceCount(OGRFeatureDefnH hDefn) -> int

Fetch current reference count.

### Parameters
* **hDefn**: handle to the feature definition on witch OGRFeature are based on.

### Returns
the current reference count.
"""
function ogr_fd_getreferencecount(arg1)
    aftercare(ccall((:OGR_FD_GetReferenceCount, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_FD_GetGeomFieldCount(OGRFeatureDefnH hDefn) -> int

Fetch number of geometry fields on the passed feature definition.

### Parameters
* **hDefn**: handle to the feature definition to get the fields count from.

### Returns
count of geometry fields.
"""
function ogr_fd_getgeomfieldcount(hFDefn)
    aftercare(ccall((:OGR_FD_GetGeomFieldCount, libgdal), Cint, (OGRFeatureDefnH,), hFDefn))
end

"""
    OGR_FD_GetGeomFieldDefn(OGRFeatureDefnH hDefn,
                            int iGeomField) -> OGRGeomFieldDefnH

Fetch geometry field definition of the passed feature definition.

### Parameters
* **hDefn**: handle to the feature definition to get the field definition from.
* **iGeomField**: the geometry field to fetch, between 0 and GetGeomFieldCount() - 1.

### Returns
a handle to an internal field definition object or NULL if invalid index. This object should not be modified or freed by the application.
"""
function ogr_fd_getgeomfielddefn(hFDefn, i)
    aftercare(ccall((:OGR_FD_GetGeomFieldDefn, libgdal), OGRGeomFieldDefnH, (OGRFeatureDefnH, Cint), hFDefn, i))
end

"""
    OGR_FD_GetGeomFieldIndex(OGRFeatureDefnH hDefn,
                             const char * pszGeomFieldName) -> int

Find geometry field by name.

### Parameters
* **hDefn**: handle to the feature definition to get field index from.
* **pszGeomFieldName**: the geometry field name to search for.

### Returns
the geometry field index, or -1 if no match found.
"""
function ogr_fd_getgeomfieldindex(hFDefn, pszName)
    aftercare(ccall((:OGR_FD_GetGeomFieldIndex, libgdal), Cint, (OGRFeatureDefnH, Cstring), hFDefn, pszName))
end

"""
    OGR_FD_AddGeomFieldDefn(OGRFeatureDefnH hDefn,
                            OGRGeomFieldDefnH hNewGeomField) -> void

Add a new field definition to the passed feature definition.

### Parameters
* **hDefn**: handle to the feature definition to add the geometry field definition to.
* **hNewGeomField**: handle to the new field definition.
"""
function ogr_fd_addgeomfielddefn(hFDefn, hGFldDefn)
    aftercare(ccall((:OGR_FD_AddGeomFieldDefn, libgdal), Cvoid, (OGRFeatureDefnH, OGRGeomFieldDefnH), hFDefn, hGFldDefn))
end

"""
    OGR_FD_DeleteGeomFieldDefn(OGRFeatureDefnH hDefn,
                               int iGeomField) -> OGRErr

Delete an existing geometry field definition.

### Parameters
* **hDefn**: handle to the feature definition.
* **iGeomField**: the index of the geometry field definition.

### Returns
OGRERR_NONE in case of success.
"""
function ogr_fd_deletegeomfielddefn(hFDefn, iGeomField)
    aftercare(ccall((:OGR_FD_DeleteGeomFieldDefn, libgdal), OGRErr, (OGRFeatureDefnH, Cint), hFDefn, iGeomField))
end

"""
    OGR_FD_IsSame(OGRFeatureDefnH hFDefn,
                  OGRFeatureDefnH hOtherFDefn) -> int

Test if the feature definition is identical to the other one.

### Parameters
* **hFDefn**: handle to the feature definition on witch OGRFeature are based on.
* **hOtherFDefn**: handle to the other feature definition to compare to.

### Returns
TRUE if the feature definition is identical to the other one.
"""
function ogr_fd_issame(hFDefn, hOtherFDefn)
    aftercare(ccall((:OGR_FD_IsSame, libgdal), Cint, (OGRFeatureDefnH, OGRFeatureDefnH), hFDefn, hOtherFDefn))
end

"""
    OGR_F_Create(OGRFeatureDefnH hDefn) -> OGRFeatureH

Feature factory.

### Parameters
* **hDefn**: handle to the feature class (layer) definition to which the feature will adhere.

### Returns
a handle to the new feature object with null fields and no geometry, or, starting with GDAL 2.1, NULL in case out of memory situation.
"""
function ogr_f_create(arg1)
    aftercare(ccall((:OGR_F_Create, libgdal), OGRFeatureH, (OGRFeatureDefnH,), arg1))
end

"""
    OGR_F_Destroy(OGRFeatureH hFeat) -> void

Destroy feature.

### Parameters
* **hFeat**: handle to the feature to destroy.
"""
function ogr_f_destroy(arg1)
    aftercare(ccall((:OGR_F_Destroy, libgdal), Cvoid, (OGRFeatureH,), arg1))
end

"""
    OGR_F_GetDefnRef(OGRFeatureH hFeat) -> OGRFeatureDefnH

Fetch feature definition.

### Parameters
* **hFeat**: handle to the feature to get the feature definition from.

### Returns
a handle to the feature definition object on which feature depends.
"""
function ogr_f_getdefnref(arg1)
    aftercare(ccall((:OGR_F_GetDefnRef, libgdal), OGRFeatureDefnH, (OGRFeatureH,), arg1))
end

"""
    OGR_F_SetGeometryDirectly(OGRFeatureH hFeat,
                              OGRGeometryH hGeom) -> OGRErr

Set feature geometry.

### Parameters
* **hFeat**: handle to the feature on which to apply the geometry.
* **hGeom**: handle to the new geometry to apply to feature.

### Returns
OGRERR_NONE if successful, or OGR_UNSUPPORTED_GEOMETRY_TYPE if the geometry type is illegal for the OGRFeatureDefn (checking not yet implemented).
"""
function ogr_f_setgeometrydirectly(arg1, arg2)
    aftercare(ccall((:OGR_F_SetGeometryDirectly, libgdal), OGRErr, (OGRFeatureH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_F_SetGeometry(OGRFeatureH hFeat,
                      OGRGeometryH hGeom) -> OGRErr

Set feature geometry.

### Parameters
* **hFeat**: handle to the feature on which new geometry is applied to.
* **hGeom**: handle to the new geometry to apply to feature.

### Returns
OGRERR_NONE if successful, or OGR_UNSUPPORTED_GEOMETRY_TYPE if the geometry type is illegal for the OGRFeatureDefn (checking not yet implemented).
"""
function ogr_f_setgeometry(arg1, arg2)
    aftercare(ccall((:OGR_F_SetGeometry, libgdal), OGRErr, (OGRFeatureH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_F_GetGeometryRef(OGRFeatureH hFeat) -> OGRGeometryH

Fetch a handle to feature geometry.

### Parameters
* **hFeat**: handle to the feature to get geometry from.

### Returns
a handle to internal feature geometry. This object should not be modified.
"""
function ogr_f_getgeometryref(arg1)
    aftercare(ccall((:OGR_F_GetGeometryRef, libgdal), OGRGeometryH, (OGRFeatureH,), arg1))
end

"""
    OGR_F_StealGeometry(OGRFeatureH hFeat) -> OGRGeometryH

Take away ownership of geometry.

### Returns
the pointer to the geometry.
"""
function ogr_f_stealgeometry(arg1)
    aftercare(ccall((:OGR_F_StealGeometry, libgdal), OGRGeometryH, (OGRFeatureH,), arg1))
end

"""
    OGR_F_Clone(OGRFeatureH hFeat) -> OGRFeatureH

Duplicate feature.

### Parameters
* **hFeat**: handle to the feature to clone.

### Returns
a handle to the new feature, exactly matching this feature.
"""
function ogr_f_clone(arg1)
    aftercare(ccall((:OGR_F_Clone, libgdal), OGRFeatureH, (OGRFeatureH,), arg1))
end

"""
    OGR_F_Equal(OGRFeatureH hFeat,
                OGRFeatureH hOtherFeat) -> int

Test if two features are the same.

### Parameters
* **hFeat**: handle to one of the feature.
* **hOtherFeat**: handle to the other feature to test this one against.

### Returns
TRUE if they are equal, otherwise FALSE.
"""
function ogr_f_equal(arg1, arg2)
    aftercare(ccall((:OGR_F_Equal, libgdal), Cint, (OGRFeatureH, OGRFeatureH), arg1, arg2))
end

"""
    OGR_F_GetFieldCount(OGRFeatureH hFeat) -> int

Fetch number of fields on this feature This will always be the same as the field count for the OGRFeatureDefn.

### Parameters
* **hFeat**: handle to the feature to get the fields count from.

### Returns
count of fields.
"""
function ogr_f_getfieldcount(arg1)
    aftercare(ccall((:OGR_F_GetFieldCount, libgdal), Cint, (OGRFeatureH,), arg1))
end

"""
    OGR_F_GetFieldDefnRef(OGRFeatureH hFeat,
                          int i) -> OGRFieldDefnH

Fetch definition for this field.

### Parameters
* **hFeat**: handle to the feature on which the field is found.
* **i**: the field to fetch, from 0 to GetFieldCount()-1.

### Returns
a handle to the field definition (from the OGRFeatureDefn). This is an internal reference, and should not be deleted or modified.
"""
function ogr_f_getfielddefnref(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldDefnRef, libgdal), OGRFieldDefnH, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_GetFieldIndex(OGRFeatureH hFeat,
                        const char * pszName) -> int

Fetch the field index given field name.

### Parameters
* **hFeat**: handle to the feature on which the field is found.
* **pszName**: the name of the field to search for.

### Returns
the field index, or -1 if no matching field is found.
"""
function ogr_f_getfieldindex(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldIndex, libgdal), Cint, (OGRFeatureH, Cstring), arg1, arg2))
end

"""
    OGR_F_IsFieldSet(OGRFeatureH hFeat,
                     int iField) -> int

Test if a field has ever been assigned a value or not.

### Parameters
* **hFeat**: handle to the feature on which the field is.
* **iField**: the field to test.

### Returns
TRUE if the field has been set, otherwise false.
"""
function ogr_f_isfieldset(arg1, arg2)
    aftercare(ccall((:OGR_F_IsFieldSet, libgdal), Cint, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_UnsetField(OGRFeatureH hFeat,
                     int iField) -> void

Clear a field, marking it as unset.

### Parameters
* **hFeat**: handle to the feature on which the field is.
* **iField**: the field to unset.
"""
function ogr_f_unsetfield(arg1, arg2)
    aftercare(ccall((:OGR_F_UnsetField, libgdal), Cvoid, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_IsFieldNull(OGRFeatureH hFeat,
                      int iField) -> int

Test if a field is null.

### Parameters
* **hFeat**: handle to the feature on which the field is.
* **iField**: the field to test.

### Returns
TRUE if the field is null, otherwise false.
"""
function ogr_f_isfieldnull(arg1, arg2)
    aftercare(ccall((:OGR_F_IsFieldNull, libgdal), Cint, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_IsFieldSetAndNotNull(OGRFeatureH hFeat,
                               int iField) -> int

Test if a field is set and not null.

### Parameters
* **hFeat**: handle to the feature on which the field is.
* **iField**: the field to test.

### Returns
TRUE if the field is set and not null, otherwise false.
"""
function ogr_f_isfieldsetandnotnull(arg1, arg2)
    aftercare(ccall((:OGR_F_IsFieldSetAndNotNull, libgdal), Cint, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_SetFieldNull(OGRFeatureH hFeat,
                       int iField) -> void

Clear a field, marking it as null.

### Parameters
* **hFeat**: handle to the feature on which the field is.
* **iField**: the field to set to null.
"""
function ogr_f_setfieldnull(arg1, arg2)
    aftercare(ccall((:OGR_F_SetFieldNull, libgdal), Cvoid, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGRField

OGRFeature field attribute value union.
"""
struct OGRField
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{OGRField}, f::Symbol)
    f === :Integer && return Ptr{Cint}(x + 0)
    f === :Integer64 && return Ptr{GIntBig}(x + 0)
    f === :Real && return Ptr{Cdouble}(x + 0)
    f === :String && return Ptr{Cstring}(x + 0)
    f === :IntegerList && return Ptr{__JL_Ctag_432}(x + 0)
    f === :Integer64List && return Ptr{__JL_Ctag_433}(x + 0)
    f === :RealList && return Ptr{__JL_Ctag_434}(x + 0)
    f === :StringList && return Ptr{__JL_Ctag_435}(x + 0)
    f === :Binary && return Ptr{__JL_Ctag_436}(x + 0)
    f === :Set && return Ptr{__JL_Ctag_437}(x + 0)
    f === :Date && return Ptr{__JL_Ctag_438}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::OGRField, f::Symbol)
    r = Ref{OGRField}(x)
    ptr = Base.unsafe_convert(Ptr{OGRField}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{OGRField}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    OGR_F_GetRawFieldRef(OGRFeatureH hFeat,
                         int iField) -> OGRField *

Fetch a handle to the internal field value given the index.

### Parameters
* **hFeat**: handle to the feature on which field is found.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.

### Returns
the returned handle is to an internal data structure, and should not be freed, or modified.
"""
function ogr_f_getrawfieldref(arg1, arg2)
    aftercare(ccall((:OGR_F_GetRawFieldRef, libgdal), Ptr{OGRField}, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_RawField_IsUnset(const OGRField * puField) -> int

Returns whether a raw field is unset.

### Parameters
* **puField**: pointer to raw field.
"""
function ogr_rawfield_isunset(arg1)
    aftercare(ccall((:OGR_RawField_IsUnset, libgdal), Cint, (Ptr{OGRField},), arg1))
end

"""
    OGR_RawField_IsNull(const OGRField * puField) -> int

Returns whether a raw field is null.

### Parameters
* **puField**: pointer to raw field.
"""
function ogr_rawfield_isnull(arg1)
    aftercare(ccall((:OGR_RawField_IsNull, libgdal), Cint, (Ptr{OGRField},), arg1))
end

"""
    OGR_RawField_SetUnset(OGRField * puField) -> void

Mark a raw field as unset.

### Parameters
* **puField**: pointer to raw field.
"""
function ogr_rawfield_setunset(arg1)
    aftercare(ccall((:OGR_RawField_SetUnset, libgdal), Cvoid, (Ptr{OGRField},), arg1))
end

"""
    OGR_RawField_SetNull(OGRField * puField) -> void

Mark a raw field as null.

### Parameters
* **puField**: pointer to raw field.
"""
function ogr_rawfield_setnull(arg1)
    aftercare(ccall((:OGR_RawField_SetNull, libgdal), Cvoid, (Ptr{OGRField},), arg1))
end

"""
    OGR_F_GetFieldAsInteger(OGRFeatureH hFeat,
                            int iField) -> int

Fetch field value as integer.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.

### Returns
the field value.
"""
function ogr_f_getfieldasinteger(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsInteger, libgdal), Cint, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_GetFieldAsInteger64(OGRFeatureH hFeat,
                              int iField) -> GIntBig

Fetch field value as integer 64 bit.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.

### Returns
the field value.
"""
function ogr_f_getfieldasinteger64(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsInteger64, libgdal), GIntBig, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_GetFieldAsDouble(OGRFeatureH hFeat,
                           int iField) -> double

Fetch field value as a double.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.

### Returns
the field value.
"""
function ogr_f_getfieldasdouble(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsDouble, libgdal), Cdouble, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_GetFieldAsString(OGRFeatureH hFeat,
                           int iField) -> const char *

Fetch field value as a string.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.

### Returns
the field value. This string is internal, and should not be modified, or freed. Its lifetime may be very brief.
"""
function ogr_f_getfieldasstring(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsString, libgdal), Cstring, (OGRFeatureH, Cint), arg1, arg2), false)
end

"""
    OGR_F_GetFieldAsIntegerList(OGRFeatureH hFeat,
                                int iField,
                                int * pnCount) -> const int *

Fetch field value as a list of integers.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **pnCount**: an integer to put the list count (number of integers) into.

### Returns
the field value. This list is internal, and should not be modified, or freed. Its lifetime may be very brief. If *pnCount is zero on return the returned pointer may be NULL or non-NULL.
"""
function ogr_f_getfieldasintegerlist(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_GetFieldAsIntegerList, libgdal), Ptr{Cint}, (OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3))
end

"""
    OGR_F_GetFieldAsInteger64List(OGRFeatureH hFeat,
                                  int iField,
                                  int * pnCount) -> const GIntBig *

Fetch field value as a list of 64 bit integers.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **pnCount**: an integer to put the list count (number of integers) into.

### Returns
the field value. This list is internal, and should not be modified, or freed. Its lifetime may be very brief. If *pnCount is zero on return the returned pointer may be NULL or non-NULL.
"""
function ogr_f_getfieldasinteger64list(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_GetFieldAsInteger64List, libgdal), Ptr{GIntBig}, (OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3))
end

"""
    OGR_F_GetFieldAsDoubleList(OGRFeatureH hFeat,
                               int iField,
                               int * pnCount) -> const double *

Fetch field value as a list of doubles.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **pnCount**: an integer to put the list count (number of doubles) into.

### Returns
the field value. This list is internal, and should not be modified, or freed. Its lifetime may be very brief. If *pnCount is zero on return the returned pointer may be NULL or non-NULL.
"""
function ogr_f_getfieldasdoublelist(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_GetFieldAsDoubleList, libgdal), Ptr{Cdouble}, (OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3))
end

"""
    OGR_F_GetFieldAsStringList(OGRFeatureH hFeat,
                               int iField) -> char **

Fetch field value as a list of strings.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.

### Returns
the field value. This list is internal, and should not be modified, or freed. Its lifetime may be very brief.
"""
function ogr_f_getfieldasstringlist(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsStringList, libgdal), Ptr{Cstring}, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGR_F_GetFieldAsBinary(OGRFeatureH hFeat,
                           int iField,
                           int * pnBytes) -> GByte *

Fetch field value as binary.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **pnBytes**: location to place count of bytes returned.

### Returns
the field value. This list is internal, and should not be modified, or freed. Its lifetime may be very brief.
"""
function ogr_f_getfieldasbinary(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_GetFieldAsBinary, libgdal), Ptr{GByte}, (OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3))
end

"""
    OGR_F_GetFieldAsDateTime(OGRFeatureH hFeat,
                             int iField,
                             int * pnYear,
                             int * pnMonth,
                             int * pnDay,
                             int * pnHour,
                             int * pnMinute,
                             int * pnSecond,
                             int * pnTZFlag) -> int

Fetch field value as date and time.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **pnYear**: (including century)
* **pnMonth**: (1-12)
* **pnDay**: (1-31)
* **pnHour**: (0-23)
* **pnMinute**: (0-59)
* **pnSecond**: (0-59)
* **pnTZFlag**: (0=unknown, 1=localtime, 100=GMT, see data model for details)

### Returns
TRUE on success or FALSE on failure.
"""
function ogr_f_getfieldasdatetime(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:OGR_F_GetFieldAsDateTime, libgdal), Cint, (OGRFeatureH, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

"""
    OGR_F_GetFieldAsDateTimeEx(OGRFeatureH hFeat,
                               int iField,
                               int * pnYear,
                               int * pnMonth,
                               int * pnDay,
                               int * pnHour,
                               int * pnMinute,
                               float * pfSecond,
                               int * pnTZFlag) -> int

Fetch field value as date and time.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **pnYear**: (including century)
* **pnMonth**: (1-12)
* **pnDay**: (1-31)
* **pnHour**: (0-23)
* **pnMinute**: (0-59)
* **pfSecond**: (0-59 with millisecond accuracy)
* **pnTZFlag**: (0=unknown, 1=localtime, 100=GMT, see data model for details)

### Returns
TRUE on success or FALSE on failure.
"""
function ogr_f_getfieldasdatetimeex(hFeat, iField, pnYear, pnMonth, pnDay, pnHour, pnMinute, pfSecond, pnTZFlag)
    aftercare(ccall((:OGR_F_GetFieldAsDateTimeEx, libgdal), Cint, (OGRFeatureH, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cfloat}, Ptr{Cint}), hFeat, iField, pnYear, pnMonth, pnDay, pnHour, pnMinute, pfSecond, pnTZFlag))
end

"""
    OGR_F_SetFieldInteger(OGRFeatureH hFeat,
                          int iField,
                          int nValue) -> void

Set field to integer value.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **nValue**: the value to assign.
"""
function ogr_f_setfieldinteger(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldInteger, libgdal), Cvoid, (OGRFeatureH, Cint, Cint), arg1, arg2, arg3))
end

"""
    OGR_F_SetFieldInteger64(OGRFeatureH hFeat,
                            int iField,
                            GIntBig nValue) -> void

Set field to 64 bit integer value.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **nValue**: the value to assign.
"""
function ogr_f_setfieldinteger64(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldInteger64, libgdal), Cvoid, (OGRFeatureH, Cint, GIntBig), arg1, arg2, arg3))
end

"""
    OGR_F_SetFieldDouble(OGRFeatureH hFeat,
                         int iField,
                         double dfValue) -> void

Set field to double value.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **dfValue**: the value to assign.
"""
function ogr_f_setfielddouble(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldDouble, libgdal), Cvoid, (OGRFeatureH, Cint, Cdouble), arg1, arg2, arg3))
end

"""
    OGR_F_SetFieldString(OGRFeatureH hFeat,
                         int iField,
                         const char * pszValue) -> void

Set field to string value.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **pszValue**: the value to assign.
"""
function ogr_f_setfieldstring(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldString, libgdal), Cvoid, (OGRFeatureH, Cint, Cstring), arg1, arg2, arg3))
end

"""
    OGR_F_SetFieldIntegerList(OGRFeatureH hFeat,
                              int iField,
                              int nCount,
                              const int * panValues) -> void

Set field to list of integers value.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to set, from 0 to GetFieldCount()-1.
* **nCount**: the number of values in the list being assigned.
* **panValues**: the values to assign.
"""
function ogr_f_setfieldintegerlist(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFieldIntegerList, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Ptr{Cint}), arg1, arg2, arg3, arg4))
end

"""
    OGR_F_SetFieldInteger64List(OGRFeatureH hFeat,
                                int iField,
                                int nCount,
                                const GIntBig * panValues) -> void

Set field to list of 64 bit integers value.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to set, from 0 to GetFieldCount()-1.
* **nCount**: the number of values in the list being assigned.
* **panValues**: the values to assign.
"""
function ogr_f_setfieldinteger64list(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFieldInteger64List, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Ptr{GIntBig}), arg1, arg2, arg3, arg4))
end

"""
    OGR_F_SetFieldDoubleList(OGRFeatureH hFeat,
                             int iField,
                             int nCount,
                             const double * padfValues) -> void

Set field to list of doubles value.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to set, from 0 to GetFieldCount()-1.
* **nCount**: the number of values in the list being assigned.
* **padfValues**: the values to assign.
"""
function ogr_f_setfielddoublelist(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFieldDoubleList, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Ptr{Cdouble}), arg1, arg2, arg3, arg4))
end

"""
    OGR_F_SetFieldStringList(OGRFeatureH hFeat,
                             int iField,
                             CSLConstList papszValues) -> void

Set field to list of strings value.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to set, from 0 to GetFieldCount()-1.
* **papszValues**: the values to assign. List of NUL-terminated string, ending with a NULL pointer.
"""
function ogr_f_setfieldstringlist(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldStringList, libgdal), Cvoid, (OGRFeatureH, Cint, CSLConstList), arg1, arg2, arg3))
end

"""
    OGR_F_SetFieldRaw(OGRFeatureH hFeat,
                      int iField,
                      OGRField * psValue) -> void

Set field.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to fetch, from 0 to GetFieldCount()-1.
* **psValue**: handle on the value to assign.
"""
function ogr_f_setfieldraw(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldRaw, libgdal), Cvoid, (OGRFeatureH, Cint, Ptr{OGRField}), arg1, arg2, arg3))
end

"""
    OGR_F_SetFieldBinary(OGRFeatureH hFeat,
                         int iField,
                         int nBytes,
                         const void * pabyData) -> void

Set field to binary data.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to set, from 0 to GetFieldCount()-1.
* **nBytes**: the number of bytes in pabyData array.
* **pabyData**: the data to apply.
"""
function ogr_f_setfieldbinary(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFieldBinary, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

"""
    OGR_F_SetFieldDateTime(OGRFeatureH hFeat,
                           int iField,
                           int nYear,
                           int nMonth,
                           int nDay,
                           int nHour,
                           int nMinute,
                           int nSecond,
                           int nTZFlag) -> void

Set field to datetime.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to set, from 0 to GetFieldCount()-1.
* **nYear**: (including century)
* **nMonth**: (1-12)
* **nDay**: (1-31)
* **nHour**: (0-23)
* **nMinute**: (0-59)
* **nSecond**: (0-59)
* **nTZFlag**: (0=unknown, 1=localtime, 100=GMT, see data model for details)
"""
function ogr_f_setfielddatetime(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:OGR_F_SetFieldDateTime, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

"""
    OGR_F_SetFieldDateTimeEx(OGRFeatureH hFeat,
                             int iField,
                             int nYear,
                             int nMonth,
                             int nDay,
                             int nHour,
                             int nMinute,
                             float fSecond,
                             int nTZFlag) -> void

Set field to datetime.

### Parameters
* **hFeat**: handle to the feature that owned the field.
* **iField**: the field to set, from 0 to GetFieldCount()-1.
* **nYear**: (including century)
* **nMonth**: (1-12)
* **nDay**: (1-31)
* **nHour**: (0-23)
* **nMinute**: (0-59)
* **fSecond**: (0-59, with millisecond accuracy)
* **nTZFlag**: (0=unknown, 1=localtime, 100=GMT, see data model for details)
"""
function ogr_f_setfielddatetimeex(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:OGR_F_SetFieldDateTimeEx, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Cint, Cint, Cint, Cint, Cfloat, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

"""
    OGR_F_GetGeomFieldCount(OGRFeatureH hFeat) -> int

Fetch number of geometry fields on this feature This will always be the same as the geometry field count for the OGRFeatureDefn.

### Parameters
* **hFeat**: handle to the feature to get the geometry fields count from.

### Returns
count of geometry fields.
"""
function ogr_f_getgeomfieldcount(hFeat)
    aftercare(ccall((:OGR_F_GetGeomFieldCount, libgdal), Cint, (OGRFeatureH,), hFeat))
end

"""
    OGR_F_GetGeomFieldDefnRef(OGRFeatureH hFeat,
                              int i) -> OGRGeomFieldDefnH

Fetch definition for this geometry field.

### Parameters
* **hFeat**: handle to the feature on which the field is found.
* **i**: the field to fetch, from 0 to GetGeomFieldCount()-1.

### Returns
a handle to the field definition (from the OGRFeatureDefn). This is an internal reference, and should not be deleted or modified.
"""
function ogr_f_getgeomfielddefnref(hFeat, iField)
    aftercare(ccall((:OGR_F_GetGeomFieldDefnRef, libgdal), OGRGeomFieldDefnH, (OGRFeatureH, Cint), hFeat, iField))
end

"""
    OGR_F_GetGeomFieldIndex(OGRFeatureH hFeat,
                            const char * pszName) -> int

Fetch the geometry field index given geometry field name.

### Parameters
* **hFeat**: handle to the feature on which the geometry field is found.
* **pszName**: the name of the geometry field to search for.

### Returns
the geometry field index, or -1 if no matching geometry field is found.
"""
function ogr_f_getgeomfieldindex(hFeat, pszName)
    aftercare(ccall((:OGR_F_GetGeomFieldIndex, libgdal), Cint, (OGRFeatureH, Cstring), hFeat, pszName))
end

"""
    OGR_F_GetGeomFieldRef(OGRFeatureH hFeat,
                          int iField) -> OGRGeometryH

Fetch a handle to feature geometry.

### Parameters
* **hFeat**: handle to the feature to get geometry from.
* **iField**: geometry field to get.

### Returns
a handle to internal feature geometry. This object should not be modified.
"""
function ogr_f_getgeomfieldref(hFeat, iField)
    aftercare(ccall((:OGR_F_GetGeomFieldRef, libgdal), OGRGeometryH, (OGRFeatureH, Cint), hFeat, iField))
end

"""
    OGR_F_SetGeomFieldDirectly(OGRFeatureH hFeat,
                               int iField,
                               OGRGeometryH hGeom) -> OGRErr

Set feature geometry of a specified geometry field.

### Parameters
* **hFeat**: handle to the feature on which to apply the geometry.
* **iField**: geometry field to set.
* **hGeom**: handle to the new geometry to apply to feature.

### Returns
OGRERR_NONE if successful, or OGRERR_FAILURE if the index is invalid, or OGR_UNSUPPORTED_GEOMETRY_TYPE if the geometry type is illegal for the OGRFeatureDefn (checking not yet implemented).
"""
function ogr_f_setgeomfielddirectly(hFeat, iField, hGeom)
    aftercare(ccall((:OGR_F_SetGeomFieldDirectly, libgdal), OGRErr, (OGRFeatureH, Cint, OGRGeometryH), hFeat, iField, hGeom))
end

"""
    OGR_F_SetGeomField(OGRFeatureH hFeat,
                       int iField,
                       OGRGeometryH hGeom) -> OGRErr

Set feature geometry of a specified geometry field.

### Parameters
* **hFeat**: handle to the feature on which new geometry is applied to.
* **iField**: geometry field to set.
* **hGeom**: handle to the new geometry to apply to feature.

### Returns
OGRERR_NONE if successful, or OGR_UNSUPPORTED_GEOMETRY_TYPE if the geometry type is illegal for the OGRFeatureDefn (checking not yet implemented).
"""
function ogr_f_setgeomfield(hFeat, iField, hGeom)
    aftercare(ccall((:OGR_F_SetGeomField, libgdal), OGRErr, (OGRFeatureH, Cint, OGRGeometryH), hFeat, iField, hGeom))
end

"""
    OGR_F_GetFID(OGRFeatureH hFeat) -> GIntBig

Get feature identifier.

### Parameters
* **hFeat**: handle to the feature from which to get the feature identifier.

### Returns
feature id or OGRNullFID if none has been assigned.
"""
function ogr_f_getfid(arg1)
    aftercare(ccall((:OGR_F_GetFID, libgdal), GIntBig, (OGRFeatureH,), arg1))
end

"""
    OGR_F_SetFID(OGRFeatureH hFeat,
                 GIntBig nFID) -> OGRErr

Set the feature identifier.

### Parameters
* **hFeat**: handle to the feature to set the feature id to.
* **nFID**: the new feature identifier value to assign.

### Returns
On success OGRERR_NONE, or on failure some other value.
"""
function ogr_f_setfid(arg1, arg2)
    aftercare(ccall((:OGR_F_SetFID, libgdal), OGRErr, (OGRFeatureH, GIntBig), arg1, arg2))
end

"""
    OGR_F_DumpReadable(OGRFeatureH hFeat,
                       FILE * fpOut) -> void

Dump this feature in a human readable form.

### Parameters
* **hFeat**: handle to the feature to dump.
* **fpOut**: the stream to write to, such as strout.
"""
function ogr_f_dumpreadable(arg1, arg2)
    aftercare(ccall((:OGR_F_DumpReadable, libgdal), Cvoid, (OGRFeatureH, Ptr{Libc.FILE}), arg1, arg2))
end

"""
    OGR_F_SetFrom(OGRFeatureH hFeat,
                  OGRFeatureH hOtherFeat,
                  int bForgiving) -> OGRErr

Set one feature from another.

### Parameters
* **hFeat**: handle to the feature to set to.
* **hOtherFeat**: handle to the feature from which geometry, and field values will be copied.
* **bForgiving**: TRUE if the operation should continue despite lacking output fields matching some of the source fields.

### Returns
OGRERR_NONE if the operation succeeds, even if some values are not transferred, otherwise an error code.
"""
function ogr_f_setfrom(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFrom, libgdal), OGRErr, (OGRFeatureH, OGRFeatureH, Cint), arg1, arg2, arg3))
end

"""
    OGR_F_SetFromWithMap(OGRFeatureH hFeat,
                         OGRFeatureH hOtherFeat,
                         int bForgiving,
                         const int * panMap) -> OGRErr

Set one feature from another.

### Parameters
* **hFeat**: handle to the feature to set to.
* **hOtherFeat**: handle to the feature from which geometry, and field values will be copied.
* **panMap**: Array of the indices of the destination feature's fields stored at the corresponding index of the source feature's fields. A value of -1 should be used to ignore the source's field. The array should not be NULL and be as long as the number of fields in the source feature.
* **bForgiving**: TRUE if the operation should continue despite lacking output fields matching some of the source fields.

### Returns
OGRERR_NONE if the operation succeeds, even if some values are not transferred, otherwise an error code.
"""
function ogr_f_setfromwithmap(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFromWithMap, libgdal), OGRErr, (OGRFeatureH, OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3, arg4))
end

"""
    OGR_F_GetStyleString(OGRFeatureH hFeat) -> const char *

Fetch style string for this feature.

### Parameters
* **hFeat**: handle to the feature to get the style from.

### Returns
a reference to a representation in string format, or NULL if there isn't one.
"""
function ogr_f_getstylestring(arg1)
    aftercare(ccall((:OGR_F_GetStyleString, libgdal), Cstring, (OGRFeatureH,), arg1), false)
end

"""
    OGR_F_SetStyleString(OGRFeatureH hFeat,
                         const char * pszStyle) -> void

Set feature style string.

### Parameters
* **hFeat**: handle to the feature to set style to.
* **pszStyle**: the style string to apply to this feature, cannot be NULL.
"""
function ogr_f_setstylestring(arg1, arg2)
    aftercare(ccall((:OGR_F_SetStyleString, libgdal), Cvoid, (OGRFeatureH, Cstring), arg1, arg2))
end

"""
    OGR_F_SetStyleStringDirectly(OGRFeatureH hFeat,
                                 char * pszStyle) -> void

Set feature style string.

### Parameters
* **hFeat**: handle to the feature to set style to.
* **pszStyle**: the style string to apply to this feature, cannot be NULL.
"""
function ogr_f_setstylestringdirectly(arg1, arg2)
    aftercare(ccall((:OGR_F_SetStyleStringDirectly, libgdal), Cvoid, (OGRFeatureH, Cstring), arg1, arg2))
end

"""
    ogr_f_getstyletable(arg1)

Return style table 
"""
function ogr_f_getstyletable(arg1)
    aftercare(ccall((:OGR_F_GetStyleTable, libgdal), OGRStyleTableH, (OGRFeatureH,), arg1))
end

"""
    ogr_f_setstyletabledirectly(arg1, arg2)

Set style table and take ownership 
"""
function ogr_f_setstyletabledirectly(arg1, arg2)
    aftercare(ccall((:OGR_F_SetStyleTableDirectly, libgdal), Cvoid, (OGRFeatureH, OGRStyleTableH), arg1, arg2))
end

"""
    ogr_f_setstyletable(arg1, arg2)

Set style table 
"""
function ogr_f_setstyletable(arg1, arg2)
    aftercare(ccall((:OGR_F_SetStyleTable, libgdal), Cvoid, (OGRFeatureH, OGRStyleTableH), arg1, arg2))
end

"""
    OGR_F_GetNativeData(OGRFeatureH hFeat) -> const char *

Returns the native data for the feature.

### Parameters
* **hFeat**: handle to the feature.

### Returns
a string with the native data, or NULL if there is none.
"""
function ogr_f_getnativedata(arg1)
    aftercare(ccall((:OGR_F_GetNativeData, libgdal), Cstring, (OGRFeatureH,), arg1), false)
end

"""
    OGR_F_SetNativeData(OGRFeatureH hFeat,
                        const char * pszNativeData) -> void

Sets the native data for the feature.

### Parameters
* **hFeat**: handle to the feature.
* **pszNativeData**: a string with the native data, or NULL if there is none.
"""
function ogr_f_setnativedata(arg1, arg2)
    aftercare(ccall((:OGR_F_SetNativeData, libgdal), Cvoid, (OGRFeatureH, Cstring), arg1, arg2))
end

"""
    OGR_F_GetNativeMediaType(OGRFeatureH hFeat) -> const char *

Returns the native media type for the feature.

### Parameters
* **hFeat**: handle to the feature.

### Returns
a string with the native media type, or NULL if there is none.
"""
function ogr_f_getnativemediatype(arg1)
    aftercare(ccall((:OGR_F_GetNativeMediaType, libgdal), Cstring, (OGRFeatureH,), arg1), false)
end

"""
    OGR_F_SetNativeMediaType(OGRFeatureH hFeat,
                             const char * pszNativeMediaType) -> void

Sets the native media type for the feature.

### Parameters
* **hFeat**: handle to the feature.
* **pszNativeMediaType**: a string with the native media type, or NULL if there is none.
"""
function ogr_f_setnativemediatype(arg1, arg2)
    aftercare(ccall((:OGR_F_SetNativeMediaType, libgdal), Cvoid, (OGRFeatureH, Cstring), arg1, arg2))
end

"""
    OGR_F_FillUnsetWithDefault(OGRFeatureH hFeat,
                               int bNotNullableOnly,
                               char ** papszOptions) -> void

Fill unset fields with default values that might be defined.

### Parameters
* **hFeat**: handle to the feature.
* **bNotNullableOnly**: if we should fill only unset fields with a not-null constraint.
* **papszOptions**: unused currently. Must be set to NULL.
"""
function ogr_f_fillunsetwithdefault(hFeat, bNotNullableOnly, papszOptions)
    aftercare(ccall((:OGR_F_FillUnsetWithDefault, libgdal), Cvoid, (OGRFeatureH, Cint, Ptr{Cstring}), hFeat, bNotNullableOnly, papszOptions))
end

"""
    OGR_F_Validate(OGRFeatureH hFeat,
                   int nValidateFlags,
                   int bEmitError) -> int

Validate that a feature meets constraints of its schema.

### Parameters
* **hFeat**: handle to the feature to validate.
* **nValidateFlags**: OGR_F_VAL_ALL or combination of OGR_F_VAL_NULL, OGR_F_VAL_GEOM_TYPE, OGR_F_VAL_WIDTH and OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT with '|' operator
* **bEmitError**: TRUE if a CPLError() must be emitted when a check fails

### Returns
TRUE if all enabled validation tests pass.
"""
function ogr_f_validate(arg1, nValidateFlags, bEmitError)
    aftercare(ccall((:OGR_F_Validate, libgdal), Cint, (OGRFeatureH, Cint, Cint), arg1, nValidateFlags, bEmitError))
end

"Opaque type for a OGR datasource (OGRDataSource) "
const OGRDataSourceH = Ptr{Cvoid}

"Opaque type for a OGR driver (OGRSFDriver) "
const OGRSFDriverH = Ptr{Cvoid}

"""
    OGR_L_GetName(OGRLayerH) -> const char *

Return the layer name.

### Parameters
* **hLayer**: handle to the layer.

### Returns
the layer name (must not been freed)
"""
function ogr_l_getname(arg1)
    aftercare(ccall((:OGR_L_GetName, libgdal), Cstring, (OGRLayerH,), arg1), false)
end

"""
    OGR_L_GetGeomType(OGRLayerH) -> OGRwkbGeometryType

Return the layer geometry type.

### Parameters
* **hLayer**: handle to the layer.

### Returns
the geometry type
"""
function ogr_l_getgeomtype(arg1)
    aftercare(ccall((:OGR_L_GetGeomType, libgdal), OGRwkbGeometryType, (OGRLayerH,), arg1))
end

"""
    OGR_L_GetSpatialFilter(OGRLayerH) -> OGRGeometryH

This function returns the current spatial filter for this layer.

### Parameters
* **hLayer**: handle to the layer to get the spatial filter from.

### Returns
a handle to the spatial filter geometry.
"""
function ogr_l_getspatialfilter(arg1)
    aftercare(ccall((:OGR_L_GetSpatialFilter, libgdal), OGRGeometryH, (OGRLayerH,), arg1))
end

"""
    OGR_L_SetSpatialFilter(OGRLayerH,
                           OGRGeometryH) -> void

Set a new spatial filter.

### Parameters
* **hLayer**: handle to the layer on which to set the spatial filter.
* **hGeom**: handle to the geometry to use as a filtering region. NULL may be passed indicating that the current spatial filter should be cleared, but no new one instituted.
"""
function ogr_l_setspatialfilter(arg1, arg2)
    aftercare(ccall((:OGR_L_SetSpatialFilter, libgdal), Cvoid, (OGRLayerH, OGRGeometryH), arg1, arg2))
end

"""
    OGR_L_SetSpatialFilterRect(OGRLayerH,
                               double,
                               double,
                               double,
                               double) -> void

Set a new rectangular spatial filter.

### Parameters
* **hLayer**: handle to the layer on which to set the spatial filter.
* **dfMinX**: the minimum X coordinate for the rectangular region.
* **dfMinY**: the minimum Y coordinate for the rectangular region.
* **dfMaxX**: the maximum X coordinate for the rectangular region.
* **dfMaxY**: the maximum Y coordinate for the rectangular region.
"""
function ogr_l_setspatialfilterrect(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OGR_L_SetSpatialFilterRect, libgdal), Cvoid, (OGRLayerH, Cdouble, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5))
end

"""
    OGR_L_SetSpatialFilterEx(OGRLayerH,
                             int iGeomField,
                             OGRGeometryH hGeom) -> void

Set a new spatial filter.

### Parameters
* **hLayer**: handle to the layer on which to set the spatial filter.
* **iGeomField**: index of the geometry field on which the spatial filter operates.
* **hGeom**: handle to the geometry to use as a filtering region. NULL may be passed indicating that the current spatial filter should be cleared, but no new one instituted.
"""
function ogr_l_setspatialfilterex(arg1, iGeomField, hGeom)
    aftercare(ccall((:OGR_L_SetSpatialFilterEx, libgdal), Cvoid, (OGRLayerH, Cint, OGRGeometryH), arg1, iGeomField, hGeom))
end

"""
    OGR_L_SetSpatialFilterRectEx(OGRLayerH,
                                 int iGeomField,
                                 double dfMinX,
                                 double dfMinY,
                                 double dfMaxX,
                                 double dfMaxY) -> void

Set a new rectangular spatial filter.

### Parameters
* **hLayer**: handle to the layer on which to set the spatial filter.
* **iGeomField**: index of the geometry field on which the spatial filter operates.
* **dfMinX**: the minimum X coordinate for the rectangular region.
* **dfMinY**: the minimum Y coordinate for the rectangular region.
* **dfMaxX**: the maximum X coordinate for the rectangular region.
* **dfMaxY**: the maximum Y coordinate for the rectangular region.
"""
function ogr_l_setspatialfilterrectex(arg1, iGeomField, dfMinX, dfMinY, dfMaxX, dfMaxY)
    aftercare(ccall((:OGR_L_SetSpatialFilterRectEx, libgdal), Cvoid, (OGRLayerH, Cint, Cdouble, Cdouble, Cdouble, Cdouble), arg1, iGeomField, dfMinX, dfMinY, dfMaxX, dfMaxY))
end

"""
    OGR_L_SetAttributeFilter(OGRLayerH,
                             const char *) -> OGRErr

Set a new attribute query.

### Parameters
* **hLayer**: handle to the layer on which attribute query will be executed.
* **pszQuery**: query in restricted SQL WHERE format, or NULL to clear the current query.

### Returns
OGRERR_NONE if successfully installed, or an error code if the query expression is in error, or some other failure occurs.
"""
function ogr_l_setattributefilter(arg1, arg2)
    aftercare(ccall((:OGR_L_SetAttributeFilter, libgdal), OGRErr, (OGRLayerH, Cstring), arg1, arg2))
end

"""
    OGR_L_ResetReading(OGRLayerH) -> void

Reset feature reading to start on the first feature.

### Parameters
* **hLayer**: handle to the layer on which features are read.
"""
function ogr_l_resetreading(arg1)
    aftercare(ccall((:OGR_L_ResetReading, libgdal), Cvoid, (OGRLayerH,), arg1))
end

"""
    OGR_L_GetNextFeature(OGRLayerH) -> OGRFeatureH

Fetch the next available feature from this layer.

### Parameters
* **hLayer**: handle to the layer from which feature are read.

### Returns
a handle to a feature, or NULL if no more features are available.
"""
function ogr_l_getnextfeature(arg1)
    aftercare(ccall((:OGR_L_GetNextFeature, libgdal), OGRFeatureH, (OGRLayerH,), arg1))
end

"""
    OGR_L_SetNextByIndex(OGRLayerH,
                         GIntBig) -> OGRErr

Move read cursor to the nIndex'th feature in the current resultset.

### Parameters
* **hLayer**: handle to the layer
* **nIndex**: the index indicating how many steps into the result set to seek.

### Returns
OGRERR_NONE on success or an error code.
"""
function ogr_l_setnextbyindex(arg1, arg2)
    aftercare(ccall((:OGR_L_SetNextByIndex, libgdal), OGRErr, (OGRLayerH, GIntBig), arg1, arg2))
end

"""
    OGR_L_GetFeature(OGRLayerH,
                     GIntBig) -> OGRFeatureH

Fetch a feature by its identifier.

### Parameters
* **hLayer**: handle to the layer that owned the feature.
* **nFeatureId**: the feature id of the feature to read.

### Returns
a handle to a feature now owned by the caller, or NULL on failure.
"""
function ogr_l_getfeature(arg1, arg2)
    aftercare(ccall((:OGR_L_GetFeature, libgdal), OGRFeatureH, (OGRLayerH, GIntBig), arg1, arg2))
end

"""
    OGR_L_SetFeature(OGRLayerH,
                     OGRFeatureH) -> OGRErr

Rewrite an existing feature.

### Parameters
* **hLayer**: handle to the layer to write the feature.
* **hFeat**: the feature to write.

### Returns
OGRERR_NONE if the operation works, otherwise an appropriate error code (e.g OGRERR_NON_EXISTING_FEATURE if the feature does not exist).
"""
function ogr_l_setfeature(arg1, arg2)
    aftercare(ccall((:OGR_L_SetFeature, libgdal), OGRErr, (OGRLayerH, OGRFeatureH), arg1, arg2))
end

"""
    OGR_L_CreateFeature(OGRLayerH,
                        OGRFeatureH) -> OGRErr

Create and write a new feature within a layer.

### Parameters
* **hLayer**: handle to the layer to write the feature to.
* **hFeat**: the handle of the feature to write to disk.

### Returns
OGRERR_NONE on success.
"""
function ogr_l_createfeature(arg1, arg2)
    aftercare(ccall((:OGR_L_CreateFeature, libgdal), OGRErr, (OGRLayerH, OGRFeatureH), arg1, arg2))
end

"""
    OGR_L_DeleteFeature(OGRLayerH,
                        GIntBig) -> OGRErr

Delete feature from layer.

### Parameters
* **hLayer**: handle to the layer
* **nFID**: the feature id to be deleted from the layer

### Returns
OGRERR_NONE if the operation works, otherwise an appropriate error code (e.g OGRERR_NON_EXISTING_FEATURE if the feature does not exist).
"""
function ogr_l_deletefeature(arg1, arg2)
    aftercare(ccall((:OGR_L_DeleteFeature, libgdal), OGRErr, (OGRLayerH, GIntBig), arg1, arg2))
end

"""
    OGR_L_GetLayerDefn(OGRLayerH) -> OGRFeatureDefnH

Fetch the schema information for this layer.

### Parameters
* **hLayer**: handle to the layer to get the schema information.

### Returns
a handle to the feature definition.
"""
function ogr_l_getlayerdefn(arg1)
    aftercare(ccall((:OGR_L_GetLayerDefn, libgdal), OGRFeatureDefnH, (OGRLayerH,), arg1))
end

"""
    OGR_L_GetSpatialRef(OGRLayerH) -> OGRSpatialReferenceH

Fetch the spatial reference system for this layer.

### Parameters
* **hLayer**: handle to the layer to get the spatial reference from.

### Returns
spatial reference, or NULL if there isn't one.
"""
function ogr_l_getspatialref(arg1)
    aftercare(ccall((:OGR_L_GetSpatialRef, libgdal), OGRSpatialReferenceH, (OGRLayerH,), arg1))
end

"""
    OGR_L_FindFieldIndex(OGRLayerH,
                         const char *,
                         int bExactMatch) -> int

Find the index of field in a layer.

### Returns
field index, or -1 if the field doesn't exist
"""
function ogr_l_findfieldindex(arg1, arg2, bExactMatch)
    aftercare(ccall((:OGR_L_FindFieldIndex, libgdal), Cint, (OGRLayerH, Cstring, Cint), arg1, arg2, bExactMatch))
end

"""
    OGR_L_GetFeatureCount(OGRLayerH,
                          int) -> GIntBig

Fetch the feature count in this layer.

### Parameters
* **hLayer**: handle to the layer that owned the features.
* **bForce**: Flag indicating whether the count should be computed even if it is expensive.

### Returns
feature count, -1 if count not known.
"""
function ogr_l_getfeaturecount(arg1, arg2)
    aftercare(ccall((:OGR_L_GetFeatureCount, libgdal), GIntBig, (OGRLayerH, Cint), arg1, arg2))
end

"""
    OGR_L_GetExtent(OGRLayerH,
                    OGREnvelope *,
                    int) -> OGRErr

Fetch the extent of this layer.

### Parameters
* **hLayer**: handle to the layer from which to get extent.
* **psExtent**: the structure in which the extent value will be returned.
* **bForce**: Flag indicating whether the extent should be computed even if it is expensive.

### Returns
OGRERR_NONE on success, OGRERR_FAILURE if extent not known.
"""
function ogr_l_getextent(arg1, arg2, arg3)
    aftercare(ccall((:OGR_L_GetExtent, libgdal), OGRErr, (OGRLayerH, Ptr{OGREnvelope}, Cint), arg1, arg2, arg3))
end

"""
    OGR_L_GetExtentEx(OGRLayerH,
                      int iGeomField,
                      OGREnvelope * psExtent,
                      int bForce) -> OGRErr

Fetch the extent of this layer, on the specified geometry field.

### Parameters
* **hLayer**: handle to the layer from which to get extent.
* **iGeomField**: the index of the geometry field on which to compute the extent.
* **psExtent**: the structure in which the extent value will be returned.
* **bForce**: Flag indicating whether the extent should be computed even if it is expensive.

### Returns
OGRERR_NONE on success, OGRERR_FAILURE if extent not known.
"""
function ogr_l_getextentex(arg1, iGeomField, psExtent, bForce)
    aftercare(ccall((:OGR_L_GetExtentEx, libgdal), OGRErr, (OGRLayerH, Cint, Ptr{OGREnvelope}, Cint), arg1, iGeomField, psExtent, bForce))
end

"""
    OGR_L_TestCapability(OGRLayerH,
                         const char *) -> int

Test if this layer supported the named capability.

### Parameters
* **hLayer**: handle to the layer to get the capability from.
* **pszCap**: the name of the capability to test.

### Returns
TRUE if the layer has the requested capability, or FALSE otherwise. OGRLayers will return FALSE for any unrecognized capabilities.
"""
function ogr_l_testcapability(arg1, arg2)
    aftercare(ccall((:OGR_L_TestCapability, libgdal), Cint, (OGRLayerH, Cstring), arg1, arg2))
end

"""
    OGR_L_CreateField(OGRLayerH,
                      OGRFieldDefnH,
                      int) -> OGRErr

Create a new field on a layer.

### Parameters
* **hLayer**: handle to the layer to write the field definition.
* **hField**: handle of the field definition to write to disk.
* **bApproxOK**: If TRUE, the field may be created in a slightly different form depending on the limitations of the format driver.

### Returns
OGRERR_NONE on success.
"""
function ogr_l_createfield(arg1, arg2, arg3)
    aftercare(ccall((:OGR_L_CreateField, libgdal), OGRErr, (OGRLayerH, OGRFieldDefnH, Cint), arg1, arg2, arg3))
end

"""
    OGR_L_CreateGeomField(OGRLayerH hLayer,
                          OGRGeomFieldDefnH hFieldDefn,
                          int bForce) -> OGRErr

Create a new geometry field on a layer.

### Parameters
* **hLayer**: handle to the layer to write the field definition.
* **hField**: handle of the geometry field definition to write to disk.
* **bApproxOK**: If TRUE, the field may be created in a slightly different form depending on the limitations of the format driver.

### Returns
OGRERR_NONE on success.
"""
function ogr_l_creategeomfield(hLayer, hFieldDefn, bForce)
    aftercare(ccall((:OGR_L_CreateGeomField, libgdal), OGRErr, (OGRLayerH, OGRGeomFieldDefnH, Cint), hLayer, hFieldDefn, bForce))
end

"""
    OGR_L_DeleteField(OGRLayerH,
                      int iField) -> OGRErr

Delete an existing field on a layer.

### Parameters
* **hLayer**: handle to the layer.
* **iField**: index of the field to delete.

### Returns
OGRERR_NONE on success.
"""
function ogr_l_deletefield(arg1, iField)
    aftercare(ccall((:OGR_L_DeleteField, libgdal), OGRErr, (OGRLayerH, Cint), arg1, iField))
end

"""
    OGR_L_ReorderFields(OGRLayerH,
                        int * panMap) -> OGRErr

Reorder all the fields of a layer.

### Parameters
* **hLayer**: handle to the layer.
* **panMap**: an array of GetLayerDefn()->OGRFeatureDefn::GetFieldCount() elements which is a permutation of [0, GetLayerDefn()->OGRFeatureDefn::GetFieldCount()-1].

### Returns
OGRERR_NONE on success.
"""
function ogr_l_reorderfields(arg1, panMap)
    aftercare(ccall((:OGR_L_ReorderFields, libgdal), OGRErr, (OGRLayerH, Ptr{Cint}), arg1, panMap))
end

"""
    OGR_L_ReorderField(OGRLayerH,
                       int iOldFieldPos,
                       int iNewFieldPos) -> OGRErr

Reorder an existing field on a layer.

### Parameters
* **hLayer**: handle to the layer.
* **iOldFieldPos**: previous position of the field to move. Must be in the range [0,GetFieldCount()-1].
* **iNewFieldPos**: new position of the field to move. Must be in the range [0,GetFieldCount()-1].

### Returns
OGRERR_NONE on success.
"""
function ogr_l_reorderfield(arg1, iOldFieldPos, iNewFieldPos)
    aftercare(ccall((:OGR_L_ReorderField, libgdal), OGRErr, (OGRLayerH, Cint, Cint), arg1, iOldFieldPos, iNewFieldPos))
end

"""
    OGR_L_AlterFieldDefn(OGRLayerH,
                         int iField,
                         OGRFieldDefnH hNewFieldDefn,
                         int nFlags) -> OGRErr

Alter the definition of an existing field on a layer.

### Parameters
* **hLayer**: handle to the layer.
* **iField**: index of the field whose definition must be altered.
* **hNewFieldDefn**: new field definition
* **nFlags**: combination of ALTER_NAME_FLAG, ALTER_TYPE_FLAG, ALTER_WIDTH_PRECISION_FLAG, ALTER_NULLABLE_FLAG and ALTER_DEFAULT_FLAG to indicate which of the name and/or type and/or width and precision fields and/or nullability from the new field definition must be taken into account.

### Returns
OGRERR_NONE on success.
"""
function ogr_l_alterfielddefn(arg1, iField, hNewFieldDefn, nFlags)
    aftercare(ccall((:OGR_L_AlterFieldDefn, libgdal), OGRErr, (OGRLayerH, Cint, OGRFieldDefnH, Cint), arg1, iField, hNewFieldDefn, nFlags))
end

"""
    OGR_L_StartTransaction(OGRLayerH) -> OGRErr

For datasources which support transactions, StartTransaction creates a transaction.

### Parameters
* **hLayer**: handle to the layer

### Returns
OGRERR_NONE on success.
"""
function ogr_l_starttransaction(arg1)
    aftercare(ccall((:OGR_L_StartTransaction, libgdal), OGRErr, (OGRLayerH,), arg1))
end

"""
    OGR_L_CommitTransaction(OGRLayerH) -> OGRErr

For datasources which support transactions, CommitTransaction commits a transaction.

### Parameters
* **hLayer**: handle to the layer

### Returns
OGRERR_NONE on success.
"""
function ogr_l_committransaction(arg1)
    aftercare(ccall((:OGR_L_CommitTransaction, libgdal), OGRErr, (OGRLayerH,), arg1))
end

"""
    OGR_L_RollbackTransaction(OGRLayerH) -> OGRErr

For datasources which support transactions, RollbackTransaction will roll back a datasource to its state before the start of the current transaction. If no transaction is active, or the rollback fails, will return OGRERR_FAILURE. Datasources which do not support transactions will always return OGRERR_NONE.

### Parameters
* **hLayer**: handle to the layer

### Returns
OGRERR_NONE on success.
"""
function ogr_l_rollbacktransaction(arg1)
    aftercare(ccall((:OGR_L_RollbackTransaction, libgdal), OGRErr, (OGRLayerH,), arg1))
end

"""
    ogr_l_reference(arg1)

Doxygen\\_Suppress 
"""
function ogr_l_reference(arg1)
    aftercare(ccall((:OGR_L_Reference, libgdal), Cint, (OGRLayerH,), arg1))
end

"""
    OGR_L_Dereference(OGRLayerH hLayer) -> int
"""
function ogr_l_dereference(arg1)
    aftercare(ccall((:OGR_L_Dereference, libgdal), Cint, (OGRLayerH,), arg1))
end

"""
    OGR_L_GetRefCount(OGRLayerH hLayer) -> int
"""
function ogr_l_getrefcount(arg1)
    aftercare(ccall((:OGR_L_GetRefCount, libgdal), Cint, (OGRLayerH,), arg1))
end

"""
    OGR_L_SyncToDisk(OGRLayerH) -> OGRErr

Flush pending changes to disk.

### Parameters
* **hLayer**: handle to the layer

### Returns
OGRERR_NONE if no error occurs (even if nothing is done) or an error code.
"""
function ogr_l_synctodisk(arg1)
    aftercare(ccall((:OGR_L_SyncToDisk, libgdal), OGRErr, (OGRLayerH,), arg1))
end

"""
    ogr_l_getfeaturesread(arg1)

Doxygen\\_Suppress 
"""
function ogr_l_getfeaturesread(arg1)
    aftercare(ccall((:OGR_L_GetFeaturesRead, libgdal), GIntBig, (OGRLayerH,), arg1))
end

"""
    OGR_L_GetFIDColumn(OGRLayerH) -> const char *

This method returns the name of the underlying database column being used as the FID column, or "" if not supported.

### Parameters
* **hLayer**: handle to the layer

### Returns
fid column name.
"""
function ogr_l_getfidcolumn(arg1)
    aftercare(ccall((:OGR_L_GetFIDColumn, libgdal), Cstring, (OGRLayerH,), arg1), false)
end

"""
    OGR_L_GetGeometryColumn(OGRLayerH) -> const char *

This method returns the name of the underlying database column being used as the geometry column, or "" if not supported.

### Parameters
* **hLayer**: handle to the layer

### Returns
geometry column name.
"""
function ogr_l_getgeometrycolumn(arg1)
    aftercare(ccall((:OGR_L_GetGeometryColumn, libgdal), Cstring, (OGRLayerH,), arg1), false)
end

"""
    ogr_l_getstyletable(arg1)

Get style table 
"""
function ogr_l_getstyletable(arg1)
    aftercare(ccall((:OGR_L_GetStyleTable, libgdal), OGRStyleTableH, (OGRLayerH,), arg1))
end

"""
    ogr_l_setstyletabledirectly(arg1, arg2)

Set style table (and take ownership) 
"""
function ogr_l_setstyletabledirectly(arg1, arg2)
    aftercare(ccall((:OGR_L_SetStyleTableDirectly, libgdal), Cvoid, (OGRLayerH, OGRStyleTableH), arg1, arg2))
end

"""
    ogr_l_setstyletable(arg1, arg2)

Set style table 
"""
function ogr_l_setstyletable(arg1, arg2)
    aftercare(ccall((:OGR_L_SetStyleTable, libgdal), Cvoid, (OGRLayerH, OGRStyleTableH), arg1, arg2))
end

"""
    OGR_L_SetIgnoredFields(OGRLayerH,
                           const char **) -> OGRErr

Set which fields can be omitted when retrieving features from the layer.

### Parameters
* **hLayer**: handle to the layer
* **papszFields**: an array of field names terminated by NULL item. If NULL is passed, the ignored list is cleared.

### Returns
OGRERR_NONE if all field names have been resolved (even if the driver does not support this method)
"""
function ogr_l_setignoredfields(arg1, arg2)
    aftercare(ccall((:OGR_L_SetIgnoredFields, libgdal), OGRErr, (OGRLayerH, Ptr{Cstring}), arg1, arg2))
end

"""
    OGR_L_Intersection(OGRLayerH pLayerInput,
                       OGRLayerH pLayerMethod,
                       OGRLayerH pLayerResult,
                       char ** papszOptions,
                       GDALProgressFunc pfnProgress,
                       void * pProgressArg) -> OGRErr

Intersection of two layers.

### Parameters
* **pLayerInput**: the input layer. Should not be NULL.
* **pLayerMethod**: the method layer. Should not be NULL.
* **pLayerResult**: the layer where the features resulting from the operation are inserted. Should not be NULL. See above the note about the schema.
* **papszOptions**: NULL terminated list of options (may be NULL).
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
an error code if there was an error or the execution was interrupted, OGRERR_NONE otherwise.
"""
function ogr_l_intersection(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Intersection, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OGR_L_Union(OGRLayerH pLayerInput,
                OGRLayerH pLayerMethod,
                OGRLayerH pLayerResult,
                char ** papszOptions,
                GDALProgressFunc pfnProgress,
                void * pProgressArg) -> OGRErr

Union of two layers.

### Parameters
* **pLayerInput**: the input layer. Should not be NULL.
* **pLayerMethod**: the method layer. Should not be NULL.
* **pLayerResult**: the layer where the features resulting from the operation are inserted. Should not be NULL. See above the note about the schema.
* **papszOptions**: NULL terminated list of options (may be NULL).
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
an error code if there was an error or the execution was interrupted, OGRERR_NONE otherwise.
"""
function ogr_l_union(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Union, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OGR_L_SymDifference(OGRLayerH pLayerInput,
                        OGRLayerH pLayerMethod,
                        OGRLayerH pLayerResult,
                        char ** papszOptions,
                        GDALProgressFunc pfnProgress,
                        void * pProgressArg) -> OGRErr

Symmetrical difference of two layers.

### Parameters
* **pLayerInput**: the input layer. Should not be NULL.
* **pLayerMethod**: the method layer. Should not be NULL.
* **pLayerResult**: the layer where the features resulting from the operation are inserted. Should not be NULL. See above the note about the schema.
* **papszOptions**: NULL terminated list of options (may be NULL).
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
an error code if there was an error or the execution was interrupted, OGRERR_NONE otherwise.
"""
function ogr_l_symdifference(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_SymDifference, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OGR_L_Identity(OGRLayerH pLayerInput,
                   OGRLayerH pLayerMethod,
                   OGRLayerH pLayerResult,
                   char ** papszOptions,
                   GDALProgressFunc pfnProgress,
                   void * pProgressArg) -> OGRErr

Identify the features of this layer with the ones from the identity layer.

### Parameters
* **pLayerInput**: the input layer. Should not be NULL.
* **pLayerMethod**: the method layer. Should not be NULL.
* **pLayerResult**: the layer where the features resulting from the operation are inserted. Should not be NULL. See above the note about the schema.
* **papszOptions**: NULL terminated list of options (may be NULL).
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
an error code if there was an error or the execution was interrupted, OGRERR_NONE otherwise.
"""
function ogr_l_identity(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Identity, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OGR_L_Update(OGRLayerH pLayerInput,
                 OGRLayerH pLayerMethod,
                 OGRLayerH pLayerResult,
                 char ** papszOptions,
                 GDALProgressFunc pfnProgress,
                 void * pProgressArg) -> OGRErr

Update this layer with features from the update layer.

### Parameters
* **pLayerInput**: the input layer. Should not be NULL.
* **pLayerMethod**: the method layer. Should not be NULL.
* **pLayerResult**: the layer where the features resulting from the operation are inserted. Should not be NULL. See above the note about the schema.
* **papszOptions**: NULL terminated list of options (may be NULL).
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
an error code if there was an error or the execution was interrupted, OGRERR_NONE otherwise.
"""
function ogr_l_update(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Update, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OGR_L_Clip(OGRLayerH pLayerInput,
               OGRLayerH pLayerMethod,
               OGRLayerH pLayerResult,
               char ** papszOptions,
               GDALProgressFunc pfnProgress,
               void * pProgressArg) -> OGRErr

Clip off areas that are not covered by the method layer.

### Parameters
* **pLayerInput**: the input layer. Should not be NULL.
* **pLayerMethod**: the method layer. Should not be NULL.
* **pLayerResult**: the layer where the features resulting from the operation are inserted. Should not be NULL. See above the note about the schema.
* **papszOptions**: NULL terminated list of options (may be NULL).
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
an error code if there was an error or the execution was interrupted, OGRERR_NONE otherwise.
"""
function ogr_l_clip(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Clip, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OGR_L_Erase(OGRLayerH pLayerInput,
                OGRLayerH pLayerMethod,
                OGRLayerH pLayerResult,
                char ** papszOptions,
                GDALProgressFunc pfnProgress,
                void * pProgressArg) -> OGRErr

Remove areas that are covered by the method layer.

### Parameters
* **pLayerInput**: the input layer. Should not be NULL.
* **pLayerMethod**: the method layer. Should not be NULL.
* **pLayerResult**: the layer where the features resulting from the operation are inserted. Should not be NULL. See above the note about the schema.
* **papszOptions**: NULL terminated list of options (may be NULL).
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
an error code if there was an error or the execution was interrupted, OGRERR_NONE otherwise.
"""
function ogr_l_erase(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Erase, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OGR_DS_Destroy(OGRDataSourceH) -> void

Closes opened datasource and releases allocated resources.

### Parameters
* **hDS**: handle to allocated datasource object.
"""
function ogr_ds_destroy(arg1)
    aftercare(ccall((:OGR_DS_Destroy, libgdal), Cvoid, (OGRDataSourceH,), arg1))
end

"""
    OGR_DS_GetName(OGRDataSourceH) -> const char *

Returns the name of the data source.

### Parameters
* **hDS**: handle to the data source to get the name from.

### Returns
pointer to an internal name string which should not be modified or freed by the caller.
"""
function ogr_ds_getname(arg1)
    aftercare(ccall((:OGR_DS_GetName, libgdal), Cstring, (OGRDataSourceH,), arg1), false)
end

"""
    OGR_DS_GetLayerCount(OGRDataSourceH) -> int

Get the number of layers in this data source.

### Parameters
* **hDS**: handle to the data source from which to get the number of layers.

### Returns
layer count.
"""
function ogr_ds_getlayercount(arg1)
    aftercare(ccall((:OGR_DS_GetLayerCount, libgdal), Cint, (OGRDataSourceH,), arg1))
end

"""
    OGR_DS_GetLayer(OGRDataSourceH,
                    int) -> OGRLayerH

Fetch a layer by index.

### Parameters
* **hDS**: handle to the data source from which to get the layer.
* **iLayer**: a layer number between 0 and OGR_DS_GetLayerCount()-1.

### Returns
a handle to the layer, or NULL if iLayer is out of range or an error occurs.
"""
function ogr_ds_getlayer(arg1, arg2)
    aftercare(ccall((:OGR_DS_GetLayer, libgdal), OGRLayerH, (OGRDataSourceH, Cint), arg1, arg2))
end

"""
    OGR_DS_GetLayerByName(OGRDataSourceH,
                          const char *) -> OGRLayerH

Fetch a layer by name.

### Parameters
* **hDS**: handle to the data source from which to get the layer.
* **pszLayerName**: Layer the layer name of the layer to fetch.

### Returns
a handle to the layer, or NULL if the layer is not found or an error occurs.
"""
function ogr_ds_getlayerbyname(arg1, arg2)
    aftercare(ccall((:OGR_DS_GetLayerByName, libgdal), OGRLayerH, (OGRDataSourceH, Cstring), arg1, arg2))
end

"""
    OGR_DS_DeleteLayer(OGRDataSourceH,
                       int) -> OGRErr

Delete the indicated layer from the datasource.

### Parameters
* **hDS**: handle to the datasource
* **iLayer**: the index of the layer to delete.

### Returns
OGRERR_NONE on success, or OGRERR_UNSUPPORTED_OPERATION if deleting layers is not supported for this datasource.
"""
function ogr_ds_deletelayer(arg1, arg2)
    aftercare(ccall((:OGR_DS_DeleteLayer, libgdal), OGRErr, (OGRDataSourceH, Cint), arg1, arg2))
end

"""
    OGR_DS_GetDriver(OGRDataSourceH) -> OGRSFDriverH

Returns the driver that the dataset was opened with.

### Parameters
* **hDS**: handle to the datasource

### Returns
NULL if driver info is not available, or pointer to a driver owned by the OGRSFDriverManager.
"""
function ogr_ds_getdriver(arg1)
    aftercare(ccall((:OGR_DS_GetDriver, libgdal), OGRSFDriverH, (OGRDataSourceH,), arg1))
end

"""
    OGR_DS_CreateLayer(OGRDataSourceH,
                       const char *,
                       OGRSpatialReferenceH,
                       OGRwkbGeometryType,
                       char **) -> OGRLayerH

This function attempts to create a new layer on the data source with the indicated name, coordinate system, geometry type.

### Parameters
* **hDS**: The dataset handle.
* **pszName**: the name for the new layer. This should ideally not match any existing layer on the datasource.
* **hSpatialRef**: handle to the coordinate system to use for the new layer, or NULL if no coordinate system is available. The driver might only increase the reference counter of the object to take ownership, and not make a full copy, so do not use OSRDestroySpatialReference(), but OSRRelease() instead when you are done with the object.
* **eType**: the geometry type for the layer. Use wkbUnknown if there are no constraints on the types geometry to be written.
* **papszOptions**: a StringList of name=value options. Options are driver specific, and driver information can be found at the following url: http://www.gdal.org/ogr_formats.html

### Returns
NULL is returned on failure, or a new OGRLayer handle on success.
"""
function ogr_ds_createlayer(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OGR_DS_CreateLayer, libgdal), OGRLayerH, (OGRDataSourceH, Cstring, OGRSpatialReferenceH, OGRwkbGeometryType, Ptr{Cstring}), arg1, arg2, arg3, arg4, arg5))
end

"""
    OGR_DS_CopyLayer(OGRDataSourceH,
                     OGRLayerH,
                     const char *,
                     char **) -> OGRLayerH

Duplicate an existing layer.

### Parameters
* **hDS**: handle to the data source where to create the new layer
* **hSrcLayer**: handle to the source layer.
* **pszNewName**: the name of the layer to create.
* **papszOptions**: a StringList of name=value options. Options are driver specific.

### Returns
a handle to the layer, or NULL if an error occurs.
"""
function ogr_ds_copylayer(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_DS_CopyLayer, libgdal), OGRLayerH, (OGRDataSourceH, OGRLayerH, Cstring, Ptr{Cstring}), arg1, arg2, arg3, arg4))
end

"""
    OGR_DS_TestCapability(OGRDataSourceH,
                          const char *) -> int

Test if capability is available.

### Parameters
* **hDS**: handle to the data source against which to test the capability.
* **pszCapability**: the capability to test.

### Returns
TRUE if capability available otherwise FALSE.
"""
function ogr_ds_testcapability(arg1, arg2)
    aftercare(ccall((:OGR_DS_TestCapability, libgdal), Cint, (OGRDataSourceH, Cstring), arg1, arg2))
end

"""
    OGR_DS_ExecuteSQL(OGRDataSourceH,
                      const char *,
                      OGRGeometryH,
                      const char *) -> OGRLayerH

Execute an SQL statement against the data store.

### Parameters
* **hDS**: handle to the data source on which the SQL query is executed.
* **pszStatement**: the SQL statement to execute.
* **hSpatialFilter**: handle to a geometry which represents a spatial filter. Can be NULL.
* **pszDialect**: allows control of the statement dialect. If set to NULL, the OGR SQL engine will be used, except for RDBMS drivers that will use their dedicated SQL engine, unless OGRSQL is explicitly passed as the dialect. The SQLITE dialect can also be used.

### Returns
a handle to a OGRLayer containing the results of the query. Deallocate with OGR_DS_ReleaseResultSet().
"""
function ogr_ds_executesql(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_DS_ExecuteSQL, libgdal), OGRLayerH, (OGRDataSourceH, Cstring, OGRGeometryH, Cstring), arg1, arg2, arg3, arg4))
end

"""
    OGR_DS_ReleaseResultSet(OGRDataSourceH,
                            OGRLayerH) -> void

Release results of OGR_DS_ExecuteSQL().

### Parameters
* **hDS**: a handle to the data source on which was executed an SQL query.
* **hLayer**: handle to the result of a previous OGR_DS_ExecuteSQL() call.
"""
function ogr_ds_releaseresultset(arg1, arg2)
    aftercare(ccall((:OGR_DS_ReleaseResultSet, libgdal), Cvoid, (OGRDataSourceH, OGRLayerH), arg1, arg2))
end

"""
    ogr_ds_reference(arg1)

Doxygen\\_Suppress 
"""
function ogr_ds_reference(arg1)
    aftercare(ccall((:OGR_DS_Reference, libgdal), Cint, (OGRDataSourceH,), arg1))
end

"""
    OGR_DS_Dereference(OGRDataSourceH hDataSource) -> int
"""
function ogr_ds_dereference(arg1)
    aftercare(ccall((:OGR_DS_Dereference, libgdal), Cint, (OGRDataSourceH,), arg1))
end

"""
    OGR_DS_GetRefCount(OGRDataSourceH hDataSource) -> int
"""
function ogr_ds_getrefcount(arg1)
    aftercare(ccall((:OGR_DS_GetRefCount, libgdal), Cint, (OGRDataSourceH,), arg1))
end

"""
    OGR_DS_GetSummaryRefCount(OGRDataSourceH hDataSource) -> int
"""
function ogr_ds_getsummaryrefcount(arg1)
    aftercare(ccall((:OGR_DS_GetSummaryRefCount, libgdal), Cint, (OGRDataSourceH,), arg1))
end

"""
    ogr_ds_synctodisk(arg1)



Flush pending changes to disk. See GDALDataset::FlushCache() 
"""
function ogr_ds_synctodisk(arg1)
    aftercare(ccall((:OGR_DS_SyncToDisk, libgdal), OGRErr, (OGRDataSourceH,), arg1))
end

"""
    ogr_ds_getstyletable(arg1)

Get style table 
"""
function ogr_ds_getstyletable(arg1)
    aftercare(ccall((:OGR_DS_GetStyleTable, libgdal), OGRStyleTableH, (OGRDataSourceH,), arg1))
end

"""
    ogr_ds_setstyletabledirectly(arg1, arg2)

Set style table (and take ownership) 
"""
function ogr_ds_setstyletabledirectly(arg1, arg2)
    aftercare(ccall((:OGR_DS_SetStyleTableDirectly, libgdal), Cvoid, (OGRDataSourceH, OGRStyleTableH), arg1, arg2))
end

"""
    ogr_ds_setstyletable(arg1, arg2)

Set style table 
"""
function ogr_ds_setstyletable(arg1, arg2)
    aftercare(ccall((:OGR_DS_SetStyleTable, libgdal), Cvoid, (OGRDataSourceH, OGRStyleTableH), arg1, arg2))
end

"""
    OGR_Dr_GetName(OGRSFDriverH) -> const char *

Fetch name of driver (file format). This name should be relatively short (10-40 characters), and should reflect the underlying file format. For instance "ESRI Shapefile".

### Parameters
* **hDriver**: handle to the driver to get the name from.

### Returns
driver name. This is an internal string and should not be modified or freed.
"""
function ogr_dr_getname(arg1)
    aftercare(ccall((:OGR_Dr_GetName, libgdal), Cstring, (OGRSFDriverH,), arg1), false)
end

"""
    OGR_Dr_Open(OGRSFDriverH,
                const char *,
                int) -> OGRDataSourceH

Attempt to open file with this driver.

### Parameters
* **hDriver**: handle to the driver that is used to open file.
* **pszName**: the name of the file, or data source to try and open.
* **bUpdate**: TRUE if update access is required, otherwise FALSE (the default).

### Returns
NULL on error or if the pass name is not supported by this driver, otherwise a handle to a GDALDataset. This GDALDataset should be closed by deleting the object when it is no longer needed.
"""
function ogr_dr_open(arg1, arg2, arg3)
    aftercare(ccall((:OGR_Dr_Open, libgdal), OGRDataSourceH, (OGRSFDriverH, Cstring, Cint), arg1, arg2, arg3))
end

"""
    OGR_Dr_TestCapability(OGRSFDriverH,
                          const char *) -> int

Test if capability is available.

### Parameters
* **hDriver**: handle to the driver to test the capability against.
* **pszCap**: the capability to test.

### Returns
TRUE if capability available otherwise FALSE.
"""
function ogr_dr_testcapability(arg1, arg2)
    aftercare(ccall((:OGR_Dr_TestCapability, libgdal), Cint, (OGRSFDriverH, Cstring), arg1, arg2))
end

"""
    OGR_Dr_CreateDataSource(OGRSFDriverH,
                            const char *,
                            char **) -> OGRDataSourceH

This function attempts to create a new data source based on the passed driver.

### Parameters
* **hDriver**: handle to the driver on which data source creation is based.
* **pszName**: the name for the new data source. UTF-8 encoded.
* **papszOptions**: a StringList of name=value options. Options are driver specific, and driver information can be found at the following url: http://www.gdal.org/ogr_formats.html

### Returns
NULL is returned on failure, or a new OGRDataSource handle on success.
"""
function ogr_dr_createdatasource(arg1, arg2, arg3)
    aftercare(ccall((:OGR_Dr_CreateDataSource, libgdal), OGRDataSourceH, (OGRSFDriverH, Cstring, Ptr{Cstring}), arg1, arg2, arg3))
end

"""
    OGR_Dr_CopyDataSource(OGRSFDriverH,
                          OGRDataSourceH,
                          const char *,
                          char **) -> OGRDataSourceH

This function creates a new datasource by copying all the layers from the source datasource.

### Parameters
* **hDriver**: handle to the driver on which data source creation is based.
* **hSrcDS**: source datasource
* **pszNewName**: the name for the new data source.
* **papszOptions**: a StringList of name=value options. Options are driver specific, and driver information can be found at the following url: http://www.gdal.org/ogr_formats.html

### Returns
NULL is returned on failure, or a new OGRDataSource handle on success.
"""
function ogr_dr_copydatasource(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_Dr_CopyDataSource, libgdal), OGRDataSourceH, (OGRSFDriverH, OGRDataSourceH, Cstring, Ptr{Cstring}), arg1, arg2, arg3, arg4))
end

"""
    OGR_Dr_DeleteDataSource(OGRSFDriverH,
                            const char *) -> OGRErr

Delete a datasource.

### Parameters
* **hDriver**: handle to the driver on which data source deletion is based.
* **pszDataSource**: the name of the datasource to delete.

### Returns
OGRERR_NONE on success, and OGRERR_UNSUPPORTED_OPERATION if this is not supported by this driver.
"""
function ogr_dr_deletedatasource(arg1, arg2)
    aftercare(ccall((:OGR_Dr_DeleteDataSource, libgdal), OGRErr, (OGRSFDriverH, Cstring), arg1, arg2))
end

"""
    OGROpen(const char *,
            int,
            OGRSFDriverH *) -> OGRDataSourceH

Open a file / data source with one of the registered drivers.

### Parameters
* **pszName**: the name of the file, or data source to open.
* **bUpdate**: FALSE for read-only access (the default) or TRUE for read-write access.
* **pahDriverList**: if non-NULL, this argument will be updated with a pointer to the driver which was used to open the data source.

### Returns
NULL on error or if the pass name is not supported by this driver, otherwise a handle to a GDALDataset. This GDALDataset should be closed by deleting the object when it is no longer needed.
"""
function ogropen(arg1, arg2, arg3)
    aftercare(ccall((:OGROpen, libgdal), OGRDataSourceH, (Cstring, Cint, Ptr{OGRSFDriverH}), arg1, arg2, arg3))
end

"""
    OGROpenShared(const char *,
                  int,
                  OGRSFDriverH *) -> OGRDataSourceH

Open a file / data source with one of the registered drivers if not already opened, or increment reference count of already opened data source previously opened with OGROpenShared()

### Parameters
* **pszName**: the name of the file, or data source to open.
* **bUpdate**: FALSE for read-only access (the default) or TRUE for read-write access.
* **pahDriverList**: if non-NULL, this argument will be updated with a pointer to the driver which was used to open the data source.

### Returns
NULL on error or if the pass name is not supported by this driver, otherwise a handle to a GDALDataset. This GDALDataset should be closed by deleting the object when it is no longer needed.
"""
function ogropenshared(arg1, arg2, arg3)
    aftercare(ccall((:OGROpenShared, libgdal), OGRDataSourceH, (Cstring, Cint, Ptr{OGRSFDriverH}), arg1, arg2, arg3))
end

"""
    OGRReleaseDataSource(OGRDataSourceH) -> OGRErr

Drop a reference to this datasource, and if the reference count drops to zero close (destroy) the datasource.

### Parameters
* **hDS**: handle to the data source to release

### Returns
OGRERR_NONE on success or an error code.
"""
function ogrreleasedatasource(arg1)
    aftercare(ccall((:OGRReleaseDataSource, libgdal), OGRErr, (OGRDataSourceH,), arg1))
end

"""
    ogrregisterdriver(arg1)

Doxygen\\_Suppress 
"""
function ogrregisterdriver(arg1)
    aftercare(ccall((:OGRRegisterDriver, libgdal), Cvoid, (OGRSFDriverH,), arg1))
end

function ogrderegisterdriver(arg1)
    aftercare(ccall((:OGRDeregisterDriver, libgdal), Cvoid, (OGRSFDriverH,), arg1))
end

"""
    OGRGetDriverCount(void) -> int

Fetch the number of registered drivers.

### Returns
the drivers count.
"""
function ogrgetdrivercount()
    aftercare(ccall((:OGRGetDriverCount, libgdal), Cint, ()))
end

"""
    OGRGetDriver(int) -> OGRSFDriverH

Fetch the indicated driver.

### Parameters
* **iDriver**: the driver index, from 0 to GetDriverCount()-1.

### Returns
handle to the driver, or NULL if iDriver is out of range.
"""
function ogrgetdriver(arg1)
    aftercare(ccall((:OGRGetDriver, libgdal), OGRSFDriverH, (Cint,), arg1))
end

"""
    OGRGetDriverByName(const char *) -> OGRSFDriverH

Fetch the indicated driver.

### Parameters
* **pszName**: the driver name

### Returns
the driver, or NULL if no driver with that name is found
"""
function ogrgetdriverbyname(arg1)
    aftercare(ccall((:OGRGetDriverByName, libgdal), OGRSFDriverH, (Cstring,), arg1))
end

"""
    ogrgetopendscount()

Doxygen\\_Suppress 
"""
function ogrgetopendscount()
    aftercare(ccall((:OGRGetOpenDSCount, libgdal), Cint, ()))
end

function ogrgetopends(iDS)
    aftercare(ccall((:OGRGetOpenDS, libgdal), OGRDataSourceH, (Cint,), iDS))
end

"""
    OGRRegisterAll(void) -> void

Register all drivers.
"""
function ogrregisterall()
    aftercare(ccall((:OGRRegisterAll, libgdal), Cvoid, ()))
end

"""
    ogrcleanupall()

Clean-up all drivers (including raster ones starting with GDAL 2.0. See [`GDALDestroyDriverManager`](@ref)() 
"""
function ogrcleanupall()
    aftercare(ccall((:OGRCleanupAll, libgdal), Cvoid, ()))
end

"Style manager opaque type "
const OGRStyleMgrH = Ptr{Cvoid}

"Style tool opaque type "
const OGRStyleToolH = Ptr{Cvoid}

"""
    OGR_SM_Create(OGRStyleTableH hStyleTable) -> OGRStyleMgrH

OGRStyleMgr factory.

### Parameters
* **hStyleTable**: pointer to OGRStyleTable or NULL if not working with a style table.

### Returns
a handle to the new style manager object.
"""
function ogr_sm_create(hStyleTable)
    aftercare(ccall((:OGR_SM_Create, libgdal), OGRStyleMgrH, (OGRStyleTableH,), hStyleTable))
end

"""
    OGR_SM_Destroy(OGRStyleMgrH hSM) -> void

Destroy Style Manager.

### Parameters
* **hSM**: handle to the style manager to destroy.
"""
function ogr_sm_destroy(hSM)
    aftercare(ccall((:OGR_SM_Destroy, libgdal), Cvoid, (OGRStyleMgrH,), hSM))
end

"""
    OGR_SM_InitFromFeature(OGRStyleMgrH hSM,
                           OGRFeatureH hFeat) -> const char *

Initialize style manager from the style string of a feature.

### Parameters
* **hSM**: handle to the style manager.
* **hFeat**: handle to the new feature from which to read the style.

### Returns
a reference to the style string read from the feature, or NULL in case of error.
"""
function ogr_sm_initfromfeature(hSM, hFeat)
    aftercare(ccall((:OGR_SM_InitFromFeature, libgdal), Cstring, (OGRStyleMgrH, OGRFeatureH), hSM, hFeat), false)
end

"""
    OGR_SM_InitStyleString(OGRStyleMgrH hSM,
                           const char * pszStyleString) -> int

Initialize style manager from the style string.

### Parameters
* **hSM**: handle to the style manager.
* **pszStyleString**: the style string to use (can be NULL).

### Returns
TRUE on success, FALSE on errors.
"""
function ogr_sm_initstylestring(hSM, pszStyleString)
    aftercare(ccall((:OGR_SM_InitStyleString, libgdal), Cint, (OGRStyleMgrH, Cstring), hSM, pszStyleString))
end

"""
    OGR_SM_GetPartCount(OGRStyleMgrH hSM,
                        const char * pszStyleString) -> int

Get the number of parts in a style.

### Parameters
* **hSM**: handle to the style manager.
* **pszStyleString**: (optional) the style string on which to operate. If NULL then the current style string stored in the style manager is used.

### Returns
the number of parts (style tools) in the style.
"""
function ogr_sm_getpartcount(hSM, pszStyleString)
    aftercare(ccall((:OGR_SM_GetPartCount, libgdal), Cint, (OGRStyleMgrH, Cstring), hSM, pszStyleString))
end

"""
    OGR_SM_GetPart(OGRStyleMgrH hSM,
                   int nPartId,
                   const char * pszStyleString) -> OGRStyleToolH

Fetch a part (style tool) from the current style.

### Parameters
* **hSM**: handle to the style manager.
* **nPartId**: the part number (0-based index).
* **pszStyleString**: (optional) the style string on which to operate. If NULL then the current style string stored in the style manager is used.

### Returns
OGRStyleToolH of the requested part (style tools) or NULL on error.
"""
function ogr_sm_getpart(hSM, nPartId, pszStyleString)
    aftercare(ccall((:OGR_SM_GetPart, libgdal), OGRStyleToolH, (OGRStyleMgrH, Cint, Cstring), hSM, nPartId, pszStyleString))
end

"""
    OGR_SM_AddPart(OGRStyleMgrH hSM,
                   OGRStyleToolH hST) -> int

Add a part (style tool) to the current style.

### Parameters
* **hSM**: handle to the style manager.
* **hST**: the style tool defining the part to add.

### Returns
TRUE on success, FALSE on errors.
"""
function ogr_sm_addpart(hSM, hST)
    aftercare(ccall((:OGR_SM_AddPart, libgdal), Cint, (OGRStyleMgrH, OGRStyleToolH), hSM, hST))
end

"""
    OGR_SM_AddStyle(OGRStyleMgrH hSM,
                    const char * pszStyleName,
                    const char * pszStyleString) -> int

Add a style to the current style table.

### Parameters
* **hSM**: handle to the style manager.
* **pszStyleName**: the name of the style to add.
* **pszStyleString**: the style string to use, or NULL to use the style stored in the manager.

### Returns
TRUE on success, FALSE on errors.
"""
function ogr_sm_addstyle(hSM, pszStyleName, pszStyleString)
    aftercare(ccall((:OGR_SM_AddStyle, libgdal), Cint, (OGRStyleMgrH, Cstring, Cstring), hSM, pszStyleName, pszStyleString))
end

"""
    ogr_style_tool_class_id

OGRStyleTool derived class types (returned by GetType()).

| Enumerator   | Note     |
| :----------- | :------- |
| OGRSTCNone   | None     |
| OGRSTCPen    | Pen      |
| OGRSTCBrush  | Brush    |
| OGRSTCSymbol | Symbol   |
| OGRSTCLabel  | Label    |
| OGRSTCVector | Vector   |
"""
@cenum ogr_style_tool_class_id::UInt32 begin
        OGRSTCNone = 0
        OGRSTCPen = 1
        OGRSTCBrush = 2
        OGRSTCSymbol = 3
        OGRSTCLabel = 4
        OGRSTCVector = 5
    end

"OGRStyleTool derived class types (returned by GetType())"
const OGRSTClassId = ogr_style_tool_class_id

"""
    OGR_ST_Create(OGRSTClassId eClassId) -> OGRStyleToolH

OGRStyleTool factory.

### Parameters
* **eClassId**: subclass of style tool to create. One of OGRSTCPen (1), OGRSTCBrush (2), OGRSTCSymbol (3) or OGRSTCLabel (4).

### Returns
a handle to the new style tool object or NULL if the creation failed.
"""
function ogr_st_create(eClassId)
    aftercare(ccall((:OGR_ST_Create, libgdal), OGRStyleToolH, (OGRSTClassId,), eClassId))
end

"""
    OGR_ST_Destroy(OGRStyleToolH hST) -> void

Destroy Style Tool.

### Parameters
* **hST**: handle to the style tool to destroy.
"""
function ogr_st_destroy(hST)
    aftercare(ccall((:OGR_ST_Destroy, libgdal), Cvoid, (OGRStyleToolH,), hST))
end

"""
    OGR_ST_GetType(OGRStyleToolH hST) -> OGRSTClassId

Determine type of Style Tool.

### Parameters
* **hST**: handle to the style tool.

### Returns
the style tool type, one of OGRSTCPen (1), OGRSTCBrush (2), OGRSTCSymbol (3) or OGRSTCLabel (4). Returns OGRSTCNone (0) if the OGRStyleToolH is invalid.
"""
function ogr_st_gettype(hST)
    aftercare(ccall((:OGR_ST_GetType, libgdal), OGRSTClassId, (OGRStyleToolH,), hST))
end

"""
    ogr_style_tool_units_id

List of units supported by OGRStyleTools.

| Enumerator   | Note          |
| :----------- | :------------ |
| OGRSTUGround | Ground unit   |
| OGRSTUPixel  | Pixel         |
| OGRSTUPoints | Points        |
| OGRSTUMM     | Millimeter    |
| OGRSTUCM     | Centimeter    |
| OGRSTUInches | Inch          |
"""
@cenum ogr_style_tool_units_id::UInt32 begin
        OGRSTUGround = 0
        OGRSTUPixel = 1
        OGRSTUPoints = 2
        OGRSTUMM = 3
        OGRSTUCM = 4
        OGRSTUInches = 5
    end

"List of units supported by OGRStyleTools"
const OGRSTUnitId = ogr_style_tool_units_id

"""
    OGR_ST_GetUnit(OGRStyleToolH hST) -> OGRSTUnitId

Get Style Tool units.

### Parameters
* **hST**: handle to the style tool.

### Returns
the style tool units.
"""
function ogr_st_getunit(hST)
    aftercare(ccall((:OGR_ST_GetUnit, libgdal), OGRSTUnitId, (OGRStyleToolH,), hST))
end

"""
    OGR_ST_SetUnit(OGRStyleToolH hST,
                   OGRSTUnitId eUnit,
                   double dfGroundPaperScale) -> void

Set Style Tool units.

### Parameters
* **hST**: handle to the style tool.
* **eUnit**: the new unit.
* **dfGroundPaperScale**: ground to paper scale factor.
"""
function ogr_st_setunit(hST, eUnit, dfGroundPaperScale)
    aftercare(ccall((:OGR_ST_SetUnit, libgdal), Cvoid, (OGRStyleToolH, OGRSTUnitId, Cdouble), hST, eUnit, dfGroundPaperScale))
end

"""
    OGR_ST_GetParamStr(OGRStyleToolH hST,
                       int eParam,
                       int * bValueIsNull) -> const char *

Get Style Tool parameter value as string.

### Parameters
* **hST**: handle to the style tool.
* **eParam**: the parameter id from the enumeration corresponding to the type of this style tool (one of the OGRSTPenParam, OGRSTBrushParam, OGRSTSymbolParam or OGRSTLabelParam enumerations)
* **bValueIsNull**: pointer to an integer that will be set to TRUE or FALSE to indicate whether the parameter value is NULL.

### Returns
the parameter value as string and sets bValueIsNull.
"""
function ogr_st_getparamstr(hST, eParam, bValueIsNull)
    aftercare(ccall((:OGR_ST_GetParamStr, libgdal), Cstring, (OGRStyleToolH, Cint, Ptr{Cint}), hST, eParam, bValueIsNull), false)
end

"""
    OGR_ST_GetParamNum(OGRStyleToolH hST,
                       int eParam,
                       int * bValueIsNull) -> int

Get Style Tool parameter value as an integer.

### Parameters
* **hST**: handle to the style tool.
* **eParam**: the parameter id from the enumeration corresponding to the type of this style tool (one of the OGRSTPenParam, OGRSTBrushParam, OGRSTSymbolParam or OGRSTLabelParam enumerations)
* **bValueIsNull**: pointer to an integer that will be set to TRUE or FALSE to indicate whether the parameter value is NULL.

### Returns
the parameter value as integer and sets bValueIsNull.
"""
function ogr_st_getparamnum(hST, eParam, bValueIsNull)
    aftercare(ccall((:OGR_ST_GetParamNum, libgdal), Cint, (OGRStyleToolH, Cint, Ptr{Cint}), hST, eParam, bValueIsNull))
end

"""
    OGR_ST_GetParamDbl(OGRStyleToolH hST,
                       int eParam,
                       int * bValueIsNull) -> double

Get Style Tool parameter value as a double.

### Parameters
* **hST**: handle to the style tool.
* **eParam**: the parameter id from the enumeration corresponding to the type of this style tool (one of the OGRSTPenParam, OGRSTBrushParam, OGRSTSymbolParam or OGRSTLabelParam enumerations)
* **bValueIsNull**: pointer to an integer that will be set to TRUE or FALSE to indicate whether the parameter value is NULL.

### Returns
the parameter value as double and sets bValueIsNull.
"""
function ogr_st_getparamdbl(hST, eParam, bValueIsNull)
    aftercare(ccall((:OGR_ST_GetParamDbl, libgdal), Cdouble, (OGRStyleToolH, Cint, Ptr{Cint}), hST, eParam, bValueIsNull))
end

"""
    OGR_ST_SetParamStr(OGRStyleToolH hST,
                       int eParam,
                       const char * pszValue) -> void

Set Style Tool parameter value from a string.

### Parameters
* **hST**: handle to the style tool.
* **eParam**: the parameter id from the enumeration corresponding to the type of this style tool (one of the OGRSTPenParam, OGRSTBrushParam, OGRSTSymbolParam or OGRSTLabelParam enumerations)
* **pszValue**: the new parameter value
"""
function ogr_st_setparamstr(hST, eParam, pszValue)
    aftercare(ccall((:OGR_ST_SetParamStr, libgdal), Cvoid, (OGRStyleToolH, Cint, Cstring), hST, eParam, pszValue))
end

"""
    OGR_ST_SetParamNum(OGRStyleToolH hST,
                       int eParam,
                       int nValue) -> void

Set Style Tool parameter value from an integer.

### Parameters
* **hST**: handle to the style tool.
* **eParam**: the parameter id from the enumeration corresponding to the type of this style tool (one of the OGRSTPenParam, OGRSTBrushParam, OGRSTSymbolParam or OGRSTLabelParam enumerations)
* **nValue**: the new parameter value
"""
function ogr_st_setparamnum(hST, eParam, nValue)
    aftercare(ccall((:OGR_ST_SetParamNum, libgdal), Cvoid, (OGRStyleToolH, Cint, Cint), hST, eParam, nValue))
end

"""
    OGR_ST_SetParamDbl(OGRStyleToolH hST,
                       int eParam,
                       double dfValue) -> void

Set Style Tool parameter value from a double.

### Parameters
* **hST**: handle to the style tool.
* **eParam**: the parameter id from the enumeration corresponding to the type of this style tool (one of the OGRSTPenParam, OGRSTBrushParam, OGRSTSymbolParam or OGRSTLabelParam enumerations)
* **dfValue**: the new parameter value
"""
function ogr_st_setparamdbl(hST, eParam, dfValue)
    aftercare(ccall((:OGR_ST_SetParamDbl, libgdal), Cvoid, (OGRStyleToolH, Cint, Cdouble), hST, eParam, dfValue))
end

"""
    OGR_ST_GetStyleString(OGRStyleToolH hST) -> const char *

Get the style string for this Style Tool.

### Parameters
* **hST**: handle to the style tool.

### Returns
the style string for this style tool or "" if the hST is invalid.
"""
function ogr_st_getstylestring(hST)
    aftercare(ccall((:OGR_ST_GetStyleString, libgdal), Cstring, (OGRStyleToolH,), hST), false)
end

"""
    OGR_ST_GetRGBFromString(OGRStyleToolH hST,
                            const char * pszColor,
                            int * pnRed,
                            int * pnGreen,
                            int * pnBlue,
                            int * pnAlpha) -> int

Return the r,g,b,a components of a color encoded in #RRGGBB[AA] format.

### Parameters
* **hST**: handle to the style tool.
* **pszColor**: the color to parse
* **pnRed**: pointer to an int in which the red value will be returned
* **pnGreen**: pointer to an int in which the green value will be returned
* **pnBlue**: pointer to an int in which the blue value will be returned
* **pnAlpha**: pointer to an int in which the (optional) alpha value will be returned

### Returns
TRUE if the color could be successfully parsed, or FALSE in case of errors.
"""
function ogr_st_getrgbfromstring(hST, pszColor, pnRed, pnGreen, pnBlue, pnAlpha)
    aftercare(ccall((:OGR_ST_GetRGBFromString, libgdal), Cint, (OGRStyleToolH, Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), hST, pszColor, pnRed, pnGreen, pnBlue, pnAlpha))
end

"""
    OGR_STBL_Create(void) -> OGRStyleTableH

OGRStyleTable factory.

### Returns
a handle to the new style table object.
"""
function ogr_stbl_create()
    aftercare(ccall((:OGR_STBL_Create, libgdal), OGRStyleTableH, ()))
end

"""
    OGR_STBL_Destroy(OGRStyleTableH hSTBL) -> void

Destroy Style Table.

### Parameters
* **hSTBL**: handle to the style table to destroy.
"""
function ogr_stbl_destroy(hSTBL)
    aftercare(ccall((:OGR_STBL_Destroy, libgdal), Cvoid, (OGRStyleTableH,), hSTBL))
end

"""
    OGR_STBL_AddStyle(OGRStyleTableH hStyleTable,
                      const char * pszName,
                      const char * pszStyleString) -> int

Add a new style in the table.

### Parameters
* **hStyleTable**: handle to the style table.
* **pszName**: the name the style to add.
* **pszStyleString**: the style string to add.

### Returns
TRUE on success, FALSE on error
"""
function ogr_stbl_addstyle(hStyleTable, pszName, pszStyleString)
    aftercare(ccall((:OGR_STBL_AddStyle, libgdal), Cint, (OGRStyleTableH, Cstring, Cstring), hStyleTable, pszName, pszStyleString))
end

"""
    OGR_STBL_SaveStyleTable(OGRStyleTableH hStyleTable,
                            const char * pszFilename) -> int

Save a style table to a file.

### Parameters
* **hStyleTable**: handle to the style table.
* **pszFilename**: the name of the file to save to.

### Returns
TRUE on success, FALSE on error
"""
function ogr_stbl_savestyletable(hStyleTable, pszFilename)
    aftercare(ccall((:OGR_STBL_SaveStyleTable, libgdal), Cint, (OGRStyleTableH, Cstring), hStyleTable, pszFilename))
end

"""
    OGR_STBL_LoadStyleTable(OGRStyleTableH hStyleTable,
                            const char * pszFilename) -> int

Load a style table from a file.

### Parameters
* **hStyleTable**: handle to the style table.
* **pszFilename**: the name of the file to load from.

### Returns
TRUE on success, FALSE on error
"""
function ogr_stbl_loadstyletable(hStyleTable, pszFilename)
    aftercare(ccall((:OGR_STBL_LoadStyleTable, libgdal), Cint, (OGRStyleTableH, Cstring), hStyleTable, pszFilename))
end

"""
    OGR_STBL_Find(OGRStyleTableH hStyleTable,
                  const char * pszName) -> const char *

Get a style string by name.

### Parameters
* **hStyleTable**: handle to the style table.
* **pszName**: the name of the style string to find.

### Returns
the style string matching the name or NULL if not found or error.
"""
function ogr_stbl_find(hStyleTable, pszName)
    aftercare(ccall((:OGR_STBL_Find, libgdal), Cstring, (OGRStyleTableH, Cstring), hStyleTable, pszName), false)
end

"""
    OGR_STBL_ResetStyleStringReading(OGRStyleTableH hStyleTable) -> void

Reset the next style pointer to 0.

### Parameters
* **hStyleTable**: handle to the style table.
"""
function ogr_stbl_resetstylestringreading(hStyleTable)
    aftercare(ccall((:OGR_STBL_ResetStyleStringReading, libgdal), Cvoid, (OGRStyleTableH,), hStyleTable))
end

"""
    OGR_STBL_GetNextStyle(OGRStyleTableH hStyleTable) -> const char *

Get the next style string from the table.

### Parameters
* **hStyleTable**: handle to the style table.

### Returns
the next style string or NULL on error.
"""
function ogr_stbl_getnextstyle(hStyleTable)
    aftercare(ccall((:OGR_STBL_GetNextStyle, libgdal), Cstring, (OGRStyleTableH,), hStyleTable), false)
end

"""
    OGR_STBL_GetLastStyleName(OGRStyleTableH hStyleTable) -> const char *

Get the style name of the last style string fetched with OGR_STBL_GetNextStyle.

### Parameters
* **hStyleTable**: handle to the style table.

### Returns
the Name of the last style string or NULL on error.
"""
function ogr_stbl_getlaststylename(hStyleTable)
    aftercare(ccall((:OGR_STBL_GetLastStyleName, libgdal), Cstring, (OGRStyleTableH,), hStyleTable), false)
end

"""
    ogrmalloc(arg1)

Doxygen\\_Suppress 
"""
function ogrmalloc(arg1)
    aftercare(ccall((:OGRMalloc, libgdal), Ptr{Cvoid}, (Csize_t,), arg1))
end

"""
    OGRCalloc(size_t count,
              size_t size) -> void *
"""
function ogrcalloc(arg1, arg2)
    aftercare(ccall((:OGRCalloc, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), arg1, arg2))
end

"""
    OGRRealloc(void * pOld,
               size_t size) -> void *
"""
function ogrrealloc(arg1, arg2)
    aftercare(ccall((:OGRRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t), arg1, arg2))
end

function ogrstrdup(arg1)
    aftercare(ccall((:OGRStrdup, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    OGRFree(void * pMemory) -> void
"""
function ogrfree(arg1)
    aftercare(ccall((:OGRFree, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

"Type for a OGR boolean "
const OGRBoolean = Cint

"""
    OGRwkbVariant

Output variants of WKB we support.

99-402 was a short-lived extension to SFSQL 1.1 that used a high-bit flag to indicate the presence of Z coordinates in a WKB geometry.

SQL/MM Part 3 and SFSQL 1.2 use offsets of 1000 (Z), 2000 (M) and 3000 (ZM) to indicate the present of higher dimensional coordinates in a WKB geometry. Reference: <a href="https://portal.opengeospatial.org/files/?artifact_id=320243"> 09-009\\_Committee\\_Draft\\_ISOIEC\\_CD\\_13249-3\\_SQLMM\\_Spatial.pdf</a>, ISO/IEC JTC 1/SC 32 N 1820, ISO/IEC CD 13249-3:201x(E), Date: 2009-01-16. The codes are also found in §8.2.3 of <a href="http://portal.opengeospatial.org/files/?artifact_id=25355"> OGC 06-103r4 "OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 1: Common architecture", v1.2.1</a>

| Enumerator         | Note                                                                            |
| :----------------- | :------------------------------------------------------------------------------ |
| wkbVariantOldOgc   | Old-style 99-402 extended dimension (Z) WKB types                               |
| wkbVariantIso      | SFSQL 1.2 and ISO SQL/MM Part 3 extended dimension (Z&M) WKB types              |
| wkbVariantPostGIS1 | PostGIS 1.X has different codes for CurvePolygon, MultiCurve and MultiSurface   |
"""
@cenum OGRwkbVariant::UInt32 begin
        wkbVariantOldOgc = 0
        wkbVariantIso = 1
        wkbVariantPostGIS1 = 2
    end

"""
    OGRGeometryTypeToName(OGRwkbGeometryType eType) -> const char *

Fetch a human readable name corresponding to an OGRwkbGeometryType value.

### Parameters
* **eType**: the geometry type.

### Returns
internal human readable string, or NULL on failure.
"""
function ogrgeometrytypetoname(eType)
    aftercare(ccall((:OGRGeometryTypeToName, libgdal), Cstring, (OGRwkbGeometryType,), eType), false)
end

"""
    OGRMergeGeometryTypes(OGRwkbGeometryType eMain,
                          OGRwkbGeometryType eExtra) -> OGRwkbGeometryType

Find common geometry type.

### Parameters
* **eMain**: the first input geometry type.
* **eExtra**: the second input geometry type.

### Returns
the merged geometry type.
"""
function ogrmergegeometrytypes(eMain, eExtra)
    aftercare(ccall((:OGRMergeGeometryTypes, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, OGRwkbGeometryType), eMain, eExtra))
end

"""
    OGRMergeGeometryTypesEx(OGRwkbGeometryType eMain,
                            OGRwkbGeometryType eExtra,
                            int bAllowPromotingToCurves) -> OGRwkbGeometryType

Find common geometry type.

### Parameters
* **eMain**: the first input geometry type.
* **eExtra**: the second input geometry type.
* **bAllowPromotingToCurves**: determine if promotion to curve type must be done.

### Returns
the merged geometry type.
"""
function ogrmergegeometrytypesex(eMain, eExtra, bAllowPromotingToCurves)
    aftercare(ccall((:OGRMergeGeometryTypesEx, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, OGRwkbGeometryType, Cint), eMain, eExtra, bAllowPromotingToCurves))
end

"""
    OGR_GT_Flatten(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the 2D geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
2D geometry type corresponding to the passed geometry type.
"""
function ogr_gt_flatten(eType)
    aftercare(ccall((:OGR_GT_Flatten, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_SetZ(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the 3D geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
3D geometry type corresponding to the passed geometry type.
"""
function ogr_gt_setz(eType)
    aftercare(ccall((:OGR_GT_SetZ, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_SetM(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the measured geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
measured geometry type corresponding to the passed geometry type.
"""
function ogr_gt_setm(eType)
    aftercare(ccall((:OGR_GT_SetM, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_SetModifier(OGRwkbGeometryType eType,
                       int bHasZ,
                       int bHasM) -> OGRwkbGeometryType

Returns a XY, XYZ, XYM or XYZM geometry type depending on parameter.

### Parameters
* **eType**: Input geometry type
* **bHasZ**: TRUE if the output geometry type must be 3D.
* **bHasM**: TRUE if the output geometry type must be measured.

### Returns
Output geometry type.
"""
function ogr_gt_setmodifier(eType, bSetZ, bSetM)
    aftercare(ccall((:OGR_GT_SetModifier, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, Cint, Cint), eType, bSetZ, bSetM))
end

"""
    OGR_GT_HasZ(OGRwkbGeometryType eType) -> int

Return if the geometry type is a 3D geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
TRUE if the geometry type is a 3D geometry type.
"""
function ogr_gt_hasz(eType)
    aftercare(ccall((:OGR_GT_HasZ, libgdal), Cint, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_HasM(OGRwkbGeometryType eType) -> int

Return if the geometry type is a measured type.

### Parameters
* **eType**: Input geometry type

### Returns
TRUE if the geometry type is a measured type.
"""
function ogr_gt_hasm(eType)
    aftercare(ccall((:OGR_GT_HasM, libgdal), Cint, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_IsSubClassOf(OGRwkbGeometryType eType,
                        OGRwkbGeometryType eSuperType) -> int

Returns if a type is a subclass of another one.

### Parameters
* **eType**: Type.
* **eSuperType**: Super type

### Returns
TRUE if eType is a subclass of eSuperType.
"""
function ogr_gt_issubclassof(eType, eSuperType)
    aftercare(ccall((:OGR_GT_IsSubClassOf, libgdal), Cint, (OGRwkbGeometryType, OGRwkbGeometryType), eType, eSuperType))
end

"""
    OGR_GT_IsCurve(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is an instance of Curve.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is an instance of Curve
"""
function ogr_gt_iscurve(arg1)
    aftercare(ccall((:OGR_GT_IsCurve, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

"""
    OGR_GT_IsSurface(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is an instance of Surface.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is an instance of Surface
"""
function ogr_gt_issurface(arg1)
    aftercare(ccall((:OGR_GT_IsSurface, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

"""
    OGR_GT_IsNonLinear(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is a non-linear geometry type.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is a non-linear geometry type.
"""
function ogr_gt_isnonlinear(arg1)
    aftercare(ccall((:OGR_GT_IsNonLinear, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

"""
    OGR_GT_GetCollection(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the collection type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the collection type that can contain the passed geometry type or wkbUnknown
"""
function ogr_gt_getcollection(eType)
    aftercare(ccall((:OGR_GT_GetCollection, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_GetCurve(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the curve geometry type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the curve type that can contain the passed geometry type
"""
function ogr_gt_getcurve(eType)
    aftercare(ccall((:OGR_GT_GetCurve, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_GetLinear(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the non-curve geometry type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the non-curve type that can contain the passed geometry type
"""
function ogr_gt_getlinear(eType)
    aftercare(ccall((:OGR_GT_GetLinear, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGRParseDate(const char * pszInput,
                 OGRField * psField,
                 int nOptions) -> int

Parse date string.

### Parameters
* **pszInput**: the input date string.
* **psField**: the OGRField that will be updated with the parsed result.
* **nOptions**: parsing options, for now always 0.

### Returns
TRUE if apparently successful or FALSE on failure.
"""
function ogrparsedate(pszInput, psOutput, nOptions)
    aftercare(ccall((:OGRParseDate, libgdal), Cint, (Cstring, Ptr{OGRField}, Cint), pszInput, psOutput, nOptions))
end

"""
    ogr_style_tool_param_pen_id

List of parameters for use with OGRStylePen.

| Enumerator        | Note                   |
| :---------------- | :--------------------- |
| OGRSTPenColor     | Color                  |
| OGRSTPenWidth     | Width                  |
| OGRSTPenPattern   | Pattern                |
| OGRSTPenId        | Id                     |
| OGRSTPenPerOffset | Perpendicular offset   |
| OGRSTPenCap       | Cap                    |
| OGRSTPenJoin      | Join                   |
| OGRSTPenPriority  | Priority               |
"""
@cenum ogr_style_tool_param_pen_id::UInt32 begin
        OGRSTPenColor = 0
        OGRSTPenWidth = 1
        OGRSTPenPattern = 2
        OGRSTPenId = 3
        OGRSTPenPerOffset = 4
        OGRSTPenCap = 5
        OGRSTPenJoin = 6
        OGRSTPenPriority = 7
        OGRSTPenLast = 8
    end

"List of parameters for use with OGRStylePen"
const OGRSTPenParam = ogr_style_tool_param_pen_id

"""
    ogr_style_tool_param_brush_id

List of parameters for use with OGRStyleBrush.

| Enumerator         | Note               |
| :----------------- | :----------------- |
| OGRSTBrushFColor   | Foreground color   |
| OGRSTBrushBColor   | Background color   |
| OGRSTBrushId       | Id                 |
| OGRSTBrushAngle    | Angle              |
| OGRSTBrushSize     | Size               |
| OGRSTBrushDx       | Dx                 |
| OGRSTBrushDy       | Dy                 |
| OGRSTBrushPriority | Priority           |
"""
@cenum ogr_style_tool_param_brush_id::UInt32 begin
        OGRSTBrushFColor = 0
        OGRSTBrushBColor = 1
        OGRSTBrushId = 2
        OGRSTBrushAngle = 3
        OGRSTBrushSize = 4
        OGRSTBrushDx = 5
        OGRSTBrushDy = 6
        OGRSTBrushPriority = 7
        OGRSTBrushLast = 8
    end

"List of parameters for use with OGRStyleBrush"
const OGRSTBrushParam = ogr_style_tool_param_brush_id

"""
    ogr_style_tool_param_symbol_id

List of parameters for use with OGRStyleSymbol.

| Enumerator          | Note            |
| :------------------ | :-------------- |
| OGRSTSymbolId       | Id              |
| OGRSTSymbolAngle    | Angle           |
| OGRSTSymbolColor    | Color           |
| OGRSTSymbolSize     | Size            |
| OGRSTSymbolDx       | Dx              |
| OGRSTSymbolDy       | Dy              |
| OGRSTSymbolStep     | Step            |
| OGRSTSymbolPerp     | Perpendicular   |
| OGRSTSymbolOffset   | Offset          |
| OGRSTSymbolPriority | Priority        |
| OGRSTSymbolFontName | Font name       |
| OGRSTSymbolOColor   | Outline color   |
"""
@cenum ogr_style_tool_param_symbol_id::UInt32 begin
        OGRSTSymbolId = 0
        OGRSTSymbolAngle = 1
        OGRSTSymbolColor = 2
        OGRSTSymbolSize = 3
        OGRSTSymbolDx = 4
        OGRSTSymbolDy = 5
        OGRSTSymbolStep = 6
        OGRSTSymbolPerp = 7
        OGRSTSymbolOffset = 8
        OGRSTSymbolPriority = 9
        OGRSTSymbolFontName = 10
        OGRSTSymbolOColor = 11
        OGRSTSymbolLast = 12
    end

"List of parameters for use with OGRStyleSymbol"
const OGRSTSymbolParam = ogr_style_tool_param_symbol_id

"""
    ogr_style_tool_param_label_id

List of parameters for use with OGRStyleLabel.

| Enumerator           | Note                   |
| :------------------- | :--------------------- |
| OGRSTLabelFontName   | Font name              |
| OGRSTLabelSize       | Size                   |
| OGRSTLabelTextString | Text string            |
| OGRSTLabelAngle      | Angle                  |
| OGRSTLabelFColor     | Foreground color       |
| OGRSTLabelBColor     | Background color       |
| OGRSTLabelPlacement  | Placement              |
| OGRSTLabelAnchor     | Anchor                 |
| OGRSTLabelDx         | Dx                     |
| OGRSTLabelDy         | Dy                     |
| OGRSTLabelPerp       | Perpendicular          |
| OGRSTLabelBold       | Bold                   |
| OGRSTLabelItalic     | Italic                 |
| OGRSTLabelUnderline  | Underline              |
| OGRSTLabelPriority   | Priority               |
| OGRSTLabelStrikeout  | Strike out             |
| OGRSTLabelStretch    | Stretch                |
| OGRSTLabelAdjHor     | OBSOLETE; do not use   |
| OGRSTLabelAdjVert    |                        |
| OGRSTLabelHColor     | Highlight color        |
| OGRSTLabelOColor     | Outline color          |
"""
@cenum ogr_style_tool_param_label_id::UInt32 begin
        OGRSTLabelFontName = 0
        OGRSTLabelSize = 1
        OGRSTLabelTextString = 2
        OGRSTLabelAngle = 3
        OGRSTLabelFColor = 4
        OGRSTLabelBColor = 5
        OGRSTLabelPlacement = 6
        OGRSTLabelAnchor = 7
        OGRSTLabelDx = 8
        OGRSTLabelDy = 9
        OGRSTLabelPerp = 10
        OGRSTLabelBold = 11
        OGRSTLabelItalic = 12
        OGRSTLabelUnderline = 13
        OGRSTLabelPriority = 14
        OGRSTLabelStrikeout = 15
        OGRSTLabelStretch = 16
        OGRSTLabelAdjHor = 17
        OGRSTLabelAdjVert = 18
        OGRSTLabelHColor = 19
        OGRSTLabelOColor = 20
        OGRSTLabelLast = 21
    end

"List of parameters for use with OGRStyleLabel"
const OGRSTLabelParam = ogr_style_tool_param_label_id

"""
    GDALVersionInfo(const char * pszRequest) -> const char *

Get runtime version information.

### Parameters
* **pszRequest**: the type of version info desired, as listed above.

### Returns
an internal string containing the requested information.
"""
function gdalversioninfo(arg1)
    aftercare(ccall((:GDALVersionInfo, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    gdalcheckversion(nVersionMajor, nVersionMinor, pszCallingComponentName)

Return [`TRUE`](@ref) if GDAL library version at runtime matches nVersionMajor.nVersionMinor.

The purpose of this method is to ensure that calling code will run with the GDAL version it is compiled for. It is primarily indented for external plugins.

### Parameters
* `nVersionMajor`: Major version to be tested against 

* `nVersionMinor`: Minor version to be tested against 

* `pszCallingComponentName`: If not NULL, in case of version mismatch, the method will issue a failure mentioning the name of the calling component.
"""
function gdalcheckversion(nVersionMajor, nVersionMinor, pszCallingComponentName)
    aftercare(ccall((:GDALCheckVersion, libgdal), Cint, (Cint, Cint, Cstring), nVersionMajor, nVersionMinor, pszCallingComponentName))
end

"""
    OGRAxisOrientation

Axis orientations (corresponds to CS\\_AxisOrientationEnum). 

| Enumerator  | Note                     |
| :---------- | :----------------------- |
| OAO\\_Other | Other                    |
| OAO\\_North | North                    |
| OAO\\_South | South                    |
| OAO\\_East  | East                     |
| OAO\\_West  | West                     |
| OAO\\_Up    | Up (to space)            |
| OAO\\_Down  | Down (to Earth center)   |
"""
@cenum OGRAxisOrientation::UInt32 begin
        OAO_Other = 0
        OAO_North = 1
        OAO_South = 2
        OAO_East = 3
        OAO_West = 4
        OAO_Up = 5
        OAO_Down = 6
    end

"""
    OSRAxisEnumToName(OGRAxisOrientation eOrientation) -> const char *

Return the string representation for the OGRAxisOrientation enumeration.

### Returns
an internal string
"""
function osraxisenumtoname(eOrientation)
    aftercare(ccall((:OSRAxisEnumToName, libgdal), Cstring, (OGRAxisOrientation,), eOrientation), false)
end

"""
    OSRSetPROJSearchPaths(const char *const * papszPaths) -> void

Set the search path(s) for PROJ resource files.

### Parameters
* **papszPaths**: NULL terminated list of directory paths.
"""
function osrsetprojsearchpaths(papszPaths)
    aftercare(ccall((:OSRSetPROJSearchPaths, libgdal), Cvoid, (Ptr{Cstring},), papszPaths))
end

"""
    OSRGetPROJSearchPaths() -> char **

Get the search path(s) for PROJ resource files.

### Returns
NULL terminated list of directory paths. To be freed with CSLDestroy()
"""
function osrgetprojsearchpaths()
    aftercare(ccall((:OSRGetPROJSearchPaths, libgdal), Ptr{Cstring}, ()))
end

"""
    OSRGetPROJVersion(int * pnMajor,
                      int * pnMinor,
                      int * pnPatch) -> void

Get the PROJ version.

### Parameters
* **pnMajor**: Pointer to major version number, or NULL
* **pnMinor**: Pointer to minor version number, or NULL
* **pnPatch**: Pointer to patch version number, or NULL
"""
function osrgetprojversion(pnMajor, pnMinor, pnPatch)
    aftercare(ccall((:OSRGetPROJVersion, libgdal), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), pnMajor, pnMinor, pnPatch))
end

"""
    OSRNewSpatialReference(const char * pszWKT) -> OGRSpatialReferenceH

Constructor.
"""
function osrnewspatialreference(arg1)
    aftercare(ccall((:OSRNewSpatialReference, libgdal), OGRSpatialReferenceH, (Cstring,), arg1))
end

"""
    OSRCloneGeogCS(OGRSpatialReferenceH hSource) -> OGRSpatialReferenceH

Make a duplicate of the GEOGCS node of this OGRSpatialReference object.
"""
function osrclonegeogcs(arg1)
    aftercare(ccall((:OSRCloneGeogCS, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRClone(OGRSpatialReferenceH hSRS) -> OGRSpatialReferenceH

Make a duplicate of this OGRSpatialReference.
"""
function osrclone(arg1)
    aftercare(ccall((:OSRClone, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRDestroySpatialReference(OGRSpatialReferenceH hSRS) -> void

OGRSpatialReference destructor.

### Parameters
* **hSRS**: the object to delete
"""
function osrdestroyspatialreference(arg1)
    aftercare(ccall((:OSRDestroySpatialReference, libgdal), Cvoid, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRReference(OGRSpatialReferenceH hSRS) -> int

Increments the reference count by one.
"""
function osrreference(arg1)
    aftercare(ccall((:OSRReference, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRDereference(OGRSpatialReferenceH hSRS) -> int

Decrements the reference count by one.
"""
function osrdereference(arg1)
    aftercare(ccall((:OSRDereference, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRRelease(OGRSpatialReferenceH hSRS) -> void

Decrements the reference count by one, and destroy if zero.
"""
function osrrelease(arg1)
    aftercare(ccall((:OSRRelease, libgdal), Cvoid, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRValidate(OGRSpatialReferenceH hSRS) -> OGRErr

Validate SRS tokens.
"""
function osrvalidate(arg1)
    aftercare(ccall((:OSRValidate, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRImportFromEPSG(OGRSpatialReferenceH hSRS,
                      int nCode) -> OGRErr

Initialize SRS based on EPSG geographic, projected or vertical CRS code.
"""
function osrimportfromepsg(arg1, arg2)
    aftercare(ccall((:OSRImportFromEPSG, libgdal), OGRErr, (OGRSpatialReferenceH, Cint), arg1, arg2))
end

"""
    OSRImportFromEPSGA(OGRSpatialReferenceH hSRS,
                       int nCode) -> OGRErr

Initialize SRS based on EPSG geographic, projected or vertical CRS code.
"""
function osrimportfromepsga(arg1, arg2)
    aftercare(ccall((:OSRImportFromEPSGA, libgdal), OGRErr, (OGRSpatialReferenceH, Cint), arg1, arg2))
end

"""
    OSRImportFromWkt(OGRSpatialReferenceH hSRS,
                     char ** ppszInput) -> OGRErr

Import from WKT string.
"""
function osrimportfromwkt(arg1, arg2)
    aftercare(ccall((:OSRImportFromWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRImportFromProj4(OGRSpatialReferenceH hSRS,
                       const char * pszProj4) -> OGRErr

Import PROJ coordinate string.
"""
function osrimportfromproj4(arg1, arg2)
    aftercare(ccall((:OSRImportFromProj4, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

"""
    OSRImportFromESRI(OGRSpatialReferenceH hSRS,
                      char ** papszPrj) -> OGRErr

Import coordinate system from ESRI .prj format(s).
"""
function osrimportfromesri(arg1, arg2)
    aftercare(ccall((:OSRImportFromESRI, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRImportFromPCI(OGRSpatialReferenceH hSRS,
                     const char * pszProj,
                     const char * pszUnits,
                     double * padfPrjParams) -> OGRErr

Import coordinate system from PCI projection definition.
"""
function osrimportfrompci(hSRS, arg2, arg3, arg4)
    aftercare(ccall((:OSRImportFromPCI, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Ptr{Cdouble}), hSRS, arg2, arg3, arg4))
end

"""
    OSRImportFromUSGS(OGRSpatialReferenceH hSRS,
                      long iProjsys,
                      long iZone,
                      double * padfPrjParams,
                      long iDatum) -> OGRErr

Import coordinate system from USGS projection definition.
"""
function osrimportfromusgs(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OSRImportFromUSGS, libgdal), OGRErr, (OGRSpatialReferenceH, Clong, Clong, Ptr{Cdouble}, Clong), arg1, arg2, arg3, arg4, arg5))
end

"""
    OSRImportFromXML(OGRSpatialReferenceH hSRS,
                     const char * pszXML) -> OGRErr

Import coordinate system from XML format (GML only currently).
"""
function osrimportfromxml(arg1, arg2)
    aftercare(ccall((:OSRImportFromXML, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

"""
    OSRImportFromDict(OGRSpatialReferenceH hSRS,
                      const char * pszDictFile,
                      const char * pszCode) -> OGRErr

Read SRS from WKT dictionary.

### Parameters
* **hSRS**: spatial reference system handle.
* **pszDictFile**: the name of the dictionary file to load.
* **pszCode**: the code to lookup in the dictionary.

### Returns
OGRERR_NONE on success, or OGRERR_SRS_UNSUPPORTED if the code isn't found, and OGRERR_SRS_FAILURE if something more dramatic goes wrong.
"""
function osrimportfromdict(arg1, arg2, arg3)
    aftercare(ccall((:OSRImportFromDict, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring), arg1, arg2, arg3))
end

"""
    OSRImportFromPanorama(OGRSpatialReferenceH hSRS,
                          long iProjSys,
                          long iDatum,
                          long iEllips,
                          double * padfPrjParams) -> OGRErr

Import coordinate system from "Panorama" GIS projection definition.
"""
function osrimportfrompanorama(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OSRImportFromPanorama, libgdal), OGRErr, (OGRSpatialReferenceH, Clong, Clong, Clong, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5))
end

"""
    OSRImportFromOzi(OGRSpatialReferenceH hSRS,
                     const char *const * papszLines) -> OGRErr

Import coordinate system from OziExplorer projection definition.

### Parameters
* **hSRS**: spatial reference object.
* **papszLines**: Map file lines. This is an array of strings containing the whole OziExplorer .MAP file. The array is terminated by a NULL pointer.

### Returns
OGRERR_NONE on success or an error code in case of failure.
"""
function osrimportfromozi(arg1, arg2)
    aftercare(ccall((:OSRImportFromOzi, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRImportFromMICoordSys(OGRSpatialReferenceH hSRS,
                            const char * pszCoordSys) -> OGRErr

Import Mapinfo style CoordSys definition.
"""
function osrimportfrommicoordsys(arg1, arg2)
    aftercare(ccall((:OSRImportFromMICoordSys, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

"""
    OSRImportFromERM(OGRSpatialReferenceH hSRS,
                     const char * pszProj,
                     const char * pszDatum,
                     const char * pszUnits) -> OGRErr

Create OGR WKT from ERMapper projection definitions.
"""
function osrimportfromerm(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OSRImportFromERM, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4))
end

"""
    OSRImportFromUrl(OGRSpatialReferenceH hSRS,
                     const char * pszUrl) -> OGRErr

Set spatial reference from a URL.
"""
function osrimportfromurl(arg1, arg2)
    aftercare(ccall((:OSRImportFromUrl, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

"""
    OSRExportToWkt(OGRSpatialReferenceH hSRS,
                   char ** ppszReturn) -> OGRErr

Convert this SRS into WKT 1 format.
"""
function osrexporttowkt(arg1, arg2)
    aftercare(ccall((:OSRExportToWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRExportToWktEx(OGRSpatialReferenceH hSRS,
                     char ** ppszReturn,
                     const char *const * papszOptions) -> OGRErr

Convert this SRS into WKT format.
"""
function osrexporttowktex(arg1, ppszResult, papszOptions)
    aftercare(ccall((:OSRExportToWktEx, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}), arg1, ppszResult, papszOptions))
end

"""
    OSRExportToPrettyWkt(OGRSpatialReferenceH hSRS,
                         char ** ppszReturn,
                         int bSimplify) -> OGRErr

Convert this SRS into a nicely formatted WKT 1 string for display to a person.
"""
function osrexporttoprettywkt(arg1, arg2, arg3)
    aftercare(ccall((:OSRExportToPrettyWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Cint), arg1, arg2, arg3))
end

"""
    OSRExportToPROJJSON(OGRSpatialReferenceH hSRS,
                        char ** ppszReturn,
                        const char *const * papszOptions) -> OGRErr

Convert this SRS into PROJJSON format.
"""
function osrexporttoprojjson(hSRS, ppszReturn, papszOptions)
    aftercare(ccall((:OSRExportToPROJJSON, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}), hSRS, ppszReturn, papszOptions))
end

"""
    OSRExportToProj4(OGRSpatialReferenceH hSRS,
                     char ** ppszReturn) -> OGRErr

Export coordinate system in PROJ.4 legacy format.
"""
function osrexporttoproj4(arg1, arg2)
    aftercare(ccall((:OSRExportToProj4, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRExportToPCI(OGRSpatialReferenceH hSRS,
                   char ** ppszProj,
                   char ** ppszUnits,
                   double ** ppadfPrjParams) -> OGRErr

Export coordinate system in PCI projection definition.
"""
function osrexporttopci(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OSRExportToPCI, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}, Ptr{Ptr{Cdouble}}), arg1, arg2, arg3, arg4))
end

"""
    OSRExportToUSGS(OGRSpatialReferenceH hSRS,
                    long * piProjSys,
                    long * piZone,
                    double ** ppadfPrjParams,
                    long * piDatum) -> OGRErr

Export coordinate system in USGS GCTP projection definition.
"""
function osrexporttousgs(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OSRExportToUSGS, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Clong}, Ptr{Clong}, Ptr{Ptr{Cdouble}}, Ptr{Clong}), arg1, arg2, arg3, arg4, arg5))
end

"""
    OSRExportToXML(OGRSpatialReferenceH hSRS,
                   char ** ppszRawXML,
                   const char * pszDialect) -> OGRErr

Export coordinate system in XML format.
"""
function osrexporttoxml(arg1, arg2, arg3)
    aftercare(ccall((:OSRExportToXML, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Cstring), arg1, arg2, arg3))
end

"""
    OSRExportToPanorama(OGRSpatialReferenceH hSRS,
                        long * piProjSys,
                        long * piDatum,
                        long * piEllips,
                        long * piZone,
                        double * padfPrjParams) -> OGRErr

Export coordinate system in "Panorama" GIS projection definition.
"""
function osrexporttopanorama(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OSRExportToPanorama, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    OSRExportToMICoordSys(OGRSpatialReferenceH hSRS,
                          char ** ppszReturn) -> OGRErr

Export coordinate system in Mapinfo style CoordSys format.
"""
function osrexporttomicoordsys(arg1, arg2)
    aftercare(ccall((:OSRExportToMICoordSys, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRExportToERM(OGRSpatialReferenceH hSRS,
                   char * pszProj,
                   char * pszDatum,
                   char * pszUnits) -> OGRErr

Convert coordinate system to ERMapper format.
"""
function osrexporttoerm(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OSRExportToERM, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4))
end

"""
    OSRMorphToESRI(OGRSpatialReferenceH hSRS) -> OGRErr

Convert in place to ESRI WKT format.
"""
function osrmorphtoesri(arg1)
    aftercare(ccall((:OSRMorphToESRI, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRMorphFromESRI(OGRSpatialReferenceH hSRS) -> OGRErr

Convert in place from ESRI WKT format.
"""
function osrmorphfromesri(arg1)
    aftercare(ccall((:OSRMorphFromESRI, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRConvertToOtherProjection(OGRSpatialReferenceH hSRS,
                                const char * pszTargetProjection,
                                const char *const * papszOptions) -> OGRSpatialReferenceH

Convert to another equivalent projection.

### Parameters
* **hSRS**: source SRS
* **pszTargetProjection**: target projection.
* **papszOptions**: lists of options. None supported currently.

### Returns
a new SRS, or NULL in case of error.
"""
function osrconverttootherprojection(hSRS, pszTargetProjection, papszOptions)
    aftercare(ccall((:OSRConvertToOtherProjection, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH, Cstring, Ptr{Cstring}), hSRS, pszTargetProjection, papszOptions))
end

"""
    OSRGetName(OGRSpatialReferenceH hSRS) -> const char *

Return the CRS name.
"""
function osrgetname(hSRS)
    aftercare(ccall((:OSRGetName, libgdal), Cstring, (OGRSpatialReferenceH,), hSRS), false)
end

"""
    OSRSetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszPath,
                    const char * pszValue) -> OGRErr

Set attribute value in spatial reference.
"""
function osrsetattrvalue(hSRS, pszNodePath, pszNewNodeValue)
    aftercare(ccall((:OSRSetAttrValue, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring), hSRS, pszNodePath, pszNewNodeValue))
end

"""
    OSRGetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszKey,
                    int iChild) -> const char *

Fetch indicated attribute of named node.
"""
function osrgetattrvalue(hSRS, pszName, iChild)
    aftercare(ccall((:OSRGetAttrValue, libgdal), Cstring, (OGRSpatialReferenceH, Cstring, Cint), hSRS, pszName, iChild), false)
end

"""
    OSRSetAngularUnits(OGRSpatialReferenceH hSRS,
                       const char * pszUnits,
                       double dfInRadians) -> OGRErr

Set the angular units for the geographic coordinate system.
"""
function osrsetangularunits(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetAngularUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

"""
    OSRGetAngularUnits(OGRSpatialReferenceH hSRS,
                       char ** ppszName) -> double

Fetch angular geographic coordinate system units.
"""
function osrgetangularunits(arg1, arg2)
    aftercare(ccall((:OSRGetAngularUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRSetLinearUnits(OGRSpatialReferenceH hSRS,
                      const char * pszUnits,
                      double dfInMeters) -> OGRErr

Set the linear units for the projection.
"""
function osrsetlinearunits(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetLinearUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

"""
    OSRSetTargetLinearUnits(OGRSpatialReferenceH hSRS,
                            const char * pszTargetKey,
                            const char * pszUnits,
                            double dfInMeters) -> OGRErr

Set the linear units for the target node.
"""
function osrsettargetlinearunits(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OSRSetTargetLinearUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cdouble), arg1, arg2, arg3, arg4))
end

"""
    OSRSetLinearUnitsAndUpdateParameters(OGRSpatialReferenceH hSRS,
                                         const char * pszUnits,
                                         double dfInMeters) -> OGRErr

Set the linear units for the projection.
"""
function osrsetlinearunitsandupdateparameters(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetLinearUnitsAndUpdateParameters, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

"""
    OSRGetLinearUnits(OGRSpatialReferenceH hSRS,
                      char ** ppszName) -> double

Fetch linear projection units.
"""
function osrgetlinearunits(arg1, arg2)
    aftercare(ccall((:OSRGetLinearUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRGetTargetLinearUnits(OGRSpatialReferenceH hSRS,
                            const char * pszTargetKey,
                            char ** ppszName) -> double

Fetch linear projection units.
"""
function osrgettargetlinearunits(arg1, arg2, arg3)
    aftercare(ccall((:OSRGetTargetLinearUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Ptr{Cstring}), arg1, arg2, arg3))
end

"""
    OSRGetPrimeMeridian(OGRSpatialReferenceH hSRS,
                        char ** ppszName) -> double

Fetch prime meridian info.
"""
function osrgetprimemeridian(arg1, arg2)
    aftercare(ccall((:OSRGetPrimeMeridian, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

"""
    OSRIsGeographic(OGRSpatialReferenceH hSRS) -> int

Check if geographic coordinate system.
"""
function osrisgeographic(arg1)
    aftercare(ccall((:OSRIsGeographic, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRIsDerivedGeographic(OGRSpatialReferenceH hSRS) -> int

Check if derived geographic coordinate system.
"""
function osrisderivedgeographic(arg1)
    aftercare(ccall((:OSRIsDerivedGeographic, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRIsLocal(OGRSpatialReferenceH hSRS) -> int

Check if local coordinate system.
"""
function osrislocal(arg1)
    aftercare(ccall((:OSRIsLocal, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRIsProjected(OGRSpatialReferenceH hSRS) -> int

Check if projected coordinate system.
"""
function osrisprojected(arg1)
    aftercare(ccall((:OSRIsProjected, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRIsCompound(OGRSpatialReferenceH hSRS) -> int

Check if the coordinate system is compound.
"""
function osriscompound(arg1)
    aftercare(ccall((:OSRIsCompound, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRIsGeocentric(OGRSpatialReferenceH hSRS) -> int

Check if geocentric coordinate system.
"""
function osrisgeocentric(arg1)
    aftercare(ccall((:OSRIsGeocentric, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRIsVertical(OGRSpatialReferenceH hSRS) -> int

Check if vertical coordinate system.
"""
function osrisvertical(arg1)
    aftercare(ccall((:OSRIsVertical, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRIsSameGeogCS(OGRSpatialReferenceH hSRS1,
                    OGRSpatialReferenceH hSRS2) -> int

Do the GeogCS'es match?
"""
function osrissamegeogcs(arg1, arg2)
    aftercare(ccall((:OSRIsSameGeogCS, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2))
end

"""
    OSRIsSameVertCS(OGRSpatialReferenceH hSRS1,
                    OGRSpatialReferenceH hSRS2) -> int

Do the VertCS'es match?
"""
function osrissamevertcs(arg1, arg2)
    aftercare(ccall((:OSRIsSameVertCS, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2))
end

"""
    OSRIsSame(OGRSpatialReferenceH hSRS1,
              OGRSpatialReferenceH hSRS2) -> int

Do these two spatial references describe the same system ?
"""
function osrissame(arg1, arg2)
    aftercare(ccall((:OSRIsSame, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2))
end

"""
    OSRIsSameEx(OGRSpatialReferenceH hSRS1,
                OGRSpatialReferenceH hSRS2,
                const char *const * papszOptions) -> int

Do these two spatial references describe the same system ?
"""
function osrissameex(arg1, arg2, papszOptions)
    aftercare(ccall((:OSRIsSameEx, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2, papszOptions))
end

"""
    OSRSetLocalCS(OGRSpatialReferenceH hSRS,
                  const char * pszName) -> OGRErr

Set the user visible LOCAL_CS name.
"""
function osrsetlocalcs(hSRS, pszName)
    aftercare(ccall((:OSRSetLocalCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

"""
    OSRSetProjCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function osrsetprojcs(hSRS, pszName)
    aftercare(ccall((:OSRSetProjCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

"""
    OSRSetGeocCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function osrsetgeoccs(hSRS, pszName)
    aftercare(ccall((:OSRSetGeocCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

"""
    OSRSetWellKnownGeogCS(OGRSpatialReferenceH hSRS,
                          const char * pszName) -> OGRErr

Set a GeogCS based on well known name.
"""
function osrsetwellknowngeogcs(hSRS, pszName)
    aftercare(ccall((:OSRSetWellKnownGeogCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

"""
    OSRSetFromUserInput(OGRSpatialReferenceH hSRS,
                        const char * pszDef) -> OGRErr

Set spatial reference from various text formats.
"""
function osrsetfromuserinput(hSRS, arg2)
    aftercare(ccall((:OSRSetFromUserInput, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, arg2))
end

"""
    OSRCopyGeogCSFrom(OGRSpatialReferenceH hSRS,
                      const OGRSpatialReferenceH hSrcSRS) -> OGRErr

Copy GEOGCS from another OGRSpatialReference.
"""
function osrcopygeogcsfrom(hSRS, hSrcSRS)
    aftercare(ccall((:OSRCopyGeogCSFrom, libgdal), OGRErr, (OGRSpatialReferenceH, OGRSpatialReferenceH), hSRS, hSrcSRS))
end

"""
    OSRSetTOWGS84(OGRSpatialReferenceH hSRS,
                  double dfDX,
                  double dfDY,
                  double dfDZ,
                  double dfEX,
                  double dfEY,
                  double dfEZ,
                  double dfPPM) -> OGRErr

Set the Bursa-Wolf conversion to WGS84.
"""
function osrsettowgs84(hSRS, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    aftercare(ccall((:OSRSetTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, arg2, arg3, arg4, arg5, arg6, arg7, arg8))
end

"""
    OSRGetTOWGS84(OGRSpatialReferenceH hSRS,
                  double * padfCoeff,
                  int nCoeffCount) -> OGRErr

Fetch TOWGS84 parameters, if available.
"""
function osrgettowgs84(hSRS, arg2, arg3)
    aftercare(ccall((:OSRGetTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cdouble}, Cint), hSRS, arg2, arg3))
end

"""
    OSRAddGuessedTOWGS84(OGRSpatialReferenceH hSRS) -> OGRErr

Try to add a a 3-parameter or 7-parameter Helmert transformation to WGS84.
"""
function osraddguessedtowgs84(hSRS)
    aftercare(ccall((:OSRAddGuessedTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS))
end

"""
    OSRSetCompoundCS(OGRSpatialReferenceH hSRS,
                     const char * pszName,
                     OGRSpatialReferenceH hHorizSRS,
                     OGRSpatialReferenceH hVertSRS) -> OGRErr

Setup a compound coordinate system.
"""
function osrsetcompoundcs(hSRS, pszName, hHorizSRS, hVertSRS)
    aftercare(ccall((:OSRSetCompoundCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, OGRSpatialReferenceH, OGRSpatialReferenceH), hSRS, pszName, hHorizSRS, hVertSRS))
end

"""
    OSRPromoteTo3D(OGRSpatialReferenceH hSRS,
                   const char * pszName) -> OGRErr

"Promotes" a 2D CRS to a 3D CRS one.
"""
function osrpromoteto3d(hSRS, pszName)
    aftercare(ccall((:OSRPromoteTo3D, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

"""
    OSRDemoteTo2D(OGRSpatialReferenceH hSRS,
                  const char * pszName) -> OGRErr

"Demote" a 3D CRS to a 2D CRS one.
"""
function osrdemoteto2d(hSRS, pszName)
    aftercare(ccall((:OSRDemoteTo2D, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

"""
    OSRSetGeogCS(OGRSpatialReferenceH hSRS,
                 const char * pszGeogName,
                 const char * pszDatumName,
                 const char * pszSpheroidName,
                 double dfSemiMajor,
                 double dfInvFlattening,
                 const char * pszPMName,
                 double dfPMOffset,
                 const char * pszAngularUnits,
                 double dfConvertToRadians) -> OGRErr

Set geographic coordinate system.
"""
function osrsetgeogcs(hSRS, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor, dfInvFlattening, pszPMName, dfPMOffset, pszUnits, dfConvertToRadians)
    aftercare(ccall((:OSRSetGeogCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring, Cdouble, Cdouble, Cstring, Cdouble, Cstring, Cdouble), hSRS, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor, dfInvFlattening, pszPMName, dfPMOffset, pszUnits, dfConvertToRadians))
end

"""
    OSRSetVertCS(OGRSpatialReferenceH hSRS,
                 const char * pszVertCSName,
                 const char * pszVertDatumName,
                 int nVertDatumType) -> OGRErr

Setup the vertical coordinate system.
"""
function osrsetvertcs(hSRS, pszVertCSName, pszVertDatumName, nVertDatumType)
    aftercare(ccall((:OSRSetVertCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cint), hSRS, pszVertCSName, pszVertDatumName, nVertDatumType))
end

"""
    OSRGetSemiMajor(OGRSpatialReferenceH hSRS,
                    OGRErr * pnErr) -> double

Get spheroid semi major axis.
"""
function osrgetsemimajor(arg1, arg2)
    aftercare(ccall((:OSRGetSemiMajor, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2))
end

"""
    OSRGetSemiMinor(OGRSpatialReferenceH hSRS,
                    OGRErr * pnErr) -> double

Get spheroid semi minor axis.
"""
function osrgetsemiminor(arg1, arg2)
    aftercare(ccall((:OSRGetSemiMinor, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2))
end

"""
    OSRGetInvFlattening(OGRSpatialReferenceH hSRS,
                        OGRErr * pnErr) -> double

Get spheroid inverse flattening.
"""
function osrgetinvflattening(arg1, arg2)
    aftercare(ccall((:OSRGetInvFlattening, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2))
end

"""
    OSRSetAuthority(OGRSpatialReferenceH hSRS,
                    const char * pszTargetKey,
                    const char * pszAuthority,
                    int nCode) -> OGRErr

Set the authority for a node.
"""
function osrsetauthority(hSRS, pszTargetKey, pszAuthority, nCode)
    aftercare(ccall((:OSRSetAuthority, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cint), hSRS, pszTargetKey, pszAuthority, nCode))
end

"""
    OSRGetAuthorityCode(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority code for a node.
"""
function osrgetauthoritycode(hSRS, pszTargetKey)
    aftercare(ccall((:OSRGetAuthorityCode, libgdal), Cstring, (OGRSpatialReferenceH, Cstring), hSRS, pszTargetKey), false)
end

"""
    OSRGetAuthorityName(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority name for a node.
"""
function osrgetauthorityname(hSRS, pszTargetKey)
    aftercare(ccall((:OSRGetAuthorityName, libgdal), Cstring, (OGRSpatialReferenceH, Cstring), hSRS, pszTargetKey), false)
end

"""
    OSRGetAreaOfUse(OGRSpatialReferenceH hSRS,
                    double * pdfWestLongitudeDeg,
                    double * pdfSouthLatitudeDeg,
                    double * pdfEastLongitudeDeg,
                    double * pdfNorthLatitudeDeg,
                    const char ** ppszAreaName) -> int

Return the area of use of the CRS.
"""
function osrgetareaofuse(hSRS, pdfWestLongitudeDeg, pdfSouthLatitudeDeg, pdfEastLongitudeDeg, pdfNorthLatitudeDeg, ppszAreaName)
    aftercare(ccall((:OSRGetAreaOfUse, libgdal), Cint, (OGRSpatialReferenceH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cstring}), hSRS, pdfWestLongitudeDeg, pdfSouthLatitudeDeg, pdfEastLongitudeDeg, pdfNorthLatitudeDeg, ppszAreaName))
end

"""
    OSRSetProjection(OGRSpatialReferenceH hSRS,
                     const char * pszProjection) -> OGRErr

Set a projection name.
"""
function osrsetprojection(arg1, arg2)
    aftercare(ccall((:OSRSetProjection, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

"""
    OSRSetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszParamName,
                   double dfValue) -> OGRErr

Set a projection parameter value.
"""
function osrsetprojparm(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetProjParm, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

"""
    OSRGetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszName,
                   double dfDefaultValue,
                   OGRErr * pnErr) -> double

Fetch a projection parameter value.
"""
function osrgetprojparm(hSRS, pszParmName, dfDefault, arg4)
    aftercare(ccall((:OSRGetProjParm, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg4))
end

"""
    OSRSetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszParamName,
                       double dfValue) -> OGRErr

Set a projection parameter with a normalized value.
"""
function osrsetnormprojparm(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetNormProjParm, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

"""
    OSRGetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszName,
                       double dfDefaultValue,
                       OGRErr * pnErr) -> double

This function is the same as OGRSpatialReference::
"""
function osrgetnormprojparm(hSRS, pszParmName, dfDefault, arg4)
    aftercare(ccall((:OSRGetNormProjParm, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg4))
end

"""
    OSRSetUTM(OGRSpatialReferenceH hSRS,
              int nZone,
              int bNorth) -> OGRErr

Set UTM projection definition.
"""
function osrsetutm(hSRS, nZone, bNorth)
    aftercare(ccall((:OSRSetUTM, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint), hSRS, nZone, bNorth))
end

"""
    OSRGetUTMZone(OGRSpatialReferenceH hSRS,
                  int * pbNorth) -> int

Get utm zone information.
"""
function osrgetutmzone(hSRS, pbNorth)
    aftercare(ccall((:OSRGetUTMZone, libgdal), Cint, (OGRSpatialReferenceH, Ptr{Cint}), hSRS, pbNorth))
end

"""
    OSRSetStatePlane(OGRSpatialReferenceH hSRS,
                     int nZone,
                     int bNAD83) -> OGRErr

Set State Plane projection definition.
"""
function osrsetstateplane(hSRS, nZone, bNAD83)
    aftercare(ccall((:OSRSetStatePlane, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint), hSRS, nZone, bNAD83))
end

"""
    OSRSetStatePlaneWithUnits(OGRSpatialReferenceH hSRS,
                              int nZone,
                              int bNAD83,
                              const char * pszOverrideUnitName,
                              double dfOverrideUnit) -> OGRErr

Set State Plane projection definition.
"""
function osrsetstateplanewithunits(hSRS, nZone, bNAD83, pszOverrideUnitName, dfOverrideUnit)
    aftercare(ccall((:OSRSetStatePlaneWithUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint, Cstring, Cdouble), hSRS, nZone, bNAD83, pszOverrideUnitName, dfOverrideUnit))
end

"""
    OSRAutoIdentifyEPSG(OGRSpatialReferenceH hSRS) -> OGRErr

Set EPSG authority info if possible.
"""
function osrautoidentifyepsg(hSRS)
    aftercare(ccall((:OSRAutoIdentifyEPSG, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS))
end

"""
    OSRFindMatches(OGRSpatialReferenceH hSRS,
                   char ** papszOptions,
                   int * pnEntries,
                   int ** ppanMatchConfidence) -> OGRSpatialReferenceH *

Try to identify a match between the passed SRS and a related SRS in a catalog.

### Parameters
* **hSRS**: SRS to match
* **papszOptions**: NULL terminated list of options or NULL
* **pnEntries**: Output parameter. Number of values in the returned array.
* **ppanMatchConfidence**: Output parameter (or NULL). *ppanMatchConfidence will be allocated to an array of *pnEntries whose values between 0 and 100 indicate the confidence in the match. 100 is the highest confidence level. The array must be freed with CPLFree().

### Returns
an array of SRS that match the passed SRS, or NULL. Must be freed with OSRFreeSRSArray()
"""
function osrfindmatches(hSRS, papszOptions, pnEntries, ppanMatchConfidence)
    aftercare(ccall((:OSRFindMatches, libgdal), Ptr{OGRSpatialReferenceH}, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{Cint}}), hSRS, papszOptions, pnEntries, ppanMatchConfidence))
end

"""
    OSRFreeSRSArray(OGRSpatialReferenceH * pahSRS) -> void

Free return of OSRIdentifyMatches()

### Parameters
* **pahSRS**: array of SRS (must be NULL terminated)
"""
function osrfreesrsarray(pahSRS)
    aftercare(ccall((:OSRFreeSRSArray, libgdal), Cvoid, (Ptr{OGRSpatialReferenceH},), pahSRS))
end

"""
    OSREPSGTreatsAsLatLong(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having lat/long coordinate ordering.
"""
function osrepsgtreatsaslatlong(hSRS)
    aftercare(ccall((:OSREPSGTreatsAsLatLong, libgdal), Cint, (OGRSpatialReferenceH,), hSRS))
end

"""
    OSREPSGTreatsAsNorthingEasting(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this projected coordinate system should be treated as having northing/easting coordinate ordering.
"""
function osrepsgtreatsasnorthingeasting(hSRS)
    aftercare(ccall((:OSREPSGTreatsAsNorthingEasting, libgdal), Cint, (OGRSpatialReferenceH,), hSRS))
end

"""
    OSRGetAxis(OGRSpatialReferenceH hSRS,
               const char * pszTargetKey,
               int iAxis,
               OGRAxisOrientation * peOrientation) -> const char *

Fetch the orientation of one axis.
"""
function osrgetaxis(hSRS, pszTargetKey, iAxis, peOrientation)
    aftercare(ccall((:OSRGetAxis, libgdal), Cstring, (OGRSpatialReferenceH, Cstring, Cint, Ptr{OGRAxisOrientation}), hSRS, pszTargetKey, iAxis, peOrientation), false)
end

"""
    OSRGetAxesCount(OGRSpatialReferenceH hSRS) -> int

Return the number of axis of the coordinate system of the CRS.
"""
function osrgetaxescount(hSRS)
    aftercare(ccall((:OSRGetAxesCount, libgdal), Cint, (OGRSpatialReferenceH,), hSRS))
end

"""
    OSRSetAxes(OGRSpatialReferenceH hSRS,
               const char * pszTargetKey,
               const char * pszXAxisName,
               OGRAxisOrientation eXAxisOrientation,
               const char * pszYAxisName,
               OGRAxisOrientation eYAxisOrientation) -> OGRErr

Set the axes for a coordinate system.
"""
function osrsetaxes(hSRS, pszTargetKey, pszXAxisName, eXAxisOrientation, pszYAxisName, eYAxisOrientation)
    aftercare(ccall((:OSRSetAxes, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, OGRAxisOrientation, Cstring, OGRAxisOrientation), hSRS, pszTargetKey, pszXAxisName, eXAxisOrientation, pszYAxisName, eYAxisOrientation))
end

"""
    OSRAxisMappingStrategy

Data axis to CRS axis mapping strategy. 

| Enumerator                       | Note                                                     |
| :------------------------------- | :------------------------------------------------------- |
| OAMS\\_TRADITIONAL\\_GIS\\_ORDER | Traditional GIS order                                    |
| OAMS\\_AUTHORITY\\_COMPLIANT     | Compliant with the order mandated by the CRS authority   |
| OAMS\\_CUSTOM                    | Custom                                                   |
"""
@cenum OSRAxisMappingStrategy::UInt32 begin
        OAMS_TRADITIONAL_GIS_ORDER = 0
        OAMS_AUTHORITY_COMPLIANT = 1
        OAMS_CUSTOM = 2
    end

"""
    OSRGetAxisMappingStrategy(OGRSpatialReferenceH hSRS) -> OSRAxisMappingStrategy

Return the data axis to CRS axis mapping strategy.
"""
function osrgetaxismappingstrategy(hSRS)
    aftercare(ccall((:OSRGetAxisMappingStrategy, libgdal), OSRAxisMappingStrategy, (OGRSpatialReferenceH,), hSRS))
end

"""
    OSRSetAxisMappingStrategy(OGRSpatialReferenceH hSRS,
                              OSRAxisMappingStrategy strategy) -> void

Set the data axis to CRS axis mapping strategy.
"""
function osrsetaxismappingstrategy(hSRS, strategy)
    aftercare(ccall((:OSRSetAxisMappingStrategy, libgdal), Cvoid, (OGRSpatialReferenceH, OSRAxisMappingStrategy), hSRS, strategy))
end

"""
    OSRGetDataAxisToSRSAxisMapping(OGRSpatialReferenceH hSRS,
                                   int * pnCount) -> const int *

Return the data axis to SRS axis mapping.
"""
function osrgetdataaxistosrsaxismapping(hSRS, pnCount)
    aftercare(ccall((:OSRGetDataAxisToSRSAxisMapping, libgdal), Ptr{Cint}, (OGRSpatialReferenceH, Ptr{Cint}), hSRS, pnCount))
end

"""
    OSRSetDataAxisToSRSAxisMapping(OGRSpatialReferenceH hSRS,
                                   int nMappingSize,
                                   const int * panMapping) -> OGRErr

Set a custom data axis to CRS axis mapping.
"""
function osrsetdataaxistosrsaxismapping(hSRS, nMappingSize, panMapping)
    aftercare(ccall((:OSRSetDataAxisToSRSAxisMapping, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Ptr{Cint}), hSRS, nMappingSize, panMapping))
end

"""
    osrsetacea(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Albers Conic Equal Area 
"""
function osrsetacea(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetACEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetae(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Azimuthal Equidistant 
"""
function osrsetae(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetAE, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetbonne(hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Bonne 
"""
function osrsetbonne(hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetBonne, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetcea(hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Cylindrical Equal Area 
"""
function osrsetcea(hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetCEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetcs(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Cassini-Soldner 
"""
function osrsetcs(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetec(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Equidistant Conic 
"""
function osrsetec(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrseteckert(hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Eckert I-VI 
"""
function osrseteckert(hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEckert, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrseteckertiv(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Eckert IV 
"""
function osrseteckertiv(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEckertIV, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrseteckertvi(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Eckert VI 
"""
function osrseteckertvi(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEckertVI, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetequirectangular(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Equirectangular 
"""
function osrsetequirectangular(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEquirectangular, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetequirectangular2(hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing)

Equirectangular generalized form 
"""
function osrsetequirectangular2(hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEquirectangular2, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetgs(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Gall Stereograpic 
"""
function osrsetgs(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetgh(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Goode Homolosine 
"""
function osrsetgh(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGH, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetigh(hSRS)

Interrupted Goode Homolosine 
"""
function osrsetigh(hSRS)
    aftercare(ccall((:OSRSetIGH, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS))
end

"""
    osrsetgeos(hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing)

GEOS - Geostationary Satellite View 
"""
function osrsetgeos(hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGEOS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetgaussschreibertmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Gauss Schreiber Transverse Mercator 
"""
function osrsetgaussschreibertmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGaussSchreiberTMercator, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetgnomonic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Gnomonic 
"""
function osrsetgnomonic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGnomonic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsethom(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)

Hotine Oblique Mercator using azimuth angle 
"""
function osrsethom(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetHOM, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    OSRSetHOMAC(OGRSpatialReferenceH hSRS,
                double dfCenterLat,
                double dfCenterLong,
                double dfAzimuth,
                double dfRectToSkew,
                double dfScale,
                double dfFalseEasting,
                double dfFalseNorthing) -> OGRErr

Set an Oblique Mercator projection using azimuth angle.
"""
function osrsethomac(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetHOMAC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsethom2pno(hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing)

Hotine Oblique Mercator using two points on centerline 
"""
function osrsethom2pno(hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetHOM2PNO, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetiwmpolyconic(hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing)

International Map of the World Polyconic 
"""
function osrsetiwmpolyconic(hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetIWMPolyconic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetkrovak(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing)

Krovak Oblique Conic Conformal 
"""
function osrsetkrovak(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetKrovak, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetlaea(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Lambert Azimuthal Equal-Area 
"""
function osrsetlaea(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetLAEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetlcc(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Lambert Conformal Conic 
"""
function osrsetlcc(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetLCC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetlcc1sp(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Lambert Conformal Conic 1SP 
"""
function osrsetlcc1sp(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetLCC1SP, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetlccb(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Lambert Conformal Conic (Belgium) 
"""
function osrsetlccb(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetLCCB, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetmc(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Miller Cylindrical 
"""
function osrsetmc(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetMC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Mercator 
"""
function osrsetmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetMercator, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetmercator2sp(hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Mercator 2SP 
"""
function osrsetmercator2sp(hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetMercator2SP, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetmollweide(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Mollweide 
"""
function osrsetmollweide(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetMollweide, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetnzmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

New Zealand Map Grid 
"""
function osrsetnzmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetNZMG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetos(hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing)

Oblique Stereographic 
"""
function osrsetos(hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetOS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetorthographic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Orthographic 
"""
function osrsetorthographic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetOrthographic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetpolyconic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Polyconic 
"""
function osrsetpolyconic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetPolyconic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetps(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Polar Stereographic 
"""
function osrsetps(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetPS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetrobinson(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Robinson 
"""
function osrsetrobinson(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetRobinson, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetsinusoidal(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Sinusoidal 
"""
function osrsetsinusoidal(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetSinusoidal, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetstereographic(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Stereographic 
"""
function osrsetstereographic(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetStereographic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetsoc(hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Swiss Oblique Cylindrical 
"""
function osrsetsoc(hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetSOC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettm(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Transverse Mercator

Special processing available for Transverse Mercator with GDAL >= 1.10 and PROJ >= 4.8 : see OGRSpatialReference::exportToProj4().
"""
function osrsettm(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTM, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettmvariant(hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Transverse Mercator variant 
"""
function osrsettmvariant(hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTMVariant, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Tunesia Mining Grid 
"""
function osrsettmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTMG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettmso(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Transverse Mercator (South Oriented) 
"""
function osrsettmso(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTMSO, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettped(hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing)

TPED (Two Point Equi Distant) 
"""
function osrsettped(hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTPED, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetvdg(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)

VanDerGrinten 
"""
function osrsetvdg(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetVDG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetwagner(hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing)

Wagner I -- VII 
"""
function osrsetwagner(hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetWagner, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetqsc(hSRS, dfCenterLat, dfCenterLong)

Quadrilateralized Spherical Cube 
"""
function osrsetqsc(hSRS, dfCenterLat, dfCenterLong)
    aftercare(ccall((:OSRSetQSC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong))
end

"""
    osrsetsch(hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt)

Spherical, Cross-track, Height 
"""
function osrsetsch(hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt)
    aftercare(ccall((:OSRSetSCH, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt))
end

"""
    osrsetverticalperspective(hSRS, dfTopoOriginLat, dfTopoOriginLon, dfTopoOriginHeight, dfViewPointHeight, dfFalseEasting, dfFalseNorthing)

Vertical Perspective / Near-sided Perspective 
"""
function osrsetverticalperspective(hSRS, dfTopoOriginLat, dfTopoOriginLon, dfTopoOriginHeight, dfViewPointHeight, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetVerticalPerspective, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfTopoOriginLat, dfTopoOriginLon, dfTopoOriginHeight, dfViewPointHeight, dfFalseEasting, dfFalseNorthing))
end

"""
    OSRCalcInvFlattening(double dfSemiMajor,
                         double dfSemiMinor) -> double

Compute inverse flattening from semi-major and semi-minor axis.

### Parameters
* **dfSemiMajor**: Semi-major axis length.
* **dfSemiMinor**: Semi-minor axis length.

### Returns
inverse flattening, or 0 if both axis are equal.
"""
function osrcalcinvflattening(dfSemiMajor, dfSemiMinor)
    aftercare(ccall((:OSRCalcInvFlattening, libgdal), Cdouble, (Cdouble, Cdouble), dfSemiMajor, dfSemiMinor))
end

"""
    OSRCalcSemiMinorFromInvFlattening(double dfSemiMajor,
                                      double dfInvFlattening) -> double

Compute semi-minor axis from semi-major axis and inverse flattening.

### Parameters
* **dfSemiMajor**: Semi-major axis length.
* **dfInvFlattening**: Inverse flattening or 0 for sphere.

### Returns
semi-minor axis
"""
function osrcalcsemiminorfrominvflattening(dfSemiMajor, dfInvFlattening)
    aftercare(ccall((:OSRCalcSemiMinorFromInvFlattening, libgdal), Cdouble, (Cdouble, Cdouble), dfSemiMajor, dfInvFlattening))
end

"""
    OSRCleanup(void) -> void

Cleanup cached SRS related memory.
"""
function osrcleanup()
    aftercare(ccall((:OSRCleanup, libgdal), Cvoid, ()))
end

"""
    OSRCRSType

Type of Coordinate Reference System (CRS). 

| Enumerator                         | Note                |
| :--------------------------------- | :------------------ |
| OSR\\_CRS\\_TYPE\\_GEOGRAPHIC\\_2D | Geographic 2D CRS   |
| OSR\\_CRS\\_TYPE\\_GEOGRAPHIC\\_3D | Geographic 3D CRS   |
| OSR\\_CRS\\_TYPE\\_GEOCENTRIC      | Geocentric CRS      |
| OSR\\_CRS\\_TYPE\\_PROJECTED       | Projected CRS       |
| OSR\\_CRS\\_TYPE\\_VERTICAL        | Vertical CRS        |
| OSR\\_CRS\\_TYPE\\_COMPOUND        | Compound CRS        |
| OSR\\_CRS\\_TYPE\\_OTHER           | Other               |
"""
@cenum OSRCRSType::UInt32 begin
        OSR_CRS_TYPE_GEOGRAPHIC_2D = 0
        OSR_CRS_TYPE_GEOGRAPHIC_3D = 1
        OSR_CRS_TYPE_GEOCENTRIC = 2
        OSR_CRS_TYPE_PROJECTED = 3
        OSR_CRS_TYPE_VERTICAL = 4
        OSR_CRS_TYPE_COMPOUND = 5
        OSR_CRS_TYPE_OTHER = 6
    end

"""
    OSRCRSInfo

Structure given overall description of a CRS.

This structure may grow over time, and should not be directly allocated by client code.

| Field               | Note                                                                                                                    |
| :------------------ | :---------------------------------------------------------------------------------------------------------------------- |
| pszAuthName         | Authority name.                                                                                                         |
| pszCode             | Object code.                                                                                                            |
| pszName             | Object name.                                                                                                            |
| eType               | Object type.                                                                                                            |
| bDeprecated         | Whether the object is deprecated                                                                                        |
| bBboxValid          | Whereas the west\\_lon\\_degree, south\\_lat\\_degree, east\\_lon\\_degree and north\\_lat\\_degree fields are valid.   |
| dfWestLongitudeDeg  | Western-most longitude of the area of use, in degrees.                                                                  |
| dfSouthLatitudeDeg  | Southern-most latitude of the area of use, in degrees.                                                                  |
| dfEastLongitudeDeg  | Eastern-most longitude of the area of use, in degrees.                                                                  |
| dfNorthLatitudeDeg  | Northern-most latitude of the area of use, in degrees.                                                                  |
| pszAreaName         | Name of the area of use.                                                                                                |
| pszProjectionMethod | Name of the projection method for a projected CRS. Might be NULL evenfor projected CRS in some cases.                   |
"""
struct OSRCRSInfo
    pszAuthName::Cstring
    pszCode::Cstring
    pszName::Cstring
    eType::OSRCRSType
    bDeprecated::Cint
    bBboxValid::Cint
    dfWestLongitudeDeg::Cdouble
    dfSouthLatitudeDeg::Cdouble
    dfEastLongitudeDeg::Cdouble
    dfNorthLatitudeDeg::Cdouble
    pszAreaName::Cstring
    pszProjectionMethod::Cstring
end

mutable struct OSRCRSListParameters
end

"""
    OSRGetCRSInfoListFromDatabase(const char * pszAuthName,
                                  const OSRCRSListParameters * params,
                                  int * pnOutResultCount) -> OSRCRSInfo **

Enumerate CRS objects from the database.

### Parameters
* **pszAuthName**: Authority name, used to restrict the search. Or NULL for all authorities.
* **params**: Additional criteria. Must be set to NULL for now.
* **pnOutResultCount**: Output parameter pointing to an integer to receive the size of the result list. Might be NULL

### Returns
an array of OSRCRSInfo* pointers to be freed with OSRDestroyCRSInfoList(), or NULL in case of error.
"""
function osrgetcrsinfolistfromdatabase(pszAuthName, params, pnOutResultCount)
    aftercare(ccall((:OSRGetCRSInfoListFromDatabase, libgdal), Ptr{Ptr{OSRCRSInfo}}, (Cstring, Ptr{OSRCRSListParameters}, Ptr{Cint}), pszAuthName, params, pnOutResultCount))
end

"""
    OSRDestroyCRSInfoList(OSRCRSInfo ** list) -> void

Destroy the result returned by OSRGetCRSInfoListFromDatabase().
"""
function osrdestroycrsinfolist(list)
    aftercare(ccall((:OSRDestroyCRSInfoList, libgdal), Cvoid, (Ptr{Ptr{OSRCRSInfo}},), list))
end

"""
    OCTNewCoordinateTransformation(OGRSpatialReferenceH hSourceSRS,
                                   OGRSpatialReferenceH hTargetSRS) -> OGRCoordinateTransformationH

Create transformation object.

### Parameters
* **hSourceSRS**: source spatial reference system.
* **hTargetSRS**: target spatial reference system.

### Returns
NULL on failure or a ready to use transformation object.
"""
function octnewcoordinatetransformation(hSourceSRS, hTargetSRS)
    aftercare(ccall((:OCTNewCoordinateTransformation, libgdal), OGRCoordinateTransformationH, (OGRSpatialReferenceH, OGRSpatialReferenceH), hSourceSRS, hTargetSRS))
end

mutable struct OGRCoordinateTransformationOptions
end

"Coordinate transformation options. "
const OGRCoordinateTransformationOptionsH = Ptr{OGRCoordinateTransformationOptions}

"""
    OCTNewCoordinateTransformationOptions(void) -> OGRCoordinateTransformationOptionsH

Create coordinate transformation options.
"""
function octnewcoordinatetransformationoptions()
    aftercare(ccall((:OCTNewCoordinateTransformationOptions, libgdal), OGRCoordinateTransformationOptionsH, ()))
end

"""
    OCTCoordinateTransformationOptionsSetOperation(OGRCoordinateTransformationOptionsH hOptions,
                                                   const char * pszCO,
                                                   int bReverseCO) -> int

Sets a coordinate operation.
"""
function octcoordinatetransformationoptionssetoperation(hOptions, pszCO, bReverseCO)
    aftercare(ccall((:OCTCoordinateTransformationOptionsSetOperation, libgdal), Cint, (OGRCoordinateTransformationOptionsH, Cstring, Cint), hOptions, pszCO, bReverseCO))
end

"""
    OCTCoordinateTransformationOptionsSetAreaOfInterest(OGRCoordinateTransformationOptionsH hOptions,
                                                        double dfWestLongitudeDeg,
                                                        double dfSouthLatitudeDeg,
                                                        double dfEastLongitudeDeg,
                                                        double dfNorthLatitudeDeg) -> int

Sets an area of interest.
"""
function octcoordinatetransformationoptionssetareaofinterest(hOptions, dfWestLongitudeDeg, dfSouthLatitudeDeg, dfEastLongitudeDeg, dfNorthLatitudeDeg)
    aftercare(ccall((:OCTCoordinateTransformationOptionsSetAreaOfInterest, libgdal), Cint, (OGRCoordinateTransformationOptionsH, Cdouble, Cdouble, Cdouble, Cdouble), hOptions, dfWestLongitudeDeg, dfSouthLatitudeDeg, dfEastLongitudeDeg, dfNorthLatitudeDeg))
end

"""
    OCTDestroyCoordinateTransformationOptions(OGRCoordinateTransformationOptionsH hOptions) -> void

Destroy coordinate transformation options.
"""
function octdestroycoordinatetransformationoptions(arg1)
    aftercare(ccall((:OCTDestroyCoordinateTransformationOptions, libgdal), Cvoid, (OGRCoordinateTransformationOptionsH,), arg1))
end

"""
    OCTNewCoordinateTransformationEx(OGRSpatialReferenceH hSourceSRS,
                                     OGRSpatialReferenceH hTargetSRS,
                                     OGRCoordinateTransformationOptionsH hOptions) -> OGRCoordinateTransformationH

Create transformation object.

### Parameters
* **hSourceSRS**: source spatial reference system.
* **hTargetSRS**: target spatial reference system.
* **hOptions**: Coordinate transformation options.

### Returns
NULL on failure or a ready to use transformation object.
"""
function octnewcoordinatetransformationex(hSourceSRS, hTargetSRS, hOptions)
    aftercare(ccall((:OCTNewCoordinateTransformationEx, libgdal), OGRCoordinateTransformationH, (OGRSpatialReferenceH, OGRSpatialReferenceH, OGRCoordinateTransformationOptionsH), hSourceSRS, hTargetSRS, hOptions))
end

"""
    OCTDestroyCoordinateTransformation(OGRCoordinateTransformationH hCT) -> void

OGRCoordinateTransformation destructor.

### Parameters
* **hCT**: the object to delete
"""
function octdestroycoordinatetransformation(arg1)
    aftercare(ccall((:OCTDestroyCoordinateTransformation, libgdal), Cvoid, (OGRCoordinateTransformationH,), arg1))
end

"""
    OCTTransform(OGRCoordinateTransformationH hTransform,
                 int nCount,
                 double * x,
                 double * y,
                 double * z) -> int

Transform an array of points.

### Parameters
* **hTransform**: Transformation object
* **nCount**: Number of points
* **x**: Array of nCount x values.
* **y**: Array of nCount y values.
* **z**: Array of nCount z values.

### Returns
TRUE or FALSE
"""
function octtransform(hCT, nCount, x, y, z)
    aftercare(ccall((:OCTTransform, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), hCT, nCount, x, y, z))
end

"""
    OCTTransformEx(OGRCoordinateTransformationH hTransform,
                   int nCount,
                   double * x,
                   double * y,
                   double * z,
                   int * pabSuccess) -> int

Transform an array of points.

### Parameters
* **hTransform**: Transformation object
* **nCount**: Number of points
* **x**: Array of nCount x values.
* **y**: Array of nCount y values.
* **z**: Array of nCount z values.
* **pabSuccess**: Output array of nCount value that will be set to TRUE/FALSE

### Returns
TRUE or FALSE
"""
function octtransformex(hCT, nCount, x, y, z, pabSuccess)
    aftercare(ccall((:OCTTransformEx, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), hCT, nCount, x, y, z, pabSuccess))
end

"""
    OCTTransform4D(OGRCoordinateTransformationH hTransform,
                   int nCount,
                   double * x,
                   double * y,
                   double * z,
                   double * t,
                   int * pabSuccess) -> int

Transform an array of points.

### Parameters
* **hTransform**: Transformation object
* **nCount**: Number of points
* **x**: Array of nCount x values. Should not be NULL
* **y**: Array of nCount y values. Should not be NULL
* **z**: Array of nCount z values. Might be NULL
* **t**: Array of nCount time values. Might be NULL
* **pabSuccess**: Output array of nCount value that will be set to TRUE/FALSE. Might be NULL.

### Returns
TRUE or FALSE
"""
function octtransform4d(hCT, nCount, x, y, z, t, pabSuccess)
    aftercare(ccall((:OCTTransform4D, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), hCT, nCount, x, y, z, t, pabSuccess))
end

struct __JL_Ctag_432
    nCount::Cint
    paList::Ptr{Cint}
end

function Base.getproperty(x::Ptr{__JL_Ctag_432}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paList && return Ptr{Ptr{Cint}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_432, f::Symbol)
    r = Ref{__JL_Ctag_432}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_432}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_432}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_433
    nCount::Cint
    paList::Ptr{GIntBig}
end

function Base.getproperty(x::Ptr{__JL_Ctag_433}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paList && return Ptr{Ptr{GIntBig}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_433, f::Symbol)
    r = Ref{__JL_Ctag_433}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_433}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_433}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_434
    nCount::Cint
    paList::Ptr{Cdouble}
end

function Base.getproperty(x::Ptr{__JL_Ctag_434}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paList && return Ptr{Ptr{Cdouble}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_434, f::Symbol)
    r = Ref{__JL_Ctag_434}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_434}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_434}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_435
    nCount::Cint
    paList::Ptr{Cstring}
end

function Base.getproperty(x::Ptr{__JL_Ctag_435}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paList && return Ptr{Ptr{Cstring}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_435, f::Symbol)
    r = Ref{__JL_Ctag_435}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_435}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_435}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_436
    nCount::Cint
    paData::Ptr{GByte}
end

function Base.getproperty(x::Ptr{__JL_Ctag_436}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paData && return Ptr{Ptr{GByte}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_436, f::Symbol)
    r = Ref{__JL_Ctag_436}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_436}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_436}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_437
    nMarker1::Cint
    nMarker2::Cint
    nMarker3::Cint
end

function Base.getproperty(x::Ptr{__JL_Ctag_437}, f::Symbol)
    f === :nMarker1 && return Ptr{Cint}(x + 0)
    f === :nMarker2 && return Ptr{Cint}(x + 4)
    f === :nMarker3 && return Ptr{Cint}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_437, f::Symbol)
    r = Ref{__JL_Ctag_437}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_437}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_437}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_438
    Year::GInt16
    Month::GByte
    Day::GByte
    Hour::GByte
    Minute::GByte
    TZFlag::GByte
    Reserved::GByte
    Second::Cfloat
end

function Base.getproperty(x::Ptr{__JL_Ctag_438}, f::Symbol)
    f === :Year && return Ptr{GInt16}(x + 0)
    f === :Month && return Ptr{GByte}(x + 2)
    f === :Day && return Ptr{GByte}(x + 3)
    f === :Hour && return Ptr{GByte}(x + 4)
    f === :Minute && return Ptr{GByte}(x + 5)
    f === :TZFlag && return Ptr{GByte}(x + 6)
    f === :Reserved && return Ptr{GByte}(x + 7)
    f === :Second && return Ptr{Cfloat}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_438, f::Symbol)
    r = Ref{__JL_Ctag_438}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_438}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_438}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

end