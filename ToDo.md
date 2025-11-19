# Final Project To Do list

## Final Report and Presentation

### Presentation Planning - Due: Dec 3
- [ ] Outline presentation content (5 minutes total):
    - [ ] Brief project description (30 sec)
    - [ ] Logical schema overview (1 min)
    - [ ] CRUD demonstration #1 (1.5 min)
    - [ ] CRUD demonstration #2 (1.5 min)
- [ ] Create PowerPoint/slides or work from github pages?
- [ ] Assign sections
- [ ] Practice timing

### Report Section 1: Update Project README - Due: Dec 9
- [ ] Document complete setup instructions:
    - [ ] Prerequisites
    - [ ] Required libraries and dependencies
    - [ ] Installation steps
    - [ ] Environment variables needed
    - [ ] Explain any make files?
    - [ ] How to access the application (URLs, ports)

### Section 2: Technical Specifications - Due: Dec 9
- [ ] Document backend architecture:
    - [ ] Technology stack (Node.js, Express, PostgreSQL)
    - [ ] API structure (REST endpoints)
    - [ ] Authentication approach
    - [ ] Error handling approach

### Section 3: Final Database Design Documentation - Due: Dec 9
- [ ] Document database architecture:
    - [ ] Updated ERD
    - [ ] Database design decisions
    - [ ] Normalization approach (3NF)
    - [ ] Constraints and integrity rules
    - [ ] Functions/procedures/triggers overview
    - [ ] Use existing data dictionary/schema.md

### Section 4: Final User Flow Documentation - Due: Dec 9
- [ ] Document how users interact with system:
    - [ ] List all available operations (create project, add funding, etc.)
    - [ ] Describe workflow for common tasks:
        - [ ] Creating a new project with budget
        - [ ] Assigning personnel to projects
        - [ ] Entering weekly reports
        - [ ] Viewing budget summaries
        - [ ] Generating reports

### Section 5: Lessons Learned - Due: Dec 10

#### 5a. Technical Expertise Gained
- [ ] Document new skills learned:
    - [ ] Database design and normalization
    - [ ] PostgreSQL advanced features (procedures, triggers, functions)
    - [ ] Backend API development
    - [ ] Error handling strategies
    - [ ] Full-stack integration
    - [ ] Other?

#### 5b. Insights
- [ ] Reflect on project experience:
    - [ ] Time management lessons
    - [ ] What worked well / what didn't
    - [ ] Data domain insights (research project management complexity)
    - [ ] Team collaboration insights
    - [ ] Challenges overcome

#### 5c. Alternative Approaches
- [ ] Discuss design alternatives:
    - [ ] Decisions made and why
    - [ ] What would you do differently?
    - [ ] Trade-offs considered
    - [ ] Alternative database designs considered, maybe from alternative perspectives?

#### 5d. Known Issues
- [ ] Document any non-working code:
    - [ ] Features not completed
    - [ ] Known bugs
    - [ ] Limitations
    - [ ] Workarounds implemented

#### 5e. Future Work
- [ ] Document planned enhancements:
    - [ ] Planned uses of the database
    - [ ] AI classification system for weekly reports
    - [ ] Advanced analytics layer (report generation, funder analysis)
    - [ ] Additional frontend features
    - [ ] Authentication and authorization system

### Final Report Assembly - Due: Dec 11
- [ ] Finalize report, check against assignment 


## Frontend Development To-Do List


...


## Backend Development To-Do List

### Major Task 1: Project Setup - Due: Nov 14
- [x] Create project directory
- [x] Run npm init -y to initialize Node.js project
- [x] Install dependencies:
    - [x] npm install express
    - [x] npm install pg (PostgreSQL client)
    - [x] npm install dotenv (environment variables)
    - [x] npm install nodemon --save-dev (auto-restart during development)
