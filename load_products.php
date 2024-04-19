<?php
  header('Content-Type: application/json');

  $conn = mysqli_connect("localhost", "root", "", "comandafacil");

  if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }

  $category = $_GET['category'];
  $id_column = 'ID_' . substr($category, 0, -1);

  $result = mysqli_query($conn, "SELECT * FROM $category");

  $products = [];
  while ($row = mysqli_fetch_assoc($result)) {
    $products[] = [
      'ID_Item' => $row[$id_column],
      'Nombre' => $row['Nombre'],
      'Descripción' => $row['Descripción'],
      'Precio' => $row['Precio'],
      'Imagen_URL' => isset($row['Imagen_URL']) ? $row['Imagen_URL'] : null
    ];
  }

  mysqli_close($conn);

  echo json_encode($products);
?>
