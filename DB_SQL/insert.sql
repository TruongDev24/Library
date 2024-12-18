-- Thêm 10 dữ liệu vào bảng Users
INSERT INTO Users (UserName, PasswordHash, Role)
VALUES 
('admin1', 'hashed_password_1', 'Admin'),
('employee1', 'hashed_password_2', 'Employee'),
('john_doe', 'hashed_password_3', 'Employee'),
('jane_smith', 'hashed_password_4', 'Employee'),
('michael_lee', 'hashed_password_5', 'Employee'),
('emily_davis', 'hashed_password_6', 'Employee'),
('mark_jones', 'hashed_password_7', 'Employee'),
('lucas_williams', 'hashed_password_8', 'Employee'),
('sarah_brown', 'hashed_password_9', 'Employee'),
('david_clark', 'hashed_password_10', 'Employee');

-- Thêm 10 dữ liệu vào bảng Employees
INSERT INTO Employees (UserID, FullName, Email, Phone, Status, HireDate)
VALUES 
(1, 'Admin User', 'admin@example.com', '1234567890', 'Active', GETDATE()),
(2, 'John Doe', 'johndoe@example.com', '0912345678', 'Active', GETDATE()),
(3, 'Jane Smith', 'janesmith@example.com', '0923456789', 'Active', GETDATE()),
(4, 'Michael Lee', 'michaellee@example.com', '0934567890', 'Active', GETDATE()),
(5, 'Emily Davis', 'emilydavis@example.com', '0945678901', 'Active', GETDATE()),
(6, 'Mark Jones', 'markjones@example.com', '0956789012', 'Active', GETDATE()),
(7, 'Lucas Williams', 'lucaswilliams@example.com', '0967890123', 'Active', GETDATE()),
(8, 'Sarah Brown', 'sarahbrown@example.com', '0978901234', 'Active', GETDATE()),
(9, 'David Clark', 'davidclark@example.com', '0989012345', 'Active', GETDATE()),
(10, 'Linda Harris', 'lindaharris@example.com', '0990123456', 'Active', GETDATE());

-- Thêm 10 dữ liệu vào bảng Readers
INSERT INTO Readers (FullName, Email, Phone, Address)
VALUES 
('John Doe', 'johndoe@example.com', '0912345678', '123 Main St'),
('Jane Smith', 'janesmith@example.com', '0923456789', '456 Oak Ave'),
('Michael Lee', 'michaellee@example.com', '0934567890', '789 Pine Rd'),
('Emily Davis', 'emilydavis@example.com', '0945678901', '101 Maple Blvd'),
('Mark Jones', 'markjones@example.com', '0956789012', '202 Elm St'),
('Lucas Williams', 'lucaswilliams@example.com', '0967890123', '303 Birch St'),
('Sarah Brown', 'sarahbrown@example.com', '0978901234', '404 Cedar Ave'),
('David Clark', 'davidclark@example.com', '0989012345', '505 Redwood Dr'),
('Linda Harris', 'lindaharris@example.com', '0990123456', '606 Spruce Ln'),
('Daniel Scott', 'danielscott@example.com', '1001234567', '707 Fir St');

-- Thêm 10 dữ liệu vào bảng Categories
INSERT INTO Categories (CategoryName)
VALUES 
('Science Fiction'),
('Literature'),
('History'),
('Biography'),
('Fantasy'),
('Mystery'),
('Romance'),
('Technology'),
('Health'),
('Self-Help');

-- Thêm 10 dữ liệu vào bảng Authors
INSERT INTO Authors (FullName)
VALUES 
('Isaac Asimov'),
('J.K. Rowling'),
('George Orwell'),
('Frank Herbert'),
('J.R.R. Tolkien'),
('Agatha Christie'),
('Stephen King'),
('Dan Brown'),
('Jane Austen'),
('Mark Twain');

-- Thêm 10 dữ liệu vào bảng Publishers
INSERT INTO Publishers (PublisherName, Address, Phone)
VALUES 
('Penguin Random House', '123 Publisher St', '0981234567'),
('HarperCollins', '456 Publisher Rd', '0982345678'),
('Macmillan', '789 Publisher Ave', '0983456789'),
('Simon & Schuster', '101 Publisher Blvd', '0984567890'),
('Hachette', '202 Publisher Dr', '0985678901'),
('Bloomsbury', '303 Publisher Ln', '0986789012'),
('Random House', '404 Publisher St', '0987890123'),
('Wiley', '505 Publisher Rd', '0988901234'),
('Pearson', '606 Publisher Ave', '0989012345'),
('Scholastic', '707 Publisher Blvd', '0989123456');

