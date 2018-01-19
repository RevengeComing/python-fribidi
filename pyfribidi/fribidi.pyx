from libc.stdlib cimport malloc, free

cimport cython

from cpython.mem cimport PyMem_Malloc, PyMem_Free

from .cfribidi cimport (FriBidiChar, FriBidiStrIndex, FriBidiCharType,
    fribidi_log2vis, FriBidiLevel, FriBidiParType)

def log2vis(unicode_string):
    cdef FriBidiStrIndex length = len(unicode_string)
    cdef FriBidiChar *str = <FriBidiChar *>malloc((length + 1)*cython.sizeof(FriBidiChar))
    cdef FriBidiParType *pbase_dir = <FriBidiParType *>malloc(cython.sizeof(FriBidiParType))
    pbase_dir[0] = 64

    cdef FriBidiChar *visual_str = <FriBidiChar *>malloc((length + 1)*cython.sizeof(FriBidiChar))

    for i in range(length):
        str[i] = ord(unicode_string[i])

    fribidi_log2vis(
        str, length, pbase_dir, visual_str,
        NULL, NULL, NULL
    )

    result = ''
    for i in range(length):
        result += chr(visual_str[i])

    free(str)
    free(visual_str)
    free(pbase_dir)

    return result