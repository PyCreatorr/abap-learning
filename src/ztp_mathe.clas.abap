CLASS ztp_mathe DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA:gv_zahl    TYPE i,
         gv_dezimal TYPE p DECIMALS 2 VALUE '4.20',
         gv_adress  TYPE string.

    CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'.

    " DATA(gv_dezimal2) = VALUE p( DECIMALS = 2 ( '4.20' ) ).

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztp_mathe IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "DATA(gv_dezimal2) = VALUE p( LENGTH = 8 DECIMALS = 2 ( '4.20' ) ).

    DATA gv_var1 TYPE p DECIMALS 2.
    DATA gv_var2 TYPE p DECIMALS 2.
    DATA gv_erg TYPE p DECIMALS 2.

    gv_var1 = 3.
    gv_var2 = 5.

    gv_erg = gv_var1 - gv_var2.

    " ADD gv_var1 To gv_erg.

    DATA gv_dezimal2 TYPE p DECIMALS 2 VALUE '4.20'.

    out->write( |{ gv_dezimal } \n { gc_pi } \n { gv_erg }| ).

  ENDMETHOD.
ENDCLASS.
