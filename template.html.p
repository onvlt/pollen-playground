<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>◊(or (select 'title metas) (select 'h1 doc))</title>
  <meta name="theme-color" content="◊|theme-color|" />

  <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>◊(->html doc #:splice? #t)</body>
</html>
