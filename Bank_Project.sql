Select * From [dbo].[Bank_Loan_Data];

Select COUNT(id)as Total_Loan_Applications From Bank_Loan_Data ;

Select COUNT(id)as MTD_Total_Loan_Applications From Bank_Loan_Data 
Where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

Select COUNT(id)as PMTD_Total_Loan_Applications From Bank_Loan_Data 
Where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

Select SUM(Loan_amount) as Total_Funded_Amount From [dbo].[Bank_Loan_Data];

Select SUM(Loan_amount) as MTD_Total_Funded_Amuont From [dbo].[Bank_Loan_Data]
Where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

Select SUM(Loan_amount) as PMTD_Total_Funded_Amuont From [dbo].[Bank_Loan_Data]
Where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

Select SUM(Total_Payment)as Total_Amount_Received From [dbo].[Bank_Loan_Data];

Select SUM(Total_Payment)as MTD_Total_Amount_Received From [dbo].[Bank_Loan_Data]
Where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

Select SUM(Total_Payment)as PMTD_Total_Amount_Received From [dbo].[Bank_Loan_Data]
Where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

Select Round(AVG(int_rate), 4) *100 as Avg_Interest_Rate From [dbo].[Bank_Loan_Data];

Select Round(AVG(int_rate), 4) *100 as MTD_Avg_Interest_Rate From [dbo].[Bank_Loan_Data]
Where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

Select Round(AVG(int_rate), 4) *100 as PMTD_Avg_Interest_Rate From [dbo].[Bank_Loan_Data]
Where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

Select Round(AVG(dti), 4) *100 AS AVG_DTI From [dbo].[Bank_Loan_Data];

Select Round(AVG(dti), 4) *100 AS MTD_AVG_DTI From [dbo].[Bank_Loan_Data]
Where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

Select Round(AVG(dti), 4) *100 AS PMTD_AVG_DTI From [dbo].[Bank_Loan_Data]
Where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

Select Loan_status From [dbo].[Bank_Loan_Data];

Select 
	(COUNT(case when loan_status = 'Fully Paid' OR loan_status = 'Current' Then id End)*100)
	/
	COUNT(id) as Good_Loan_Percentage
From Bank_Loan_Data;

Select COUNT(id) as Good_Loan_Applications From Bank_Loan_Data
Where loan_status = 'Fully Paid' or loan_status = 'Current';

Select SUM(loan_amount) as Good_Loan_Funded_Amount From Bank_Loan_Data
Where loan_status = 'Fully Paid' or loan_status = 'Current';

Select SUM(total_payment) as Good_Loan_Received_Amount From Bank_Loan_Data
Where loan_status = 'Fully Paid' or loan_status = 'Current';

Select 
	Round((Count(Case When Loan_status = 'Charged Off' Then id End) * 100), 4)
	/
	Count(id) as Bad_Loan_Percentage
From BanK_Loan_Data;

Select Count(id) as Bad_Loan_Appications
From [dbo].[Bank_Loan_Data]
Where loan_status = 'Charged Off';

Select SUM(loan_amount) as Bad_Loan_Funded_Amount
From [dbo].[Bank_Loan_Data]
Where loan_status = 'Charged Off';

Select SUM(total_payment) as Bad_Loan_Received_Amount
From [dbo].[Bank_Loan_Data]
Where loan_status = 'Charged Off';

Select loan_status,
		Count(id) as Total_Loan_Applications,
		SUM(Total_payment) as Total_Amount_Received,
		SUM(Loan_amount) as Total_Funded_Amount,
		Round(AVG(int_rate *100), 2) as Interest_Rate,
		Round(AVG(dti *100), 2) as DTI
From Bank_Loan_Data
Group by loan_status;

Select loan_status,
		SUM(Total_payment) as MTD_Total_Amount_Received,
		SUM(Loan_amount) as MTD_Total_Funded_Amount
From Bank_Loan_Data
Where MONTH(Issue_date) = 12
Group by loan_status;

Select MONTH(issue_date) as Month_Number,
		DATENAME(Month, issue_date) as Month_Name,
		Count(id) as Total_Loan_Applications,
		SUM(Loan_amount) as Total_Funded_Amount,
		SUM(Total_Payment) as Total_Received_Amount
From Bank_Loan_Data
Group By MONTH(issue_date), DATENAME(Month, issue_date)
Order By MONTH(issue_date);

Select Address_state,
		Count(id) as Total_Loan_Applications,
		SUM(Loan_amount) as Total_Funded_Amount,
		SUM(Total_Payment) as Total_Received_Amount
From Bank_Loan_Data
Group By Address_state
Order By Count(id);

Select term,
		Count(id) as Total_Loan_Applications,
		SUM(Loan_amount) as Total_Funded_Amount,
		SUM(Total_Payment) as Total_Received_Amount
From Bank_Loan_Data
Group By term
Order By term;

Select emp_length,
		Count(id) as Total_Loan_Applications,
		SUM(Loan_amount) as Total_Funded_Amount,
		SUM(Total_Payment) as Total_Received_Amount
From Bank_Loan_Data
Group By emp_length
Order By emp_length;

Select purpose,
		Count(id) as Total_Loan_Applications,
		SUM(Loan_amount) as Total_Funded_Amount,
		SUM(Total_Payment) as Total_Received_Amount
From Bank_Loan_Data
Group By purpose
Order By purpose;

Select home_ownership,
		Count(id) as Total_Loan_Applications,
		SUM(Loan_amount) as Total_Funded_Amount,
		SUM(Total_Payment) as Total_Received_Amount
From Bank_Loan_Data
Group By home_ownership
Order By home_ownership;

