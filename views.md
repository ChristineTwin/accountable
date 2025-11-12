# Draft Views

## budget_line_summary
Purpose: Calculate total amounts for each budget line from person_line and line_items
Tables used: budget_line, person_line, line_items

## budget_summary
Purpose: Aggregate budget totals by project
Tables used: budget, budget_line_summary

## budget_by_funder
Purpose: Budget breakdown grouped by funder
Tables used: budget_line_summary

## budget_by_category
Purpose: Budget breakdown grouped by budget category
Tables used: budget_line_summary, budget_categories

## project_funding_summary
Purpose: Summary of all funding for each project
Tables used: project_funder, funder

## personnel_allocation
Purpose: Show personnel effort allocation across projects
Tables used: person_line, personnel, budget_line, budget, project
Columns: person_id, person_name, project_id, project_name, total_allocation, budget_line_count

## weekly_hours_summary
Purpose: Aggregate hours from weekly report items by person/project
Tables used: weekly_report, w_report_item, personnel, project

## deliverable_status_summary
Purpose: Track deliverable completion by project/funder
Tables used: deliverable, deliverable_funder, project, funder

## report_status_summary
Purpose: Track funder report completion status
Tables used: report, project_funder, project, funder

For future since we won't be implementing the NLP classification tools yet:
## classification_accuracy
Purpose: Track classification accuracy
Tables used: classifications

