# Artwork Management System

## Project Description
This SQL database solution implements a complete artwork management system based on the specified business requirements. 
The system tracks artists, artworks, genres, and exhibitions with their complex relationships.

## Database Structure
The system comprises 5 interconnected tables:

1. **Artist** - Stores artist biographical information
   - Required fields: Name, Surname
   - Additional fields: Birth/Death years, Nationality

2. **Genre** - Categorizes artistic styles
   - Required field: Description

3. **Artwork** - Contains all artwork details
   - Required field: Title
   - Relationships: One artist, One genre
   - Status tracking: Displayed/Stored/On Loan/In Conservation

4. **Exhibition** - Manages exhibition events
   - Required field: Description

5. **Entry** - Junction table linking artworks to exhibitions
   - Tracks display details and insurance values

## Implementation Highlights

### Comprehensive Data Model
- Enforced referential integrity with foreign keys
- Appropriate data types for all fields
- Validation constraints (e.g., artwork status)
- Unique constraints to prevent duplicate entries

### Rich Sample Data
- Exceeds minimum record requirements:
  - 10 Genres (minimum: 3)
  - 8 Artists (minimum: 5)
  - 20 Artworks (minimum: 20)
  - 15 Exhibitions (minimum: 15)
  - 25 Entries (minimum: 1 artwork in multiple exhibitions)

### Advanced Query Capabilities
- Multi-table joins with aggregation
- Complex filtering with HAVING clauses
- Comprehensive sorting options
- Conditional formatting in reports
- String aggregation for readable output

## Setup Instructions

1. Execute the SQL script to:
   - Create the database
   - Build all tables with constraints
   - Populate with sample data

2. Run demonstration queries to see:
   - Basic CRUD operations
   - Analytical reports
   - Business rule enforcement

## GitHub Repository
Access the complete solution at:  
```bash
https://github.com/HChristopherNaoyuki/artwork-sql.git
```

## Learning Outcomes Demonstrated
- Proper database design principles
- SQL statement proficiency
- Complex query formulation
- Data integrity enforcement
- Practical business application

This implementation not only meets all assignment requirements but provides a robust 
foundation for a real-world artwork management system with enhanced functionality and comprehensive reporting capabilities.

## Reference

> Naoyuki Christopher H. (Year). *artwork-sql*. Available at: \https://github.com/HChristopherNaoyuki/artwork-sql.git (Accessed: \2025-08-20).

## DISCLAIMER

UNDER NO CIRCUMSTANCES SHOULD IMAGES OR EMOJIS BE INCLUDED DIRECTLY 
IN THE README FILE. ALL VISUAL MEDIA, INCLUDING SCREENSHOTS AND IMAGES 
OF THE APPLICATION, MUST BE STORED IN A DEDICATED FOLDER WITHIN THE 
PROJECT DIRECTORY. THIS FOLDER SHOULD BE CLEARLY STRUCTURED AND NAMED 
ACCORDINGLY TO INDICATE THAT IT CONTAINS ALL VISUAL CONTENT RELATED TO 
THE APPLICATION (FOR EXAMPLE, A FOLDER NAMED IMAGES, SCREENSHOTS, OR MEDIA).

I AM NOT LIABLE OR RESPONSIBLE FOR ANY MALFUNCTIONS, DEFECTS, OR ISSUES 
THAT MAY OCCUR AS A RESULT OF COPYING, MODIFYING, OR USING THIS SOFTWARE. 
IF YOU ENCOUNTER ANY PROBLEMS OR ERRORS, PLEASE DO NOT ATTEMPT TO FIX THEM 
SILENTLY OR OUTSIDE THE PROJECT. INSTEAD, KINDLY SUBMIT A PULL REQUEST 
OR OPEN AN ISSUE ON THE CORRESPONDING GITHUB REPOSITORY, SO THAT IT CAN 
BE ADDRESSED APPROPRIATELY BY THE MAINTAINERS OR CONTRIBUTORS.

---