-- Thêm 10 dữ liệu vào bảng Books
INSERT INTO Books (Title, PublisherID, CategoryID, PublishedYear)
VALUES 
('Foundation', 1, 1, 1951),
('Harry Potter and the Sorcerer Stone', 2, 2, 1997),
('1984', 3, 3, 1949),
('Dune', 4, 1, 1965),
('The Hobbit', 5, 2, 1937),
('Murder on the Orient Express', 6, 5, 1934),
('The Shining', 7, 6, 1977),
('The Da Vinci Code', 8, 5, 2003),
('Pride and Prejudice', 9, 2, 1813),
('The Adventures of Tom Sawyer', 10, 4, 1876);

-- Thêm 10 dữ liệu vào bảng BookAuthors
INSERT INTO BookAuthors (BookID, AuthorID)
VALUES 
(1, 1),  -- Foundation - Isaac Asimov
(2, 2),  -- Harry Potter - J.K. Rowling
(3, 3),  -- 1984 - George Orwell
(4, 4),  -- Dune - Frank Herbert
(5, 5),  -- The Hobbit - J.R.R. Tolkien
(6, 6),  -- Murder on the Orient Express - Agatha Christie
(7, 7),  -- The Shining - Stephen King
(8, 8),  -- The Da Vinci Code - Dan Brown
(9, 9),  -- Pride and Prejudice - Jane Austen
(10, 10);  -- The Adventures of Tom Sawyer - Mark Twain

-- Thêm 10 dữ liệu vào bảng BookCopies
INSERT INTO BookCopies (BookID, IsAvailable)
VALUES 
(1, 1),
(2, 0),  -- Không có sẵn
(3, 1),
(4, 1),
(5, 0),  -- Không có sẵn
(6, 1),
(7, 1),
(8, 0),  -- Không có sẵn
(9, 1),
(10, 1);

-- Thêm 10 dữ liệu vào bảng BookLocations
INSERT INTO BookLocations (BookID, Shelf, Row, ShelfColumn)
VALUES 
(1, 'A1', 1, 1),
(2, 'B2', 1, 2),
(3, 'C3', 2, 1),
(4, 'D4', 1, 3),
(5, 'E5', 3, 2),
(6, 'F6', 2, 3),
(7, 'G7', 1, 4),
(8, 'H8', 2, 2),
(9, 'I9', 3, 1),
(10, 'J10', 4, 1);

