LOAD DATA
CHARACTERSET UTF8
INFILE 'UnicodeData.txt'
BADFILE 'UnicodeData.bad'
DISCARDFILE 'UnicodeData.dsc'
APPEND
INTO TABLE unicode_data
FIELDS TERMINATED BY ';'
TRAILING NULLCOLS
(
  code_point              CHAR(6),
  name                    CHAR(200),
  general_category        CHAR(2),
  combining_class         INTEGER EXTERNAL,
  bidi_class              CHAR(3),
  decomposition_mapping   CHAR(200),
  decimal_digit_value     CHAR(10),
  digit_value             CHAR(10),
  numeric_value           CHAR(20),
  bidi_mirrored           CHAR(1),
  unicode_1_name          CHAR(200),
  iso_comment             CHAR(200),
  simple_uppercase        CHAR(6),
  simple_lowercase        CHAR(6),
  simple_titlecase        CHAR(6)
)

