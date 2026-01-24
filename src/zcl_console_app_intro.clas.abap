CLASS zcl_console_app_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS:
        demo_hello_world
            IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out,
        demo_variables
            IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out,
        demo_internal_table
            IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out,
        demo_all_in_one
            IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.



CLASS zcl_console_app_intro IMPLEMENTATION.
      METHOD if_oo_adt_classrun~main.
        " Call whatever demo you want to run:
        demo_hello_world( out ).
        demo_variables( out ).
        demo_internal_table( out ).
        demo_all_in_one( out ).
      ENDMETHOD.

  METHOD demo_hello_world.
    out->write( |Hello from demo_hello_world!| ).
  ENDMETHOD.

  METHOD demo_variables.
    DATA: lv_text  TYPE string,
          lv_count TYPE i.

    lv_text  = 'ABAP syntax demo'.
    lv_count = 5.

    out->write( |Text:  { lv_text }| ).
    out->write( |Count: { lv_count }| ).
  ENDMETHOD.

  METHOD demo_internal_table.
    TYPES: BEGIN OF ty_person,
             id   TYPE i,
             name TYPE string,
           END OF ty_person.

    DATA: lt_persons TYPE STANDARD TABLE OF ty_person,
          ls_person  TYPE ty_person.

    " Fill table
    ls_person-id   = 1.
    ls_person-name = 'Anna'.
    APPEND ls_person TO lt_persons.

    ls_person-id   = 2.
    ls_person-name = 'Ben'.
    APPEND ls_person TO lt_persons.

    ls_person-id   = 3.
    ls_person-name = 'Chris'.
    APPEND ls_person TO lt_persons.

    " Loop and output
    LOOP AT lt_persons INTO ls_person.
      out->write( |ID: { ls_person-id }  Name: { ls_person-name }| ).
    ENDLOOP.
  ENDMETHOD.

  METHOD demo_all_in_one.
    TYPES: BEGIN OF ty_item,
             id       TYPE i,
             title    TYPE string,
             price    TYPE decfloat16,
           END OF ty_item.

    DATA: lt_items TYPE STANDARD TABLE OF ty_item,
          ls_item  TYPE ty_item,
          lv_total TYPE decfloat16 VALUE 0.

    " Fill items
    ls_item-id    = 1.
    ls_item-title = 'Notebook'.
    ls_item-price = '9.99'.
    APPEND ls_item TO lt_items.

    ls_item-id    = 2.
    ls_item-title = 'Pen'.
    ls_item-price = '1.49'.
    APPEND ls_item TO lt_items.

    ls_item-id    = 3.
    ls_item-title = 'Backpack'.
    ls_item-price = '29.95'.
    APPEND ls_item TO lt_items.

    " Loop and sum
    LOOP AT lt_items INTO ls_item.
      out->write(
        |ID: { ls_item-id }  Title: { ls_item-title }  Price: { ls_item-price }|
      ).
      lv_total = lv_total + ls_item-price.
    ENDLOOP.

    out->write( '------------------------' ).
    out->write( |Total: { lv_total }| ).
  ENDMETHOD.

ENDCLASS.
