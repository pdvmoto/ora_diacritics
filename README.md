# ora_diacritics

Experiment with Diacritics in oracle and spoolfiles to linux.

loaded text file from unicode
exameine data in table.
spool all characters to spoolfile, and check outout 
=> are all Characters as Desired.. ? 

probably need linux settings:

export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
export LANG=en_US.UTF-8 

then sqlplus.. spool stuff..

check: file <spoolfile> to be utf8

