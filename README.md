# Library Database System - MS SQL Project

A relational database design project for managing library operations, created as part of a university database course. The project focuses on database modeling, MS SQL schema implementation and business queries supporting a library borrowing process.

## Project goal

The goal was to design and implement a database that supports key library operations:

- storing readers, employees, books, authors, publishers and addresses,
- registering book borrowings and returns,
- checking whether a reader can borrow another book,
- checking book availability by ISBN or by title and author,
- reviewing reader borrowing history,
- identifying the TOP10 most frequently borrowed books in the last 6 months.

## Tech stack

- **MS SQL Server**
- **T-SQL**
- **Azure Data Studio**
- **Jupyter Notebook / `.ipynb`**
- **Relational database modeling**

## Main project file

The main project file is located in `docs/Biblioteka_Dawid_Baldyga.ipynb`.  
It contains the original notebook version of the database project, including the database design, SQL implementation, diagrams and explanations prepared for the university assignment.

## Database scope

The database model includes the following main entities:

- `Osoba`
- `Adres`
- `Czytelnik`
- `Pracownik`
- `Autor`
- `Wydawnictwo`
- `Ksiazka`
- `Autor_Ksiazka`
- `Wypozyczenie`

The schema includes primary keys, foreign keys, unique indexes and basic integrity constraints.

## Diagrams

The repository includes two diagrams exported from the original notebook:

- `diagrams/conceptual-diagram.png` - conceptual model of the library domain
- `diagrams/implementation-diagram.png` - implementation-oriented database model


## Key SQL features demonstrated

- Database creation with separate data and log files
- Table creation with primary keys and foreign keys
- Unique indexes
- `CHECK` constraints
- `INNER JOIN`
- Variables and conditional logic in T-SQL
- `TOP`
- `GROUP BY`
- `ORDER BY`
- `DATEADD`
- Business-oriented SQL queries

## Business queries

The project contains SQL scripts for:

1. **Reader borrowing limit**  
   Checks whether a reader has reached the maximum number of active borrowings.

2. **Book availability check**  
   Checks whether a book is available by ISBN or by title and author. If the book is not available, the query returns the expected return date.

3. **Reader borrowing history**  
   Displays all books borrowed by a selected reader, including borrowing date, return deadline and actual return date.

4. **TOP10 most borrowed books**  
   Returns the most frequently borrowed titles within the last 6 months.

## Repository structure

```text
library-database-system/
├── README.md
├── sql/
│   ├── 00_run_order.sql
│   ├── 01_create_database.sql
│   ├── 02_schema_tables_indexes_constraints.sql
│   ├── 03_check_reader_borrowing_limit.sql
│   ├── 04_check_book_availability.sql
│   ├── 05_reader_borrowing_history.sql
│   └── 06_top10_books_last_6_months.sql
├── data/
│   └── sample_data.sql
├── diagrams/
│   ├── conceptual-diagram.png
│   └── implementation-diagram.png
├── docs/
│   ├── Biblioteka_Dawid_Baldyga.ipynb
│   └── assignment-notes.md
└── demo/
    └── demo-video.md
```

## How to use

1. Run `sql/01_create_database.sql`.
2. Connect to the `biblioteka` database.
3. Run `sql/02_schema_tables_indexes_constraints.sql`.
4. Run `data/sample_data.sql` to insert sample data.
5. Run selected business queries from the `sql/` folder.

## Demo video

A short walkthrough video  in `demo/demo-video.md`.  

## What I learned

- How to design a relational database around a real business process
- How to translate business requirements into tables, relationships and constraints
- How to write SQL queries that answer operational questions
- How to document and explain database design decisions
- How to use `.ipynb` as a text-based JSON notebook format for SQL project documentation

## Project status

Completed as a university database project. The repository version was cleaned and structured for portfolio purposes.
