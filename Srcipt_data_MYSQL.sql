Create DATABASE PhucLongCoffeeandTea;
USE PhucLongCoffeeandTea;

CREATE TABLE Branches
(
    BranchID    INT AUTO_INCREMENT PRIMARY KEY,
    Name        VARCHAR(255),
    Address     VARCHAR(255),
    PhoneNumber VARCHAR(15),
    ManagerID   INT
);

CREATE TABLE Employees
(
    EmployeeID  INT AUTO_INCREMENT PRIMARY KEY,
    FullName    VARCHAR(255),
    Role        VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Salary      DECIMAL(10, 2),
    BranchID    INT,
    FOREIGN KEY (BranchID) REFERENCES Branches (BranchID)
);

CREATE TABLE Shifts
(
    ShiftID   INT PRIMARY KEY,
    Name      VARCHAR(100),
    StartTime TIME,
    EndTime   TIME
);
CREATE TABLE EmployeeShifts
(
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID   INT,
    ShiftID      INT,
    WorkDate     DATETIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (ShiftID) REFERENCES Shifts (ShiftID)
);
alter table employeeshifts
    modify WorkDate date null;
CREATE TABLE Products
(
    ProductID     INT AUTO_INCREMENT PRIMARY KEY,
    Name          VARCHAR(255),
    Category      VARCHAR(100),
    Price         DECIMAL(10, 2)
);

CREATE TABLE Customers
(
    CustomerID    INT AUTO_INCREMENT PRIMARY KEY,
    FullName      VARCHAR(255),
    PhoneNumber   VARCHAR(15),
    LoyaltyPoints INT
);

CREATE TABLE Orders
(
    OrderID     INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID  INT,
    EmployeeID  INT,
    BranchID    INT,
    OrderDate   DATETIME,
    TotalAmount DECIMAL(10, 2),
    Status      VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (BranchID) REFERENCES Branches (BranchID)
);

