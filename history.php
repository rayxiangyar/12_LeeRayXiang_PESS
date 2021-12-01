<?php

$conn = mysqli_connect('localhost', "root", "", "pessdb");

$sql = "SELECT * FROM dispatch";

	$result = mysqli_query($conn,$sql);


?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Police Emergency Service System</title>
<link href="nav.css" rel="stylesheet" type="text/css">

</head>

<body>

	
<?php // import nav.php
	require_once 'nav.php';
?>
	<div class="center">
	<table width="50%" border="2" align="center" cellpadding="5" cellspacing="4">
	&nbsp&nbsp&nbsp	
<tr style="background-color:black;color:white;">
	
	    <th>Incident Id</th>
		<th>Patrol Car Id</th>
		<th>Time Dispatched</th>
		<th>Time Arrived</th>
		<th>Time Completed</th>
	
	</tr>
	<?php while($row = mysqli_fetch_array($result)){?>
	<tr>
	<td><?php echo $row['incidentId'];?></td>
	<td><?php echo $row['patrolcarId'];?></td>
	<td><?php echo $row['timeDispatched'];?></td>
	<td><?php echo $row['timeArrived'];?></td>
	<td><?php echo $row['timeCompleted'];?></td>
	</tr>
	
	
	<?php } ?>
	</table>
	</div>