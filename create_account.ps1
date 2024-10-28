Invoke-WebRequest http://127.0.0.1:5000/create_account `
    -Method Post `
    -Headers @{"Content-Type" = "application/json" } `
    -Body (Get-Content -Raw -Path "account_info.json")