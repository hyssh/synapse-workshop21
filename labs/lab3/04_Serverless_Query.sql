SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://mtcssynapseworkshop.dfs.core.windows.net/sampledataset/nyctaxi/NYCTripSmall.parquet',
        FORMAT='PARQUET'
    ) AS [result]


-- Use MASTER
CREATE DATABASE hysshDB 
                COLLATE Latin1_General_100_BIN2_UTF8


-- Use your (LOGICAL) database
CREATE EXTERNAL DATA SOURCE nyctaxi
WITH ( LOCATION = 'https://mtcssynapseworkshop.dfs.core.windows.net')


CREATE EXTERNAL FILE FORMAT ParquetFormat WITH (  FORMAT_TYPE = PARQUET );


SELECT
    TOP 100 *
FROM
    OPENROWSET(
            BULK '/sampledataset/nyctaxi/NYCTripSmall.parquet',
            DATA_SOURCE = 'nyctaxi',
            FORMAT='PARQUET'
    ) AS [result]


CREATE EXTERNAL TABLE Taxi (
 	 [DateID] int,
 	 [MedallionID] int,
 	 [HackneyLicenseID] int,
 	 [PickupTimeID] int,
 	 [DropoffTimeID] int,
 	 [PickupGeographyID] int,
 	 [DropoffGeographyID] int,
 	 [PickupLatitude] float,
 	 [PickupLongitude] float,
 	 [PickupLatLong] nvarchar(4000),
 	 [DropoffLatitude] float,
 	 [DropoffLongitude] float,
 	 [DropoffLatLong] nvarchar(4000),
 	 [PassengerCount] int,
 	 [TripDurationSeconds] int,
 	 [TripDistanceMiles] float,
 	 [PaymentType] nvarchar(4000),
 	 [FareAmount] numeric(19,4),
 	 [SurchargeAmount] numeric(19,4),
 	 [TaxAmount] numeric(19,4),
 	 [TipAmount] numeric(19,4),
 	 [TollsAmount] numeric(19,4),
 	 [TotalAmount] numeric(19,4)
) WITH (
         LOCATION = '/sampledataset/nyctaxi/*.parquet',
         DATA_SOURCE = nyctaxi,
         FILE_FORMAT =  ParquetFormat
);
