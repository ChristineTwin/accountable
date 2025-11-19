# Accountable DB Tables and Attributes
Notes: 
- Some changes from the ERD.
- Still need to add in actual expense accounting tables, future implementation.

## Data Dictionary and DB Design Notes

### project
| Attribute     | Data Type    | PK/FK| Constraints                  | Index | Description         |
|---------------|--------------|------|------------------------------|-------|---------------------|
| proj_id       | SERIAL       | PK   | NOT NULL, UNIQUE             | Y     | Unique identifier   |
| proj_name     | VARCHAR(50)  | -    | NOT NULL, UNIQUE             | Y     | Proposal full name  |
| proj_nickname | VARCHAR(10)  | -    | NOT NULL, UNIQUE             | Y     | Short abbreviation  |
| start_date    | DATE         | -    | NOT NULL                     | N     | Project start date  |
| end_date      | DATE         | -    | end_date > start_date        | N     | Planned/actual date | 
| status        | VARCHAR(20)  | -    | NOT NULL, (Active, Complete) | N     | Current status      | 
| description   | TEXT         | -    |                              | N     | Detailed description|

**Table Constraints:**
- CHECK (end_date IS NULL OR end_date > start_date)
- Future step would be to constrain status or have a table of status values

### funder
| Attribute      | Data Type    | PK/FK| Constraints                        | Index | Description         |
|----------------|--------------|------|------------------------------------|-------|---------------------|
| funder_id      | SERIAL       | PK   | NOT NULL, UNIQUE                   | Y     | Unique identifier   |
| funder_name    | VARCHAR(100) | -    | NOT NULL, UNIQUE                   | Y     | Funder name         |
| funder_type    | VARCHAR(50)  | -    | NOT NULL, Fed, State,Foundation, Corporate| N | Type of funding organization |
| notes          | TEXT         | -    |                                    | N     | Notes about funder  |

- Future step would be to constrain funder_type or have a table of funder_type values

### project_funder
| Attribute       | Data Type    | PK/FK| Constraints                         | Index | Description              |
|-----------------|--------------|------|-------------------------------------|-------|--------------------------|
| funding_id      | SERIAL       | PK   | NOT NULL, UNIQUE                    | Y     | Unique identifier        |
| project_id      | INTEGER      | FK   | NOT NULL, project(proj_id)          | Y     | References project table |
| funder_id       | INTEGER      | FK   | NOT NULL, funder(funder_id)         | Y     | References funder table  |
| award_number    | VARCHAR(50)  | -    | UNIQUE                              | Y     | NULL if proposed         |
| total_amount    | DECIMAL(12,2)| -    | CHECK (total_amount >= 0)           | N     | Total from this funder   |
| start_date      | DATE         | -    | NOT NULL                            | N     | Funding start date       |
| end_date        | DATE         | -    | NULL OR end_date > start_date       | N     | Funding end date         |
| status          | VARCHAR(20)  | -    | NOT NULL, Proposed, Active, Complete| N     | Funding status           |

**Table Constraints:**
- UNIQUE (project_id, funder_id)
- CHECK (end_date IS NULL OR end_date > start_date)

### budget_categories (reference table - shared codes)
| Attribute       | Data Type    | PK/FK| Constraints                        | Index | Description             |
|-----------------|--------------|------|------------------------------------|-------|-------------------------|
| category_id     | SERIAL       | PK   | NOT NULL, UNIQUE                   | Y     | Unique identifier       |
| code            | VARCHAR(20)  | -    | NOT NULL, UNIQUE                   | Y     | Budget code (e.g., "PERS", "EQUIP") |
| description     | VARCHAR(100) | -    | NOT NULL                           | N     | Category description (e.g., "Personnel Costs") |

