CREATE DATABASE LibraryManagement;
GO
USE LibraryManagement;
GO
-- Bảng Users: Quản lý tài khoản người dùng
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(50) NOT NULL DEFAULT 'Employee', -- Admin, Employee (quản lý mặc định là nhân viên)
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Bảng Employees: Quản lý thông tin nhân viên
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    FullName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(15),
    Status NVARCHAR(50) DEFAULT 'Active', -- Active, Inactive
    HireDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Bảng LoginHistory: Lưu lịch sử đăng nhập nhân viên
CREATE TABLE LoginHistory (
    LoginID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    LoginTime DATETIME DEFAULT GETDATE(),
    IPAddress NVARCHAR(50),
    Device NVARCHAR(100),
    Status NVARCHAR(50) DEFAULT 'Success', -- Success/Failure
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Bảng Readers: Quản lý độc giả
CREATE TABLE Readers (
    ReaderID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(15),
    Address NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Bảng Categories: Danh mục sách
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(255) NOT NULL UNIQUE
);

-- Bảng Authors: Tác giả
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(255) NOT NULL
);

-- Bảng Publishers: Nhà xuất bản
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY IDENTITY(1,1),
    PublisherName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    Phone NVARCHAR(15)
);

-- Bảng Books: Sách
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    PublisherID INT,
    CategoryID INT,
    PublishedYear INT,
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Bảng BookAuthors: Quan hệ nhiều-nhiều giữa sách và tác giả
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Bảng BookCopies: Bản sao sách
CREATE TABLE BookCopies (
    CopyID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    IsAvailable BIT DEFAULT 1,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Bảng BookLocations: Vị trí của sách trên kệ
CREATE TABLE BookLocations (
    LocationID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    Shelf NVARCHAR(100) NOT NULL,  -- Tên kệ sách (hoặc số kệ)
    Row INT,                       -- Số hàng
    ShelfColumn INT,               -- Số cột (đổi tên từ 'Column' thành 'ShelfColumn')
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Bảng BorrowRecords: Lưu thông tin mượn sách
CREATE TABLE BorrowRecords (
    BorrowID INT PRIMARY KEY IDENTITY(1,1),
    ReaderID INT NOT NULL,
    BorrowDate DATETIME DEFAULT GETDATE(),
    DueDate DATETIME NOT NULL,
    Status NVARCHAR(50) DEFAULT 'Borrowed', -- Borrowed, Returned, Overdue
    FOREIGN KEY (ReaderID) REFERENCES Readers(ReaderID)
);

-- Bảng ReturnRecords: Lưu thông tin trả sách
CREATE TABLE ReturnRecords (
    ReturnID INT PRIMARY KEY IDENTITY(1,1),
    BorrowID INT NOT NULL,
    ReturnDate DATETIME DEFAULT GETDATE(),
    PenaltyAmount DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (BorrowID) REFERENCES BorrowRecords(BorrowID)
);

-- Bảng Renewals: Lịch sử gia hạn mượn sách
CREATE TABLE Renewals (
    RenewalID INT PRIMARY KEY IDENTITY(1,1),
    BorrowID INT NOT NULL,
    RenewalDate DATETIME DEFAULT GETDATE(),
    NewDueDate DATETIME NOT NULL,
    FOREIGN KEY (BorrowID) REFERENCES BorrowRecords(BorrowID)
);

-- Bảng Notifications: Thông báo cho độc giả
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    ReaderID INT,
    Message NVARCHAR(255),
    SentAt DATETIME DEFAULT GETDATE(),
    IsRead BIT DEFAULT 0,
    FOREIGN KEY (ReaderID) REFERENCES Readers(ReaderID)
);

-- Bảng BookReservations: Đặt trước sách
CREATE TABLE BookReservations (
    ReservationID INT PRIMARY KEY IDENTITY(1,1),
    ReaderID INT NOT NULL,
    BookID INT NOT NULL,
    ReservationDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Pending', -- Pending, Completed, Canceled
    FOREIGN KEY (ReaderID) REFERENCES Readers(ReaderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Bảng DigitalResources: Quản lý tài liệu số
CREATE TABLE DigitalResources (
    ResourceID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    URL NVARCHAR(255),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Bảng BookRequests: Yêu cầu nhập sách mới
CREATE TABLE BookRequests (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    ReaderID INT NOT NULL,
    Title NVARCHAR(255),
    Author NVARCHAR(255),
    RequestDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Pending', -- Pending, Approved, Rejected
    FOREIGN KEY (ReaderID) REFERENCES Readers(ReaderID)
);

-- Bảng LibraryBranches: Chi nhánh thư viện
CREATE TABLE LibraryBranches (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255)
);

-- Bảng Suppliers: Nhà cung cấp sách
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(255) NOT NULL,
    ContactInfo NVARCHAR(255)
);

-- Bảng Transactions: Giao dịch tài chính
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    ReaderID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    TransactionDate DATETIME DEFAULT GETDATE(),
    Description NVARCHAR(255),
    FOREIGN KEY (ReaderID) REFERENCES Readers(ReaderID)
);

-- Cập nhật bảng BorrowRecords (phiếu mượn)
ALTER TABLE BorrowRecords
ADD EmployeeID INT;

-- Cập nhật bảng ReturnRecords (phiếu trả)
ALTER TABLE ReturnRecords
ADD EmployeeID INT;

-- Thêm khóa ngoại để liên kết với bảng Employees (nhân viên)
ALTER TABLE BorrowRecords
ADD CONSTRAINT FK_BorrowRecords_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

ALTER TABLE ReturnRecords
ADD CONSTRAINT FK_ReturnRecords_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);