- [x] Create .gitignore file (add node_modules/, .env)
- [x] Create .env file with database credentials
- [x] Create basic folder structure:
    /routes - API route files
    /controllers - Business logic
    /db - Database connection and queries
    /middleware - Authentication, error handling
    /views - SQL view definitions
    /sql - Store sql queries

### Major Task 2: Database Setup - Due: Nov 15
- [x] Install PostgreSQL
- [x] Create database in PostgreSQL (CREATE DATABASE accountable_db;)
- [x] Create schema.sql file
    Refer to schema.md file, CREATE TABLE statements:
    - project
    - funder
    - project_funder
    - budget_categories
    - budget
    - budget_line
    - person_line
    - line_items
    - personnel
    - classifications
    - deliverable
    - deliverable_funder
    - weekly_report
    - w_report_item
    - classifications (for AI)
    - report
- [x] Run schema.sql to create all tables
- [ ] Create seed data file seed.sql - Scott gave ok to use an LLM to make seed data
- [ ] Run seed data

### Major Task 3: Basic Express Server - Due: Nov 15
- [ ] Create server.js or app.js file
- [ ] Set up Express app
- [ ] Configure middleware (express.json(), cors if needed)
- [ ] Create database connection file (/db/connection.js)
- [ ] Test database connection
- [ ] Create a test route (GET /api/health to check server is running)
- [ ] Start server and test in browser/Postman

### Major Task 4: Build CRUD Routes

#### Projects (TEMPLATE) - Due: Nov 16
- [ ] Write SQL queries (/db/projectQueries.js):
    - [ ] SELECT all projects
    - [ ] SELECT project by ID
    - [ ] INSERT new project
    - [ ] UPDATE project
    - [ ] DELETE project
- [ ] Create controller (/controllers/projectController.js)
    - [ ] getAllProjects function
    - [ ] getProjectById function
    - [ ] createProject function
    - [ ] updateProject function
    - [ ] deleteProject function
- [ ] Create routes (/routes/projectRoutes.js)
    - [ ] GET /api/projects
    - [ ] GET /api/projects/:id
    - [ ] POST /api/projects
    - [ ] PUT /api/projects/:id
    - [ ] DELETE /api/projects/:id
- [ ] Register routes in server.js
- [ ] Test all endpoints (not sure how, need to research)

