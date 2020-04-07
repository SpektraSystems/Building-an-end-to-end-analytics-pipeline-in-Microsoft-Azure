CREATE USER [<AAD User ID>@msazurelabs.onmicrosoft.com] FROM EXTERNAL PROVIDER;
EXEC sp_addrolemember 'db_owner', '<AAD User ID>@msazurelabs.onmicrosoft.com'
