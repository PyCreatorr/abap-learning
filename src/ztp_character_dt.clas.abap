CLASS ztp_character_dt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

" ---------------------------------- "
" Variables "
" ---------------------------------- "
    DATA: gv_char(10) TYPE c,
          gv_numc(10) TYPE n,
          gv_string   TYPE string.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztp_character_dt IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
        gv_char = 'TestTestTe'.
        gv_numc = '12345789'.

        gv_string = 'Dies ist ein String'.


        out->write( |{ gv_char } { gv_numc } { gv_string }| ).
        gv_string = |{ gv_string } { gv_char } { gv_numc }|.

        out->write( | gv_string: { gv_string }| ).

        " ---------------------------------- "
        " FIND SUBSCRINGS "
        " ---------------------------------- "

        FIND '12345' IN gv_string.

        IF sy-subrc = 0.
          out->write( |Found at position { sy-fdpos }| ).
        ELSE.
          out->write( |Not found| ).
        ENDIF.

        " ---------------------------------- "
        " REPLACE COMMAND "
        " ---------------------------------- "
        DATA(str) = `Hallo`.

        REPLACE ALL OCCURRENCES OF 'Test' IN gv_string WITH ' Hi, guys!'.
        IF sy-subrc = 0.
            out->write( |{ gv_string }| ).
        ELSE.
            out->write( |'Not found!'| ).
        ENDIF.


        " ---------------------------------- "
        " SPLIT String "
        " ---------------------------------- "
        DATA(lv_full_name) = 'Heinrich Lutz'.
        DATA: lv_vorname TYPE string,
        lv_nachname TYPE string.

        SPLIT lv_full_name AT ' ' INTO lv_vorname lv_nachname.

        IF sy-subrc = 0.
            out->write( |Vorname: { lv_vorname }, Nachname: { lv_nachname }| ).
        ENDIF.

        " ---------------------------------- "
        " CONDENSE - Remove empty spaces or gaps"
        " ---------------------------------- "

        DATA(lv_text) = '  Hello    world   '.

        " CONDENSE lv_text.
        CONDENSE lv_text NO-GAPS.

        out->write( | condensed text:{ lv_text }| ).

        " ---------------------------------- "
        " TRANSLATE - change characters in a string/char field. Most often it’s used to change case. "
        " ---------------------------------- "

        TRANSLATE lv_text TO UPPER CASE.
        out->write(  |{ lv_text }| ).

        TRANSLATE lv_text TO LOWER CASE.
        out->write(  |{ lv_text }| ).

        " ---------------------------------- "
        " TRANSLATE - Replace characters using a mapping "
        " ---------------------------------- "
        DATA(lv_text2) = 'a1b2c3'.
        TRANSLATE lv_text2 USING 'abcXYZ'.
        " meaning: a->X, b->Y, c->Z
        " gv_text = 'X1Y2Z3'

        "Rule: USING takes pairs:
        "first half = “from”, second half = “to”, same length.

        out->write(  |{ lv_text2 }| ).

        DATA(lv_text3) = 'Hello!'.

        TRANSLATE lv_text3 USING '!?.   '.
        " ! -> space, ? -> space, . -> space
        " gv_text = 'Hello '
        out->write(  |{ lv_text3 }| ).

        out->write( TEXT-001 ).


    ENDMETHOD.
ENDCLASS.