#### Core Entities - Due: Nov 17
- [ ] Funders
    - [ ] Write SQL queries (/db/funderQueries.js)
    - [ ] Create controller (/controllers/funderController.js)
    - [ ] Create routes (/routes/funderRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Project Funding
    - [ ] Write SQL queries (/db/fundingQueries.js)
    - [ ] Create controller (/controllers/fundingController.js)
    - [ ] Create routes (/routes/fundingRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Budget Categories
    - [ ] Write SQL queries (/db/budgetCategoryQueries.js)
    - [ ] Create controller (/controllers/budgetCategoryController.js)
    - [ ] Create routes (/routes/budgetCategoryRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

#### Budget Entities - Due: Nov 18
- [ ] Budgets
    - [ ] Write SQL queries (/db/budgetQueries.js)
    - [ ] Create controller (/controllers/budgetController.js)
    - [ ] Create routes (/routes/budgetRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Budget Lines
    - [ ] Write SQL queries (/db/budgetLineQueries.js)
    - [ ] Create controller (/controllers/budgetLineController.js)
    - [ ] Create routes (/routes/budgetLineRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Person Lines
    - [ ] Write SQL queries (/db/personLineQueries.js)
    - [ ] Create controller (/controllers/personLineController.js)
    - [ ] Create routes (/routes/personLineRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Line Items
    - [ ] Write SQL queries (/db/lineItemQueries.js)
    - [ ] Create controller (/controllers/lineItemController.js)
    - [ ] Create routes (/routes/lineItemRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

#### Personnel & Deliverables - Due: Nov 19
- [ ] Personnel
    - [ ] Write SQL queries (/db/personnelQueries.js)
    - [ ] Create controller (/controllers/personnelController.js)
    - [ ] Create routes (/routes/personnelRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Classifications (Personnel)
    - [ ] Write SQL queries (/db/classificationQueries.js)
    - [ ] Create controller (/controllers/classificationController.js)
    - [ ] Create routes (/routes/classificationRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Deliverables
    - [ ]  Write SQL queries (/db/deliverableQueries.js)
    - [ ] Create controller (/controllers/deliverableController.js)
    - [ ] Create routes (/routes/deliverableRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Deliverable Funders
    - [ ] Write SQL queries (/db/deliverableFunderQueries.js)
    - [ ] Create controller (/controllers/deliverableFunderController.js)
    - [ ] Create routes (/routes/deliverableFunderRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

#### Reports & Weekly Reports - Due: Nov 20
- [ ] Weekly Reports
    - [ ] Write SQL queries (/db/weeklyReportQueries.js)
    - [ ] Create controller (/controllers/weeklyReportController.js)
    - [ ] Create routes (/routes/weeklyReportRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Weekly Report Items
    - [ ] Write SQL queries (/db/reportItemQueries.js)
    - [ ] Create controller (/controllers/reportItemController.js)
    - [ ] Create routes (/routes/reportItemRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman

- [ ] Reports (Funder Reports)
    - [ ] Write SQL queries (/db/reportQueries.js)
    - [ ] Create controller (/controllers/reportController.js)
    - [ ] Create routes (/routes/reportRoutes.js)
    - [ ] Register routes in server.js
    - [ ] Test all endpoints in Postman


### Major Task 5: Create Database Views - Due: Nov 20
- [ ] Create SQL views file (/sql/views.sql):
    budget_line_summary view
    budget_summary view
    budget_by_funder view
    budget_by_category view
    project_funding_summary view
    personnel_allocation view
    weekly_hours_summary view
    deliverable_status_summary view
    report_status_summary view
- [ ] Run views.sql to create all views
- [ ] Test each view

### Major Task 6: Build View Routes - Due: Nov 21
- [ ] Budget Views
    - [ ] Write SQL queries (/db/viewQueries.js - budget section)
    - [ ] Create controller functions (/controllers/viewController.js)
    - [ ] Create routes (/routes/viewRoutes.js - budget section)
    - [ ]  Test all budget view endpoints in Postman

- [ ] Project Views
    - [ ] Write SQL queries (project views section)
    - [ ] Create controller functions
    - [ ] Create routes
    - [ ] Test all project view endpoints in Postman

- [ ] Personnel Views
    - [ ] Write SQL queries (personnel views section)
    - [ ] Create controller functions
    - [ ] Create routes
    - [ ] Test all personnel view endpoints in Postman

- [ ] Weekly Report Views
    - [ ] Write SQL queries (weekly report views section)
    - [ ] Create controller functions
    - [ ] Create routes
    - [ ] Test all weekly report view endpoints in Postman

### Major Task 7: Error Handling & Validation - Due: Nov 21
- [ ] Create error handling middleware
- [ ] Add input validation for POST/PUT routes - or is this in controllers? or in sql query functions?
- [ ] Add proper HTTP status codes
- [ ] Test error cases (invalid IDs, missing fields, etc.)

### Major Task 8: Testing & Documentation - Due: Nov 21
- [ ] Test all routes end-to-end
- [ ] Create Postman collection with all routes
- [ ] Document any setup instructions in README
- [ ] Test with sample data workflow

### Major Task 9: Frontend Integration Support - Due: Dec 3
- [ ] Create API Service Layer
- [ ] Document how to use API service layer
- [ ] Implement API Service Layer
- [ ] Fix any backend bugs discovered during integration
- [ ] Test

### Major Task 10: Final Push - Due: Dec 4
- [ ] Verify all endpoints work from frontend
- [ ] Test error handling
- [ ] Ensure proper HTTP status codes returned
- [ ] Finalize documentation
- [ ] Make DB dump file