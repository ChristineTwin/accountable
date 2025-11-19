DROP TABLE IF EXISTS project CASCADE;
CREATE TABLE project (
  proj_id SERIAL PRIMARY KEY,
  proj_name VARCHAR(50) NOT NULL UNIQUE,
  proj_nickname VARCHAR(10) NOT NULL UNIQUE,
  start_date DATE NOT NULL,
  end_date DATE,
  status VARCHAR(20) NOT NULL,
  description TEXT,
  CHECK (end_date IS NULL OR end_date > start_date)
);

CREATE INDEX idx_proj_name ON project(proj_name);
CREATE INDEX idx_proj_nickname ON project(proj_nickname);

DROP TABLE IF EXISTS funder CASCADE;
CREATE TABLE funder (
  funder_id SERIAL PRIMARY KEY,
  funder_name VARCHAR(100) NOT NULL UNIQUE,
  funder_type VARCHAR(50) NOT NULL,
  notes TEXT
);

CREATE INDEX idx_funder_name ON funder(funder_name);

DROP TABLE IF EXISTS project_funder CASCADE;
CREATE TABLE project_funder (
    funding_id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL,
    funder_id INTEGER NOT NULL,
    award_number VARCHAR(50) UNIQUE,
    total_amount DECIMAL(12,2),
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project(proj_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    FOREIGN KEY (funder_id) REFERENCES funder(funder_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    CHECK (total_amount >= 0),
    CHECK (end_date IS NULL OR end_date > start_date),
    UNIQUE (project_id, funder_id)
);

CREATE INDEX idx_proj_fund_proj_id ON project_funder(project_id);
CREATE INDEX idx_proj_fund_funder_id ON project_funder(funder_id);
CREATE INDEX idx_proj_fund_award_num ON project_funder(award_number);

DROP TABLE IF EXISTS budget_categories CASCADE;
CREATE TABLE budget_categories (
    category_id SERIAL PRIMARY KEY,
    budget_code VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(100) NOT NULL
);

CREATE INDEX idx_budget_cat_code ON budget_categories(budget_code);

DROP TABLE IF EXISTS budget CASCADE;
CREATE TABLE budget (
    budget_id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL,
    notes TEXT,
    FOREIGN KEY (project_id) REFERENCES project(proj_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE INDEX idx_budget_proj_id ON budget(project_id);

DROP TABLE IF EXISTS budget_line CASCADE;
CREATE TABLE budget_line (
    budget_line_id SERIAL PRIMARY KEY,
    budget_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    funder_id INTEGER NOT NULL,
    description TEXT,
    FOREIGN KEY (budget_id) REFERENCES budget(budget_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES budget_categories(category_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (funder_id) REFERENCES funder(funder_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_budget_line_budget_id ON budget_line(budget_id);
CREATE INDEX idx_budget_line_cat_id ON budget_line(category_id);
CREATE INDEX idx_budget_line_funder_id ON budget_line(funder_id);

DROP TABLE IF EXISTS personnel CASCADE;
CREATE TABLE personnel (
    person_id SERIAL PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    rate DECIMAL(10,2)
);

CREATE INDEX idx_personnel_email ON personnel(email);

DROP TABLE IF EXISTS person_line CASCADE;
CREATE TABLE person_line (
    person_line_id SERIAL PRIMARY KEY,
    budget_line_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    description TEXT,
    CHECK (amount>=0),
    FOREIGN KEY (budget_line_id) REFERENCES budget_line(budget_line_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (person_id) REFERENCES personnel(person_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE INDEX idx_person_ln_bdgt_ln ON person_line(budget_line_id);
CREATE INDEX idx_person_ln_person_id ON person_line(person_id);

DROP TABLE IF EXISTS line_items CASCADE;
CREATE TABLE line_items (
    line_item_id SERIAL PRIMARY KEY,
    budget_line_id INTEGER NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    description VARCHAR(100),
    CHECK (amount>=0),
    FOREIGN KEY (budget_line_id) REFERENCES budget_line(budget_line_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE INDEX idx_items_bdgt_ln ON line_items(budget_line_id);

DROP TABLE IF EXISTS report CASCADE;
CREATE TABLE report (
    report_id SERIAL PRIMARY KEY,
    funding_id INTEGER NOT NULL,
    due_date DATE NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE,
    notes TEXT,
    FOREIGN KEY (funding_id) REFERENCES project_funder(funding_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE INDEX idx_report_funding ON report(funding_id);

DROP TABLE IF EXISTS deliverable CASCADE;
CREATE TABLE deliverable (
    deliverable_id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL,
    deliverable_name VARCHAR(100) NOT NULL,
    description TEXT,
    status VARCHAR(20),
    notes TEXT,
    FOREIGN KEY (project_id) REFERENCES project(proj_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE INDEX idx_deliverable_project ON deliverable(project_id);

DROP TABLE IF EXISTS deliverable_funder CASCADE;
CREATE TABLE deliverable_funder (
    deliverable_id INTEGER NOT NULL,
    funder_id INTEGER NOT NULL,
    notes TEXT,
    PRIMARY KEY (deliverable_id, funder_id),
    FOREIGN KEY (deliverable_id) REFERENCES deliverable(deliverable_id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (funder_id) REFERENCES funder(funder_id)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE INDEX idx_deliverable_funder_deliverable_id ON deliverable_funder(deliverable_id);
CREATE INDEX idx_deliverable_funder_funder_id ON deliverable_funder(funder_id);

DROP TABLE IF EXISTS weekly_report CASCADE;
CREATE TABLE weekly_report (
    w_report_id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL,
    project_id INTEGER NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (person_id) REFERENCES personnel(person_id)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    FOREIGN KEY (project_id) REFERENCES project(proj_id)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE INDEX idx_w_report_person_id ON weekly_report(person_id);
CREATE INDEX idx_w_report_project_id ON weekly_report(project_id);
CREATE INDEX idx_w_report_timestamp ON weekly_report(timestamp);

DROP TABLE IF EXISTS w_report_item CASCADE;
CREATE TABLE w_report_item (
    report_item_id SERIAL PRIMARY KEY,
    w_report_id INTEGER NOT NULL,
    hours DECIMAL(5,2) NOT NULL,
    text TEXT NOT NULL,
    CHECK (hours > 0),
    FOREIGN KEY (w_report_id) REFERENCES weekly_report(w_report_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE INDEX idx_w_report_id ON w_report_item(w_report_id);