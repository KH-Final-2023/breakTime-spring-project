<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="bu.CSS/payment.css">
    <title>Document</title>
</head>

<body>

    <button id="reviewBtn">asd</button>
    <button id="submit">asdasd</button>
    
</body>
 
 <script>
 document.getElementById("submit").addEventListener("click",function(){
    document.getElementById('reviewBtn').disabled = !this.value;
  })
 </script>

</html>