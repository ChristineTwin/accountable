# Task 1 - Project Proposal
## Project Requirements for Reference
- The project must be able to create, read, update and delete data from the chosen database. The executed operations should be driven from user input.
- The user interface for the project may be a simple command line argument project, a web page or a GUI-based project. The user interface provides access to the database and determines the operations that are executed on the data. If you are working on another front-end project for another course, these could be combined.
- The basic assumption is that your project will use PostgreSQL as your DBMS. If you plan to use a NoSQL database or a different relational database, you must specify which database you are using in this proposal. We will work with you to define a corresponding grading rubric for your project. The teaching team will need to approve your NoSQL database choice. Seeking that approval early will provide a greater likelihood of success
in the later components of the project.
- The project must demonstrate your mastery of the chosen database model (relational, document, key value, columnar etc.)
- The final result is an application that demonstrates your ability to code a system using a database as its storage mechanism as well as your ability to document the system.

## Proposal

### Team Members
Christine Voyer

### Project Description
The longterm idea is to build an AI-powered grant management platform that synthesizes weekly narrative reports and personel hours tracking into organized draft report materials and budget reports.

#### Purpose and Rationale
Before coming to the Roux, I had worked for 12 years at a medium sized non-profit as a program manager. Managing the reporting and budget tracking working with budgets composed with funds from across a patchwork of funding sources, from tiny local foundations to large federal agencies was a huge time sink, even in an organization with significant capacity in accounting and development. In addition, the many systems used across the many departments to track progress and spending were rarely aligned, and the tools and systems were largely siloed. 

Funder reporting requirements may be seen as a burden (federal reporting requirements especiall), but the solution isn't less accountability. The solution is better (fewer) tools. Funders deserve to know their money is being spent appropriately and achieving outcomes and/or contributing new knowledge. The burden comes from using disconnected systems that create manual work and friction points. I am proposing a tool that puts everything in one place and leverages already existing tools like task management tools and weekly check ins to quickly capture the relevant information about the work.

#### Target Users
- Research institutions (universities, labs)
- Non-profits managing federal/foundation grants
- Any organization with documentation-heavy funding sources

#### Problem Statement
Managing federal awards and similar funding requires tracking:
- Budget spending vs. approved amounts across multiple categories
- Personnel effort allocation and compliance with approved amounts
- Progress on deliverables and specific aims
- Regular reporting to funders with different requirements

Currently, these elements exist in separate systems (email updates, spreadsheets, accounting software, project management tools, development databases). Project managers and other organization staff spend hours manually synthesizing information into reports.

### Technical Overview
- SQL vs. NoSQL storage
- Software, Apps, Languages, Libraries and hardware that will be used to develop the project. Are there any machine restrictions for the project?

### Database Design
- An E-R Diagram of the conceptual design for the database which you will be using for the project. This diagram should contain attributes, entities, relationships, multiplicity, and the primary keys for the entities. You can use any diagramming tool you prefer. One that is freely available is https://erdplus.com/. You should plan on using this diagram during your class project presentation as well as in your final project write-up (where it will be graded more strictly and worth more points).

First pass of ERD, not exactly like described in readme. review changes and complexity.
![Draft ERD]('accountable_erd_101625')

### User Workflow
- A brief step-by-step user interaction of your application. The description should list the steps a user would be required to perform to use your application. A flow chart is sufficient.
