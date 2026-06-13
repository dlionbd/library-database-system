-- Run order for a local MS SQL Server environment.
-- 1. Run 01_create_database.sql first.
-- 2. Connect to the biblioteka database.
-- 3. Run the schema, sample data and selected business queries.

:r ./01_create_database.sql
:r ./02_schema_tables_indexes_constraints.sql
:r ../data/sample_data.sql

-- Example analytical/business queries:
:r ./03_check_reader_borrowing_limit.sql
:r ./04_check_book_availability.sql
:r ./05_reader_borrowing_history.sql
:r ./06_top10_books_last_6_months.sql