CREATE TABLE OrderDetails
(
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID       INT,
    ProductID     INT,
    Quantity      INT,
    Subtotal      DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

CREATE TABLE Ingredients
(
    IngredientID INT AUTO_INCREMENT PRIMARY KEY,
    Name         VARCHAR(255),
    Unit         VARCHAR(50),
    PricePerUnit DECIMAL(10, 2)
);

CREATE TABLE BranchIngredients
(
    BranchIngredientID INT AUTO_INCREMENT PRIMARY KEY,  -- Mã theo dõi nguyên liệu tại chi nhánh
    BranchID           INT,                              -- Mã chi nhánh, khóa ngoại từ bảng Branches
    IngredientID       INT,                              -- Mã nguyên liệu, khóa ngoại từ bảng Ingredients
    LastUpdated        DATETIME,                         -- Thời gian cập nhật nguyên liệu
    FOREIGN KEY (BranchID) REFERENCES Branches (BranchID),    -- Khóa ngoại tham chiếu đến bảng Branches
    FOREIGN KEY (IngredientID) REFERENCES Ingredients (IngredientID)  -- Khóa ngoại tham chiếu đến bảng Ingredients
);

CREATE TABLE MemberRewardsBirthDay (
                                       CustomerID INT NOT NULL, -- Mã khách hàng
                                       MembershipLevel VARCHAR(50) NOT NULL, -- Cấp độ thành viên
                                       Points INT NOT NULL, -- Điểm tích lũy của khách hàng
                                       RegisteredDate DATE NOT NULL, -- Ngày đăng ký thành viên
                                       RewardDescription VARCHAR(255) NOT NULL, -- Mô tả quà tặng
                                       ExpiryDate DATE NOT NULL, -- Ngày hết hạn quà tặng
                                       PRIMARY KEY (CustomerID, MembershipLevel), -- Khóa chính theo CustomerID và MembershipLevel
                                       FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- Khóa ngoại tham chiếu đến bảng Customers
);

INSERT INTO Branches (Name, Address, PhoneNumber, ManagerID)
VALUES ('Phúc Long - Bến Thành', '38 Le Loi, Quận 1, TP.HCM', '02838212345', 1),
       ('Phúc Long - Hà Nội', '123 Trần Duy Hưng, Hà Nội', '02412345678', 2),
       ('Phúc Long - Đà Nẵng', '45 Nguyễn Văn Linh, Đà Nẵng', '0236123456', 3),
       ('Phúc Long - TP Thủ Đức', '56 Xa Lộ Hà Nội, TP Thủ Đức, HCM', '02839345678', 4),
       ('Phúc Long - Bình Dương', '789 Đại Lộ Bình Dương', '0274456789', 5),
       ('Phúc Long - Hạ Long', '234 Nguyễn Trãi, Hạ Long', '0203234567', 6),
       ('Phúc Long - Nha Trang', '12 Nguyễn Thị Minh Khai, Nha Trang', '0258356789', 7),
       ('Phúc Long - Vũng Tàu', '14 Nguyễn An Ninh, Vũng Tàu', '0254856789', 8),
       ('Phúc Long - Hải Phòng', '88 Quang Trung, Hải Phòng', '0225398765', 9),
       ('Phúc Long - Phú Nhuận', '123 Phan Đình Phùng, Phú Nhuận, HCM', '02839412345', 10),
       ('Phúc Long - Biên Hòa', '78 Đồng Khởi, Biên Hòa', '0613634567', 11),
       ('Phúc Long - Cần Thơ', '15 Lê Lợi, Cần Thơ', '0292387456', 12),
       ('Phúc Long - Vĩnh Long', '35 Lý Thường Kiệt, Vĩnh Long', '0270385436', 13),
       ('Phúc Long - Long Xuyên', '24 Nguyễn Trãi, Long Xuyên', '0296378901', 14),
       ('Phúc Long - Rạch Giá', '44 Nguyễn Thái Học, Rạch Giá', '0297623412', 15),
       ('Phúc Long - Cà Mau', '123 Trần Hưng Đạo, Cà Mau', '0290221234', 16),
       ('Phúc Long - Quảng Ngãi', '32 Quang Trung, Quảng Ngãi', '0256325489', 17),
       ('Phúc Long - Quảng Bình', '56 Trần Phú, Quảng Bình', '0232221345', 18),
       ('Phúc Long - Phan Thiết', '67 Nguyễn Huệ, Phan Thiết', '0623387456', 19),
       ('Phúc Long - Kon Tum', '99 Phan Chu Trinh, Kon Tum', '0260386745', 20);

INSERT INTO Employees (FullName, Role, PhoneNumber, Salary, BranchID)
VALUES ('Nguyễn Văn A', 'Quản lý', '0987654321', 8000000, 7),
       ('Lê Thị B', 'Thu ngân', '0912345678', 6000000, 2),
       ('Trần Quang C', 'Nhân viên pha chế', '0908765432', 5500000, 17),
       ('Nguyễn Hồng D', 'Quản lý', '0922334455', 8500000, 4),
       ('Phan Minh E', 'Thu ngân', '0933445566', 6500000, 13),
       ('Vũ Thị F', 'Nhân viên pha chế', '0944556677', 5700000, 15),
       ('Bùi Thi G', 'Nhân viên pha chế', '0955667788', 5900000, 19),
       ('Hoàng Lê H', 'Quản lý', '0966778899', 8000000, 6),
       ('Lý Hữu I', 'Thu ngân', '0977889900', 6000000, 1),
       ('Đỗ Minh K', 'Nhân viên pha chế', '0988990011', 5500000, 20),
       ('Phạm Thị L', 'Quản lý', '0999001122', 8200000, 8),
       ('Trần Quỳnh M', 'Thu ngân', '0911234567', 6100000, 5),
       ('Vũ Minh N', 'Nhân viên pha chế', '0922345678', 5700000, 12),
       ('Nguyễn Quang O', 'Quản lý', '0933456789', 8400000, 14),
       ('Bùi Thị P', 'Thu ngân', '0944567890', 6000000, 18),
       ('Phan Thị Q', 'Nhân viên pha chế', '0955678901', 5800000, 9),
       ('Hoàng Quốc R', 'Quản lý', '0966789012', 8200000, 3),
       ('Lê Thi S', 'Thu ngân', '0977890123', 6000000, 16),
       ('Nguyễn Minh T', 'Nhân viên pha chế', '0988901234', 5700000, 11),
       ('Trần Thị U', 'Quản lý', '0999012345', 8300000, 10),
       ('Phan Quốc V', 'Thu ngân', '0902345678', 6000000, 7),
       ('Trần Hải W', 'Nhân viên pha chế', '0913456789', 5800000, 2),
       ('Vũ Thi X', 'Quản lý', '0924567890', 8200000, 5),
       ('Nguyễn Thị Y', 'Thu ngân', '0935678901', 6000000, 4),
       ('Hoàng Minh Z', 'Nhân viên pha chế', '0946789012', 5700000, 13),
       ('Bùi Thị AA', 'Quản lý', '0957890123', 8500000, 14),
       ('Lê Quốc BB', 'Thu ngân', '0968901234', 6500000, 16),
       ('Phan Minh CC', 'Nhân viên pha chế', '0979012345', 5900000, 3),
       ('Trần Lê DD', 'Quản lý', '0980123456', 8400000, 9),
       ('Nguyễn Hải EE', 'Thu ngân', '0991234567', 6000000, 18);

INSERT INTO Shifts (ShiftID, Name, StartTime, EndTime)
VALUES (1, 'Sáng', '06:00:00', '14:00:00'),
       (2, 'Chiều', '14:00:00', '22:00:00'),
       (3, 'Tối', '22:00:00', '06:00:00'),
       (4, 'Sáng', '07:00:00', '15:00:00'),
       (5, 'Chiều', '15:00:00', '23:00:00'),
       (6, 'Tối', '23:00:00', '07:00:00'),
       (7, 'Sáng', '06:30:00', '14:30:00'),
       (8, 'Chiều', '14:30:00', '22:30:00'),
       (9, 'Tối', '22:30:00', '06:30:00'),
       (10, 'Sáng', '08:00:00', '16:00:00'),
       (11, 'Chiều', '16:00:00', '00:00:00'),
       (12, 'Tối', '00:00:00', '08:00:00'),
       (13, 'Sáng', '06:00:00', '14:00:00'),
       (14, 'Chiều', '14:00:00', '22:00:00'),
       (15, 'Tối', '22:00:00', '06:00:00'),
       (16, 'Sáng', '07:30:00', '15:30:00'),
       (17, 'Chiều', '15:30:00', '23:30:00'),
       (18, 'Tối', '23:30:00', '07:30:00'),
       (19, 'Sáng', '05:00:00', '13:00:00'),
       (20, 'Chiều', '13:00:00', '21:00:00'),
       (21, 'Tối', '21:00:00', '05:00:00'),
       (22, 'Sáng', '06:00:00', '14:00:00'),
       (23, 'Chiều', '14:00:00', '22:00:00'),
       (24, 'Tối', '22:00:00', '06:00:00'),
       (25, 'Sáng', '08:30:00', '16:30:00'),
       (26, 'Chiều', '16:30:00', '00:30:00'),
       (27, 'Tối', '00:30:00', '08:30:00'),
       (28, 'Sáng', '07:00:00', '15:00:00'),
       (29, 'Chiều', '15:00:00', '23:00:00'),
       (30, 'Tối', '23:00:00', '07:00:00'),
       (31, 'Sáng', '06:15:00', '14:15:00'),
       (32, 'Chiều', '14:15:00', '22:15:00'),
       (33, 'Tối', '22:15:00', '06:15:00');

INSERT INTO EmployeeShifts (AssignmentID, EmployeeID, ShiftID, WorkDate)
VALUES (1, 3, 1, '2024-12-01'),
       (2, 5, 2, '2024-12-01'),
       (3, 7, 3, '2024-12-01'),
       (4, 2, 4, '2024-12-02'),
       (5, 6, 5, '2024-12-02'),
       (6, 8, 6, '2024-12-02'),
       (7, 10, 7, '2024-12-03'),
       (8, 9, 8, '2024-12-03'),
       (9, 4, 9, '2024-12-03'),
       (10, 1, 10, '2024-12-04'),
       (11, 12, 11, '2024-12-04'),
       (12, 15, 12, '2024-12-04'),
       (13, 14, 13, '2024-12-05'),
       (14, 16, 14, '2024-12-05'),
       (15, 18, 15, '2024-12-05'),
       (16, 17, 16, '2024-12-06'),
       (17, 13, 17, '2024-12-06'),
       (18, 11, 18, '2024-12-06'),
       (19, 19, 19, '2024-12-07'),
       (20, 20, 20, '2024-12-07'),
       (21, 22, 21, '2024-12-08'),
       (22, 23, 22, '2024-12-08'),
       (23, 25, 23, '2024-12-08'),
       (24, 24, 24, '2024-12-09'),
       (25, 27, 25, '2024-12-09'),
       (26, 29, 26, '2024-12-09'),
       (27, 28, 27, '2024-12-10'),
       (28, 30, 28, '2024-12-10'),
       (29, 21, 29, '2024-12-10'),
       (30, 26, 30, '2024-12-11'),
       (31, 9, 31, '2024-12-11'),
       (32, 7, 32, '2024-12-11'),
       (33, 4, 1, '2024-12-12'),
       (34, 5, 2, '2024-12-12'),
       (35, 6, 3, '2024-12-12'),
       (36, 10, 4, '2024-12-13'),
       (37, 12, 5, '2024-12-13'),
       (38, 13, 6, '2024-12-13'),
       (39, 15, 7, '2024-12-14'),
       (40, 14, 8, '2024-12-14');

INSERT INTO menu (MenuID, Name, Category, Price)
VALUES (1, 'Hồng Trà Chanh', 'Trà', 35000),
       (2, 'Hồng Trà Đào', 'Trà', 60000),
       (3, 'Trà Vải Lài', 'Trà', 60000),
       (4, 'Trà Nhãn Sen', 'Trà', 60000),
       (5, 'Trà Nhãn Lài', 'Trà', 60000),
       (6, 'Trà Lài Đác Thơm', 'Trà', 60000),
       (7, 'Trà Lucky Tea', 'Trà', 60000),
       (8, 'Trà Ô Long Dâu', 'Trà', 65000),
       (9, 'Trà Lài Mãng Cầu Thạch Dừa Sợi', 'Trà', 60000),
       (10, 'Trà Bá Tước Lựu Đỏ', 'Trà', 65000),
       (11, 'Trà Ô Long Lài Bưởi', 'Trà', 60000),
       (12, 'Trà Lài Phúc Bồn Tử Thạch Dừa Sợi', 'Trà', 65000),
       (13, 'Trà Sữa Phúc Long', 'Trà sữa', 55000),
       (14, 'Trà Sữa Ô Long', 'Trà sữa', 55000),
       (15, 'Trà Sữa Ô Long Bách Hoa', 'Trà sữa', 65000),
       (16, 'Trà Sữa Ô Long Quế Hoa', 'Trà sữa', 55000),
       (17, 'Trà Sữa Socola', 'Trà sữa', 50000),
       (18, 'Hồng Trà Sữa', 'Trà sữa', 50000),
       (19, 'Trà Sữa Matcha', 'Trà sữa', 55000),
       (20, 'Trà Sữa Lài', 'Trà sữa', 50000),
       (21, 'Trà Sữa Bá Tước', 'Trà sữa', 55000),
       (22, 'Trà Sữa Ô Long Lài Thạch Konjac', 'Trà sữa', 55000),
       (23, 'Trà Sữa Nhãn Sen', 'Trà sữa', 55000),
       (24, 'Trà Phúc Long Kem Silky', 'Kem Silky', 55000),
       (25, 'Trà Ô Long Kem Silky', 'Kem Silky', 55000),
       (26, 'Hồng Trà Kem Silky', 'Kem Silky', 55000),
       (27, 'Trà Lài Kem Silky', 'Kem Silky', 55000),
       (28, 'Trà Ô Long Quế Hoa Kem Silky', 'Kem Silky', 55000),
       (29, 'Cà Phê Sữa Kem Silky', 'Kem Silky', 55000),
       (30, 'Cà Phê Đen Đá', 'Cà phê', 30000),
       (31, 'Cà phê Cappuccino', 'Cà phê', 55000),
       (32, 'Cà Phê Sữa Kem Silky', 'Cà phê', 55000),
       (33, 'Cà Phê Sữa Đá', 'Cà phê', 35000),
       (34, 'Cà phê Latte', 'Cà phê', 50000),
       (35, 'Chanh Đá Xay', 'Đá xay', 45000),
       (36, 'Đá xay Matcha', 'Đá xay', 55000),
       (37, 'Cappuccino Đá Xay', 'Đá xay', 55000),
       (38, 'Hồng Trà Đác Cam Đá Xay', 'Đá xay', 70000),
       (39, 'Sữa Chua Xoài Đác Thơm', 'Đá xay', 70000),
       (40, 'Sữa Chua Phúc Bồn Tử Đác Cam', 'Đá xay', 70000),
       (41, 'Trà Yuza Cúc Hoa (L)', 'Trà - BST Kim Cúc Mộc Tê', 65000),
       (42, 'Trà Yuza Ô long Bách Hoa (L)', 'Trà - BST Kim Cúc Mộc Tê', 65000),
       (43, 'Trà Sữa Ô long Bách Hoa (L)', 'Trà sữa - BST Kim Cúc Mộc Tê', 65000),
       (44, 'Trà Ô Long Dâu (L)', 'Trà - BST Tearamisu', 65000),
       (45, 'Cà phê Tearamisu (L)', 'Cà phê - BST Tearamisu', 65000),
       (46, 'Trà Tearamisu (L)', 'Trà - BST Tearamisu', 65000);

INSERT INTO Customers (CustomerID, FullName, PhoneNumber, LoyaltyPoints)
VALUES (1, 'Nguyễn Văn A', '0987654321', 150),
       (2, 'Trần Thị B', '0912345678', 200),
       (3, 'Lê Quang C', '0908765432', 50),
       (4, 'Phan Thị D', '0922334455', 300),
       (5, 'Vũ Minh E', '0933445566', 120),
       (6, 'Hoàng Văn F', '0944556677', 180),
       (7, 'Nguyễn Thị G', '0955667788', 70),
       (8, 'Bùi Hữu H', '0966778899', 250),
       (9, 'Lý Phương I', '0977889900', 10),
       (10, 'Đỗ Thị J', '0988990011', 500),
       (11, 'Trần Quang K', '0911234567', 60),
       (12, 'Vũ Thi L', '0922345678', 90),
       (13, 'Hoàng Quốc M', '0933456789', 400),
       (14, 'Nguyễn Thanh N', '0944567890', 30),
       (15, 'Bùi Thi O', '0955678901', 100),
       (16, 'Lê Quang P', '0966789012', 150),
       (17, 'Phan Hồng Q', '0977890123', 200),
       (18, 'Nguyễn Thi R', '0988901234', 220),
       (19, 'Trần Thi S', '0999012345', 130),
       (20, 'Vũ Minh T', '0902345678', 80),
       (21, 'Lý Thanh U', '0913456789', 60),
       (22, 'Hoàng Thi V', '0924567890', 110),
       (23, 'Nguyễn Thi W', '0935678901', 190),
       (24, 'Trần Hữu X', '0946789012', 260),
       (25, 'Bùi Minh Y', '0957890123', 140),
       (26, 'Lê Hữu Z', '0968901234', 70),
       (27, 'Phan Quốc AA', '0979012345', 300),
       (28, 'Nguyễn Thi BB', '0980123456', 160),
       (29, 'Trần Minh CC', '0991234567', 50),
       (30, 'Vũ Quang DD', '0905678901', 210);


INSERT INTO Orders (OrderID, CustomerID, EmployeeID, BranchID, OrderDate, TotalAmount, Status)
VALUES (1, 1, 3, 2, '2024-12-01 08:30:00', 150000, 'Đã hoàn thành'),
       (2, 2, 5, 3, '2024-12-01 09:15:00', 200000, 'Chờ xử lý'),
       (3, 3, 4, 1, '2024-12-01 10:00:00', 120000, 'Đã hoàn thành'),
       (4, 4, 7, 5, '2024-12-02 11:00:00', 180000, 'Chờ xử lý'),
       (5, 5, 6, 4, '2024-12-02 12:30:00', 250000, 'Đã hoàn thành'),
       (6, 6, 8, 2, '2024-12-03 13:00:00', 220000, 'Đã hoàn thành'),
       (7, 7, 2, 3, '2024-12-03 14:45:00', 140000, 'Đã hoàn thành'),
       (8, 8, 3, 1, '2024-12-04 08:00:00', 170000, 'Chờ xử lý'),
       (9, 9, 5, 4, '2024-12-04 09:30:00', 160000, 'Đã hoàn thành'),
       (10, 10, 4, 5, '2024-12-05 10:00:00', 200000, 'Chờ xử lý'),
       (11, 11, 7, 2, '2024-12-05 11:45:00', 250000, 'Đã hoàn thành'),
       (12, 12, 6, 3, '2024-12-06 13:15:00', 210000, 'Chờ xử lý'),
       (13, 13, 8, 1, '2024-12-06 14:00:00', 230000, 'Đã hoàn thành'),
       (14, 14, 3, 4, '2024-12-07 08:30:00', 190000, 'Chờ xử lý'),
       (15, 15, 5, 2, '2024-12-07 09:45:00', 220000, 'Đã hoàn thành'),
       (16, 16, 4, 5, '2024-12-08 10:00:00', 250000, 'Chờ xử lý'),
       (17, 17, 7, 1, '2024-12-08 11:15:00', 180000, 'Đã hoàn thành'),
       (18, 18, 8, 3, '2024-12-09 08:30:00', 210000, 'Đã hoàn thành'),
       (19, 19, 2, 4, '2024-12-09 09:45:00', 230000, 'Chờ xử lý'),
       (20, 20, 3, 5, '2024-12-10 10:15:00', 200000, 'Đã hoàn thành'),
       (21, 21, 6, 1, '2024-12-10 11:30:00', 250000, 'Chờ xử lý'),
       (22, 22, 7, 2, '2024-12-11 08:45:00', 190000, 'Đã hoàn thành'),
       (23, 23, 5, 3, '2024-12-11 09:00:00', 160000, 'Chờ xử lý'),
       (24, 24, 4, 4, '2024-12-12 10:15:00', 220000, 'Đã hoàn thành'),
       (25, 25, 8, 5, '2024-12-12 11:30:00', 240000, 'Chờ xử lý');

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES (1, 1, 5, 2, 70000),    -- Trà xanh Thái Nguyên (2 x 35,000)
       (2, 1, 10, 1, 65000),   -- Cacao đá xay (1 x 65,000)
       (3, 2, 13, 3, 120000),  -- Hồng trà sữa (3 x 40,000)
       (4, 3, 7, 2, 60000),    -- Cà phê sữa đá (2 x 30,000)
       (5, 3, 24, 1, 55000),   -- Trà xoài nhiệt đới (1 x 55,000)
       (6, 4, 14, 2, 110000),  -- Trà Tân Cương Mận Đỏ (2 x 55,000)
       (7, 5, 11, 2, 100000),  -- Trà đào (2 x 50,000)
       (8, 5, 6, 1, 45000),    -- Lục trà sữa Tân Cương (1 x 45,000)
       (9, 6, 19, 3, 120000),  -- Cà phê Americano (3 x 40,000)
       (10, 6, 17, 1, 60000),  -- Sinh tố dâu (1 x 60,000)
       (11, 7, 12, 2, 60000),  -- Hồng trà (2 x 30,000)
       (12, 7, 23, 1, 55000),  -- Trà ổi hồng (1 x 55,000)
       (13, 8, 18, 2, 110000), -- Trà sữa trân châu đường đen (2 x 55,000)
       (14, 8, 10, 1, 65000),  -- Cacao đá xay (1 x 65,000)
       (15, 9, 15, 3, 150000), -- Chanh tuyết (3 x 50,000)
       (16, 9, 25, 2, 80000),  -- Soda chanh (2 x 40,000)
       (17, 10, 20, 2, 90000), -- Latte (2 x 45,000)
       (18, 10, 3, 1, 55000),  -- Trà Bưởi Ô Long Lài (1 x 55,000)
       (19, 11, 5, 2, 70000),  -- Trà xanh Thái Nguyên (2 x 35,000)
       (20, 12, 30, 1, 60000), -- Sinh tố việt quất (1 x 60,000)
       (21, 13, 1, 2, 90000),  -- Trà sữa Phúc Long (2 x 45,000)
       (22, 14, 4, 1, 60000),  -- Silky Bưởi Ô Long Lài (1 x 60,000)
       (23, 15, 2, 3, 120000), -- Trà Ô Long Lài (3 x 40,000)
       (24, 16, 8, 2, 50000),  -- Cà phê đen (2 x 25,000)
       (25, 16, 24, 1, 55000); -- Trà vải (1 x 55,000)

INSERT INTO Ingredients (IngredientID, Name, Unit, PricePerUnit)
VALUES (1, 'Trà Ô Long', 'gram', 20000.00),
       (2, 'Trà Xanh', 'gram', 15000.00),
       (3, 'Trà Đào', 'gram', 18000.00),
       (4, 'Sữa', 'ml', 10000.00),
       (5, 'Đường', 'gram', 5000.00),
       (6, 'Bột Matcha', 'gram', 25000.00),
       (7, 'Cà Phê', 'gram', 20000.00),
       (8, 'Kem Silky', 'ml', 30000.00),
       (9, 'Sữa Đặc', 'ml', 12000.00),
       (10, 'Đá viên', 'kg', 5000.00),
       (11, 'Cacao', 'gram', 15000.00),
       (12, 'Nhãn Sen', 'gram', 35000.00),
       (13, 'Trái cây tươi', 'kg', 20000.00),
       (14, 'Thạch Konjac', 'gram', 10000.00),
       (15, 'Topping Trân Châu', 'gram', 15000.00),
       (16, 'Hạt chia', 'gram', 20000.00),
       (17, 'Bột Dừa', 'gram', 18000.00),
       (18, 'Si-rô dâu', 'ml', 12000.00),
       (19, 'Si-rô chanh', 'ml', 10000.00),
       (20, 'Nước ép trái cây', 'ml', 15000.00),
       (21, 'Mứt vải', 'gram', 22000.00),
       (22, 'Sữa Hạnh Nhân', 'ml', 15000.00),
       (23, 'Si-rô Bạc Hà', 'ml', 10000.00),
       (24, 'Nước cốt Chanh', 'ml', 8000.00),
       (25, 'Nước Cam', 'ml', 12000.00),
       (26, 'Nước Cà Chua', 'ml', 10000.00),
       (27, 'Thạch trái cây', 'gram', 15000.00),
       (28, 'Nước Chanh Leo', 'ml', 15000.00),
       (29, 'Siro Vải', 'ml', 12000.00),
       (30, 'Hạt lúa mạch', 'gram', 18000.00),
       (31, 'Bột lúa mì', 'gram', 25000.00),
       (32, 'Nước Dừa', 'ml', 20000.00),
       (33, 'Trà Hồng', 'gram', 17000.00),
       (34, 'Si-rô Mận', 'ml', 13000.00),
       (35, 'Si-rô Kiwi', 'ml', 13000.00),
       (36, 'Trái Bơ', 'kg', 40000.00),
       (37, 'Thạch Dừa', 'gram', 10000.00),
       (38, 'Trái Dâu', 'kg', 25000.00),
       (39, 'Dứa', 'kg', 20000.00),
       (40, 'Trà Gạo Lứt', 'gram', 18000.00),
       (41, 'Nước Bưởi', 'ml', 15000.00),
       (42, 'Cacao Đá Xay', 'gram', 20000.00),
       (43, 'Chanh', 'kg', 15000.00),
       (44, 'Dưa Hấu', 'kg', 30000.00),
       (45, 'Quả Nho', 'kg', 35000.00),
       (46, 'Nước Nhãn', 'ml', 12000.00),
       (47, 'Trà Bưởi', 'gram', 18000.00),
       (48, 'Chanh Dây', 'kg', 25000.00),
       (49, 'Dưa Lưới', 'kg', 35000.00),
       (50, 'Thạch Nhựa', 'gram', 12000.00);

INSERT INTO BranchIngredients (BranchIngredientID, BranchID, IngredientID, LastUpdated)
VALUES (1, 3, 2, '2024-12-01 10:00:00'),    -- Trà Xanh (sắp hết do tiêu thụ nhanh)
       (2, 1, 4, '2024-12-01 10:00:00'),    -- Sữa (tiêu thụ nhanh)
       (3, 7, 1, '2024-12-01 10:00:00'),    -- Trà Ô Long (được sử dụng thường xuyên)
       (4, 8, 19, '2024-12-01 10:00:00'),    -- Si-rô chanh (dễ cạn kiệt)
       (5, 4, 12, '2024-12-01 10:00:00'),    -- Nhãn Sen (nguyên liệu tươi, dễ hỏng)
       (6, 5, 15, '2024-12-01 10:00:00'),    -- Topping Trân Châu (dễ hết)
       (7, 6, 5, '2024-12-01 10:00:00'),    -- Đường (có thể hết nhanh do nhu cầu cao)
       (8, 10, 7, '2024-12-01 10:00:00'),    -- Cà Phê (nguyên liệu tiêu thụ nhanh)
       (9, 3, 14, '2024-12-01 10:00:00'),    -- Thạch Konjac (tiêu thụ ít nhưng quan trọng)
       (10, 9, 6, '2024-12-01 10:00:00'),    -- Bột Matcha (có thể hết do sử dụng trong nhiều món)
       (11, 12, 3, '2024-12-01 10:00:00'),   -- Trà Đào (hết nhanh trong các món trà)
       (12, 15, 18, '2024-12-01 10:00:00'),   -- Si-rô dâu (được sử dụng phổ biến)
       (13, 13, 25, '2024-12-01 10:00:00'),   -- Nước Cam (dễ tiêu thụ)
       (14, 2, 11, '2024-12-01 10:00:00'),    -- Cacao (hết nhanh trong các đồ uống)
       (15, 20, 17, '2024-12-01 10:00:00'),   -- Bột Dừa (hết nhanh trong các món mới)
       (16, 17, 20, '2024-12-01 10:00:00'),   -- Nước ép trái cây (tiêu thụ nhanh)
       (17, 11, 8, '2024-12-01 10:00:00'),    -- Kem Silky (dễ hết)
       (18, 16, 10, '2024-12-01 10:00:00'),  -- Đá viên (cần theo dõi số lượng)
       (19, 14, 16, '2024-12-01 10:00:00'),   -- Hạt chia (dùng nhiều trong nhiều món)
       (20, 18, 4, '2024-12-01 10:00:00');    -- Sữa (hết nhanh trong các đồ uống)


INSERT INTO MemberRewardsBirthDay (CustomerID, MembershipLevel, Points, RegisteredDate, RewardDescription, ExpiryDate)
VALUES
    (1, 'Vàng', 300, '2024-01-01', 'Quà tặng Voucher 100k', '2024-01-31'), -- Vàng
    (12, 'Bạc', 150, '2024-02-15', 'Quà tặng Trà Ô Long miễn phí', '2024-02-29'), -- Bạc
    (2, 'Kim Cương', 500, '2024-03-10', 'Quà tặng Set Trà Phúc Long cao cấp', '2024-03-31'), -- Kim Cương
    (6, 'Vàng', 350, '2024-04-05', 'Quà tặng Thẻ giảm giá 30%', '2024-04-30'), -- Vàng
    (9, 'Bạc', 120, '2024-05-12', 'Quà tặng Trà Xanh miễn phí', '2024-05-31'), -- Bạc
    (30, 'Kim Cương', 700, '2024-06-18', 'Quà tặng Set Trà Phúc Long + Thẻ quà tặng 200k', '2024-06-30'), -- Kim Cương
    (7, 'Vàng', 200, '2024-07-25', 'Quà tặng 1 phần Topping Trân Châu', '2024-07-31'), -- Vàng
    (11, 'Bạc', 100, '2024-08-30', 'Quà tặng Nước Ép Trái Cây miễn phí', '2024-08-31'), -- Bạc
    (3, 'Kim Cương', 600, '2024-09-15', 'Quà tặng Thẻ quà tặng 200k', '2024-09-30'), -- Kim Cương
    (10, 'Vàng', 250, '2024-10-10', 'Quà tặng Bột Matcha miễn phí', '2024-10-31'); -- Vàng
