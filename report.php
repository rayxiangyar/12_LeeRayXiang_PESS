<?php

$conn = mysqli_connect('localhost', "root", "", "pessdb");

$sql = "SELECT * FROM incident";

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
		<th>Caller Name</th>
		<th>Phone Number</th>
		<th>Incident Type</th>
		<th>Incident Location</th>
		<th>Incident Description</th>
	    <th>Incident Status Id</th>
		<th>Time Called</th>
	</tr>
	<?php while($row = mysqli_fetch_array($result)){?>
	<tr>
	<td><?php echo $row['incidentId'];?></td>
	<td><?php echo $row['callerName'];?></td>
	<td><?php echo $row['phoneNumber'];?></td>
	<td><?php echo $row['incidentTypeId'];?></td>
	<td><?php echo $row['incidentLocation'];?></td>
	<td><?php echo $row['incidentDesc'];?></td>
	<td><?php echo $row['IncidentStatusId'];?></td>
	<td><?php echo $row['timeCalled'];?></td>
	</tr>
	
	
	<?php } ?>
	</table>
	</div>
		
		

</body>
</html>