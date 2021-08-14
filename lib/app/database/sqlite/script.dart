final createProjectTable = '''
  CREATE TABLE project (
    id INTEGER NOT NULL PRIMARY KEY
    ,name VARCHAR(255) NOT NULL
    ,description VARCHAR(500) 
    ,clone_link VARCHAR(255)
  );
''';

final createTaskTable = '''
  CREATE TABLE task (
    id INTEGER NOT NULL PRIMARY KEY
    ,name VARCHAR(255) NOT NULL
    ,custom_identifier VARCHAR(255)
    ,description VARCHAR(255) 
  );
''';
