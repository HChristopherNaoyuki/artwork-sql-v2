-- STEP 1: Create database and tables
CREATE DATABASE artwork_sql;
GO

USE artwork_sql;
GO

-- Create Genre table
CREATE TABLE Genre (
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    Description NVARCHAR(255) NOT NULL
);
GO

-- Create Artist table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Surname NVARCHAR(100) NOT NULL,
    BirthYear INT,
    DeathYear INT,
    Nationality NVARCHAR(100)
);
GO

-- Create Artwork table
CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    ArtistID INT NOT NULL,
    GenreID INT NOT NULL,
    CreationYear INT,
    Medium NVARCHAR(100),
    Status NVARCHAR(50) CHECK (Status IN ('Displayed', 'Stored', 'On Loan', 'In Conservation')),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);
GO

-- Create Exhibition table with enhanced fields
CREATE TABLE Exhibition (
    ExhibitionID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Location NVARCHAR(255),
    Curator NVARCHAR(255)
);
GO

-- Create Entry table with more detailed information
CREATE TABLE Entry (
    EntryID INT PRIMARY KEY IDENTITY(1,1),
    ArtworkID INT NOT NULL,
    ExhibitionID INT NOT NULL,
    EntryDate DATE NOT NULL,
    DisplayLocation NVARCHAR(255) NOT NULL,
    InsuranceValue DECIMAL(12,2),
    SpecialNotes NVARCHAR(MAX),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID),
    FOREIGN KEY (ExhibitionID) REFERENCES Exhibition(ExhibitionID),
    CONSTRAINT UQ_ArtworkExhibition UNIQUE (ArtworkID, ExhibitionID)  -- Prevent duplicate entries
);
GO

-- STEP 2: Insert data into tables
-- Insert into Genre (5 records)
INSERT INTO Genre (Description) VALUES 
('Impressionism'),
('Abstract'),
('Surrealism'),
('Renaissance'),
('Baroque'),
('Cubism'),
('Expressionism'),
('Realism'),
('Pop Art'),
('Minimalism');
GO

-- Insert into Artist (8 records with detailed information)
INSERT INTO Artist (Name, Surname, BirthYear, DeathYear, Nationality) VALUES
('Vincent', 'van Gogh', 1853, 1890, 'Dutch'),
('Pablo', 'Picasso', 1881, 1973, 'Spanish'),
('Salvador', 'Dali', 1904, 1989, 'Spanish'),
('Claude', 'Monet', 1840, 1926, 'French'),
('Leonardo', 'da Vinci', 1452, 1519, 'Italian'),
('Frida', 'Kahlo', 1907, 1954, 'Mexican'),
('Georgia', 'O''Keeffe', 1887, 1986, 'American'),
('Jackson', 'Pollock', 1912, 1956, 'American');
GO

-- Insert into Artwork (20 records with detailed information)
INSERT INTO Artwork (Title, ArtistID, GenreID, CreationYear, Medium, Status) VALUES
('Starry Night', 1, 1, 1889, 'Oil on canvas', 'Displayed'),
('The Persistence of Memory', 3, 3, 1931, 'Oil on canvas', 'Stored'),
('Guernica', 2, 6, 1937, 'Oil on canvas', 'Displayed'),
('Water Lilies', 4, 1, 1916, 'Oil on canvas', 'On Loan'),
('Mona Lisa', 5, 4, 1503, 'Oil on poplar panel', 'Displayed'),
('The Last Supper', 5, 4, 1498, 'Tempera on gesso', 'Displayed'),
('The Scream', 6, 7, 1893, 'Oil, tempera, pastel on cardboard', 'In Conservation'),
('The Two Fridas', 6, 3, 1939, 'Oil on canvas', 'On Loan'),
('Jimson Weed', 7, 2, 1936, 'Oil on canvas', 'Displayed'),
('Sunflowers', 1, 1, 1888, 'Oil on canvas', 'Displayed'),
('Les Demoiselles d''Avignon', 2, 6, 1907, 'Oil on canvas', 'Stored'),
('The Elephants', 3, 3, 1948, 'Oil on canvas', 'Displayed'),
('Impression, Sunrise', 4, 1, 1872, 'Oil on canvas', 'Displayed'),
('Self-Portrait with Thorn Necklace', 6, 3, 1940, 'Oil on canvas', 'Stored'),
('Red Canna', 7, 2, 1924, 'Oil on canvas', 'Displayed'),
('Irises', 1, 1, 1889, 'Oil on canvas', 'On Loan'),
('The Old Guitarist', 2, 6, 1904, 'Oil on panel', 'Displayed'),
('Number 1A', 8, 2, 1948, 'Oil and enamel on canvas', 'Displayed'),
('The Broken Column', 6, 3, 1944, 'Oil on masonite', 'Stored'),
('Autumn Rhythm', 8, 2, 1950, 'Enamel on canvas', 'Displayed');
GO

