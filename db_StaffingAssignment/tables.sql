--Primary key name needs to be changed in all the tables

create table [Address](
	AddressId int identity(1,1) primary key not null,
	Province nvarchar(50) not null,
	District nvarchar(50) not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null
)
ALTER TABLE [Address]
ADD CONSTRAINT UkAddressProvinceDistrict UNIQUE (Province,District)


create table ContactInformation(
	ContactInformationId int identity(1,1) primary key not null,
	Email nvarchar(100) not null,
	Phone varchar(15) not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null
)
ALTER TABLE [ContactInformation]
ADD CONSTRAINT UkContactInformationEmail UNIQUE (Email)
ALTER TABLE [ContactInformation]
ADD CONSTRAINT UkContactInformationPhone UNIQUE (Phone)

create table Person(
	PersonId int identity(1,1) primary key not null,
	FirstName nvarchar(50) not null,
	MiddleName nvarchar(50) ,
	LastName nvarchar(50) not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null
)

create table PersonContactInformation(
	PersonContactInformationId int identity(1,1) primary key not null,
	PersonId int not null,
	ContactInformationId int  not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null,
	constraint FkPersonContactInformationPersonPersonId foreign key (PersonId)
	references dbo.Person(PersonId),
	constraint FkPersonContactInformationContactInformationContactInformationId foreign key (ContactInformationId)
	references dbo.ContactInformation(ContactInformationId)
)

create table PersonAddress(
	PersonAddressId int identity(1,1) primary key not null,
	PersonId int not null,
	AddressId int not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null,
	constraint FkPersonAddressPersonPersonId foreign key (PersonId)
	references dbo.Person(PersonId),
	constraint FkPersonAddressAddressAddressId foreign key (AddressId)
	references dbo.Address(AddressId)
)


create table Organization(
	OrganizationId int identity(1,1) primary key not null,
	OrganizationName nvarchar(100) not null,
	OrganizationCategory nvarchar(50) not null,
	OrganizationDescription nvarchar(1000) not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null
)

create table OrganizationAddress(
	OrganizatonAddressId int identity(1,1) primary key not null,
	OrganizationId int not null,
	AddressId int not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null,
	constraint FkOrganizationAddressOrganizationOrganizationId foreign key (OrganizationId)
	references dbo.Organization(OrganizationId),
	constraint FkOrganizationAddressAddressAddressId foreign key (AddressId)
	references dbo.[Address](AddressId)
)


create table OrganizationContactInformation(
	OrganizationContactInformationId int identity(1,1) primary key not null,
	OrganizationId int not null,
	ContactInformationId int not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null,
	constraint FkOrganizationContactInformationOrganizationOrganizationId foreign key (OrganizationId)
	references dbo.Organization(OrganizationId),
	constraint FkOrganizationContactInformationContactInformationContactInformationId foreign key (ContactInformationId)
	references dbo.ContactInformation(ContactInformationId)
)


create table Employee(
	EmployeeId int identity(1,1) primary key not null,
	PersonId int not null,
	OrganizationId int not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate(),
	constraint FkEmployeePersonPersonId foreign key (PersonId)
	references dbo.Person(PersonId),
	constraint FkEmployeeOrganizationOrganizationId foreign key (OrganizationId)
	references dbo.Organization(OrganizationId)
)
create table Customer(
	CustomerId int identity(1,1) primary key not null,
	OrganizationId int foreign key references dbo.Organization(OrganizationId) not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate()
)

create table Job(
	JobId int identity(1,1) primary key not null,
	OrganizationId int not null,
	JobTitle nvarchar(50) not null,
	PayPerHour money not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null,
	constraint FkJobOrganizationOrganizationId foreign key(OrganizationId)
	references dbo.Organization(OrganizationId)
)

create table Assignment(
	AssignmentId int identity(1,1) not null,
	EmployeeId int not null,
	JobId int not null,
	[Status] int not null,
	Startdate smalldatetime not null,
	EndDate smalldatetime not null,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null,
	constraint PkAssignmentAssignmentId primary key (AssignmentId),
	constraint FkAssignmentEmployeeEmployeeId foreign key (EmployeeId)
	references dbo.Employee(EmployeeId),
	constraint FkAssignmentJobJobId foreign key (JobId)
	references dbo.Job(JobId)
)

create table [Transaction] (
	TransactionId int identity(1,1) primary key not null,
	AssignmentId int not null,
	WorkHours int not null,
	PayPerHour money not null,
	Amount money not null,
	InvoiceId int,
	InsertPersonId int not null,
	InsertDate smalldatetime default getdate() not null
	constraint FkTransactionAssignmentAssignmentId foreign key (AssignmentId)
	references dbo.Assignment(AssignmentId)
)

create table Invoice(
	InvoiceId int identity(1,1) primary key not null,
	TransactionId int not null,
	Amount money not null,
	InsertPersonId int null,
	InsertDate smalldatetime default getdate() not null,
	constraint FkInvoiceTransactionTransactionId foreign key (TransactionId)
	references dbo.[Transaction](TransactionId)
)