### budget
| Attribute       | Data Type    | PK/FK| Constraints                        | Index | Description         |
|-----------------|--------------|------|------------------------------------|-------|---------------------|
| budget_id       | SERIAL       | PK   | NOT NULL, UNIQUE                   | Y     | Unique identifier   |
| project_id      | INTEGER      | FK   | NOT NULL, project(proj_id)         | Y     | References project table |
| notes           | TEXT         | -    |                                    | N     | Budget notes or description |

### budget_line
| Attribute       | Data Type    | PK/FK| Constraints                        | Index | Description             |
|-----------------|--------------|------|------------------------------------|-------|-------------------------|
| budget_line_id  | SERIAL       | PK   | NOT NULL, UNIQUE                   | Y     | Unique identifier       |
| budget_id       | INTEGER      | FK   | NOT NULL, budget(budget_id)        | Y     | References budget table |
| category_id     | INTEGER      | FK   | NOT NULL, budget_categories(category_id) | Y | References budget category |
| funder_id       | INTEGER      | FK   | NOT NULL, funder(funder_id)        | Y     | References funder table |
| description     | TEXT         | -    |                                    | N     | Optional additional notes |

### personnel
| Attribute         | Data Type    | PK/FK| Constraints                        | Index | Description         |
|-------------------|--------------|------|------------------------------------|-------|---------------------|
| person_id         | SERIAL       | PK   | NOT NULL, UNIQUE                   | Y     | Unique identifier   |
| fname             | VARCHAR(50)  | -    | NOT NULL                           | N     | First name          |
| lname             | VARCHAR(50)  | -    | NOT NULL                           | N     | Last name           |
| email             | VARCHAR(100) | -    | UNIQUE                             | Y     | Email address       |
| phone             | VARCHAR(20)  | -    |                                    | N     | Phone number        |
| address           | TEXT         | -    |                                    | N     | Full mailing        |
| rate              | DECIMAL(10,2)| -    | CHECK (rate >= 0)                  | N     | Hourly rate         |

- Future implementation adds role entity and then adds FK to personnel table  
| role_id           | INTEGER      | FK   | classifications(classification_id) | Y     | Personnel role      |

### person_line
| Attribute       | Data Type    | PK/FK| Constraints                        | Index | Description             |
|-----------------|--------------|------|------------------------------------|-------|-------------------------|
| person_line_id  | SERIAL       | PK   | NOT NULL, UNIQUE                   | Y     | Unique identifier       |
| budget_line_id  | INTEGER      | FK   | NOT NULL, budget_line(budget_line_id) | Y  | References budget line  |
| person_id       | INTEGER      | FK   | NOT NULL, personnel(person_id)     | Y     | References personnel    |
| amount          | DECIMAL(12,2)| -    | NOT NULL, CHECK (amount >= 0)      | N     | Amount for this person  |
| description     | TEXT         | -    |                                    | N     | Role/position description |

### line_items
| Attribute       | Data Type    | PK/FK| Constraints                        | Index | Description         |
|-----------------|--------------|------|------------------------------------|-------|---------------------|
| line_item_id    | SERIAL       | PK   | NOT NULL, UNIQUE                   | Y     | Unique identifier   |
| budget_line_id  | INTEGER      | FK   | NOT NULL, budget_line(budget_line_id) | Y  | References budget line |
| description     | VARCHAR(100) | -    | NOT NULL                           | N     | Line item description |
| amount          | DECIMAL(12,2)| -    | NOT NULL, CHECK (amount >= 0)      | N     | Line item amount    |

### report
| Attribute         | Data Type    | PK/FK  | Constraints                           | Index | Description               |
|-------------------|--------------|--------|---------------------------------------|-------|---------------------------|
| report_id         | SERIAL       | PK     | NOT NULL, UNIQUE                      | Y     | Unique identifier         |
| funding_id        | INTEGER      | FK     | NOT NULL, project_funder(funding_id)  | Y     | References project_funder |
| due_date          | DATE         | -      | NOT NULL                              | N     | Report due date           |
| completed         | BOOLEAN      | -      | NOT NULL, DEFAULT FALSE               | N     | Whether is completed      |
| notes             | TEXT         | -      |                                       | N     | Report notes              |

