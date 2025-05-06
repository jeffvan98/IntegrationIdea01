-- Insert sample Products
INSERT INTO dbo.Product (ProductName, ProductDescription, ProductType)
VALUES 
('Steel Bolt 12mm', 'High-strength steel bolt, 12mm diameter.', 'Good'),
('Aluminum Sheet 1m x 2m', 'Industrial-grade aluminum sheet.', 'Good'),
('Plastic Cap 5cm', 'Protective plastic cap for tube ends.', 'Good'),
('Assembly Service', 'Labor service for product assembly.', 'Service');

-- Insert sample Price Components
INSERT INTO dbo.PriceComponent (ProductID, PriceAmount, CurrencyCode, EffectiveDate)
SELECT ProductID, 1.50, 'USD', GETDATE()
FROM dbo.Product WHERE ProductName = 'Steel Bolt 12mm'
UNION ALL
SELECT ProductID, 75.00, 'USD', GETDATE()
FROM dbo.Product WHERE ProductName = 'Aluminum Sheet 1m x 2m'
UNION ALL
SELECT ProductID, 0.25, 'USD', GETDATE()
FROM dbo.Product WHERE ProductName = 'Plastic Cap 5cm'
UNION ALL
SELECT ProductID, 50.00, 'USD', GETDATE()
FROM dbo.Product WHERE ProductName = 'Assembly Service';

-- Insert sample Supplier Products
INSERT INTO dbo.SupplierProduct (ProductID, SupplierName, AvailableFromDate)
SELECT ProductID, 'ACME Industrial Supplies', GETDATE()
FROM dbo.Product WHERE ProductName = 'Steel Bolt 12mm'
UNION ALL
SELECT ProductID, 'Global Metals Inc.', GETDATE()
FROM dbo.Product WHERE ProductName = 'Aluminum Sheet 1m x 2m'
UNION ALL
SELECT ProductID, 'PlastiTech Co.', GETDATE()
FROM dbo.Product WHERE ProductName = 'Plastic Cap 5cm';

-- Insert sample Inventory Items
INSERT INTO dbo.InventoryItem (ProductID, SerialNumber, InventoryStatus, QuantityOnHand, Location)
SELECT ProductID, 'SN-BOLT-0001', 'Available', 500, 'Warehouse A'
FROM dbo.Product WHERE ProductName = 'Steel Bolt 12mm'
UNION ALL
SELECT ProductID, 'SN-SHEET-0002', 'Available', 150, 'Warehouse B'
FROM dbo.Product WHERE ProductName = 'Aluminum Sheet 1m x 2m'
UNION ALL
SELECT ProductID, NULL, 'Available', 1000, 'Warehouse A'
FROM dbo.Product WHERE ProductName = 'Plastic Cap 5cm';
