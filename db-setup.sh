#!/bin/bash

# Database setup script
set -e  # Exit on error

DB_NAME="accountable_db"
DB_USER="postgres"

echo "Database Setup"

# Create database (skip if exists)
echo "Creating database..."
createdb -U $DB_USER $DB_NAME 2>/dev/null || echo "Database already exists, skipping creation"

# Run schema
echo "Running schema..."
psql -U $DB_USER -d $DB_NAME -f backend/sql/schema.sql

: '
# Run functions, procedures, triggers
echo "Creating database objects..."
psql -U $DB_USER -d $DB_NAME -f backend/sql/functions.sql
psql -U $DB_USER -d $DB_NAME -f backend/sql/procedures.sql
psql -U $DB_USER -d $DB_NAME -f backend/sql/triggers.sql

# Run views
echo "Creating views..."
psql -U $DB_USER -d $DB_NAME -f backend/sql/views.sql

# Load seed data
echo "Loading seed data..."
psql -U $DB_USER -d $DB_NAME -f backend/sql/seed.sql

echo "Database setup complete"
'