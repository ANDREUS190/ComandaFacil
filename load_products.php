<?php
  header('Content-Type: application/json');

  $conn = mysqli_connect("localhost", "root", "", "comandafacil");

  if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }

  $category = $_GET['category'];
  $id_column = 'id_' . substr($category, 0, -1);

  $result = mysqli_query($conn, "SELECT * FROM $category");

  $products = [];
  while ($row = mysqli_fetch_assoc($result)) {
    $products[] = [
      'id_item' => $row[$id_column],
      'nombre' => $row['nombre'],
      'descripcion' => $row['descripcion'],
      'precio' => $row['precio'],
      'imagen_url' => isset($row['imagen_url']) ? $row['imagen_url'] : 'nose'
    ];
  }

  mysqli_close($conn);

  echo json_encode($products);
?>
