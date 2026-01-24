CLASS ztp_mathe_advanced DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: gv_string TYPE string VALUE 'Hallo',
          gv_zahl   TYPE i VALUE 5.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztp_mathe_advanced IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "DATA(gv_dezimal2) = VALUE p( LENGTH = 8 DECIMALS = 2 ( '4.20' ) ).

    DATA gv_string TYPE string.
    DATA(gv_zahl2) = CONV i( 3 ).
    DATA(gv_zahl3) = CONV i( 2 ).
    DATA(gv_zahl4) = CONV i( 3 ).

    " DATA(gv_dezimal2) = VALUE p( DECIMALS = 2 ( '4.20' ) ).  " default length, no decimals control needed here
    DATA gv_erg TYPE p DECIMALS 2.

    gv_string = '3'.
    " gv_var2 = 5.

    " gv_erg = gv_var1 - gv_var2.

    " ADD gv_var1 To gv_erg.

    DATA gv_dezimal2 TYPE p DECIMALS 2 VALUE '4.20'.

    " gv_dezimal2 = gv_dezimal2 / gv_zahl2.
    gv_dezimal2 = gv_dezimal2 MOD gv_zahl2.

    gv_zahl3 = gv_zahl3 DIV gv_zahl2.

    gv_zahl4 = gv_zahl4 ** gv_zahl2.

    out->write( |{ gv_dezimal2 } \n { gv_zahl3 }  { gv_zahl4 }| ).

  ENDMETHOD.
ENDCLASS.
