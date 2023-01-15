Write-Host "  ==> Building postgres image for SimpleLogin project..."
docker build -t postgres ./

Write-Host "  ==> Running postgres container for SimpleLogin project..."
docker run -d --name postgres -p 5432:5432 postgres

Write-Host " "
docker ps -l