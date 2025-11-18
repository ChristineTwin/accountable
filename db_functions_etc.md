## Stored Procedures
create_project_with_budget - Creates project and budget in one transaction
assign_personnel_to_budget_line - Adds person to budget line with validation
complete_project_report - Marks report complete and updates timestamp
delete_project_safely - Checks for active funding before deletion

## Triggers
validate_project_dates - BEFORE INSERT/UPDATE on project - ensures end_date > start_date
validate_positive_amounts - BEFORE INSERT/UPDATE on person_line/line_items - ensures amount > 0
auto_set_report_defaults - BEFORE INSERT on report - sets completed = FALSE, created_at
update_modified_timestamp - BEFORE UPDATE on budget tables - sets updated_at timestamp

## User-Defined Functions
get_personnel_cost(budget_line_id) - Returns sum of person_line amounts
get_items_cost(budget_line_id) - Returns sum of line_items amounts
get_budget_line_total(budget_line_id) - Returns personnel + items total
get_project_funding_total(project_id) - Returns sum of all funding for project
days_until_report_due(report_id) - Returns days until due date (negative if overdue)