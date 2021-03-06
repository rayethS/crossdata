Feature: PostgreSql Select with equals filter

  # NUMBERS
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_1 = -32768;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_1 = -32768'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_2 = -2147483648;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_2 = -2147483648'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_3 = -9223372036854775808;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_3 = -9223372036854775808'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_4 = -1000.0001;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_4 = -1000.0001'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_5 = -1000.0001;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_5 = -1000.0001'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_6 = 20000.00;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_6 = 20000.00'
    Then The result has to have '5' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      |-32768|-2147483648|-9223372036854775808|-1000.000100000000000000|-1000.000100000000000000|20000.0|2.0      |1    |1       |1       |
      |-100  |-100       |-100                |-100.001000000000000000 |-100.001000000000000000 |20000.0|2000000.0|10   |10      |10      |
      |-10   |-10        |-10                 |-10.010000000000000000  |-10.010000000000000000  |20000.0|2.0E7    |100  |100     |100     |
      |-1    |-1         |-1                  |-1.100000000000000000   |-1.100000000000000000   |20000.0|2.0E8    |1000 |1000    |1000    |
      |100   |100        |100                 |100.001000000000000000  |100.001000000000000000  |20000.0|2.0E12   |26000|10000000|10000000|

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_7 = 2.00000000000000;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_7 = 2.00000000000000'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_8 = 1;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_8 = 1'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_9 = 1;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_9 = 1'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatanumbers WHERE col_10 = 1;
    When I execute 'SELECT * FROM databasetest.crossdatanumbers WHERE col_10 = 1'
    Then The result has to have '1' rows:
      | col_1-integer | col_2-integer     | col_3-long          | col_4-decimal(38,18)      | col_5-decimal(38,18)    | col_6-double  | col_7-double    | col_8-integer  | col_9-integer  | col_10-long   |
      | -32768        |-2147483648        |-9223372036854775808 |-1000.000100000000000000   |-1000.000100000000000000 |20000.0        |2.0              |1               |1               |1              |

# CHARACTERS
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatacharacter WHERE col_1 = 'example_1';
    When I execute 'SELECT * FROM databasetest.crossdatacharacter WHERE col_1 = 'example_1''
    Then The result has to have '1' rows:
      | col_1-string     | col_2-string     | col_3-string     | col_4-string     | col_5-string     |
      | example_1 |example_1  |example_1 |example_1 |example_1  |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatacharacter WHERE col_2 = 'example_1';
    When I execute 'SELECT * FROM databasetest.crossdatacharacter WHERE col_2 = 'example_1''
    Then The result has to have '1' rows:
      | col_1-string     | col_2-string     | col_3-string     | col_4-string     | col_5-string     |
      | example_1 |example_1  |example_1 |example_1 |example_1  |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatacharacter WHERE col_3 = 'example_1';
    When I execute 'SELECT * FROM databasetest.crossdatacharacter WHERE col_3 = 'example_1''
    Then The result has to have '1' rows:
      | col_1-string     | col_2-string     | col_3-string     | col_4-string     | col_5-string     |
      | example_1 |example_1  |example_1 |example_1 |example_1  |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatacharacter WHERE col_4 = 'example_1';
    When I execute 'SELECT * FROM databasetest.crossdatacharacter WHERE col_4 = 'example_1''
    Then The result has to have '1' rows:
      | col_1-string     | col_2-string     | col_3-string     | col_4-string     | col_5-string     |
      | example_1 |example_1  |example_1 |example_1 |example_1  |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatacharacter WHERE col_5 = 'example_1';
    When I execute 'SELECT * FROM databasetest.crossdatacharacter WHERE col_5 = 'example_1''
    Then The result has to have '1' rows:
      | col_1-string     | col_2-string     | col_3-string     | col_4-string     | col_5-string     |
      | example_1 |example_1  |example_1 |example_1 |example_1  |


#BOOLEAN
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdataboolean WHERE col_1 =TRUE;
    When I execute 'SELECT * FROM databasetest.crossdataboolean WHERE col_1 =TRUE'
    Then The result has to have '7' rows:
      | col_1-boolean |
      | true  |
      | true  |
      | true  |
      | true  |
      | true  |
      | true  |
      | true  |

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdataboolean WHERE col_1 =true;
    When I execute 'SELECT * FROM databasetest.crossdataboolean WHERE col_1 =true'
    Then The result has to have '7' rows:
      | col_1-boolean |
      | true  |
      | true  |
      | true  |
      | true  |
      | true  |
      | true  |
      | true  |

  #UUID
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatauuid WHERE col_1 = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11';
    When I execute 'SELECT * FROM databasetest.crossdatauuid WHERE col_1 = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11''
    Then The result has to have '5' rows:
      | col_1-string                       |
      |a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11|
      |a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11|
      |a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11|
      |a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11|
      |a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11|

  #ARRAY<int>
  Scenario:[POSTGRESQL NATIVE-ARRAYS TYPES]Select * FROM databasetest.crossdataarray where col_2[1] = 10000
    When I execute 'SELECT col_1, col_2 FROM databasetest.crossdataarray where col_2[1] = 10000 '
    Then The result has to have '1' rows:
      | col_1-string | col_2-array<int> |
      | Bill  | 10000,10000,10000,10000 |

  #TIMESTAMP
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatatimestamp where col_1 = '2016-12-15 15:12:32.459957';
    When I execute 'SELECT * FROM databasetest.crossdatatimestamp where col_1 = '2016-12-15 15:12:32.459957''
    Then The result has to have '1' rows:
      | col_1-timestamp                     | col_2-timestamp                    |
      |2016-12-15 15:12:32.459957 |2016-12-16 00:12:32.459957|

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatatimestamp where col_2='2016-12-16 00:12:32.459957';
    When I execute 'SELECT * FROM databasetest.crossdatatimestamp where col_2='2016-12-16 00:12:32.459957' '
    Then The result has to have '1' rows:
      | col_1-timestamp                     | col_2-timestamp                    |
      |2016-12-15 15:12:32.459957 |2016-12-16 00:12:32.459957|

  #DATE
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatadate where col_1 = '1999-01-08';
    When I execute 'SELECT * FROM databasetest.crossdatadate where col_1 = '1999-01-08''
    Then The result has to have '12' rows:
      | col_1-date     |
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
      |1999-01-08|
  #TIME
  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatatime where col_1 = '1970-01-01 04:05:06.789';
    When I execute 'SELECT * FROM databasetest.crossdatatime where col_1 = '1970-01-01 04:05:06.789''
    Then The result has to have '1' rows:
      | col_1-timestamp                 | col_2-timestamp               |
      |1970-01-01 04:05:06.789|1970-01-01 13:05:06.0|

  Scenario: [CROSSDATA-841 : POSTGRESQL NATIVE] SELECT * FROM databasetest.crossdatatime where col_2='04:05:06-08';
    When I execute 'SELECT * FROM databasetest.crossdatatime where col_2='04:05:06-08''
    Then The result has to have '2' rows:
      | col_1-timestamp                 | col_2-timestamp               |
      |1970-01-01 04:05:06.789  |1970-01-01 13:05:06.0|
      |1970-01-01 04:05:06  |1970-01-01 13:05:06.0|