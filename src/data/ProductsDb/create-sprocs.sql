-- =================================================================================
-- Script Name: create-sprocs.sql
-- Purpose: Contains stored procedures for managing the database.
--          Includes procedures for updating inventory quantities.
-- =================================================================================

-- =================================================================================
-- Stored Procedure: UpdateInventory
-- Description:
--   Updates the inventory quantity for a product at a specific location.
--   If the product, location, or inventory item does not exist, the update
--   is aborted to avoid unintended side effects.
--
-- Inputs:
--   @ProductName      NVARCHAR(255) - Name of the product to update.
--   @SerialNumber     NVARCHAR(100) - Optional serial number of the inventory item.
--   @QuantityChange   INT           - The quantity to add or subtract from inventory.
--   @Location         NVARCHAR(255) - The location of the inventory item.
--   @UpdateDate       DATETIME      - The date of the inventory update.
--
-- Behavior:
--   - Checks if the product exists. If not, aborts the procedure.
--   - Checks if the inventory item exists for the product and location. If not, aborts.
--   - Updates the inventory quantity for the existing inventory item.
--   - Logs messages for success or reasons for aborting.
-- =================================================================================
CREATE PROCEDURE dbo.UpdateInventory
    @ProductName NVARCHAR(255),
    @SerialNumber NVARCHAR(100),
    @QuantityChange INT,
    @Location NVARCHAR(255),
    @UpdateDate DATETIME
AS
BEGIN
    -- Declare variables
    DECLARE @ProductID INT;
    DECLARE @InventoryItemID INT;
    DECLARE @Status NVARCHAR(50);
    DECLARE @Message NVARCHAR(4000);

    -- Check if the product exists
    SELECT @ProductID = ProductID
    FROM dbo.Product
    WHERE ProductName = @ProductName;

    IF @ProductID IS NULL
    BEGIN
        -- If product does not exist, set error message
        SET @Status = 'Failure';
        SET @Message = 'Product does not exist. Update aborted.';

        SELECT @Status as Status, @Message as Message
        FOR XML RAW, ELEMENTS;
        RETURN;
    END

    -- Check if the inventory item exists for the given product and location
    SELECT @InventoryItemID = InventoryItemID
    FROM dbo.InventoryItem
    WHERE ProductID = @ProductID 
      AND Location = @Location
      AND (SerialNumber = @SerialNumber OR @SerialNumber IS NULL);

    IF @InventoryItemID IS NULL
    BEGIN
        -- If inventory item does not exist, set error message
        SET @Status = 'Failure';
        SET @Message = 'Inventory item does not exist. Update aborted.';

        SELECT @Status as Status, @Message as Message
        FOR XML RAW, ELEMENTS;
        RETURN;
    END

    -- Update inventory quantity
    UPDATE dbo.InventoryItem
    SET QuantityOnHand = QuantityOnHand + @QuantityChange
    WHERE InventoryItemID = @InventoryItemID;

    -- Return success message
    SET @Status = 'Success';
    SET @Message = 'Inventory updated successfully';
    SELECT @Status as Status, @Message as Message
    FOR XML RAW, ELEMENTS;
END;
GO