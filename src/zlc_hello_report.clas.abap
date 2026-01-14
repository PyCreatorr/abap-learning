CLASS zlc_hello_report DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA gv_int TYPE i.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zlc_hello_report IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: gv_name TYPE string.

    " DATA(lv_uline) TYPE string.
    DATA(lv_uline) = repeat( val = '-' occ = 50 ).

    gv_name = 'MY NAME'.
    DATA: gv_name2 TYPE string VALUE ' MY NAME'.

    out->write( |Hello World!| ).
    out->write( |Text: { gv_name }| ).
    out->write( |Line 1\n| ). "Print and empty line
    out->write( |Line 1\n\nLine 4| ).

    out->write( |Text2: { gv_name2 }| ).
    out->write( |Text1: { gv_name }  Text2: { gv_name2 }| ).

    out->write( lv_uline ).
  ENDMETHOD.
ENDCLASS.
