backend/
├── node_modules/
├── .env # db credentials (DON'T commit)
├── package.json
├── package-lock.json
├── server.js # starts Express server
│
├── routes/
│   ├── projectRoutes.js
│   ├── funderRoutes.js
│   ├── fundingRoutes.js
│   ├── budgetCategoryRoutes.js
│   ├── budgetRoutes.js
│   ├── budgetLineRoutes.js
│   ├── personLineRoutes.js
│   ├── lineItemRoutes.js
│   ├── personnelRoutes.js
│   ├── deliverableRoutes.js
│   ├── deliverableFunderRoutes.js
│   ├── weeklyReportRoutes.js
│   ├── reportItemRoutes.js
│   ├── reportRoutes.js
│   └── viewRoutes.js
│
├── controllers/
│   ├── projectController.js
│   ├── funderController.js
│   ├── fundingController.js
│   ├── budgetCategoryController.js
│   ├── budgetController.js
│   ├── budgetLineController.js
│   ├── personLineController.js
│   ├── lineItemController.js
│   ├── personnelController.js
│   ├── deliverableController.js
│   ├── deliverableFunderController.js
│   ├── weeklyReportController.js
│   ├── reportItemController.js
│   ├── reportController.js
│   └── viewController.js
│
├── db/ #db queries
│   ├── connection.js
│   ├── projectQueries.js
│   ├── funderQueries.js
│   ├── fundingQueries.js
│   ├── budgetCategoryQueries.js
│   ├── budgetQueries.js
│   ├── budgetLineQueries.js
│   ├── personLineQueries.js
│   ├── lineItemQueries.js
│   ├── personnelQueries.js
│   ├── deliverableQueries.js
│   ├── deliverableFunderQueries.js
│   ├── weeklyReportQueries.js
│   ├── reportItemQueries.js
│   ├── reportQueries.js
│   └── viewQueries.js
│
├── middleware/
│   ├── auth.js               
│   └── errorHandler.js       
│
└── sql/ #db set up                   
    ├── schema.sql # CREATE TABLE statements
    ├── views.sql # CREATE VIEW statements
    └── seed.sql # loading fake data?