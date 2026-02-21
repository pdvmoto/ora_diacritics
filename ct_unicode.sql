-- create table to load unicode data..

CREATE TABLE unicode_data (
    code_point              VARCHAR2(6)   NOT NULL, -- hex, e.g. 00E9
    name                    VARCHAR2(200),
    general_category        VARCHAR2(2),
    combining_class         NUMBER,
    bidi_class              VARCHAR2(3),
    decomposition_mapping   VARCHAR2(200),
    decimal_digit_value     VARCHAR2(10),
    digit_value             VARCHAR2(10),
    numeric_value           VARCHAR2(20),
    bidi_mirrored           CHAR(1),
    unicode_1_name          VARCHAR2(200),
    iso_comment             VARCHAR2(200),
    simple_uppercase        VARCHAR2(6),
    simple_lowercase        VARCHAR2(6),
    simple_titlecase        VARCHAR2(6)
);

ALTER TABLE unicode_data
ADD CONSTRAINT unicode_data_pk PRIMARY KEY (code_point);

CREATE OR REPLACE VIEW unicode_chars_bmp AS
SELECT
    code_point,
    UNISTR('\' || code_point) AS chr,
    name,
    general_category,
    combining_class,
    bidi_class,
    decomposition_mapping,
    numeric_value
FROM unicode_data
WHERE TO_NUMBER(code_point, 'XXXX') <= 65535;

-- not really happy here..
CREATE OR REPLACE VIEW unicode_chars AS
SELECT
    code_point,
    CASE
      -- BMP
      WHEN cp_num <= 65535 THEN
        UNISTR('\' || code_point)
      -- Supplementary planes
      ELSE
        UNISTR(
          '\' ||
          TO_CHAR(
            55296 + FLOOR((cp_num - 65536) / 1024),
            'XXXX'
          ) ||
          '\' ||
          TO_CHAR(
            56320 + MOD(cp_num - 65536, 1024),
            'XXXX'
          )
        )
    END AS chr,
    name,
    general_category,
    combining_class,
    bidi_class,
    decomposition_mapping,
    numeric_value
FROM (
    SELECT
        u.*,
        TO_NUMBER(code_point, 'XXXX') AS cp_num
    FROM unicode_data u
);