-- Insert into Exhibition (15 records with detailed information)
INSERT INTO Exhibition (Title, Description, StartDate, EndDate, Location, Curator) VALUES
('Modern Masters', 'Survey of 20th century modernist art', '2023-01-15', '2023-04-15', 'Main Gallery', 'Dr. Emily Johnson'),
('Renaissance Wonders', 'Masterpieces of the Renaissance period', '2023-05-01', '2023-08-31', 'Historical Wing', 'Prof. Michael Brown'),
('Surreal Dreams', 'Exploring the surrealist movement', '2023-02-10', '2023-05-10', 'Modern Wing', 'Sarah Williams'),
('Impressionist Highlights', 'Celebrating impressionist techniques', '2023-03-01', '2023-06-30', 'Garden Gallery', 'Jean-Luc Martin'),
('Abstract Expressions', 'Post-war abstract expressionism', '2023-04-15', '2023-07-15', 'Contemporary Space', 'Robert Chen'),
('Women in Art', 'Female artists through history', '2023-06-01', '2023-09-30', 'Feminist Gallery', 'Maria Garcia'),
('Dutch Masters', 'Golden Age of Dutch painting', '2023-07-15', '2023-10-15', 'European Wing', 'Hans VanderBerg'),
('Italian Renaissance', 'Florentine and Venetian masters', '2023-08-01', '2023-11-30', 'Classical Wing', 'Giovanni Rossi'),
('20th Century Innovations', 'Avant-garde movements of the 1900s', '2023-09-15', '2023-12-15', 'Innovation Hall', 'Thomas Wright'),
('Latin American Art', 'Modern art from Latin America', '2023-10-01', '2024-01-31', 'International Wing', 'Carlos Mendez'),
('Post-Impressionism', 'Beyond impressionism', '2023-11-01', '2024-02-28', 'Transition Gallery', 'Claire Dubois'),
('Cubist Revolution', 'Picasso and Braque', '2024-01-15', '2024-04-15', 'Modernist Space', 'Antoine Lefevre'),
('Baroque Splendor', 'Dramatic baroque works', '2024-02-01', '2024-05-31', 'Grand Hall', 'Isabella Conti'),
('Contemporary Voices', '21st century artists', '2024-03-15', '2024-06-15', 'New Voices Gallery', 'Jamal Washington'),
('American Modernism', 'Early 20th century American art', '2024-04-01', '2024-07-31', 'American Wing', 'Elizabeth Taylor');
GO

