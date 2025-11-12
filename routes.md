# Suggested Routes:
# API Routes Documentation

## Authentication Requirements
**Longterm would need more refined permissions**

- [Admin] - System administrator only
- [PM/Admin] - Project Manager or Admin
- No marking = all authenticated users

## CRUD Routes

### Projects
- GET /api/projects - List all projects
- GET /api/projects/:id - Get single project details
- POST /api/projects - Create new project [PM/Admin]
- PUT /api/projects/:id - Update project [PM/Admin]
- DELETE /api/projects/:id - Delete project [Admin]

### Funders
- GET /api/funders - List all funders
- GET /api/funders/:id - Get single funder details
- POST /api/funders - Create new funder [PM/Admin]
- PUT /api/funders/:id - Update funder [PM/Admin]
- DELETE /api/funders/:id - Delete funder [Admin]

### Project Funding
- GET /api/projects/:id/funding - Get all funding sources for a project
- POST /api/projects/:id/funding - Add funding source to project [PM/Admin]
- PUT /api/funding/:id - Update funding details (amount, dates, status, award number) [PM/Admin]
- DELETE /api/funding/:id - Remove funding source [Admin]

### Budget Categories
- GET /api/budget-categories - List all standard budget category codes (PERS, EQUIP, etc.)
- GET /api/budget-categories/:id - Get single category details
- POST /api/budget-categories - Create new category code [Admin]
- PUT /api/budget-categories/:id - Update category [Admin]
- DELETE /api/budget-categories/:id - Delete category [Admin]

### Budgets
- GET /api/projects/:id/budget - Get budget for project
- POST /api/projects/:id/budget - Create budget for project [PM/Admin]
- PUT /api/budgets/:id - Update budget notes [PM/Admin]
- DELETE /api/budgets/:id - Delete budget [Admin]

### Budget Lines
- POST /api/budgets/:id/lines - Create budget line (requires category_id and funder_id) [PM/Admin]
- PUT /api/budget-lines/:id - Update budget line category or notes [PM/Admin]
- DELETE /api/budget-lines/:id - Delete budget line (cascades to personnel and items) [PM/Admin]

### Person Lines (Personnel costs)
- GET /api/budget-lines/:id/personnel - Get all personnel assigned to this budget line
- POST /api/budget-lines/:id/personnel - Add person to budget line with amount [PM/Admin]
- PUT /api/person-lines/:id - Update person allocation (amount, description) [PM/Admin]
- DELETE /api/person-lines/:id - Remove person from budget line [PM/Admin]

### Line Items (Non-personnel costs)
- GET /api/budget-lines/:id/items - Get all line items for this budget line
- POST /api/budget-lines/:id/items - Add line item to budget line (equipment, travel, etc.) [PM/Admin]
- PUT /api/line-items/:id - Update line item description or amount [PM/Admin]
- DELETE /api/line-items/:id - Delete line item [PM/Admin]

### Personnel
- GET /api/personnel - List all personnel
- GET /api/personnel/:id - Get single person details
- POST /api/personnel - Create personnel record [PM/Admin]
- PUT /api/personnel/:id - Update personnel information [PM/Admin]
- DELETE /api/personnel/:id - Delete personnel record [Admin]

### Deliverables
- GET /api/projects/:id/deliverables - Get all deliverables for project
- POST /api/projects/:id/deliverables - Create new deliverable [PM/Admin]
- PUT /api/deliverables/:id - Update deliverable details [PM/Admin]
- DELETE /api/deliverables/:id - Delete deliverable [PM/Admin]

### Deliverable Funders
- GET /api/deliverables/:id/funders - Get all funders requiring this deliverable
- POST /api/deliverables/:id/funders - Link deliverable to funder [PM/Admin]
- DELETE /api/deliverable-funders/:deliverable_id/:funder_id - Remove funder requirement [PM/Admin]

### Weekly Reports
- GET /api/weekly-reports - List all weekly reports (with filters)
- GET /api/weekly-reports/:id - Get single weekly report
- POST /api/weekly-reports - Create weekly report for person/project
- PUT /api/weekly-reports/:id - Update weekly report 
- DELETE /api/weekly-reports/:id - Delete weekly report [PM/Admin]

### Weekly Report Items
- GET /api/weekly-reports/:id/items - Get all activity items for this report
- POST /api/weekly-reports/:id/items - Add activity item to report (hours + text) 
- PUT /api/report-items/:id - Update report item
- DELETE /api/report-items/:id - Delete report item [PM/Admin]

### Reports (Funder Reports)
- GET /api/funding/:id/reports - Get all required reports for funding source
- POST /api/funding/:id/reports - Create new required report [PM/Admin]
- PUT /api/reports/:id - Update report (mark completed, add notes) [PM/Admin]
- DELETE /api/reports/:id - Delete report requirement [PM/Admin]

## View Routes (Read-only)

### Budget Views
- GET /api/views/budgets/:budget_id/lines - Budget lines with calculated totals [PM/Admin]
- GET /api/views/budgets/:budget_id/summary - Complete budget summary [PM/Admin]
- GET /api/views/budgets/:budget_id/by-funder - Budget breakdown by funder [PM/Admin]
- GET /api/views/budgets/:budget_id/by-category - Budget breakdown by category [PM/Admin]

### Project Views
- GET /api/views/projects/:project_id/funding-summary - Project funding summary
- GET /api/views/projects/:project_id/personnel - Personnel assigned to project
- GET /api/views/projects/:project_id/weekly-reports - Weekly reports for project [PM/Admin]
- GET /api/views/projects/:project_id/deliverables-status - Deliverable status summary
- GET /api/views/projects/:project_id/reports-status - Funder reports status summary

### Personnel Views
- GET /api/views/personnel/:person_id/allocation - Personnel allocation across projects
- GET /api/views/personnel/:person_id/hours - Weekly hours summary by project
- GET /api/views/personnel/:person_id/weekly-reports - Weekly reports by person [PM/Admin]

### Weekly Report Views
- GET /api/views/weekly-hours/project/:project_id - Hours summary for project [PM/Admin]
- GET /api/views/weekly-hours/person/:person_id - Hours summary for person [PM/Admin]
- GET /api/views/weekly-hours/date-range?start=YYYY-MM-DD&end=YYYY-MM-DD - Hours by date range [PM/Admin]

## Future Implementations
### Classifications (AI)
- POST /api/report-items/:id/classify - AI classify report item to deliverable [Automated/System]
- GET /api/classifications/:id - Get classification details
- PUT /api/classifications/:id/verify - Project manager verify/correct AI classification [PM/Admin]
- GET /api/projects/:id/classifications - Get all classifications for project
- GET /api/views/classifications/accuracy - Overall classification accuracy metrics [PM/Admin]
- GET /api/views/classifications/accuracy/:project_id - Accuracy by project [PM/Admin]

