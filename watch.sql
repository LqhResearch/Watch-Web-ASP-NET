CREATE DATABASE Watch
GO

USE Watch
GO

CREATE TABLE Permission
(
	PermissionID INT IDENTITY(1,1) PRIMARY KEY,
	PermissionName NVARCHAR(30)
)
GO

INSERT INTO Permission (PermissionName) VALUES 
(N'Quản trị viên'),
(N'Thành viên')
GO

CREATE TABLE Users
(
	Username NVARCHAR(30) NOT NULL PRIMARY KEY,
	Password VARCHAR(64),
	Fullname NVARCHAR(64),
	Email VARCHAR(32),
	PermissionID INT,

	FOREIGN KEY (PermissionID) REFERENCES Permission (PermissionID)
)
GO

INSERT INTO Users VALUES
(N'admin', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', N'Quản trị viên', 'dty@gmail.com', 1),
(N'user', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', N'Người dùng mới', 'user@gmail.com', 2)
GO

CREATE TABLE Trademark
(
	TrademarkID INT IDENTITY(1,1) PRIMARY KEY,
	TrademarkName NVARCHAR(255),
)
GO

INSERT INTO Trademark (TrademarkName) VALUES
(N'Wonlex'),
(N'Tag Heuer'),
(N'Casio')
GO

CREATE TABLE Product
(
	ProductID INT IDENTITY(1,1) PRIMARY KEY,
	ProductName NVARCHAR(255),
	Description NTEXT,
	Price INT,
	PercentSales INT,
	Thumbnail NVARCHAR(255),
	Color NVARCHAR(30),
	TrademarkID INT,

	FOREIGN KEY (TrademarkID) REFERENCES Trademark (TrademarkID)
)
GO

INSERT INTO Product (ProductName, Description, Price, PercentSales, Thumbnail, Color, TrademarkID) VALUES
(N'Đồng hồ định vị Wonlex GW400S', N'Chưa có', 899000, 0, '/assets/product/dong-ho-thong-minh-Gw400S.jpg', N'Xanh', 1),
(N'Đồng hồ Thụy Sỹ Tag Heuer', N'Một trong những chiếc đồng hồ Thụy Sỹ danh giá, Tag Heuer nổi tiếng với công nghệ chế tác đồng hồ thể thao cực đỉnh. Thương hiệu nhanh chóng đẩy tên tuổi của mình khi kết hợp với các giải thể thao uy tín, đua xe và nhà sản xuất đua xe. Không chỉ dừng lại với đồng hồ đeo tay cổ điển, đồng hồ thông minh (smartwatch) Tag Heuer cũng dần chiếm được thị phần của riêng mình. Nam giới yêu thích đồng hồ nam với thiết kế khỏe khoắn không thể bỏ qua dòng Formula One, Aquaracer hay Grand Carrera từ Tag Heuer.', 34000000, 0, '/assets/product/dong-ho-noi-tieng-the-gioi-tag-heuer.jpg', N'Đen', 2),
(N'Đồng hồ nam Longines Master', N'Đang cập nhật', 88464000, 15, '/assets/product/dong-ho-nam-longines-master.png', N'Trắng', 2),
(N'Đồng hồ Casio 51 mm Nam', N'Sở hữu đường kính mặt 51 mm cùng thiết kế màu xanh thanh lịch, trẻ trung cho các bạn nam yêu thích sự cá tính. Thời gian sử dụng pin thoải mái lên đến 10 năm.', 1579000, 15, '/assets/product/casio-120w-2avdf-nam.jpg', N'Đen', 3)
GO

CREATE TABLE Slider
(
	SliderID INT IDENTITY(1,1) PRIMARY KEY,
	SliderName NVARCHAR(255),
	Thumbnail NVARCHAR(255),
	Status BIT DEFAULT 1,
	Description NTEXT
)
GO

INSERT INTO Slider (SliderName, Thumbnail, Description) VALUES
(N'Đồng hồ TiTan', '/assets/slider/slider-1.jpg', N'Thời gian với sự hoàn hảo là phong cách trông thật phong cách'),
(N'Thứ sáu giảm giá', '/assets/slider/slider-2.jpg', N'Giảm giá thời trang vào tối thứ sáu'),
(N'Đồng hồ nam', '/assets/slider/slider-3.jpg', N'Đồng hồ tay thời trang độc quyền trường tồn dành cho nam giới'),
(N'Đồng hồ thông minh', '/assets/slider/slider-4.jpg', N'Bán đồng hồ thông minh độc quyền')
GO

CREATE TABLE Orders
(
	OrderID VARCHAR(12) PRIMARY KEY,
	TotalMoney INT,
	PaymentMoney INT,
	CreatedAt DATETIME DEFAULT GETDATE(),
	Username NVARCHAR(30),
	Status INT

	FOREIGN KEY (Username) REFERENCES Users (Username)
)
GO

CREATE TABLE OrderDetail
(
	OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
	OrderID VARCHAR(12),
	ProductID INT,
	Quantity INT

	FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
)
GO

CREATE TABLE Cart
(
	CartID INT IDENTITY(1,1) PRIMARY KEY,
	Username NVARCHAR(30),
	ProductID INT,
	Quantity INT,

	FOREIGN KEY (Username) REFERENCES Users (Username),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
)
GO

CREATE TABLE Comment
(
	CommentID INT IDENTITY(1,1) PRIMARY KEY,
	Username NVARCHAR(30),
	ProductID INT,
	Content TEXT,
	Star INT,

	FOREIGN KEY (Username) REFERENCES Users (Username),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
)
GO