-- Thêm 10 dữ liệu vào bảng BorrowRecords
INSERT INTO BorrowRecords (ReaderID, BorrowDate, DueDate, Status)
VALUES 
(1, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(2, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(3, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(4, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(5, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(6, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(7, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(8, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(9, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed'),
(10, GETDATE(), DATEADD(DAY, 7, GETDATE()), 'Borrowed');

-- Thêm 10 dữ liệu vào bảng ReturnRecords
INSERT INTO ReturnRecords (BorrowID, ReturnDate, PenaltyAmount)
VALUES 
(1, GETDATE(), 0),
(2, GETDATE(), 0),
(3, GETDATE(), 0),
(4, GETDATE(), 0),
(5, GETDATE(), 0),
(6, GETDATE(), 0),
(7, GETDATE(), 0),
(8, GETDATE(), 0),
(9, GETDATE(), 0),
(10, GETDATE(), 0);

-- Thêm 10 dữ liệu vào bảng Renewals
INSERT INTO Renewals (BorrowID, RenewalDate, NewDueDate)
VALUES 
(1, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(2, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(3, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(4, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(5, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(6, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(7, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(8, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(9, GETDATE(), DATEADD(DAY, 7, GETDATE())),
(10, GETDATE(), DATEADD(DAY, 7, GETDATE()));

-- Thêm 10 dữ liệu vào bảng Notifications
INSERT INTO Notifications (ReaderID, Message, IsRead)
VALUES 
(1, 'Your book reservation has been confirmed.', 0),
(2, 'You have an overdue book.', 0),
(3, 'New books are available in the Science Fiction section.', 1),
(4, 'Your borrowed book is due soon.', 0),
(5, 'Your renewal request has been approved.', 1),
(6, 'A book you requested is now available.', 0),
(7, 'Your reservation has been canceled.', 1),
(8, 'Reminder: Please return the book by the due date.', 0),
(9, 'You have a new book recommendation based on your preferences.', 1),
(10, 'Your request for a new book has been approved.', 0);

-- Thêm 10 dữ liệu vào bảng BookReservations
INSERT INTO BookReservations (ReaderID, BookID, Status)
VALUES 
(1, 1, 'Pending'),
(2, 2, 'Completed'),
(3, 3, 'Pending'),
(4, 4, 'Pending'),
(5, 5, 'Completed'),
(6, 6, 'Canceled'),
(7, 7, 'Pending'),
(8, 8, 'Completed'),
(9, 9, 'Pending'),
(10, 10, 'Completed');

-- Thêm 10 dữ liệu vào bảng DigitalResources
INSERT INTO DigitalResources (Title, Description, URL, CategoryID)
VALUES 
('E-book on Java Programming', 'An introduction to Java programming language.', 'https://example.com/java-ebook', 9),
('Python Programming Guide', 'Learn Python with this comprehensive guide.', 'https://example.com/python-guide', 9),
('Digital Marketing 101', 'Basics of digital marketing strategies.', 'https://example.com/digital-marketing', 8),
('Cloud Computing Fundamentals', 'Overview of cloud computing and services.', 'https://example.com/cloud-computing', 9),
('Artificial Intelligence in Healthcare', 'Explore AI applications in healthcare.', 'https://example.com/ai-healthcare', 9),
('Introduction to Machine Learning', 'A beginner guide to machine learning.', 'https://example.com/machine-learning', 9),
('Web Development Basics', 'Everything you need to know about web development.', 'https://example.com/web-development', 9),
('Data Science and Analytics', 'How to work with data and analytics.', 'https://example.com/data-science', 9),
('Digital Library for Students', 'A collection of resources for students.', 'https://example.com/digital-library', 9),
('Health and Wellness Tips', 'Learn about health and wellness.', 'https://example.com/health-wellness', 10);

-- Thêm 10 dữ liệu vào bảng BookRequests
INSERT INTO BookRequests (ReaderID, Title, Author, Status)
VALUES 
(1, 'Clean Code', 'Robert C. Martin', 'Approved'),
(2, 'The Pragmatic Programmer', 'Andrew Hunt', 'Approved'),
(3, 'Design Patterns', 'Erich Gamma', 'Pending'),
(4, 'The Mythical Man-Month', 'Frederick P. Brooks Jr.', 'Pending'),
(5, 'Refactoring', 'Martin Fowler', 'Rejected'),
(6, 'Code Complete', 'Steve McConnell', 'Approved'),
(7, 'Introduction to Algorithms', 'Thomas H. Cormen', 'Approved'),
(8, 'The Art of Computer Programming', 'Donald E. Knuth', 'Pending'),
(9, 'Patterns of Enterprise Application Architecture', 'Martin Fowler', 'Approved'),
(10, 'Operating Systems: Three Easy Pieces', 'Remzi H. Arpaci-Dusseau', 'Rejected');

-- Thêm 10 dữ liệu vào bảng LibraryBranches
INSERT INTO LibraryBranches (BranchName, Address)
VALUES 
('Downtown Library', '123 Downtown St'),
('Eastside Library', '456 Eastside Ave'),
('Westside Library', '789 Westside Blvd'),
('Northgate Library', '101 Northgate Rd'),
('Southpark Library', '202 Southpark Ln'),
('Uptown Library', '303 Uptown Dr'),
('Riverside Library', '404 Riverside Ave'),
('Hillside Library', '505 Hillside Blvd'),
('Parkview Library', '606 Parkview St'),
('City Center Library', '707 City Center Rd');

-- Thêm 10 dữ liệu vào bảng Suppliers
INSERT INTO Suppliers (SupplierName, ContactInfo)
VALUES 
('Book World', 'contact@bookworld.com'),
('Global Books', 'contact@globalbooks.com'),
('Books-R-Us', 'info@books-r-us.com'),
('Best Books', 'sales@bestbooks.com'),
('Novelty Publishers', 'support@noveltypub.com'),
('Read More Books', 'info@readmorebooks.com'),
('Book Haven', 'contact@bookhaven.com'),
('Literary Inc.', 'sales@literaryinc.com'),
('Books Unlimited', 'info@booksunlimited.com'),
('Fictional Books', 'contact@fictionalbooks.com');

-- Thêm 10 dữ liệu vào bảng Transactions
INSERT INTO Transactions (ReaderID, Amount, Description)
VALUES 
(1, 15.00, 'Late fee for overdue books'),
(2, 10.00, 'Fine for lost book'),
(3, 25.00, 'Subscription fee for premium membership'),
(4, 5.00, 'Late fee for overdue books'),
(5, 50.00, 'Purchase of new books'),
(6, 20.00, 'Late fee for overdue books'),
(7, 15.00, 'Late fee for overdue books'),
(8, 30.00, 'Late fee for overdue books'),
(9, 12.00, 'Late fee for overdue books'),
(10, 18.00, 'Purchase of new books');
