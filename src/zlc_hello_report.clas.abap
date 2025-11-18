CLASS zlc_hello_report DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zlc_hello_report IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( |Hello World!!| ).
  ENDMETHOD.
ENDCLASS.