### deliverable
| Attribute           | Data Type    | PK/FK  | Constraints                           | Index | Description               |
|---------------------|--------------|--------|---------------------------------------|-------|---------------------------|
| deliverable_id      | SERIAL       | PK     | NOT NULL, UNIQUE                      | Y     | Unique identifier         |
| project_id          | INTEGER      | FK     | NOT NULL, REFERENCES project(proj_id) | Y     | References project table  |
| deliverable_name    | VARCHAR(100) | -      | NOT NULL                              | N     | Name of deliverable       |
| description         | TEXT         | -      |                                       | N     | Detailed description      |
| status              | TEXT         | -      |                                       | N     | Current status            |
| notes               | TEXT         | -      |                                       | N     | Additional notes          |

### deliverable_funder
| Attribute           | Data Type    | PK/FK  | Constraints                           | Index | Description                  |
|---------------------|--------------|--------|---------------------------------------|-------|------------------------------|
| deliverable_id      | INTEGER      | PK,FK  | NOT NULL, deliverable(deliverable_id) | Y     | References deliverable table |
| funder_id           | INTEGER      | PK,FK  | NOT NULL, funder(funder_id)           | Y     | References funder table      |
| notes               | TEXT         | -      |                                       | N     | Notes specific tothis funder |

### weekly_report
| Attribute              | Data Type    | PK/FK  | Constraints                           | Index | Description               |
|------------------------|--------------|--------|---------------------------------------|-------|---------------------------|
| w_report_id            | SERIAL       | PK     | NOT NULL, UNIQUE                      | Y     | Unique identifier         |
| person_id              | INTEGER      | FK     | NOT NULL, personnel(person_id)        | Y     | References personnel table |
| project_id             | INTEGER      | FK     | NOT NULL, project(proj_id)            | Y     | References project table  |
| timestamp              | TIMESTAMP    | -      | NOT NULL, DEFAULT CURRENT_TIMESTAMP   | Y     | When report was created   |

### w_report_item
| Attribute              | Data Type    | PK/FK  | Constraints                           | Index | Description               |
|------------------------|--------------|--------|---------------------------------------|-------|---------------------------|
| report_item_id         | SERIAL       | PK     | NOT NULL, UNIQUE                      | Y     | Unique identifier         |
| w_report_id            | INTEGER      | FK     | NOT NULL, weekly_report(w_report_id)  | Y     | References weekly report  |
| hours                  | DECIMAL(5,2) | -      | NOT NULL, CHECK (hours > 0)           | N     | Hours spent on activity   |
| text                   | TEXT         | -      | NOT NULL                              | N     | Activity description      |


--- 
Don't build this out yet, since we aren't implementing the AI functionality yet.

### classifications
| Attribute              | Data Type    | PK/FK  | Constraints                           | Index | Description               |
|------------------------|--------------|--------|---------------------------------------|-------|---------------------------|
| classification_id      | SERIAL       | PK     | NOT NULL, UNIQUE                      | Y     | Unique identifier         |
| w_report_item_id       | INTEGER      | FK     | w_report_item(w_report_item_id)       | Y     | References report item    |
| project_id             | INTEGER      | FK     | NOT NULL, REFERENCES project(proj_id) | Y     | References project table  |
| ai_deliverable_id      | INTEGER      | FK     | REFERENCES deliverable(deliverable_id)| Y     | AI predicted deliverable  |
| actual_deliverable_id  | INTEGER      | FK     | REFERENCES deliverable(deliverable_id)| Y     | IF PM verified deliverable|
| confidence_score       | DECIMAL(3,2) | -      | confidence_score BETWEEN 0 AND 1      | N     | AI confidence (0.0 to 1.0)|
