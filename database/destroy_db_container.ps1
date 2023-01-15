Write-Host "  ==> Stoping postgres container..."
docker stop postgres

Write-Host "  ==> Deleting postgres container..." 
docker rm postgres

Write-Host "  ==> Removing postgres image..."
docker rmi postgres