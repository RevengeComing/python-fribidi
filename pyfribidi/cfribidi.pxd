from libc.stdint cimport uint32_t


cdef extern from "fribidi.h" :
    ctypedef int fribidi_boolean

    ctypedef uint32_t FriBidiChar
    ctypedef int FriBidiStrIndex
    ctypedef uint32_t FriBidiCharType
    ctypedef uint32_t FriBidiParType
    ctypedef signed char FriBidiLevel

    fribidi_boolean fribidi_log2vis(
        FriBidiChar     *str,
        FriBidiStrIndex len,
        FriBidiCharType *pbase_dir,

        FriBidiChar     *visual_str,
        FriBidiStrIndex *position_L_to_V_list,
        FriBidiStrIndex *position_V_to_L_list,
        FriBidiLevel    *embedding_level_list
    )