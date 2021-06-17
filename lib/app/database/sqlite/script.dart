final createProjectTable = '''
  CREATE TABLE project (
    id INT PRIMARY KEY
    ,name VARCHAR(255) NOT NULL
    ,description VARCHAR(500) 
    ,clone_link VARCHAR(255)
    ,active CHAR NOT NULL DEFAULT 'Y'
    ,created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
''';

final createTaskTable = '''
  CREATE TABLE (
    id INT PRIMARY KEY
    ,custom_identifier VARCHAR(255)
    ,description VARCHAR(255)
    ,active CHAR NOT NULL DEFAULT 'Y'
    ,created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,project_id INT 
    ,CONSTRAINT fk_project_id FOREIGN KEY (project_id) REFERENCES project (id)
  )
''';