-- Insert into Entry (25 records ensuring multiple entries for some artworks)
-- Starry Night in 3 exhibitions
INSERT INTO Entry (ArtworkID, ExhibitionID, EntryDate, DisplayLocation, InsuranceValue, SpecialNotes) VALUES
(1, 1, '2023-01-10', 'Gallery A1', 100000000.00, 'Climate controlled case required'),
(1, 4, '2023-02-25', 'Main Hall', 100000000.00, 'Featured centerpiece'),
(1, 11, '2023-10-28', 'Transition Gallery', 100000000.00, 'Special lighting required'),
-- Mona Lisa in 2 exhibitions
(5, 2, '2023-04-28', 'Renaissance Hall', 860000000.00, 'High security area'),
(5, 8, '2023-07-28', 'Italian Masters Room', 860000000.00, 'Restricted viewing time'),
-- The Persistence of Memory in 2 exhibitions
(2, 3, '2023-02-05', 'Surreal Wing', 150000000.00, 'Fragile - handle with care'),
(2, 6, '2023-05-28', 'Feminist Gallery', 150000000.00, 'Display with feminist context'),
-- Other entries
(3, 1, '2023-01-12', 'Gallery B2', 200000000.00, 'Anti-war exhibit centerpiece'),
(4, 4, '2023-02-28', 'Water Feature', 80000000.00, 'Complementary water sound installation'),
(6, 2, '2023-04-30', 'Religious Art Wing', 450000000.00, 'Restoration in progress'),
(7, 1, '2023-01-14', 'Gallery C3', 120000000.00, 'Currently in conservation - replica displayed'),
(8, 6, '2023-05-30', 'Self-Portrait Section', 60000000.00, 'Part of feminist narrative'),
(9, 5, '2023-04-10', 'Modern Gallery', 40000000.00, 'Flower series highlight'),
(10, 4, '2023-03-02', 'Sunflower Corner', 90000000.00, 'Complementary Van Gogh letters displayed'),
(11, 1, '2023-01-16', 'Gallery D4', 180000000.00, 'Proto-cubist masterpiece'),
(12, 3, '2023-02-08', 'Surreal Wing', 50000000.00, 'Dali''s iconic elephants'),
(13, 4, '2023-03-03', 'Impressionist Corner', 250000000.00, 'Namesake of Impressionism'),
(14, 6, '2023-05-30', 'Self-Portrait Section', 55000000.00, 'Pain and suffering theme'),
(15, 5, '2023-04-12', 'Flower Gallery', 35000000.00, 'O''Keeffe''s floral abstraction'),
(16, 4, '2023-03-05', 'Garden View', 85000000.00, 'Complements water lilies'),
(17, 1, '2023-01-18', 'Gallery E5', 70000000.00, 'Blue Period highlight'),
(18, 5, '2023-04-15', 'Abstract Space', 65000000.00, 'Drip technique showcase'),
(19, 6, '2023-05-30', 'Pain Gallery', 48000000.00, 'Physical and emotional pain'),
(20, 5, '2023-04-18', 'Action Painting Area', 75000000.00, 'Energy and movement focus');
GO

-- STEP 3: Demonstrate UPDATE statement
-- Update artwork status and corresponding entry
UPDATE Artwork 
SET Status = 'In Conservation', Medium = 'Oil, tempera, pastel on cardboard (fragile)' 
WHERE Title = 'The Scream';
GO

UPDATE Entry 
SET SpecialNotes = SpecialNotes + ' - Urgent conservation required' 
WHERE ArtworkID = (SELECT ArtworkID FROM Artwork WHERE Title = 'The Scream');
GO

-- Update exhibition information
UPDATE Exhibition 
SET EndDate = '2023-12-31', Description = Description + ' - Extended due to popular demand' 
WHERE Title = '20th Century Innovations';
GO

-- STEP 4: Demonstrate DELETE statement
-- First, delete entries for an artwork
DELETE FROM Entry 
WHERE ArtworkID = (SELECT ArtworkID FROM Artwork WHERE Title = 'The Old Guitarist');
GO

-- Then delete the artwork
DELETE FROM Artwork 
WHERE Title = 'The Old Guitarist';
GO

-- STEP 5: Display artwork report sorted by genre and title
SELECT 
    g.Description AS Genre,
    a.Title AS ArtworkTitle,
    CONCAT(ar.Name, ' ', ar.Surname) AS Artist,
    a.CreationYear,
    a.Medium,
    a.Status,
    COUNT(e.EntryID) AS TimesExhibited
FROM 
    Artwork a
JOIN 
    Genre g ON a.GenreID = g.GenreID
JOIN 
    Artist ar ON a.ArtistID = ar.ArtistID
LEFT JOIN 
    Entry e ON a.ArtworkID = e.ArtworkID
