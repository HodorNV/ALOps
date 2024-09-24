# Setting up S2S Authentication

Certain steps in ALOps need S2S authentication to work.  Basically, you DevOps service needs access to Business Central, so the setup is quite similar to setting up any S2S authentication.

The main steps are very well explained here: [https://www.kauffmann.nl/2020/09/14/service-to-service-authentication-for-automation-apis-in-business-central/](https://www.kauffmann.nl/2020/09/14/service-to-service-authentication-for-automation-apis-in-business-central/)

On top of that, you shouldn't forget to add your ClientId in the Admin Center:

![image](https://private-user-images.githubusercontent.com/12088142/336007950-0e5a2ac9-3ada-4644-9b71-9e63a1c40029.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjQyNDg5MzYsIm5iZiI6MTcyNDI0ODYzNiwicGF0aCI6Ii8xMjA4ODE0Mi8zMzYwMDc5NTAtMGU1YTJhYzktM2FkYS00NjQ0LTliNzEtOWU2M2ExYzQwMDI5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA4MjElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwODIxVDEzNTcxNlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWIzNWFjMjA0MWFlOTA2YWYxM2NjY2Y4OWQ3MzMwYzA1MTJhZjY3ZGM3ZWQwYTE0ZmUwMmEwMjA0NDkzNGFlZWEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.YXU6Fki065iksphy014uYIIaH9UXneTqACEDNfSTuAg)

And give these permissions in Azure:

![image](https://private-user-images.githubusercontent.com/12088142/336008783-680747bc-323a-45cd-891c-471acc162535.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjQyNDg5MzcsIm5iZiI6MTcyNDI0ODYzNywicGF0aCI6Ii8xMjA4ODE0Mi8zMzYwMDg3ODMtNjgwNzQ3YmMtMzIzYS00NWNkLTg5MWMtNDcxYWNjMTYyNTM1LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA4MjElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwODIxVDEzNTcxN1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTdkNTJlODFiNjQ1MDJmMGZkMzI1YzczODE0YWZjOWU5OTUxNTcwMTI3ZWIxZjhiYWJiMzZiMzM0ZDdlZTE0ZmMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.L7HfFIkcv1oJGng9ooq-Xt-XdqMkir2vZALx07EEZXU)

Referred issues:

- [https://github.com/HodorNV/ALOps/issues/763](https://github.com/HodorNV/ALOps/issues/763)