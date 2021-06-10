final createUserTable = '''
  CREATE TABLE user (
    id INT NOT NULL PRIMARY KEY
    ,name VARCHAR(255) NOT NULL
    ,login VARCHAR(255) NOT NULL
    ,password VARCHAR(50) NOT NULL
    ,cpf CHAR(14) NOT NULL
    ,company_position CHAR(2) NOT NULL 
    ,active CHAR(1) NOT NULL DEFAULT 'Y'
  )
''';
