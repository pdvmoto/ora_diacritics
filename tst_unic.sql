
column code_point format A6 head cde_pnt
column uni_str format A7 head cde_pnt
column to_nr format 999999 
column asc_nr format 9999
column uname  format A40
column uname1 format A40

set linesize 128 
set pagesize 100

select  u.code_point
      , ' [' || unistr ( '\'||u.code_point ) || '] ' uni_str
      , to_number ( u.code_point, 'XXXXXX' ) to_nr
--    , chr ( to_number ( u.code_point, 'XXXXXX' ))  nr2chr
      , ascii (  to_number ( u.code_point, 'XXXXXX' ) ) asc_nr
--    , utl_raw.length ( hextoraw ( u.code_point ) )  lenrw
--    , utl_raw.cast_to_number ( hextoraw( u.code_point) ) numbr
--    , to_nuber ( u.code_point, '\XXXXX' ) nr
      , u.name uname,  u.unicode_1_name  uname1
--, u.* 
from unicode_data  u 
order by u.code_point   ; 