GROUP BY 
    g.Description, a.Title, ar.Name, ar.Surname, a.CreationYear, a.Medium, a.Status
ORDER BY 
    g.Description ASC,
    a.Title ASC;
GO

-- STEP 6: Demonstrate GROUP BY clause
-- Report showing exhibitions with artwork counts and total insurance value
SELECT 
    ex.Title AS Exhibition,
    ex.StartDate,
    ex.EndDate,
    COUNT(en.EntryID) AS NumberOfArtworks,
    '$' + CONVERT(NVARCHAR(50), SUM(en.InsuranceValue), 1) AS TotalInsuranceValue,
    STRING_AGG(g.Description, ', ') WITHIN GROUP (ORDER BY g.Description) AS GenresRepresented
FROM 
    Exhibition ex
JOIN 
    Entry en ON ex.ExhibitionID = en.ExhibitionID
JOIN 
    Artwork a ON en.ArtworkID = a.ArtworkID
JOIN 
    Genre g ON a.GenreID = g.GenreID
GROUP BY 
    ex.Title, ex.StartDate, ex.EndDate
ORDER BY 
    ex.StartDate, NumberOfArtworks DESC;
GO

-- STEP 7: Demonstrate HAVING clause
-- Report showing artists with more than 3 artworks in the collection
-- and average insurance value over $50 million
SELECT 
    CONCAT(ar.Name, ' ', ar.Surname) AS Artist,
    ar.Nationality,
    COUNT(a.ArtworkID) AS NumberOfArtworks,
    '$' + CONVERT(NVARCHAR(50), AVG(e.InsuranceValue), 1) AS AverageInsuranceValue,
    STRING_AGG(a.Title, '; ') WITHIN GROUP (ORDER BY a.Title) AS ArtworkTitles
FROM 
    Artist ar
JOIN 
    Artwork a ON ar.ArtistID = a.ArtistID
JOIN 
    Entry e ON a.ArtworkID = e.ArtworkID
GROUP BY 
    ar.Name, ar.Surname, ar.Nationality
HAVING 
    COUNT(a.ArtworkID) > 3 AND AVG(e.InsuranceValue) > 50000000
ORDER BY 
    AverageInsuranceValue DESC;
GO

-- STEP 8: Demonstrate JOINs
-- Comprehensive report showing all artworks with their full exhibition history
-- including artworks never exhibited
SELECT 
    a.Title AS Artwork,
    CONCAT(ar.Name, ' ', ar.Surname) AS Artist,
    g.Description AS Genre,
    a.CreationYear,
    a.Medium,
    a.Status,
    CASE 
        WHEN COUNT(e.ExhibitionID) = 0 THEN 'Never Exhibited'
        ELSE CONVERT(NVARCHAR(50), COUNT(e.ExhibitionID)) + ' exhibition(s)'
    END AS ExhibitionHistory,
    CASE 
        WHEN COUNT(e.ExhibitionID) = 0 THEN NULL
        ELSE STRING_AGG(
            CONCAT(ex.Title, ' (', CONVERT(NVARCHAR(10), ex.StartDate, 120) + ' to ' + CONVERT(NVARCHAR(10), ex.EndDate, 120) + ')'), 
            '; '
        ) WITHIN GROUP (ORDER BY ex.StartDate)
    END AS Exhibitions
FROM 
    Artwork a
JOIN 
    Artist ar ON a.ArtistID = ar.ArtistID
JOIN 
    Genre g ON a.GenreID = g.GenreID
LEFT JOIN 
    Entry e ON a.ArtworkID = e.ArtworkID
LEFT JOIN 
    Exhibition ex ON e.ExhibitionID = ex.ExhibitionID
GROUP BY 
    a.Title, ar.Name, ar.Surname, g.Description, a.CreationYear, a.Medium, a.Status
ORDER BY 
    CASE WHEN COUNT(e.ExhibitionID) = 0 THEN 1 ELSE 0 END,  -- Never exhibited first
    COUNT(e.ExhibitionID) DESC,
    a.Title;
GO