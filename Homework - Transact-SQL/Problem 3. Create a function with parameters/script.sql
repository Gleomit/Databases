CREATE FUNCTION ufn_CalculateFutureSum(@sum money, @yearlyInterestRateInPercent money, @numberOfMonths int)
 RETURNS money
AS
	BEGIN
		DECLARE @monthlyInterestRate money
		SET @monthlyInterestRate = @yearlyInterestRateInPercent / 12
		RETURN @sum * (1 + @numberOfMonths * @monthlyInterestRate / 100)
	END
GO